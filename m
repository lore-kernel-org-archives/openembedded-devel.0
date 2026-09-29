Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB547CA5FBB
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1491.1790722679109543677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RLJRuDOm;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso1377404eec.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722678; x=1791327478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j83HoH/yIdpueNHkb60iPQY0Jy4jJHh0gQxzlF5wuKg=;
        b=RLJRuDOmEvF3Vmjkr6aST1zTNZwXpuW89b/vyjCePMe/Bqs50vFzXIjVVtK9V1Y8MP
         Pc6adMdpJtV9Efj9h6Ra/yKSKd/sWN8XhLsK9sg6fVCUQmyG+Cpk1XIAiv3ddQH28+zm
         ykZcW8rPo9HDG0sD8dtElPXyM1eayl2jv8wvSFJ53j5zzSOpkIfS2Rj4DSkP+NzRSbsO
         4DFv8apFWsbH/BHsM307x8S6B1W2A2+OyVOcjd/iwZsOrlkELPcLgaK0nPWi47HM+Sq/
         Bin6Abnsqqu7RO7T7YHIRXM4ZVtlk1QhKo5kTGj8sDqG5omuRn4rrfOnB0K1YT0rRf/7
         +iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722678; x=1791327478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j83HoH/yIdpueNHkb60iPQY0Jy4jJHh0gQxzlF5wuKg=;
        b=lNnBO2rCacMdSmckZ8F71xsHBABZIg0YuSPm7rl3g70YBQxXbVPzgZWgj79LkMoL+X
         AdQu/usXvZRPKpJewZm2IWUmKnvwbWysuGVrLc9Qn9osLdOGyQNrygLBI9AjbWG0wbbX
         oJ8INf/HVkv6ncSYTLByXI733c4p4sI+WXxV1T9SbcGh+vEoNu9daFj6JQleKdyvNUKt
         hehe7QzsjVepsbRc+Bt26kfqvrF3URTOF14sdTPtHDSqdqXJCpXkISB7KEWMyNheNhya
         TmMPRXc8hiTNLAk3zYSBBPbzOOmAr2UpGX2Sozzddrl4Nm2BUf9WRQWVFOyjdxaRF8Sa
         34Kg==
X-Gm-Message-State: AFq9FYJHP6A2EZfuplxm8irKHK11XsGg+SoPTXUkhAdNY25vaSjpDqFc
	Bh38TvZV40WyV8ERat/Ki/Jefc9LadxaNIKCfCJEHBq/z58yFz3SV/SmRzrh962Q8D0=
X-Gm-Gg: AYBFou2oP15JdE/10DMUNVLkeNB5BxJLvH2yD2hq5yapOZuKHZ8QIZySx8klvIX2KqN
	SqxY7NwUK6FACEpMKyX45fDqnFv/+fVOJ/0DkpjH56g57jytHUk348fUkiUbMQSwaQDuacgF6OT
	UPH0FXUWlRG06neuUfXM4gQfwvczNGpmbRk6L3ySdo68O/F88RznhrAp6sEjNHZbDsOhrlgd4i2
	1hZIJARbzYiTZmyD47vS+mrFO99s85boZTCGtMLsMQQsOCmo1e7wU75+XMxmWqvz/KjZSg1Y/ZM
	MgUGEpT9+68t5A1Eb2uD5CaWAvVkiTw6/DGBmVmM41lcqRQ9B3G+rCS5PweRwuveYdnlRmC789J
	PjMZsmoGByFN3TkKbDUs3Znz5SlU924dIBKvaRlklAgJEGaSOTmPPuvzBsp5/6JQD6VpT7YHd6P
	GjeqgVl4xhSB0zgEMkTWte51pyE6TzOtFKSX216GqhBfM676o09+vH7Sr5sB7/Q5/nQM6aQnYw4
	NDkbTEPKIJHu7aKjOkqN72A/z4K+BajhHFZe23nJFpZ2JrjmkLozJNG03d+KutDUd0Kz+HAAgG0
	nANGYTec3J9nNE8q+T9OiY8pLeIHqB7A+WwKDaIAl89y4SaQPntd3GBKIWUSel4J1w+S1Wsmccn
	uj7EQBsQkkaaZQG4EeTE1RsTPVFjQFZePwOcMb5qkWZHso8pxuCnIk10DL7gykuKCfAXaLvO1mE
	1s1GzgEbrokYa2K4VbB0XuZZw8CQFctcyk62e8Ig==
