Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEC2E9273A
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44423.1767019916336999335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0IDvfDD;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42e2e77f519so5556592f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019915; x=1767624715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm8nFOiMVUiqxmDNKObMDwVhI9c+LAamK3CErtl7zYc=;
        b=H0IDvfDDxqoDCVplUTjIULeY2nUBo27rfMcQR4s8qqKull+eb7PtDdtajzIGft/HPH
         7/ttvRV7fdRkjTADeS2GXR9Of9D77NfCfYUUjRXyy5Jt4/XdL0Zpic/vwil7a8nLjXLT
         P+rqUcXst2YjqwgEvhvJW5J7rCqyUqE07xGpeMddfEdwuElxGAwxSWlecakInbT7QmeW
         yHInYOe6xNuyNpv9LU3b/cUO1O4fwb1dAPW0zHYRUVV5BXSb4ChASd/AXwYsgaMSnE7i
         9V9OxHmfhpBaPBob+ppgHrZcc25p0A4QDYCm8F8DxOs+xB4hbz/9v/bkqmHl6xQdtWQz
         018A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019915; x=1767624715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sm8nFOiMVUiqxmDNKObMDwVhI9c+LAamK3CErtl7zYc=;
        b=RicEDG626aM2a07VEctuO8o+MSc5qbmt9VUyQLaOmrThNBu6/2A2Gb+QHWAOmDBKc2
         wk8wKudQCxL04737NF9IeTrVrPXBpvmDwd+mDh4PYO+Mm5zjajUzrIuF5nnrIarYRamp
         CL2RG3ks3HD6OpwlvVOqT+SHVNqKCMDlOj6IjG5Qv7rqlzcQc3bnqX69eA+AE/eo4FLN
         Q4YdihmIBTc9mBKtVnGYj4l5IdezXiJ3pkTqEQ10ag7AhygaZkVDd1nNoQJ4UcyBeIIN
         GAnPPMYL4QX5/UtAvhllzMZJIImn1Tq8ChWAGXs69wRXb4RtUPdZp3lQVLz/7L66l2Nl
         +3sQ==
X-Gm-Message-State: AOJu0YwicCpS3RSLN75coC2FwWXXjo2ZOXm5jR+KRPYyf1/D+6tUmFP5
	Ei0CIeQE4qoWoviHZJY+MEb9J/FugcRDy3NqbxhOQlmwlU65fOwC6Q5MdNNzew==
X-Gm-Gg: AY/fxX5Z8/lx7rR0V31CTAu7STdheSVeuvuOV/L8400443/WjP99AEfHxkWl63FDUm7
	cFPMU6xv3+riYXDPE7L+UCW38BD6DhFadUz3GWHP0Vaxhx1Eicz9RYdtD0/fZ/xRPIiWNNKOjEv
	5ZHboXHVLuVmEmbupljwA6AI+yvB/gM0bMIQcWf9agWxywZpRE4obhwapiZo6Byal6vpdBhGrFr
	O/7nknvRAp/noOMjMnl4sHaS37Vf/ae70W/H4cjC7yBYIME0LdV48Chy6oqcjEcnxgxMUclFxr2
	1LvCo0E9Aa2X+fcd/P9W1pkHKXXrdmIqI3bds30LVOjy99MVDURWerBxtVc2Sw+T00Ryv0NxwXN
	eEAgQy2oBzBV2I7rV/VmaqTg8VdMA7gC3OpaOhQLiteF5785c/Bw8wdkMmoa2ztbM6lZk08LkCV
	OFkK3TTrfS
X-Google-Smtp-Source: AGHT+IG2WCPY6Gzy222EmeNCzZy7JRKnxuRL/Hh4ruIZHfehBIXYENu0UT5d31zFxdByGwORcumHsA==
X-Received: by 2002:a05:6000:2c02:b0:42b:4267:83e9 with SMTP id ffacd0b85a97d-4324e4c73f3mr33912881f8f.2.1767019914601;
        Mon, 29 Dec 2025 06:51:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 03/11] cifs-utils: patch CVE-2025-2312
Date: Mon, 29 Dec 2025 15:51:44 +0100
Message-ID: <20251229145152.489068-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122982

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2312

Pick the patch that is referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cifs/cifs-utils/CVE-2025-2312.patch       | 135 ++++++++++++++++++
 .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch

