Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CB0C9EC75
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30997.1768216820518105786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 03:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vpd6K9UE;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso57335345e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768216819; x=1768821619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErlCjQqFbdqS5hf+O8fGTQ7OI7V68OKpRAJVghi7KOc=;
        b=Vpd6K9UEZ98i6qRjuIC8+7sNvi2wAqVUOj7yssreTsmjriU4L5uM8/J1/0FJN63KAs
         qR+UzxQXXXsfLedy18bb8e2XTgk4iHFc0fFeBQql60eigKsvT/6m2k+YXT+T6K6bhY5Y
         C/NiALVR/u0bzwYp5FG23xecwAkKNYFs8jDTkzLvCZ1+++pFirz/613eMCHpiOSaFWfX
         AtC+isnFbNoNP8to8IwSo2SMAJuMgL+NO/xFMzU1S20T9JAJqi/lL2PtxceUvOZzllsv
         R1Mz7CoRXSfoYlnl5gNYreRM5358bXdOXwTMM/8EWg8QkwBv3WQjcYIBpLn728+f7Yma
         ZmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216819; x=1768821619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErlCjQqFbdqS5hf+O8fGTQ7OI7V68OKpRAJVghi7KOc=;
        b=RdHEQKW3faSpftmnKAJD7fenkA8aOAq0jrxQTeBpIXQf0yu1vAvlQ3hAdvl6Ors3n5
         s+forE5PR9mARANnZXWImZQGRcH3fMrgOIj0fb1B2YGnAp7oDHbTfwrwFc1euJeAfxuD
         /9tTqRN2BtKbwG11TANfnDlJjKkvhYyp4wIE+DrmJBLylnfotB6CB/jvkhvsx8T1IvGE
         FGqlt/QQ95dIthZIGR+ZtCEuQ7UkD9MP/bCwcxDExPDYqaH+GchaiplFREDLWE+yfUTN
         6FVt3Eb7OvZUgvCSM6LjoBzmISkg5EKJuTk1Q83X1oWorexTeUkfDuYIrYEENZU1YIfM
         US8A==
X-Gm-Message-State: AOJu0Yw0ZW+vI4Yrgkql5OuXcR0MYQOLioXRkadzBlJnLTJvk2m4P6B0
	jXG/tqv7Jm6oxHVHg50RqmTWq8UGNrR6viwCKr4oENgHpNZ7ZtAbDDh6ILj/Jw==
X-Gm-Gg: AY/fxX4BJ2wWMLgZN6Zf0K1sPXYo7YsLdfrmDS9/fPksAExaSY0RvCJbM1cGr3Dqrvm
	gZloT0RJJpG7Mof/vHHUH03Gys/WZMxTWjElVVD+ijyTp8tgH+cHB/Ji5E7SxxJmVK+ZfKJffX9
	OZkvg8poXYmY2XcKsg0+0c90xhZX5a1oPY42fNPQuGlZ9RoVTUWvM0fXE8KfMo0OzSuOLuMW3T1
	KUFAdHNR0wVrfQ3CiHKOYWk8gAPDOJg1TjChG1JdpyoslAeV6esDhbDns+gWC3oShOwFSz+grGX
	cUWZ1BMk0Xt1dk+aZA4SEXpFOGOUl1nGJEbQTFqvNLCmsJ/FDCy2cZlS85XUimuTiMXlZ90qTbH
	8Vuijc3vfTZl6gazjL/1YlpX3TX+tXM3n7Vvgq0HVCPFMxy8qe8vdhIPbrETyqgCTKqrvhP1qo6
	QJqLbGVktRXD2G5q+bCOQ=
X-Google-Smtp-Source: AGHT+IFBW7tm+JTMFPdwCj3jCLTYA5caLLdqYL9r58hx2SY/piXBzOquiIklPgOcso66pCb4YLsJQg==
X-Received: by 2002:a05:600c:a08:b0:477:63b5:6f39 with SMTP id 5b1f17b1804b1-47d84b3477amr176611465e9.19.1768216818650;
        Mon, 12 Jan 2026 03:20:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695225sm351382935e9.4.2026.01.12.03.20.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:20:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] raptor2: patch CVE-2017-18926
Date: Mon, 12 Jan 2026 12:20:12 +0100
Message-ID: <20260112112016.515266-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 11:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123377

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-18926

NVD advisory mentions the original announcement on oss-security
mailing list[1]. This mentions a bug link[2] related to this
vulnerability. The bug mentions the revision of the fix - pick
that patch from the project's git repository.

[1]: https://www.openwall.com/lists/oss-security/2017/06/07/1
[2]: https://bugs.librdf.org/mantis/view.php?id=617

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../raptor2/files/CVE-2017-18926.patch        | 44 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.15.bb |  8 ++--
 2 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2017-18926.patch

diff --git a/meta-oe/recipes-support/raptor2/files/CVE-2017-18926.patch b/meta-oe/recipes-support/raptor2/files/CVE-2017-18926.patch
new file mode 100644
index 0000000000..f3211c899b
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/files/CVE-2017-18926.patch
@@ -0,0 +1,44 @@
+From 686fc0608480f4b2d2f8c60717141ad8e3c5a849 Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Sun, 16 Apr 2017 23:15:12 +0100
+Subject: [PATCH] Calcualte max nspace declarations correctly for XML writer
+
+(raptor_xml_writer_start_element_common): Calculate max including for
+each attribute a potential name and value.
+
+Fixes Issues #0000617 http://bugs.librdf.org/mantis/view.php?id=617
+and #0000618 http://bugs.librdf.org/mantis/view.php?id=618
+
+CVE: CVE-2017-18926
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/590681e546cd9aa18d57dc2ea1858cb734a3863f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_xml_writer.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
+index 693b946..0d3a36a 100644
+--- a/src/raptor_xml_writer.c
++++ b/src/raptor_xml_writer.c
+@@ -181,9 +181,10 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+   size_t nspace_declarations_count = 0;  
+   unsigned int i;
+ 
+-  /* max is 1 per element and 1 for each attribute + size of declared */
+   if(nstack) {
+-    int nspace_max_count = element->attribute_count+1;
++    int nspace_max_count = element->attribute_count * 2; /* attr and value */
++    if(element->name->nspace)
++      nspace_max_count++;
+     if(element->declared_nspaces)
+       nspace_max_count += raptor_sequence_size(element->declared_nspaces);
+     if(element->xml_language)
+@@ -237,7 +238,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+         }
+       }
+ 
+-      /* Add the attribute + value */
++      /* Add the attribute's value */
+       nspace_declarations[nspace_declarations_count].declaration=
+         raptor_qname_format_as_xml(element->attributes[i],
+                                    &nspace_declarations[nspace_declarations_count].length);
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
index 577c6ee00a..193cf13b21 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libxml2 libxslt curl yajl"
 
-SRC_URI = " \
-    http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
-    file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
-"
+SRC_URI = "http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
+           file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
+           file://CVE-2017-18926.patch \
+           "
 SRC_URI[md5sum] = "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
 SRC_URI[sha256sum] = "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"
 

