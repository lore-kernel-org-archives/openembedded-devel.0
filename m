Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F87C38142
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2063.1674324092782604368
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T1dciYX5;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id d8so8375958pjc.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koUcgKCFWXov3+NezwzTEpayFNsZPqRly/yqvoVV4ps=;
        b=T1dciYX5T3EkPINH5BHOvgqHWbGPtYt+l+d50hlVuzPT9QV7FsJHK/Yzukd6q6XiS+
         R1CldNf0qWJrxd3sl8bdBcYu+r3fPZ2AGM621OwNFNMiagqu07NyxxD+t3KXMlqMVtF1
         x9i364NjSHsS+f6Hb/meS/7w259yTpjURMjC1jQwDkTbkGtD7DAUxPI6e7uSCNy1UR3J
         wGc9VJeRq16JM+J9XRsfdFv6t9ukDPT6ONn6I8PmERXGdXI8oVzSwmT/+glqfiDlI8Tf
         N2IG24hTzQXVD7y/Jv2exnD1y1H2/P0sv8rxgYIOIhAUAJB4EUxa4qjDQUB4XGRKZJa3
         8zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koUcgKCFWXov3+NezwzTEpayFNsZPqRly/yqvoVV4ps=;
        b=ywNcMw/vmEWJBHzce2D3DMlFzS8rXB5NCvpv4P2oT66mIUvMJY2Ve2jOJnm/x6BLWE
         xXvVxezmuokOm3aAtlOTYLE6Gl45TM/7MDXuGSAJB3RGGDnzIzC+DL0cDWQnfRvnWp6r
         ixoZYFVXIKY8yn8th3BqcbhZKDZe5hZuuU2PT3krNEzpy6hFlJRe7XMfPf9BoLlmAppA
         1sV+EIWKXrsjX53Fg39ebBnO5BsCvpYn3RUx1YqqM/HLPy/9NHkytJITg3sX17sdOIlB
         k57M/jK0MSYjw3TLwKnPSYlID0rFt8JovHwEriAompVwDk7VOvZ1b6c2GDpu5W9Ywr0l
         blsg==
X-Gm-Message-State: AFqh2kouKwNZl9hRVidxtBXVBEDp5gexubaE13HGP8vHwenruSkcwMLO
	WgAbzC/F7cPH3n13ct67Qf8shUXEboQf0Q==
X-Google-Smtp-Source: AMrXdXuPg0ZGym+Q1QPqyTCug3eSqipKNr2pXVHZMObGDmHNbMxKI+ZjnAo4ewaQQ2wCZKy3fnrDVA==
X-Received: by 2002:a17:90a:cb84:b0:229:7110:712d with SMTP id a4-20020a17090acb8400b002297110712dmr20210085pju.45.1674324103442;
        Sat, 21 Jan 2023 10:01:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 24/30] xmlsec1: Include xmlsec/parser.h for xmlSecParserSetDefaultOptions()
Date: Sat, 21 Jan 2023 10:01:15 -0800
Message-Id: <20230121180121.1229895-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100691

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mldsigverify-Include-xmlsec-parser.h.patch | 43 +++++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.37.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
new file mode 100644
index 0000000000..4347e925a3
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
@@ -0,0 +1,43 @@
+From 30e1afe60820c18c89cd10e9dcb7208ad5676d1d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Jan 2023 15:06:35 -0800
+Subject: [PATCH] xmldsigverify: Include xmlsec/parser.h
+
+this ensures that xmlSecParserSetDefaultOptions definition is made
+available
+
+Fixes
+| xmldsigverify.c:275:5: error: call to undeclared function 'xmlSecParserSetDefaultOptions'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|     xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA |
+|     ^
+
+Upstream-Status: Submitted [https://github.com/lsh123/xmlsec/pull/463]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/xmldsigverify.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
+index ed538c70..ff68120e 100644
+--- a/examples/xmldsigverify.c
++++ b/examples/xmldsigverify.c
+@@ -25,6 +25,7 @@
+ #include <xmlsec/xmldsig.h>
+ #include <xmlsec/crypto.h>
+ 
++#include <xmlsec/parser.h>
+ /* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/conf/ssl.crt" */
+ #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-bin/keys-certs.def"
+ #define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-bin/keys-certs"
+@@ -36,7 +37,7 @@ int verify_request(xmlSecKeysMngrPtr mngr);
+ int url_decode(char *buf, size_t size);
+ 
+ int
+-main(int , char **) {
++main() {
+     xmlSecKeysMngrPtr mngr;
+ #ifndef XMLSEC_NO_XSLT
+     xsltSecurityPrefsPtr xsltSecPrefs = NULL;
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
index bd9c584dfd..a3da770943 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://0001-nss-nspr-fix-for-multilib.patch \
     file://run-ptest \
     file://ensure-search-path-non-host.patch \
+    file://0001-xmldsigverify-Include-xmlsec-parser.h.patch \
     "
 
 SRC_URI[sha256sum] = "5f8dfbcb6d1e56bddd0b5ec2e00a3d0ca5342a9f57c24dffde5c796b2be2871c"
-- 
2.39.1