X-Received: by 2002:a05:7300:d105:b0:34b:7158:974d with SMTP id 5a478bee46e88-34c676c5ae6mr774091eec.27.1790722678429;
        Tue, 29 Sep 2026 15:57:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 21/26] ot-br-posix: reference sCrashCallback on non-glibc
Date: Tue, 29 Sep 2026 15:57:18 -0700
Message-ID: <20260929225723.1046705-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130508

backtrace.cpp sets sCrashCallback but only reads it back inside a
glibc-only execinfo backtrace path, so on musl (no backtrace()) clang
flags it as -Wunused-but-set-variable under -Werror. Reference it in
the non-glibc branch too.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Reference-sCrashCallback-on-non-gli.patch | 34 +++++++++++++++++++
 .../openthread/ot-br-posix_git.bb             |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-posix-backtrace-Reference-sCrashCallback-on-non-gli.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-posix-backtrace-Reference-sCrashCallback-on-non-gli.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-posix-backtrace-Reference-sCrashCallback-on-non-gli.patch
new file mode 100644
index 0000000000..88c3b67314
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-posix-backtrace-Reference-sCrashCallback-on-non-gli.patch
@@ -0,0 +1,34 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:57:51 +0000
+Subject: [PATCH] posix/backtrace: Reference sCrashCallback on non-glibc,
+ non-Android builds
+
+sCrashCallback is set unconditionally by otSysRegisterCrashCallback()
+whenever OPENTHREAD_POSIX_CONFIG_BACKTRACE_ENABLE is set, but it is
+only read from signalCritical(), which is compiled solely under the
+`OPENTHREAD_POSIX_CONFIG_ANDROID_ENABLE || defined(__GLIBC__)` branch.
+On musl (neither Android nor glibc) that branch is replaced by an
+empty platformBacktraceInit() stub, so the variable is set but never
+used, which clang's -Wunused-but-set-global (promoted to -Werror)
+turns into a hard build failure. Use the existing OT_UNUSED_VARIABLE()
+idiom already used elsewhere in this file (e.g. in signalCritical())
+to acknowledge the variable on this code path too.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/posix/platform/backtrace.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix/platform/backtrace.cpp b/src/posix/platform/backtrace.cpp
+index 1111111..2222222 100644
+--- a/src/posix/platform/backtrace.cpp
++++ b/src/posix/platform/backtrace.cpp
+@@ -185,6 +185,6 @@ void platformBacktraceInit(void)
+     }
+ }
+ #else  // OPENTHREAD_POSIX_CONFIG_ANDROID_ENABLE || defined(__GLIBC__)
+-void platformBacktraceInit(void) {}
++void platformBacktraceInit(void) { OT_UNUSED_VARIABLE(sCrashCallback); }
+ #endif // OPENTHREAD_POSIX_CONFIG_ANDROID_ENABLE || defined(__GLIBC__)
+ #endif // OPENTHREAD_POSIX_CONFIG_BACKTRACE_ENABLE
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 8c49a30327..59e1dae2a3 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=m
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
            file://0001-x509_crt-Zero-initialize-mbedtls_x509_time-at-declar.patch;patchdir=third_party/openthread/repo \
+           file://0001-posix-backtrace-Reference-sCrashCallback-on-non-gli.patch;patchdir=third_party/openthread/repo \
            "

 SYSTEMD_SERVICE:${PN} = "otbr-agent.service"

