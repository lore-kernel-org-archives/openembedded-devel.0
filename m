Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.21353.1610905006105806692
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ae8pJvHH;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m6so8804962pfm.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XXEC2FZeaNmQIdODJXrWTSTjmYa6kIprKjyrjm9rZ20=;
        b=ae8pJvHH0ZXut1LGoBxjZrebb8mt9Kfm0xGYsszayLKC3ko1sM/evXhCsXmvhdbSJN
         e6NSSwgP92MKB6jqHH3Dtu028sCovkoqH7CvZmHmpmYLIg0NW3JdMHA79/IfcxrSOrvt
         +OyrySDI+NXPptJoikUfwuOUWU1zJXHu8GQYhgpcnR3rmPfP2+9xqprOi9yh/epvBO7m
         0vQpzPDeX24iSnmg0j3tW1Pi6SqVkI2KpK6p2mV40C4HKoEY2nTKqt4RZuGA+r2g3Ej1
         VICd0EVLlAoYHhoL0NZw6cA+/oHDASFpk0J/BMNSORBoszep1sNLA5B38QdGzjE8emao
         sMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XXEC2FZeaNmQIdODJXrWTSTjmYa6kIprKjyrjm9rZ20=;
        b=T/L9TaKOqjdiK+f/TbcTzDzSKSo8I7SC3vw37UdZPlbp22FMJXXMADJAYrtPXDPPGK
         ys9l2wgYZapwZK3Pks1G9W51ZQdgejEdAPJIWFHrgK1rD8o63dq2nxrK/jqK0kiu2n6m
         /qx9YfTBTYtguXp6HGaJhMS979E+8XpehDqwWgCMvDvW0e8sxc3kqFOEAqaHPcKJgtzT
         h80T6FsWOtw6lanSPvsZivwNea5GYIZe6uH8S8+sHIGNnEfsCu0jPql9mZAxvor+KXDI
         AYMx+KHKkMPheQBVWgsMoRVul8rhQi/GSXKyw6i/87HLKoaZYxOjT5Aj28UlBcAp9W9h
         eZwA==
X-Gm-Message-State: AOAM533uxkm2LNewbpUitd2kTym1/0IeFXQblKeQ4IJsvQ8omc98oocI
	bRgrL9bHsYQgxqd2MHs/PUt2eM2ehGyJ0w==
X-Google-Smtp-Source: ABdhPJyG7j5pp6EAi1L/Oqcm+UIHQSLsHaL4yAZRZwA3H8vgQIB/gSiAglclyHn7KM1tNpQPC3GZvg==
X-Received: by 2002:aa7:82cc:0:b029:19e:1328:d039 with SMTP id f12-20020aa782cc0000b029019e1328d039mr23164097pfn.70.1610905005524;
        Sun, 17 Jan 2021 09:36:45 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:45 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 05/31] php: CVE-2020-7070
Date: Sun, 17 Jan 2021 09:36:10 -0800
Message-Id: <09f5a2ac5ab8550f5f0bd05417f2f54d27995dac.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Security Advisory

References
https://nvd.nist.gov/vuln/detail/CVE-2020-7070
https://bugs.php.net/patch-display.php?bug=79699&patch=fix-urldecode&revision=1600650364
https://github.com/php/php-src/blob/master/main/php_variables.c

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aff8a1fefb9a1a311e5ba14ad69871514270803a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../php/php/CVE-2020-7070.patch               | 24 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.4.9.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
new file mode 100644
index 0000000000..e5b527f989
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
@@ -0,0 +1,24 @@
+Subject: Patch fix-urldecode for HTTP related Bug #79699
+
+---
+ main/php_variables.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/main/php_variables.c b/main/php_variables.c
+index 1a40c2a1..cbdc7cf1 100644
+--- a/main/php_variables.c
++++ b/main/php_variables.c
+@@ -514,7 +514,9 @@ SAPI_API SAPI_TREAT_DATA_FUNC(php_default_treat_data)
+ 		}
+ 
+ 		val = estrndup(val, val_len);
+-		php_url_decode(var, strlen(var));
++		if (arg != PARSE_COOKIE) {
++			php_url_decode(var, strlen(var));
++		}
+ 		if (sapi_module.input_filter(arg, var, &val, val_len, &new_val_len)) {
+ 			php_register_variable_safe(var, val, new_val_len, &array);
+ 		}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index 1da5607835..bc58b5792e 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -30,6 +30,7 @@ SRC_URI_append_class-target = " \
             file://phar-makefile.patch \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
+            file://CVE-2020-7070.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-- 
2.17.1

