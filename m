Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.21192.1610905598466231647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8WsrgpY;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id b3so8831242pft.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BdPvmfchDDD5ZIfOrZZgs5Y+MFQ7ThuVMvB6ACInoOI=;
        b=m8WsrgpY4SwrXEefnMhzLYZogAnBrF+S2naO6xRyEXFOny88QjK/c5VcMAAayhwdRW
         OETAWW3I2nvWKa/2aObOHz/0cSiGbiM6S3PVZFkhgD52cjhUX+uCSLgWU0RwrXt7jl55
         +ZRqvWWeLJ3YzeImznpJEvj8oRzPUQBNJuMu/Tphm+fhDTBtrhnQrp0dZH4Jiv0WDEaQ
         5R3dqy7lSfedWGQ7umqQGAp5O/Whw8/5+i0ZUBhTAhWp3DsSr3TTOEQC3aDQHhbMUgKE
         JxvXO5k0QLIaujMWi/RxRTpQWyStQhvdmHhXhVQAogUD4apCWnP6OKhytKCV/FX5U45R
         hfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BdPvmfchDDD5ZIfOrZZgs5Y+MFQ7ThuVMvB6ACInoOI=;
        b=KCei/98hwEomItioSPV92NWEA56SBtglWG51y7+ECh80+rFpXSpLpjcmz8fn2qPEoI
         /FLkTOG96v57K4yJozNuK+qwmgDAOGA91IOeboHOopCDBrPEECOkvC9owB6KTECjX/mc
         tqw9swL89edLFFp+7bvC1fIKBmT/O6Y+GiUS6rcuLr8ID+SgC32emCcDMuganRo/5y7a
         wnDdtAn3P9syg/8UqRXU+ob/l7jcRO4lAwTygd5AwoFxvt1V2iWT2v4NWSvFKTX5/MHQ
         yFBwJ/EIL8lwiQGGu72gHm5hwBlQJqS21wtoeqaSb3qBL6ZbOBX/KyK8TDPQ7+IY6CPE
         cOxQ==
X-Gm-Message-State: AOAM531TvF8WtVUDmw/0Ba0EXZ5juNN0YAb6Ad9SIXJS1BQc+pyaiPG/
	WTvtrcgtgSP4rJhoeJaiaxkWLH6/rNCgUA==
X-Google-Smtp-Source: ABdhPJy5KOIT0WZds5nmwWjShUZp+TxxtcGwrlxb0ChPdR4Ej95MZblRbFsjS/c9m1z2RTC73guH1A==
X-Received: by 2002:a63:ec0b:: with SMTP id j11mr22379545pgh.211.1610905597827;
        Sun, 17 Jan 2021 09:46:37 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:37 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/28] samba: CVE-2020-14318 Security Advisory
Date: Sun, 17 Jan 2021 09:46:05 -0800
Message-Id: <5191148b5ccffab2ef226bb435d1210fedf9a328.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14318

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1d44b4c03d51e91ce01cf5fd0b33155ce36f1862)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 38beb6fe98894ffaf82a05ccfd6694f735daba26)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/samba/CVE-2020-14318.patch          | 142 ++++++++++++++++++
 .../samba/samba_4.10.18.bb                    |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
new file mode 100644
index 0000000000..ff1225db07
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
index b5085c913b..923b2ddf16 100644
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
2.17.1

