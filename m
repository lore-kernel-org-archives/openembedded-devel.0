Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.1011.1629567350092664054
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OXTZeDw7;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id t42so8965748pfg.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rFsFpQqMzI3TT3ijqNdrDIrdF8VIKnQqp+T6Wml8BEA=;
        b=OXTZeDw7aNT2S03idb9HQJSeIU+CJV42CFquhBB048ZRJPA6rxUfO0e5DEgRwPnyzE
         oo25NDoOLgAGLhll0RjKEj97Klp0BE4vCfPJ1vt1FzLVa7ReensA726FXFq0bKBsVNFB
         zc+DuSpfCQgDmwPVd3ojnVDkNwkTzmzJFspUvHRjtCzKDb8LL8XGMG7v4rsliWC2Sr32
         lqSZJjBozpOUYS6paAnmwRlDzjH2ujK231lexV9noy8rUKlSsz6KKdFx7YmPZbMAGLAw
         AZvCaKI5AurcGLCHIYT+oKIPfeoDr8rYNMRjBPchv1bgZvbg4xFB5fCBVF1L7JiKIlNJ
         MMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFsFpQqMzI3TT3ijqNdrDIrdF8VIKnQqp+T6Wml8BEA=;
        b=TmKlPFkPHirv/IUlLg2jkVQu7FDOd6tma1WFacpchOC4RChvtQ8lOspf/bQjGiVEp8
         WBECv+vuGaKq6CMU3jOS/s8v9WoMB058ECLwFIAy5OK3GlbTA6E8i/gaYdfHaxzvDTLm
         BpIc4PICHTFrfgvth1BdiEkXQ2wZOYJEu/pRghCgRdxkXAcFMSvY7jE3SE6rvgZU4jg0
         noCVlaUBWq2wzPLOMeoJHUFqlVZC3Xlcdmb/fqdi1CMeHAGDxxFb375fsxpR3vv+rhwp
         sUEgjwfELPEMuLXtdIF4e4kP/LkZw50ATMgnPaISzzThoFi4e2KPjJWoSgXh5yGqzDSS
         yJEg==
X-Gm-Message-State: AOAM530JrgccKwQpvAWbYIZw0RA2XniKd/+flmDzKy3FUutgL+IhucoR
	e9AWY46VSKWfVQIjAtZUpGhKFh3EYRM=
X-Google-Smtp-Source: ABdhPJxbRqtz4mNWX62CanzsHzqdxV291VunE5ylelMrSl+DokrXIqdMCZzwPZq5feS4AVl16bf/pA==
X-Received: by 2002:a63:1266:: with SMTP id 38mr24187341pgs.219.1629567349525;
        Sat, 21 Aug 2021 10:35:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:49 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 5/7] php: move to version 7.4.21
Date: Sat, 21 Aug 2021 10:35:39 -0700
Message-Id: <e4a74a0f0fae82d8ebb4e5233c391eee7c899318.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Lots of bug fixes.

CVE: CVE-2021-21704 CVE-2021-21705

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93045c3db744a9f1cd0a9b0ce992d44d9c44c309)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 69dcf5bac8adfd55f1a40cff1e989ed8806607cb)
[Stable bug fix only updates]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.16.bb b/meta-oe/recipes-devtools/php/php_7.4.21.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.16.bb
rename to meta-oe/recipes-devtools/php/php_7.4.21.bb
index bc0a6b5df3..c7c00ac30e 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.16.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.21.bb
@@ -33,7 +33,8 @@ SRC_URI_append_class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
+SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1

