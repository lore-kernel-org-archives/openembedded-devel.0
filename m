Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AC7ECAADC
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.34042.1661494320063452625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PD2yQFry;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id v4so524655pgi.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xwXWRhurZNbnG8tSk7Po6D7leXYhvkY5xiBcO4J+w5Y=;
        b=PD2yQFryBVRIc67i7HE28dGdEmjXWpoPTlhuGzBVSUjVDCyPWYN/SbPI0LVFlTF80S
         8qKHvQOKOxu5qc68xlTL7tZMwsxffj1EbrHQ+fN4ORrulQc1xnLtLHFhpI3UwgEAtVhP
         9zI2jE9CK3BpGJDC0u7NOw+/hSWSI1bT//d4JqipPaxztonP1G1xinOu2sghYEcwtOy9
         EJENWGMdn8eYaBx72MkVR85CURd3WwVMdQcK5eWn+Recu7M4+1Qk9cY1MwIYKa2niUoS
         OLpxj4f6aiSkc/qoWtUyltTQ30cZi5XVAD/Jh/XId4suYfR3qPRC3uSr6TUE49m0Cbzj
         jvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xwXWRhurZNbnG8tSk7Po6D7leXYhvkY5xiBcO4J+w5Y=;
        b=JW9bu/r6AEKewA0MSSZ3h4oSACKSRfOhGuwG3VIgHKXA2WJWKjTjLkMN/kavEi4axq
         lAEoj5ll+TVupOV1FjHNY1C5yNQvirODs99J9qvKbxEPwdfYyGFAq1XFQCrd3avEDuG0
         3XGwhcEfgfEUzDCK33m/jR8SXUUooaJM+j4YQ6iVhCo4TzOHTOm68fMv5dYXYUuNbD6M
         hVp+amr8jIoOenvt7oiaAGUtZ/n1MSLMEQWvZvQEk6zN0zp3uL8zwRceoXAHJOtLvoze
         ygusyhlsO88I3M27n/Zz+f3bIHXYvSKFDIyRz+uLfbFNgDWqbWIn9XoCiuMvgfejRPHx
         AsNA==
X-Gm-Message-State: ACgBeo0cjCZ80BQ3swtyPTm8FbUVnBC28inse1n11Q7/0L2GNY74sb9Z
	Vs1bGSuP87a4lVnN4vbA2Q+92VzCewUlbA==
X-Google-Smtp-Source: 
 AA6agR4pLs49yOfhxZBIMRHwyhxPe+0111i+raT1FkUnZQxJhUF0Fg4zikIbPJs/OAO6weAuUT+ckw==
X-Received: by 2002:a63:91ca:0:b0:42b:4847:90dd with SMTP id
 l193-20020a6391ca000000b0042b484790ddmr2037375pge.28.1661494319237;
        Thu, 25 Aug 2022 23:11:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/9] libteam: Include missing headers for strrchr and
 memcmp
Date: Thu, 25 Aug 2022 23:11:48 -0700
Message-Id: <20220826061150.3030485-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98470

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ssing-headers-for-strrchr-and-memcmp.patch | 46 +++++++++++++++++++
 .../recipes-support/libteam/libteam_1.31.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-teamd-Include-missing-headers-for-strrchr-and-memcmp.patch

diff --git a/meta-oe/recipes-support/libteam/libteam/0001-teamd-Include-missing-headers-for-strrchr-and-memcmp.patch b/meta-oe/recipes-support/libteam/libteam/0001-teamd-Include-missing-headers-for-strrchr-and-memcmp.patch
new file mode 100644
index 0000000000..5f8e56177e
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0001-teamd-Include-missing-headers-for-strrchr-and-memcmp.patch
@@ -0,0 +1,46 @@
+From 49693cac37ee35ff673240c8060201efe0d999c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 22:27:03 -0700
+Subject: [PATCH] teamd: Include missing headers for strrchr and memcmp
+
+Compiler does not see the prototype for these functions otherwise and
+build fails e.g.
+
+| ../../git/teamd/teamd_phys_port_check.c:52:10: error: call to undeclared library function 'strrchr' with type 'char *(const char *, int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|         start = strrchr(link, '/');
+|                 ^
+
+Upstream-Status: Submitted [https://github.com/jpirko/libteam/pull/68]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ teamd/teamd_phys_port_check.c    | 1 +
+ teamd/teamd_runner_loadbalance.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/teamd/teamd_phys_port_check.c b/teamd/teamd_phys_port_check.c
+index 1eec129..c2454ab 100644
+--- a/teamd/teamd_phys_port_check.c
++++ b/teamd/teamd_phys_port_check.c
+@@ -19,6 +19,7 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
++#include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+diff --git a/teamd/teamd_runner_loadbalance.c b/teamd/teamd_runner_loadbalance.c
+index a581472..421a7c6 100644
+--- a/teamd/teamd_runner_loadbalance.c
++++ b/teamd/teamd_runner_loadbalance.c
+@@ -17,6 +17,7 @@
+  *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+  */
+ 
++#include <string.h>
+ #include <sys/socket.h>
+ #include <linux/netdevice.h>
+ #include <team.h>
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-support/libteam/libteam_1.31.bb b/meta-oe/recipes-support/libteam/libteam_1.31.bb
index ad84389013..023cea9039 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.31.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.31.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/jpirko/libteam;branch=master;protocol=https \
            file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
            file://0001-team_basic_test.py-switch-to-python3.patch \
            file://0001-team_basic_test.py-check-the-return-value.patch \
+           file://0001-teamd-Include-missing-headers-for-strrchr-and-memcmp.patch \
            file://run-ptest \
            "
 SRCREV = "3ee12c6d569977cf1cd30d0da77807a07aa77158"
-- 
2.37.2


