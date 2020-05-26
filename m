Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.2647.1590520824197571802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 12:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=JUAOhu1e;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.171, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f171.google.com with SMTP id z80so21919630qka.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 12:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wmoVL39tdorYo3lLx4VgFMWKcLbmNNOPO0Rgb9//64I=;
        b=JUAOhu1eIa3Tk67FCe/nkPXh+L+Q/cSGQX2B+9HAfKAI2pK3uqssQmgl7ZGm29kNow
         Uk9XKpf+8By1Pb282ZTndmnsfZ6vKvCbouXckSgO/Hcz51IB6o64gOuR9h4F1ZsvNoRm
         +boe2VxF3lUlKltaqFrsJg43wGqhpdJHLRpFPRhwkQIQK6Ji2KPazR/p20UkEbj/rAaT
         r21+ILdIMHRIPcOkkbnxQf/bszOPjLScIWMp/g6EhEhSl/5ixt0PBTu04d6TgRQHeXeb
         Ql6xhAuVSzA3RRA4n09PtHlH0eOXOPmFEM1KIOC0Z7O2ATgnsrYrbmS8VlcvDawngvAA
         MtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wmoVL39tdorYo3lLx4VgFMWKcLbmNNOPO0Rgb9//64I=;
        b=UvADW26vZlpBfME4UK3JB31w01fP09XqX+SAkFDBS3ERBADN+GAG4w3zam510fPqe7
         rXg4tH6HwEv5yVfgKOu/z15YLL7NRkx/AZkHOhSHEtMVYbLVtSuJiUMR1S/js8ofZmq0
         /72gUdU1PaZbi6WtrxUeP1rJoajVzgV0uEWHOh2Fj21LdsdGCuLfv4ob5Z5JbNKTDwoy
         Sh86ClJhWGiRG3+DPXXWBbAfFlggVbkCdybO4NBo591M5KOviJ8Ewk1JJf1NyEXeCciN
         oKoX/1b1EV2UxWBI5MEwXVIE2d0jpmv0seMJZiI2uYJdqyrdirotwx6F8GRMCi1eKXYW
         zlrw==
X-Gm-Message-State: AOAM5310KGbbMfL+Fp9Bu1ViAyrZ+pCfgBg2xQ9saURz1OJrrxHv0E9s
	qDAM0rsLEOx+1IdlOZuVBZMjmw+6vnQ=
X-Google-Smtp-Source: ABdhPJxVg6qMYcVgHFZpNNnseMlAVQ5SOnUw+NdB47dyxOLRDhSJTBqIKsJI+1OpQX0295d1xV0yDA==
X-Received: by 2002:a37:c20c:: with SMTP id i12mr374161qkm.167.1590520823240;
        Tue, 26 May 2020 12:20:23 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:d122:133e:cc4c:c1a0])
        by smtp.gmail.com with ESMTPSA id c197sm434453qkg.133.2020.05.26.12.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 12:20:22 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-oe][PATCH 3/4] python3-pytest-metadata: Update 1.8.0 -> 1.9.0
Date: Tue, 26 May 2020 16:20:10 -0300
Message-Id: <20200526192011.17024-3-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 ...a_1.8.0.bb => python3-pytest-metadata_1.9.0.bb} | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.8.0.bb => python3-pytest-metadata_1.9.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
index 807b0cedb..4a77af3cf 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
@@ -1,15 +1,17 @@
 DESCRIPTION = "pytest-metadata is a plugin that allowed for accessing pytest metadata"
-HOMEPAGE = "https://github.com/pytest-dev/pytest-metadata"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
+SRC_URI[sha256sum] = "168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c"
+
 PYPI_PACKAGE = "pytest-metadata"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "95674c2390b58e0138cabac5101d1908"
-SRC_URI[sha256sum] = "2071a59285de40d7541fde1eb9f1ddea1c9db165882df82781367471238b66ba"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-pytest \
+"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

