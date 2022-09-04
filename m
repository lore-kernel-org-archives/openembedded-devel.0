Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD62C6FA86
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.11492.1662276877018885707
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okQcUw9b;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id t5so5774804pjs.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7Iy6kQAsxWfUTzayRP4xfFuIj8NuMLEoUTZJxM8LL7U=;
        b=okQcUw9bb6/oQU0BnufwqYvTBkYAGYbG8jHCOx1V/B4e1NfxLCD1ZsnRjjdq1fl29h
         thQOQSUb2XCvSsWkC9vTbzeHdFf6USc63jiJPCZ1g2/1YtlpOSM5pTeA/cXFhe2fuZlF
         aPzBJEkNI+9+VLY4saOX14T1bdFKxbillibkWFHRVkxH8e6d75yKHKGB4n+kWoq0t1Yt
         AHpwuLyscvfWpCbKjylV6EO6NaMPRexUgKxlQ8Nv7DDYoGf4PfRB+YQ6KfaF2Wzfv00U
         iL4/s6hRTPjfPYda0VCETVeRizN+ZvQ0LbjH0OPOF23lYBXTzNX5jF/w7oG/aMUWyTWj
         h1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Iy6kQAsxWfUTzayRP4xfFuIj8NuMLEoUTZJxM8LL7U=;
        b=pvqGM3fuYM39aQ6kTvAe3PABR3sg52bJ43O33pBc/7jhe18ACWLOtmMsnFJWHxDHdo
         fC17Ky57KDV0iOxpjUyMGJWpE4O3khSOyuS+qbrX0fPZ6ydB0wt0+ec+sHYsOQ/7dvTx
         Un71374osTbY7SJPTZHaeWSNoOFTMVYx8be+Z7PoxUl/E1xzTF9u47sLBcfCNtgPv1eW
         RasFZYfCEfp/cC3P535qxA4e4J7/ks+0Q8iBILc8JYtilAQOqwuNPfmPTaYMGS6kPw35
         u9ZkJnGYQRgt1EVtAcyHcDm3nSFaaGRdYQJCQgAtpLwXmndve0M++hf3Qz0vtkl4CtVE
         x+gA==
X-Gm-Message-State: ACgBeo0YChzYKstrSMZ9REshL7MudkopRiHI1EOr5HemvvtNSkJ33UmT
	zfeXiHgdD3DzHbxtiI8GyaTeAlQy/059vw==
X-Google-Smtp-Source: 
 AA6agR6vHUadip648Xi9XXzWxMuWB54f37HrZ/ZbmsSsl/jw7WLS7W3/YbZAn/UfFvppF+jfg4skSQ==
X-Received: by 2002:a17:90a:53a4:b0:1fa:97eb:6f0a with SMTP id
 y33-20020a17090a53a400b001fa97eb6f0amr13606237pjh.54.1662276877181;
        Sun, 04 Sep 2022 00:34:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/63] libpwquality: Do not use fgetpwent_r on musl
Date: Sun,  4 Sep 2022 00:33:30 -0700
Message-Id: <20220904073417.3251865-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98610

It does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-fix-musl-build.patch           | 72 +++++++++++++++++++
 .../libpwquality/libpwquality_1.4.4.bb        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch

diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch b/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch
new file mode 100644
index 0000000000..2cbdd6c74c
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch
@@ -0,0 +1,72 @@
+Do not use fgetpwent_r
+
+fgetpwent_r does not exist on musl
+
+Source: https://git.alpinelinux.org/aports/tree/community/libpwquality/0001-fix-musl-build.patch
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/pam_pwquality.c
++++ b/src/pam_pwquality.c
+@@ -19,6 +19,7 @@
+ #include <stdio.h>
+ #include <pwd.h>
+ #include <errno.h>
++#include <security/pam_modutil.h>
+ #include "pwquality.h"
+ 
+ /*
+@@ -43,8 +44,6 @@ struct module_options {
+ 
+ #define CO_RETRY_TIMES  1
+ 
+-#define PATH_PASSWD "/etc/passwd"
+-
+ static int
+ _pam_parse (pam_handle_t *pamh, struct module_options *opt,
+             int argc, const char **argv)
+@@ -98,44 +97,7 @@ static int
+ check_local_user (pam_handle_t *pamh,
+                   const char *user)
+ {
+-        struct passwd pw, *pwp;
+-        char buf[4096];
+-        int found = 0;
+-        FILE *fp;
+-        int errn;
+-
+-        fp = fopen(PATH_PASSWD, "r");
+-        if (fp == NULL) {
+-                pam_syslog(pamh, LOG_ERR, "unable to open %s: %s",
+-                           PATH_PASSWD, pam_strerror(pamh, errno));
+-                return -1;
+-        }
+-
+-        for (;;) {
+-                errn = fgetpwent_r(fp, &pw, buf, sizeof (buf), &pwp);
+-                if (errn == ERANGE) {
+-                        pam_syslog(pamh, LOG_WARNING, "%s contains very long lines; corrupted?",
+-                                   PATH_PASSWD);
+-                        /* we can continue here as next call will read further */
+-                        continue;
+-                }
+-                if (errn != 0)
+-                        break;
+-                if (strcmp(pwp->pw_name, user) == 0) {
+-                        found = 1;
+-                        break;
+-                }
+-        }
+-
+-        fclose (fp);
+-
+-        if (errn != 0 && errn != ENOENT) {
+-                pam_syslog(pamh, LOG_ERR, "unable to enumerate local accounts: %s",
+-                           pam_strerror(pamh, errn));
+-                return -1;
+-        } else {
+-                return found;
+-        }
++	return pam_modutil_check_user_in_passwd(pamh, user, NULL) == PAM_SUCCESS;
+ }
+ 
+ PAM_EXTERN int
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
index f892cc650d..a6887b0868 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
@@ -8,6 +8,7 @@ SRCNAME = "libpwquality"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
            file://add-missing-python-include-dir-for-cross.patch \
 "
+SRC_URI:append:libc-musl = " file://0001-fix-musl-build.patch "
 
 SRC_URI[md5sum] = "1fe43f6641dbf1e1766e2a02cf68a9c3"
 SRC_URI[sha256sum] = "d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff44278d276141752a545"
-- 
2.37.3


