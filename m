Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.7737.1608017507135328391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408733"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:31:42 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E0C04CE6014
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 15:31:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:31:40 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH 1/2] samba: CVE-2020-14318 Security Advisory
Date: Tue, 15 Dec 2020 15:31:36 +0800
Message-ID: <1608017496-56213-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4E0C04CE6014.A58EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14318

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../samba/samba/CVE-2020-14318.patch          | 142 ++++++++++++++++++
 .../samba/samba_4.10.18.bb                    |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
new file mode 100644
index 000000000..b4a273fc8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
@@ -0,0 +1,142 @@
+From ccf53dfdcd39f3526dbc2f20e1245674155380ff Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Fri, 11 Dec 2020 11:32:44 +0900
+Subject: [PATCH] s4: torture: Add smb2.notify.handle-permissions test.
+
+s3: smbd: Ensure change notifies can't get set unless the
+ directory handle is open for SEC_DIR_LIST.
+
+CVE-2020-14318
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=14434
+
+Signed-off-by: Jeremy Allison <jra@samba.org>
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ source3/smbd/notify.c         |  8 ++++
+ source4/torture/smb2/notify.c | 82 ++++++++++++++++++++++++++++++++++-
+ 2 files changed, 89 insertions(+), 1 deletion(-)
+
+diff --git a/source3/smbd/notify.c b/source3/smbd/notify.c
+index 44c0b09..d23c03b 100644
+--- a/source3/smbd/notify.c
++++ b/source3/smbd/notify.c
+@@ -283,6 +283,14 @@ NTSTATUS change_notify_create(struct files_struct *fsp, uint32_t filter,
+ 	char fullpath[len+1];
+ 	NTSTATUS status = NT_STATUS_NOT_IMPLEMENTED;
+ 
++	/*
++	 * Setting a changenotify needs READ/LIST access
++	 * on the directory handle.
++	 */
++	if (!(fsp->access_mask & SEC_DIR_LIST)) {
++		return NT_STATUS_ACCESS_DENIED;
++	}
++
+ 	if (fsp->notify != NULL) {
+ 		DEBUG(1, ("change_notify_create: fsp->notify != NULL, "
+ 			  "fname = %s\n", fsp->fsp_name->base_name));
+diff --git a/source4/torture/smb2/notify.c b/source4/torture/smb2/notify.c
+index ebb4f8a..a5c9b94 100644
+--- a/source4/torture/smb2/notify.c
++++ b/source4/torture/smb2/notify.c
+@@ -2569,6 +2569,83 @@ done:
+ 	return ok;
+ }
+ 
++/*
++  Test asking for a change notify on a handle without permissions.
++*/
++
++#define BASEDIR_HPERM BASEDIR "_HPERM"
++
++static bool torture_smb2_notify_handle_permissions(
++		struct torture_context *torture,
++		struct smb2_tree *tree)
++{
++	bool ret = true;
++	NTSTATUS status;
++	union smb_notify notify;
++	union smb_open io;
++	struct smb2_handle h1 = {{0}};
++	struct smb2_request *req;
++
++	smb2_deltree(tree, BASEDIR_HPERM);
++	smb2_util_rmdir(tree, BASEDIR_HPERM);
++
++	torture_comment(torture,
++		"TESTING CHANGE NOTIFY "
++		"ON A HANDLE WITHOUT PERMISSIONS\n");
++
++	/*
++	  get a handle on the directory
++	*/
++	ZERO_STRUCT(io.smb2);
++	io.generic.level = RAW_OPEN_SMB2;
++	io.smb2.in.create_flags = 0;
++	io.smb2.in.desired_access = SEC_FILE_READ_ATTRIBUTE;
++	io.smb2.in.create_options = NTCREATEX_OPTIONS_DIRECTORY;
++	io.smb2.in.file_attributes = FILE_ATTRIBUTE_NORMAL;
++	io.smb2.in.share_access = NTCREATEX_SHARE_ACCESS_READ |
++				NTCREATEX_SHARE_ACCESS_WRITE;
++	io.smb2.in.alloc_size = 0;
++	io.smb2.in.create_disposition = NTCREATEX_DISP_CREATE;
++	io.smb2.in.impersonation_level = SMB2_IMPERSONATION_ANONYMOUS;
++	io.smb2.in.security_flags = 0;
++	io.smb2.in.fname = BASEDIR_HPERM;
++
++	status = smb2_create(tree, torture, &io.smb2);
++	CHECK_STATUS(status, NT_STATUS_OK);
++	h1 = io.smb2.out.file.handle;
++
++	/* ask for a change notify,
++	   on file or directory name changes */
++	ZERO_STRUCT(notify.smb2);
++	notify.smb2.level = RAW_NOTIFY_SMB2;
++	notify.smb2.in.buffer_size = 1000;
++	notify.smb2.in.completion_filter = FILE_NOTIFY_CHANGE_NAME;
++	notify.smb2.in.file.handle = h1;
++	notify.smb2.in.recursive = true;
++
++	req = smb2_notify_send(tree, &notify.smb2);
++	torture_assert_goto(torture,
++			req != NULL,
++			ret,
++			done,
++			"smb2_notify_send failed\n");
++
++	/*
++	 * Cancel it, we don't really want to wait.
++	 */
++	smb2_cancel(req);
++	status = smb2_notify_recv(req, torture, &notify.smb2);
++	/* Handle h1 doesn't have permissions for ChangeNotify. */
++	CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
++
++done:
++	if (!smb2_util_handle_empty(h1)) {
++		smb2_util_close(tree, h1);
++	}
++	smb2_deltree(tree, BASEDIR_HPERM);
++	return ret;
++}
++
+ /*
+    basic testing of SMB2 change notify
+ */
+@@ -2602,7 +2679,10 @@ struct torture_suite *torture_smb2_notify_init(TALLOC_CTX *ctx)
+ 				     torture_smb2_notify_rmdir3);
+ 	torture_suite_add_2smb2_test(suite, "rmdir4",
+ 				     torture_smb2_notify_rmdir4);
+-
++	torture_suite_add_1smb2_test(suite,
++				    "handle-permissions",
++				    torture_smb2_notify_handle_permissions);
++ 
+ 	suite->description = talloc_strdup(suite, "SMB2-NOTIFY tests");
+ 
+ 	return suite;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index b5085c913..923b2ddf1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
            file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
+           file://CVE-2020-14318.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
-- 
2.25.1



