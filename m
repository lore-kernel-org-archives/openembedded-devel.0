Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC37D14899
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:28:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6692.1767950933394655837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTUInd/g;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0a33d0585so28113475ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950932; x=1768555732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UsZlpe7v4C1fB5n4jMTJlKw7vJT8QhlmXqh+U0ADh94=;
        b=YTUInd/gPuvgIXllPjP/AWtaPt1EerK8fDXtb1lUGijY3jS+WBSOmWavUMzSMhqdaA
         r/3/nUqbTWXpY0JUW364EAIN9P3YGgRlG5V5sqk72VnFFq5PBwpTCCLZW5Idyut13o4M
         33IAHhAsyosxxiidrlFTMvIMO63vbQ60jmoiFqBKKHCLVS5G6D/y1mq05qwLeufZley7
         qrtZh49g3mfNXFXdWq0bm5uDbhu0yYZAx/OKtjrzJOQeYcFrBd4YCnUWaTrxPXwpJwS9
         LqYARPmmfPhTBxZuT2K2T2U5kxfLA8LIOvuXsI0bV4HU2LDptCb3YGCRMQfZywNDvkV/
         qUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950932; x=1768555732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsZlpe7v4C1fB5n4jMTJlKw7vJT8QhlmXqh+U0ADh94=;
        b=Rfx37lwrhNna9XJcyOyaQjnpAsxdlLVfWEyV5POdi0MeyA29RNikuTE/yrSK9AyBYr
         A3qVYiYKifVZYVO96yE1G1FLTO0gj+z7dhobdTyjZg2WjogGCJvMjIFX0sjA2Tax6XG8
         +wcaYpnCbghdPvMchbGLUM/SMrd61pW04RwlFmwpjI5PhWQ1sgOHn6JCrWDZlktSymoO
         pHEUESCCIMJ8J4xrD+kFgDpfZXwXen1AssXK6aS4W1c4XGAmAertb9gJ3rnNI/Itso0g
         RZKuu+Kj0jEn3pvYUoPzdBNFWN/7SEWzXw9cxlVcma8tHaaX20HO16Kng5a4Z4FDsOml
         5OjA==
X-Gm-Message-State: AOJu0Ywqw6ibKQggGyr43GsIYsu0Qx3dEQc3qsmzoATp7s2kxm7ImkNX
	vNqrObMov3WEUVzwzNHiTxH8rBoC4wtxbKTLn/okANPxLbT+gwjXJ4okwHXVaw==
X-Gm-Gg: AY/fxX4Vp4dzrN4HZSUbxLlZe0jO7Z6QQgqOH75T0mrHB8p4/rWk6pTmEbj8tE5bety
	DicospBCFDJ3cD9WoJ4wYCN/CD0N5ZwoNhJI9/BgEGxs2jpmtyyqgr7KhKYMBj9OdwKgPDo8Koy
	fyPLu9wheHEPcc2xpMiTdDOq9UgCEKWohnnLaQd2Vy6+5VXhoDfaYW93o1Ior5UWmyRu3PcfRUI
	6clFZnnEJ20y9SSSQNEikv/vL9uSSi1ugnqcU2apUS9prz9pukrfRnd3ea7VEpAo1lKsOBTqYV3
	oayPDDWAZZyecJOD0VEQypNKnHV6dmKYty0NYkRmvzavOt3YWNXk6vyfYAs4kwEEE/uD16qDjOO
	WFp+/j88NMUmuJD+V5n+1GWEg+Esn+oV4TyGEkZmj4jgWjk3hz0MYB/MNQ6cUJ1h1qoulEzqAOH
	01FhTlQZpUwyK/jFya3EDVjgg=
X-Google-Smtp-Source: AGHT+IEWz5K9kPe/ay02PTo757U14LkxtQayWFkYH1Z7HksyZERO+N2jARC9QmsObtzyam9tDzHLOQ==
X-Received: by 2002:a17:902:cf05:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a3ee49015dmr81787325ad.37.1767950932427;
        Fri, 09 Jan 2026 01:28:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 01/12] cifs-utils: patch CVE-2025-2312
Date: Fri,  9 Jan 2026 22:28:31 +1300
Message-ID: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123279

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2312

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cifs/cifs-utils/CVE-2025-2312.patch       | 136 ++++++++++++++++++
 .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
 2 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch

diff --git a/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
new file mode 100644
index 0000000000..3e62b0f1c3
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
@@ -0,0 +1,136 @@
+From faf6ce0abd6fbca95721eb88754add9c0c700a5c Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 89b679228cc1be9739d54203d28289b03352c174)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
index c78bbae7b8..4e27491bba 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
@@ -5,7 +5,9 @@ LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "316522036133d44ed02cd39ed2748e2b59c85b30"
-SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
+SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master \
+           file://CVE-2025-2312.patch \
+"
 
 S = "${WORKDIR}/git"
 DEPENDS += "libtalloc"

