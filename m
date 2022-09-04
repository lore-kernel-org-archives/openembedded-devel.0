Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C9EC6FA86
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.11377.1662276884480382755
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kc54lvCI;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id r22so5601937pgm.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1DiD6zZDMT++Lzm8Er6XbQEJHedoUHaJ+9XZn418ihA=;
        b=Kc54lvCIG4YheUCKavfkj5zcx0/sjtVltTGXO8WU5Cln2EDig+UrjOXHr1b59FTGFq
         zYqm0ioGRGAeNvoaJQf8woRsfcPmvGsmCSfUNCBw/bm9oz/+Y1pbRL4aK1prGDS+zgi4
         X/wJvztQ1W9roD7xEdxEyyKocMeuJbAaeYN5TKHf7eCOiENmwyilatZIP9hBuuB91tZy
         Wy2VkrbKHrL8pBpezjQ8eEqHYWpwfvAZgwpLHrLjyt8wtlh7xHRd75a23r1oqWY8qAis
         Gka4DDUe4cNOl8F5LgdLXxbVHguL3SPrn55DHeVVoqjKHfNWkgonx46QbCxh9Ynkq/Vz
         UT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1DiD6zZDMT++Lzm8Er6XbQEJHedoUHaJ+9XZn418ihA=;
        b=BZ4aZs26t5w9BvumYADwVehvYYQIBAwGcEfO9MMvnDf5e9EoKsGlo47ToKb87F9//e
         Imh8fdVKg7LgGemRDss8BBC9QtaI2BuSocaxUUYsJyjnVM8iaVGwzqsRZY7gSPDuco8v
         Ao4MpikZtEF+le+F1oI6DGBaIprlugB3BVKo+NieoJqIeR2bXAbGPcN7w5tu7NVs8oaU
         lVM2J/kB7SgtVR2X9ICbhnYmhfTwF/xNe8SK4TjVSVfUuL1gj0phUaTkLlysNvT7we+k
         yifuYko2/9V3vgy5Id1w2jhC5OwIpkVfVosTJV7Na/iWtt6/n1U5xTCjHiPL4maNNyUU
         1dpA==
X-Gm-Message-State: ACgBeo3eYIAZwrt1sVBSthKnsJkg2YuMJJ3T8momJYDSwNqSzaLNiBSR
	eQ6+/wJllPtDdkUGNHIYEIScmL572XUL5g==
X-Google-Smtp-Source: 
 AA6agR6q2EypTXnK4y004a77qc6cSKp1M6vJxYRAeIhsldPRKDI7BSJgyvEgmH9zPNXOUNQCNV3CdQ==
X-Received: by 2002:aa7:9019:0:b0:535:fb2e:4ae9 with SMTP id
 m25-20020aa79019000000b00535fb2e4ae9mr43864446pfo.72.1662276890720;
        Sun, 04 Sep 2022 00:34:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 29/63] pam-ssh-agent-auth: Fix __progname configure
 check
Date: Sun,  4 Sep 2022 00:33:43 -0700
Message-Id: <20220904073417.3251865-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98623

This check needs to include stdio.h for printf() API to work
otherwise test fails.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...configure-Include-stdio.h-for-printf.patch | 37 +++++++++++++++++++
 .../pam/pam-ssh-agent-auth_0.10.3.bb          |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pam/pam-ssh-agent-auth/0001-configure-Include-stdio.h-for-printf.patch

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth/0001-configure-Include-stdio.h-for-printf.patch b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth/0001-configure-Include-stdio.h-for-printf.patch
new file mode 100644
index 0000000000..c9e2760a27
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth/0001-configure-Include-stdio.h-for-printf.patch
@@ -0,0 +1,37 @@
+From a0ae303fe0bcd81dfb1a649cc5e7a372d3bd878d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 20:44:42 -0700
+Subject: [PATCH] configure: Include stdio.h for printf
+
+Fixes test for __progname
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -2791,7 +2791,9 @@ if test "x$ac_cv_have_control_in_msghdr"
+ fi
+ 
+ AC_CACHE_CHECK([if libc defines __progname], ac_cv_libc_defines___progname, [
+-	AC_TRY_LINK([],
++	AC_TRY_LINK([
++#include <stdio.h>
++],
+ 		[ extern char *__progname; printf("%s", __progname); ],
+ 		[ ac_cv_libc_defines___progname="yes" ],
+ 		[ ac_cv_libc_defines___progname="no" ]
+--- a/configure
++++ b/configure
+@@ -14838,7 +14838,7 @@ else
+ 
+ 	cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+-
++#include <stdio.h>
+ int
+ main ()
+ {
diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index 7065529326..b5bcc63339 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.OpenSSL;md5=8ab01146141ded59b75f8ba7811ed05a
 SRC_URI = "http://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth/v${PV}/pam_ssh_agent_auth-${PV}.tar.bz2 \
            file://0001-Adapt-to-OpenSSL-1.1.1.patch \
            file://0002-Check-against-the-correct-OPENSSL_VERSION_NUMBER.patch \
+           file://0001-configure-Include-stdio.h-for-printf.patch \
            "
 SRC_URI[md5sum] = "8dbe90ab3625e545036333e6f51ccf1d"
 SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f47a763"
-- 
2.37.3


