Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF584C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24370.1786747581707487566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d0IaI6GO;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1441587a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747581; x=1787352381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vn+vGv9AC6mq4kXfC1a0x35oH/uU/ed4AacTwc1i40I=;
        b=d0IaI6GOXyysmTtEGyBgNvWCKfG890To/+dfgJpUGllLDgQQ/UN2xN1CUF7EBPqZw0
         JQ1T4OjR15Tm9FTaeLhh1cmolSz1GMQ1BHSwyQ87Jqb8e2KzcJ9oJW3r3OQFWqb3FGI6
         FT6FA9gPmGVQ2fSYu5XaTd4te3gka6xu+lq2j1XBTidGeeFGGcWRxKDY0stysidlgmtN
         SSKd9Y60j1seBc/mxuFnleUG1jc8p5c20qu6c5GG5CWycS6F5vHRBEOLXRKqJ8hVlqJY
         0ce9s4h3trPXkm6Tdwr0fd2pp0Qq9zrSHrURE+wx3lUMalpA/Pg4h156AbHl2Mudzy1x
         vUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747581; x=1787352381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vn+vGv9AC6mq4kXfC1a0x35oH/uU/ed4AacTwc1i40I=;
        b=fkm92li5+tGQJGQAH7OKvIEhG0e3Q8cUxdyouuSsC5Xqpn5ubmQ62M66m+t54cassX
         0Ti0XGIJa1bNKUfDm1AyRkIVY0lZwUbKQzW5AOz0FH4N4ky3eq+dsgl0nMT5StxGHbJS
         etKNqPUbYlsjnLFe7inKR+Ur4rAMLNqDJrqpQcoy4KTrOAsnkS5Ur/bjBE9KP5USme1e
         pmuaULlJDyZi1DvD1ZQgDAytzfBItqbsT/VIFYlAusAG+eeKmtRC7/HKEOgG+9P2AKCg
         iuqScVzxAuZzQGmVqg935rhHHthvtILuEhvNcNynba3KFZaRvFbLtuiV7ssz2zeztzg1
         q0fA==
X-Gm-Message-State: AOJu0YxudUuKV+BI6VZIfBOex14loI5bLyHJm2YfEqsqtJxVMTh4ITXl
	kK83D2bAxqMxTaUBX+p6SOw9R+nnJ2A6JZsFx2wlCR0gC9Io2v5IOUVJU3+7tybH
X-Gm-Gg: AR+sD11e/bNpeks1JZ0/rlwP4i1R3CjteVxpPsNr9qbBipTC4N/cNiZ51J+Karz6Oeg
	cerBbdhyE1tH+8gYW7OA2Yvto9gJnTzWZ65hjylKoV7VsLorq0Tfbxh+BLlt+UPJhUg2pLlEQrd
	KP6mkHPxB5tvFx0AmC6osiqd+IHCxw5DniNUFGBUBT48FyIOJymoZKUfpsfGi7ptKGKc/UWRpUj
	1Gdex7DtstFZX1DvjS7WZke95vJ0Iwr0Lf5Tuy2b4YTh9uQ5Tfuk5JjqY7vG35I1nlrjFSxHNCF
	1xgS9OrQNMvBYGibs6G8GhWXA/R8cJU4QBdyxiDJIGY9ROcMeX4oAsElm1+28BEMzib/2j13f/Q
	FzI9vEEaA9AJDgNal2SumcKDPnsl526jXoL817USNurKkYnZtk13lKUaDE5xafBWnsCSv7Si3n3
	DX6ZrUNIXLdE2g9CIAtockaPS76mZCZCww1k9Ygt3cfCbepJtJVgZ+fjmzTCBQVtQCu3GpSrd+f
	HrzMIUIwHwtB0phLA5CD5HEfEZwCf59eNKfLHDRpRshxRhc6kDtcoT3tp/GMgi8qqpDXB6YWDA5
	JrfTNOI82n9ZswUFxB9FO/MvrrPksimord5NLh/qNka3z4tgOlsRkTLKB6t+Cr5pUADPdUruLjA
	4BCLA6NhQ9f3UgMBWAsikYWRG1nkzGaOxJNgSaBacLoj6wM/wRA2VjX42
X-Received: by 2002:a05:6a20:d48e:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cc71a24c46mr11350439637.1.1786747581028;
        Fri, 14 Aug 2026 15:46:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 035/109] liblognorm: upgrade 2.0.9 -> 2.1.0
Date: Fri, 14 Aug 2026 15:44:21 -0700
Message-ID: <20260814224539.1523174-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129099

Minor release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ntf-to-autoconf-function-check-macro.patch | 28 -------------------
 ...iblognorm_2.0.9.bb => liblognorm_2.1.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.9.bb => liblognorm_2.1.0.bb} (84%)

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch b/meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch
deleted file mode 100644
index abb09bc648..0000000000
--- a/meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b8c65236cd6cd68b57004479006c683455680a82 Mon Sep 17 00:00:00 2001
-From: Alfred Wingate <parona@protonmail.com>
-Date: Sun, 15 Oct 2023 12:34:52 +0100
-Subject: [PATCH] Add asprintf to autoconf function check macro
-
-Upstream-Status: Submitted [https://github.com/rsyslog/liblognorm/pull/376]
-Signed-off-by: Alfred Wingate <parona@protonmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b6f92f1..b057550 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,7 +55,7 @@ AC_TYPE_SIZE_T
- AC_FUNC_SELECT_ARGTYPES
- AC_TYPE_SIGNAL
- AC_FUNC_STRERROR_R
--AC_CHECK_FUNCS([strdup strndup strtok_r])
-+AC_CHECK_FUNCS([asprintf strdup strndup strtok_r])
- 
- LIBLOGNORM_CFLAGS="-I\$(top_srcdir)/src"
- LIBLOGNORM_LIBS="\$(top_builddir)/src/liblognorm.la"
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.9.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.1.0.bb
similarity index 84%
rename from meta-oe/recipes-extended/liblognorm/liblognorm_2.0.9.bb
rename to meta-oe/recipes-extended/liblognorm/liblognorm_2.1.0.bb
index 188f7d6011..050916330b 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.9.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.1.0.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
 
 DEPENDS = "libfastjson libestr"
 
-SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV} \
-           file://0001-Add-asprintf-to-autoconf-function-check-macro.patch \
-           "
-SRCREV = "3804548e3541747bde3e82a78d2c2dcd865296dd"
+SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV}"
+SRCREV = "71dcbaf806a0e464aded2efb98651ff89aec8a36"
 
 inherit autotools pkgconfig
 