diff --git a/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
new file mode 100644
index 0000000000..162e4cc4be
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
@@ -0,0 +1,135 @@
+From 44312bbc9aaae39a88541abe7ab7700314d34047 Mon Sep 17 00:00:00 2001
+From: Ritvik Budhiraja <rbudhiraja@microsoft.com>
+Date: Tue, 19 Nov 2024 06:07:58 +0000
+Subject: [PATCH] CIFS.upcall to accomodate new namespace mount opt
+
+NOTE: This patch is dependent on one of the previously sent patches:
+[PATCH] CIFS: New mount option for cifs.upcall namespace resolution
+which introduces a new mount option called upcall_target, to
+customise the upcall behaviour.
+
+Building upon the above patch, the following patch adds functionality
+to handle upcall_target as a mount option in cifs.upcall. It can have 2 values -
+mount, app.
+Having this new mount option allows the mount command to specify where the
+upcall should happen: 'mount' for resolving the upcall to the host
+namespace, and 'app' for resolving the upcall to the ns of the calling
+thread. This will enable both the scenarios where the Kerberos credentials
+can be found on the application namespace or the host namespace to which
+just the mount operation is "delegated".
+This aids use cases like Kubernetes where the mount
+happens on behalf of the application in another container altogether.
+
+Signed-off-by: Ritvik Budhiraja <rbudhiraja@microsoft.com>
+Signed-off-by: Steve French <stfrench@microsoft.com>
+
+CVE: CVE-2025-2312
+Upstream-Status: Backport [https://git.samba.org/?p=cifs-utils.git;a=commit;h=89b679228cc1be9739d54203d28289b03352c174]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cifs.upcall.c | 55 +++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 47 insertions(+), 8 deletions(-)
+
+diff --git a/cifs.upcall.c b/cifs.upcall.c
+index 52c0328..0883afa 100644
+--- a/cifs.upcall.c
++++ b/cifs.upcall.c
+@@ -953,6 +953,13 @@ struct decoded_args {
+ #define MAX_USERNAME_SIZE 256
+ 	char username[MAX_USERNAME_SIZE + 1];
+ 
++#define MAX_UPCALL_STRING_LEN 6 /* "mount\0" */
++	enum upcall_target_enum {
++		UPTARGET_UNSPECIFIED, /* not specified, defaults to app */
++		UPTARGET_MOUNT, /* upcall to the mount namespace */
++		UPTARGET_APP, /* upcall to the application namespace which did the mount */
++	} upcall_target;
++
+ 	uid_t uid;
+ 	uid_t creduid;
+ 	pid_t pid;
+@@ -969,6 +976,7 @@ struct decoded_args {
+ #define DKD_HAVE_PID		0x20
+ #define DKD_HAVE_CREDUID	0x40
+ #define DKD_HAVE_USERNAME	0x80
++#define DKD_HAVE_UPCALL_TARGET	0x100
+ #define DKD_MUSTHAVE_SET (DKD_HAVE_HOSTNAME|DKD_HAVE_VERSION|DKD_HAVE_SEC)
+ 	int have;
+ };
+@@ -979,6 +987,7 @@ __decode_key_description(const char *desc, struct decoded_args *arg)
+ 	size_t len;
+ 	char *pos;
+ 	const char *tkn = desc;
++	arg->upcall_target = UPTARGET_UNSPECIFIED;
+ 
+ 	do {
+ 		pos = index(tkn, ';');
+@@ -1077,6 +1086,31 @@ __decode_key_description(const char *desc, struct decoded_args *arg)
+ 			}
+ 			arg->have |= DKD_HAVE_VERSION;
+ 			syslog(LOG_DEBUG, "ver=%d", arg->ver);
++		} else if (strncmp(tkn, "upcall_target=", 14) == 0) {
++			if (pos == NULL)
++				len = strlen(tkn);
++			else
++				len = pos - tkn;
++
++			len -= 14;
++			if (len > MAX_UPCALL_STRING_LEN) {
++				syslog(LOG_ERR, "upcall_target= value too long for buffer");
++				return 1;
++			}
++			if (strncmp(tkn + 14, "mount", 5) == 0) {
++				arg->upcall_target = UPTARGET_MOUNT;
++				syslog(LOG_DEBUG, "upcall_target=mount");
++			} else if (strncmp(tkn + 14, "app", 3) == 0) {
++				arg->upcall_target = UPTARGET_APP;
++				syslog(LOG_DEBUG, "upcall_target=app");
++			} else {
++				// Should never happen
++				syslog(LOG_ERR, "Invalid upcall_target value: %s, defaulting to app",
++				       tkn + 14);
++				arg->upcall_target = UPTARGET_APP;
++				syslog(LOG_DEBUG, "upcall_target=app");
++			}
++			arg->have |= DKD_HAVE_UPCALL_TARGET;
+ 		}
+ 		if (pos == NULL)
+ 			break;
+@@ -1440,15 +1474,20 @@ int main(const int argc, char *const argv[])
+ 	 * acceptably in containers, because we'll be looking at the correct
+ 	 * filesystem and have the correct network configuration.
+ 	 */
+-	rc = switch_to_process_ns(arg->pid);
+-	if (rc == -1) {
+-		syslog(LOG_ERR, "unable to switch to process namespace: %s", strerror(errno));
+-		rc = 1;
+-		goto out;
++	if (arg->upcall_target == UPTARGET_APP || arg->upcall_target == UPTARGET_UNSPECIFIED) {
++		syslog(LOG_INFO, "upcall_target=app, switching namespaces to application thread");
++		rc = switch_to_process_ns(arg->pid);
++		if (rc == -1) {
++			syslog(LOG_ERR, "unable to switch to process namespace: %s", strerror(errno));
++			rc = 1;
++			goto out;
++		}
++		if (trim_capabilities(env_probe))
++			goto out;
++	} else {
++		syslog(LOG_INFO, "upcall_target=mount, not switching namespaces to application thread");
+ 	}
+ 
+-	if (trim_capabilities(env_probe))
+-		goto out;
+ 
+ 	/*
+ 	 * The kernel doesn't pass down the gid, so we resort here to scraping
+@@ -1495,7 +1534,7 @@ int main(const int argc, char *const argv[])
+ 	 * look at the environ file.
+ 	 */
+ 	env_cachename =
+-		get_cachename_from_process_env(env_probe ? arg->pid : 0);
++		get_cachename_from_process_env((env_probe && (arg->upcall_target == UPTARGET_APP)) ? arg->pid : 0);
+ 
+ 	rc = setuid(uid);
+ 	if (rc == -1) {
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
index e2918503be..f86e7bd22b 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
@@ -5,7 +5,9 @@ LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "316522036133d44ed02cd39ed2748e2b59c85b30"
-SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
+SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master \
+           file://CVE-2025-2312.patch \
+           "
 
 DEPENDS += "libtalloc"
 

