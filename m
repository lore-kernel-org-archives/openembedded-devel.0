Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.37384.1597640496162512961
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2020 22:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ONOJFoNJ;
 spf=pass (domain: linaro.org, ip: 209.85.215.179, mailfrom: arthur.she@linaro.org)
Received: by mail-pg1-f179.google.com with SMTP id 128so7544763pgd.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2020 22:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aW8h0ypichPgZiqBDUbwHYa5g2+gvK2gG4U6MrgBt3U=;
        b=ONOJFoNJjO+t/nqRZkNkp62FCwdna6PPWzxwI1P6h4E1i2FadFodlXUUwnZKk+sAaR
         ve4JzTDE90lbF5UJ5mCrqW84xUqebywV3RVIagFU1lQzsN0uqoNOUtBIjIR0dub7QUel
         U8dmdk3W7dK3lBjY8Mjoa7ABREBBygRU9KImEAyGfqjiXcbXmvGz3dsI38vpTlMOZh7g
         1SOGjh1tUT4iDSKsX9XeGc0JExTdDOgRsXaw6gata8Oqna+X3lI+KbdxZff4ZsifiZFq
         OyLgn4qZD4GA6MiHxFDexmu70w7k19h3fG9eSBxx+JE6t/dAdQCLPPcXj3fjs58HR/6P
         5Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aW8h0ypichPgZiqBDUbwHYa5g2+gvK2gG4U6MrgBt3U=;
        b=orAbHV7/oV1TP9N5OT/fDO7sjvIuQRxrAyMO4QFeoyLCZGZt9+R6JKyjgGtldPz03N
         nJFYWusU8jYUrEmfwUIHVbxKcA2JRwHl9w0ifFdSSu0IRVEX8ZvTSO9BmZwYpx9PsJ7g
         iZhH87oCEu8eUvG0Y8aWn5XdnuL2NHr/2BCZPgxKMA5eEZq1eti5j2kdXgjKYtSVBBRV
         GbmVT8O4RWq8T4JWFoPrrv4NbkGm9eH/iEucwsMzqInfqUFxDGiiUiPla2M60rRd5/VV
         MrsWpKPl7uCDj0UTBVAIpcWQW3Oz5We11AsfC+u5qTL1OhASdFfu2+vHUTOlNXk6FQeq
         DYJg==
X-Gm-Message-State: AOAM532q39Z5YXICdycZ9dkjDs04Wj6jIZCJ88Ts47WNXVaQ03Xuavrt
	GGrsdw5DoDvvI2D76S2to0dqJX9Cub0K6Q==
X-Google-Smtp-Source: ABdhPJz7+35OqgXbTni9Ft6cyRUZd7WeEefKn81VysvNyoy3TESWhGQp1oXY53yU+gRlGL6Lq5t8tQ==
X-Received: by 2002:a62:8815:: with SMTP id l21mr10008979pfd.309.1597640495335;
        Sun, 16 Aug 2020 22:01:35 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id w10sm15381652pjq.46.2020.08.16.22.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 22:01:34 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [meta-oe][PATCH] xmlrpc-c: Upgrade 1.51.03 -> 1.54.02
Date: Sun, 16 Aug 2020 22:01:32 -0700
Message-Id: <20200817050132.4078162-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade to release 1.54.02:

- Build: Use 'curl-config' found at configure time, not at make time.
- Fix bug: 'toValue' won't compile for vector of vectors or map of vectors. Thanks Yang Bo .
- Fix tiny memory leak in virtually impossible low memory situation.

It also solved one igt-gpu-tools test results misleading issue [1]

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/92

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 .../xmlrpc-c/xmlrpc-c_1.54.02.bb              | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
new file mode 100644
index 000000000..c1f0b78ca
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to help you \
+write an XML-RPC server or client in C or C++."
+
+HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
+
+SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
+           file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
+           file://0002-fix-formatting-issues.patch \
+           "
+
+#Release 1.54.02
+SRCREV = "86405c7e1bd4f70287204a28d242a1054daab520"
+
+S = "${WORKDIR}/git/stable"
+
+DEPENDS = "libxml2"
+
+inherit autotools-brokensep binconfig pkgconfig
+
+TARGET_CFLAGS += "-Wno-narrowing"
+
+EXTRA_OEMAKE += "CC_FOR_BUILD='${BUILD_CC}' \
+                 LD_FOR_BUILD='${BUILD_LD}' \
+                 CFLAGS_FOR_BUILD='${BUILD_CFLAGS}' \
+                 LDFLAGS_FOR_BUILD='${BUILD_LDFLAGS}' \
+                 "
+
+EXTRA_OECONF += "--disable-libwww-client --disable-wininet-client"
+
+PACKAGECONFIG ??= "curl cplusplus"
+
+PACKAGECONFIG[abyss] = "--enable-abyss-server --enable-abyss-threads --enable-abyss-openssl,--disable-abyss-server --disable-abyss-threads --disable-abyss-openssl,openssl,"
+PACKAGECONFIG[cplusplus] = "--enable-cplusplus,--disable-cplusplus,,"
+PACKAGECONFIG[curl] = "--enable-curl-client,--disable-curl-client,curl,curl"
+
+do_configure() {
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+        autoconf
+        oe_runconf
+        # license is incompatible with lib/util/getoptx.*
+        rm -fv ${S}/tools/turbocharger/mod_gzip.c
+}
+
+BBCLASSEXTEND = "native"
+
+CLEANBROKEN = "1"
-- 
2.25.1

