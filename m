Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8816FD02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 06:13:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D6D4TD026234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 23:13:04 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 12 Jun 2014 23:13:04 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:12:57 +0800
Message-ID: <1402639978-4607-4-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
References: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] samba: Security Advisory - CVE-2013-4124
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
X-List-Received-Date: Fri, 13 Jun 2014 06:13:04 -0000
Content-Type: text/plain

Integer overflow in the read_nttrans_ea_list function in nttrans.c in
smbd in Samba 3.x before 3.5.22, 3.6.x before 3.6.17, and 4.x before
4.0.8 allows remote attackers to cause a denial of service (memory
consumption) via a malformed packet.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4124

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../samba/samba/samba-3.6.16-CVE-2013-4124.patch   |   43 ++++++++++++++++++++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch

diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch
new file mode 100644
index 0000000..54b8edf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.16-CVE-2013-4124.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport
+
+From efdbcabbe97a594572d71d714d258a5854c5d8ce Mon Sep 17 00:00:00 2001
+From: Jeremy Allison <jra@samba.org>
+Date: Wed, 10 Jul 2013 17:10:17 -0700
+Subject: [PATCH] Fix bug #10010 - Missing integer wrap protection in EA list
+ reading can cause server to loop with DOS.
+
+Ensure we never wrap whilst adding client provided input.
+CVE-2013-4124
+
+Signed-off-by: Jeremy Allison <jra@samba.org>
+---
+ source3/smbd/nttrans.c |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/source3/smbd/nttrans.c b/source3/smbd/nttrans.c
+index ea9d417..5fc3a09 100644
+--- a/source3/smbd/nttrans.c
++++ b/source3/smbd/nttrans.c
+@@ -989,7 +989,19 @@ struct ea_list *read_nttrans_ea_list(TALLOC_CTX *ctx, const char *pdata, size_t
+ 		if (next_offset == 0) {
+ 			break;
+ 		}
++
++		/* Integer wrap protection for the increment. */
++		if (offset + next_offset < offset) {
++			break;
++		}
++
+ 		offset += next_offset;
++
++		/* Integer wrap protection for while loop. */
++		if (offset + 4 < offset) {
++			break;
++		}
++
+ 	}
+ 
+ 	return ea_list_head;
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index a5e7dcd..331796c 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -33,6 +33,7 @@ SRC_URI += "\
     file://samba-3.6.22-CVE-2013-4496.patch;patchdir=.. \
     file://0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch;patchdir=.. \
     file://samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch;patchdir=.. \
+    file://samba-3.6.16-CVE-2013-4124.patch;patchdir=.. \
 "
 SRC_URI[md5sum] = "fbb245863eeef2fffe172df779a217be"
 SRC_URI[sha256sum] = "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b3514de"
-- 
1.7.9.5


