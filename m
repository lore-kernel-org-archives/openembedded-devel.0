Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.6509.1603965832520555194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 03:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qzHoGhgw;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id w27so3017607ejb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2020 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vWnDdlNbKcbARG0cw4gLsUt7FUTvXxp2haKr6JWVEGg=;
        b=qzHoGhgw3P9QbmjmKE2EUJoqQndh7ANkDzu1mEr59Majgef4fyHaDBp97OrOjH7FDq
         LzeLlxdUjHtlFoYuUI76YiA8CMcTAYOX8WbZkmSJoOqUieZ5f/7Ig837nSRFpFsvRPT4
         SEuznU9tvcgQDo4AjwqpjimgAWtfvrCPfZXn9x4X9nuSxq43LoIGyZAg1SdWmfYMwL+z
         oBg8iHcX4SG3+X/orxg/q6vKgX+TgBFnDiN8Q5F/T/32ywNtCtHtijBqu9diZsPzVJW1
         FVPORkRw7IFket0ZEMXeSisGQt7T2/gfSizrwzEF0W5ioHSs8mD4M3HeOIxQZK3O/tFx
         D2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vWnDdlNbKcbARG0cw4gLsUt7FUTvXxp2haKr6JWVEGg=;
        b=sdheV2UblH3ym5N1QXg4RQl+6h+UTY2Nj2e5ru4T50k9rd8x5KyjDCm3paZqSOuYKn
         t4P+/NonGSNYapmy6JB5poGlSUgqKw1dIUOnFxpUk2smuNoebLgUf0ikrSgjIkQR+fxJ
         GiDZmHdnY7dYGD7uGzJ7PMChmFbbejbzZtjsFXm0LKEk5opI+RRvuYwJUWtLsG7b2HwC
         B0SimvR5VU/TraxepoU3HUske7/wHExBKN+/o9sbD30MLye+oJTKOxzDaXTOQmKoZ6hA
         Kk4ncGNTGAiEbmpug2nTUtjZVARYAbL8VWe8mjXod5G1MXLGdNZC3HBIkDGYtY1eEX3A
         80Ew==
X-Gm-Message-State: AOAM531YEOAE5I0SB0HCRwUm23GhIiLQ7NLbFcExaEKoe0cvnKsoXirO
	g5iHHUk2IY6ZCbbIbdvDkLwYhBfjmRMmqw==
X-Google-Smtp-Source: ABdhPJxzPUDGxq9jL6ElA7MzUsATbmrX/WiGjASek58U6Rx5lWi9UQeab1yEik6HaznXYtq4QaWnmw==
X-Received: by 2002:a17:906:d9c1:: with SMTP id qk1mr3339042ejb.426.1603965830416;
        Thu, 29 Oct 2020 03:03:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q2sm1196316ejd.20.2020.10.29.03.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:03:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] libsigrokdecode: add python 3.9 support
Date: Thu, 29 Oct 2020 11:03:37 +0100
Message-Id: <20201029100339.26698-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029100339.26698-1-alex.kanavin@gmail.com>
References: <20201029100339.26698-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sigrok/libsigrokdecode/python39.patch     | 27 +++++++++++++++++++
 .../sigrok/libsigrokdecode_0.5.3.bb           |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch
new file mode 100644
index 000000000..f7115a1cb
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/python39.patch
@@ -0,0 +1,27 @@
+From 9b0ad5177bd692f7556a4756bdbd2da81d9c34ce Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
+Date: Tue, 4 Aug 2020 09:19:44 +0200
+Subject: [PATCH] configure.ac: Add support for Python 3.9.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f9958b3..2917cb3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+-- 
+2.24.0.rc2
+
diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
index f9c1d1a3a..d78d2770c 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
@@ -8,7 +8,8 @@ DEPENDS = "glib-2.0 python3"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${PV}.tar.gz"
+SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${PV}.tar.gz \
+           file://python39.patch"
 
 SRC_URI[md5sum] = "7ba4ed4ef1f06ae96979751e096c2821"
 SRC_URI[sha256sum] = "c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0"
-- 
2.29.0

