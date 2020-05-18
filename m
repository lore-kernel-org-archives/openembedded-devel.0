Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.43844.1589813411616935123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q9lTQl8q;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id s69so5329909pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=C9h8qpIBNnY6YH/mnrO+G38jlxnb0+fNMx5BiaD4hDw=;
        b=q9lTQl8q3skNMa4Vm6IrhBZubhxOv8Vwc1OaNEKgNpBtwpkAcU5ZryD5rOiM0G+/cm
         r0bn3Z4xACoi54oU+EctfImeD/Q9l0ZzXy9H1vuMJSCjl5DoYkLjZnUWu5kZfcJERv/O
         mryYF3F+wGFqRFZnTo89YCxu6bQj9dI/wWfe1H5PoNYBgGlC1AVgoaEmhEyS0LLuhncI
         sPy45rzn/TiT77PUj7d1zoQCmErKoQApjPnd9qyagE3Hv6Z5dZ7/a0hZueUI4dwDVnY/
         UP5scOk66bt3UDaH/oB5E9cKpr1a5nASjN3zeQdvyWvIzmDvx3LDz/cIsa26Tu8EcEJS
         sqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=C9h8qpIBNnY6YH/mnrO+G38jlxnb0+fNMx5BiaD4hDw=;
        b=EpcPjhzijHQxETNdGFzgM7FMuukGup7m1pAmaZqGlpAlAm+hUd1mgYLIZQ7RPQHea5
         ntn7BZUfbjsSeP1wluR3uHRR4NeAGeMEUBHK84KD4smjmAAWiK+wYmAjOyFY3gKf6SM4
         skfmc9+l9+k7AVwxyRhTEqraTmHf+QlEEqD0ffBwnVh/1+zgtFIZba0by1HZagRf/0Br
         Gd/F3dRbOHQ1i++CZkTYd1yhJpbhbRljcL1s43IOwv7DoMgBviVHHrGPAKxSnQ5r/IoK
         x/U2s5J94uby/1RcCmapudeDe6Tl33xQ4BFYka6HbaUIPU40UErd9AAHlIS5a26kZlP5
         fhZg==
X-Gm-Message-State: AOAM533ip24cbwmxQ/Npa21ePukQvt7YKbfA4LUE4Iuff2k9gnCryHqA
	4B8JC79laNrw3C4oBN6gFUZOqJ7h
X-Google-Smtp-Source: ABdhPJzihyQjCivO1Iy+5BWxmWWRBgab5QTCFAKUuwtahJgoEsLf6dWNWsHAEsGh0pDRzTo1vL9iCQ==
X-Received: by 2002:a17:902:c40c:: with SMTP id k12mr11644626plk.11.1589813410947;
        Mon, 18 May 2020 07:50:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:10 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/57] php: fix PACKAGECONFIG for soap
Date: Mon, 18 May 2020 07:49:09 -0700
Message-Id: <ecce4fe695cc1ac6a7688e9579551683fbab0ca5.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Claude Bing <me@claudebing.com>

PHP 7.4 enables libxml by default and removed it as a configurable
option.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7aeef522ff3522ccf76a6750846e235e7c80427a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
index c1784a78d9..a76dcaad37 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -93,7 +93,7 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
-PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
+PACKAGECONFIG[soap] = "--enable-soap, --disable-soap, libxml2"
 PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
 PACKAGECONFIG[pam] = ",,libpam"
 PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
-- 
2.17.1

