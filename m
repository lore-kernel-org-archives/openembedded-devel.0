Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 047466FD02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 06:13:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5D6D5SY013505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 23:13:05 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 12 Jun 2014 23:13:05 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:12:58 +0800
Message-ID: <1402639978-4607-5-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
References: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] samba: Security Advisory - CVE-2013-4475
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 06:13:05 -0000
Content-Type: text/plain

Samba 3.x before 3.6.20, 4.0.x before 4.0.11, and 4.1.x before 4.1.1,
when vfs_streams_depot or vfs_streams_xattr is enabled, allows remote
attackers to bypass intended file restrictions by leveraging ACL
differences between a file and an associated alternate data stream
(ADS).

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4475

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../samba/samba/samba-3.6.19-CVE-2013-4475.patch   |  102 ++++++++++++++++++++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch

diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch
new file mode 100644
index 0000000..a435c08
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.19-CVE-2013-4475.patch
@@ -0,0 +1,102 @@
+Upstream-Status: Backport
+
+From 928910f01f951657ea4629a6d573ac00646d16f8 Mon Sep 17 00:00:00 2001
+From: Jeremy Allison <jra@samba.org>
+Date: Thu, 31 Oct 2013 13:48:42 -0700
+Subject: [PATCH] Fix bug #10229 - No access check verification on stream
+ files.
+
+https://bugzilla.samba.org/show_bug.cgi?id=10229
+
+We need to check if the requested access mask
+could be used to open the underlying file (if
+it existed), as we're passing in zero for the
+access mask to the base filename.
+
+Signed-off-by: Jeremy Allison <jra@samba.org>
+---
+ source3/smbd/open.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 61 insertions(+)
+
+diff --git a/source3/smbd/open.c b/source3/smbd/open.c
+index 447de80..441b8cd 100644
+--- a/source3/smbd/open.c
++++ b/source3/smbd/open.c
+@@ -152,6 +152,48 @@ NTSTATUS smbd_check_open_rights(struct connection_struct *conn,
+ }
+ 
+ /****************************************************************************
++ Ensure when opening a base file for a stream open that we have permissions
++ to do so given the access mask on the base file.
++****************************************************************************/
++
++static NTSTATUS check_base_file_access(struct connection_struct *conn,
++				struct smb_filename *smb_fname,
++				uint32_t access_mask)
++{
++	uint32_t access_granted = 0;
++	NTSTATUS status;
++
++	status = smbd_calculate_access_mask(conn, smb_fname,
++					false,
++					access_mask,
++					&access_mask);
++	if (!NT_STATUS_IS_OK(status)) {
++		DEBUG(10, ("smbd_calculate_access_mask "
++			"on file %s returned %s\n",
++			smb_fname_str_dbg(smb_fname),
++			nt_errstr(status)));
++		return status;
++	}
++
++	if (access_mask & (FILE_WRITE_DATA|FILE_APPEND_DATA)) {
++		uint32_t dosattrs;
++		if (!CAN_WRITE(conn)) {
++			return NT_STATUS_ACCESS_DENIED;
++		}
++		dosattrs = dos_mode(conn, smb_fname);
++ 		if (IS_DOS_READONLY(dosattrs)) {
++			return NT_STATUS_ACCESS_DENIED;
++		}
++	}
++
++
++	return smbd_check_open_rights(conn,
++				smb_fname,
++				access_mask,
++				&access_granted);
++}
++
++/****************************************************************************
+  fd support routines - attempt to do a dos_open.
+ ****************************************************************************/
+ 
+@@ -3227,6 +3269,25 @@ static NTSTATUS create_file_unixpath(connection_struct *conn,
+ 		if (SMB_VFS_STAT(conn, smb_fname_base) == -1) {
+ 			DEBUG(10, ("Unable to stat stream: %s\n",
+ 				   smb_fname_str_dbg(smb_fname_base)));
++		} else {
++			/*
++			 * https://bugzilla.samba.org/show_bug.cgi?id=10229
++			 * We need to check if the requested access mask
++			 * could be used to open the underlying file (if
++			 * it existed), as we're passing in zero for the
++			 * access mask to the base filename.
++			 */
++			status = check_base_file_access(conn,
++							smb_fname_base,
++							access_mask);
++
++			if (!NT_STATUS_IS_OK(status)) {
++				DEBUG(10, ("Permission check "
++					"for base %s failed: "
++					"%s\n", smb_fname->base_name,
++					nt_errstr(status)));
++				goto fail;
++			}
+ 		}
+ 
+ 		/* Open the base file. */
+-- 
+1.8.4.1
+
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 331796c..cf13a0f 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -34,6 +34,7 @@ SRC_URI += "\
     file://0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch;patchdir=.. \
     file://samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch;patchdir=.. \
     file://samba-3.6.16-CVE-2013-4124.patch;patchdir=.. \
+    file://samba-3.6.19-CVE-2013-4475.patch;patchdir=.. \
 "
 SRC_URI[md5sum] = "fbb245863eeef2fffe172df779a217be"
 SRC_URI[sha256sum] = "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b3514de"
-- 
1.7.9.5


