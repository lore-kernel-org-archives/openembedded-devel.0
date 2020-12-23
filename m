Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.5525.1608703266373016799
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 22:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qt/JtJJ8;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w5so9956360pgj.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 22:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDd85Q2pSjeJm2z9sXYcvOuAN6cOw5NPbNzkHICuA3g=;
        b=qt/JtJJ8YrE1yuBmC8fWOnh4lJjE86/juYUt5SuvDnofxdI78TyfYZTw0eh3UbzUk1
         WIXr6YaRkcx7BPMHtxY9PaW16TwJ0IGc9QJSvjqG1TuD+Ly103z+MrykmjTjcnfc/5wk
         CC5vsPWNfeJNZlN1S3xeb2bKGLpHdhd+mcYwpB77RpUlsYX0x+TA9VzFl+fqglG4c3DF
         hqSfiotjdAzfdUAZd90lP4UiHz9D7hBvsg3qNqGoBmEvBdme+aYb3posXxwDM15TP2Yj
         yDf5RGM05/sOEfOp/PUGLSLQUdqY9yEIeoYwgUAI36UBUSX/4zRLnHOhsxPAM/esK0Uz
         7pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDd85Q2pSjeJm2z9sXYcvOuAN6cOw5NPbNzkHICuA3g=;
        b=sFY0b60rw/Drk6rXlLyPpEWJWr5PAaDVzmp+L8yAr0WC9GR3aR5uYlj1FtwaVR2ueq
         ATgnO3Zr9daD0aAJ5zDDpzUDMkNMrArsFWCAjIbA0vBR/dyGIFb+XQEfkSBtsDEH8aF2
         SH/8OfXAhlJ/FqDsa51wvQskP2nmkIyT7Gkbd8zcZWIXLzLBbCu7ei9RBHbANYTSKTIF
         r7aZx/57nJblcNbj5dbz0BCQNY+h0SIFrSiw+CHh2JCGZdkZRJ5Edk2pLjp01wD2lXMa
         r+V/EQTkQTACWOIuNoesi/6Zg3oImy8sAUPTVKEIuE2kmgS13xiHEG07EXx8FfTHxZVR
         LZig==
X-Gm-Message-State: AOAM531x0dnrV1RoZTlgdWWkakLk8gHaAPMdmtSw5r7A4KER7ibYERVL
	6i2pnMcLuzn0W26xB049i5U2FRcwzSBWkQ==
X-Google-Smtp-Source: ABdhPJzmWC28xsep5dhWXu30pyInns4eRCUwqDM+gXXuNXydOi0n/qSMzfuChNYFw+1yi+AO/Qhorw==
X-Received: by 2002:a63:1322:: with SMTP id i34mr23205840pgl.282.1608703265716;
        Tue, 22 Dec 2020 22:01:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id k11sm23325675pgt.83.2020.12.22.22.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 22:01:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] postgresql: Use /dev/urandom when openssl is not used
Date: Tue, 22 Dec 2020 22:01:01 -0800
Message-Id: <20201223060102.3211143-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223060102.3211143-1-raj.khem@gmail.com>
References: <20201223060102.3211143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index a1665ab2b2..09c6a3ca9d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -56,7 +56,7 @@ pkg_postinst_${PN} () {
 enable_pam = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl ac_cv_file__dev_urandom=yes,openssl,"
 PACKAGECONFIG[python] = "--with-python,--without-python,python3,python3"
 PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
-- 
2.29.2

