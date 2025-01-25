Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33D7C0218E
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14808.1737828195499015552
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDSmnVGc;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21619108a6bso53163395ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828195; x=1738432995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eflqLNncEnO1imr2+2VMeNXswhNnNTBEG5aAVd9hQC4=;
        b=LDSmnVGc5uFwz8wo18oBsMtDHgcJWnRLn0bQyH1x4WEpbABCT1iyf34aTUPpyO70/r
         y8HibcbUb6rNGTIZJ6Lap52YuPCv0zlnW57GY6j12I8uBpu45TIlSQYJ+DspDbi55TbJ
         YPbdHzRyYKxgR2YAHpS/tR9xqwzaSFkTGFuVWxcPDmhSMxZo3l71iI2VOoiwuut0WSgt
         elqkLUIcpK4hR/7ewEKdLAYPJ3mW67CrUzbs7E5vckjqNb1CSne0zTBVBWMPNqMfTDl2
         NM4YlJA5lqwzcusdeaxPtzrR6qIOU22BAc27nfLt2G0MPAoiFmUDy1wYDUfVuDv0XXjl
         SfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828195; x=1738432995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eflqLNncEnO1imr2+2VMeNXswhNnNTBEG5aAVd9hQC4=;
        b=YYa6+mrRzanjvgd2JFdD8Lnfd5C1yfXjPSp2nz3t90H7kZwSvfiasTf73QAdd/pqKu
         wAcK0KrrOepPdWPR+ci6AzpjOzpwo0ERWvW8+Bn50qiCrY8IG3mEEA177fLTd71UXPKE
         8cNp0wE11rWj/tcnN3LFFVDEsMTyZdHuTygiFAWMBmhi2BbwgE/5HNJO8+nWpH3oelkf
         5QkoJSicC7LVV3cpZzaDIJxY75l7I+S5SmuI44c6Ek/f+RacwUvamx3SBsknbjxNAjf7
         WxAY01T3ZifAGfN6hWVC5Xl5vOU4Lm9R4fboHzeqLgP0YfwWdStOaQLt/223FQ5UZWtn
         KALA==
X-Gm-Message-State: AOJu0YylEFeljOKu7fALuua32LRQDLfi4zzkpGW3Qcxijg43Moj1Rx+H
	1ISH9hMa68Qopz0r9NS72ALWDVqJGpuWakA46+xDu6CbiAi/7KmdMJ7J2A==
X-Gm-Gg: ASbGncuqNJRWomm8yNrPnKAazRY27r5L5pQpi9zqGzOlSdf/pFvqHK/pZq2dH+tQH1T
	MOibDFVFypG8/LiubJxOFI+mzx9p0TZtcCuok245E9R48fwT6qHhJ7+obJAEfKyQdrzD5laqGxh
	WEDefzpXXUOf9VJ6UWKVlHlM0gRqdlylQ1QNzQa/XqpoCww+qmPjvvmWcj//dse5na6V8pUYpd7
	+WEcMiOb4OO8VSzBtjspdlABJvlq0kmOfSDJv/VZwwX+gFIGbI1oUmTPVvjvKVBargqyFSJlnWa
	fNR4gix/zGgHuEt3ZCwrK2NFs8o=
X-Google-Smtp-Source: AGHT+IGCInF0g+9F60apmo+GKnvC4Ppu3KkXOUGxAyOLZx6QrRoTYW98gnbR4gU1aJ9e3ZGA4OiskQ==
X-Received: by 2002:a05:6a21:6da5:b0:1e1:c07b:b087 with SMTP id adf61e73a8af0-1eb21183620mr52970805637.0.1737828194739;
        Sat, 25 Jan 2025 10:03:14 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 05/14] libtinyxml: patch CVE-2023-34194
Date: Sat, 25 Jan 2025 10:02:59 -0800
Message-ID: <20250125180308.7856-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115088

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian:
https://salsa.debian.org/debian/tinyxml/-/commit/2366e1f23d059d4c20c43c54176b6bd78d6a83fc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f4a6966bf0cc48ee7fa83c64c2eec2c4fbf91eb4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtinyxml/CVE-2023-34194.patch           | 31 +++++++++++++++++++
 .../libtinyxml/libtinyxml_2.6.2.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
new file mode 100644
index 0000000000..a94806daad
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
@@ -0,0 +1,31 @@
+From: Guilhem Moulin <guilhem@debian.org>
+Date: Sat, 30 Dec 2023 14:15:54 +0100
+Subject: Avoid reachable assertion via crafted XML document with a '\0'
+ located after whitespace
+
+Bug: https://www.forescout.com/resources/sierra21-vulnerabilities
+Bug-Debian: https://bugs.debian.org/1059315
+Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-34194
+
+CVE: CVE-2023-34194
+Upstream-Status: Inactive-Upstream [lastrelease: 2011]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tinyxmlparser.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tinyxmlparser.cpp b/tinyxmlparser.cpp
+index 8aa0dfa..1601962 100644
+--- a/tinyxmlparser.cpp
++++ b/tinyxmlparser.cpp
+@@ -1606,6 +1606,10 @@ const char* TiXmlDeclaration::Parse( const char* p, TiXmlParsingData* data, TiXm
+ 		}
+ 
+ 		p = SkipWhiteSpace( p, _encoding );
++		if ( !p || !*p )
++		{
++			break;
++		}
+ 		if ( StringEqual( p, "version", true, _encoding ) )
+ 		{
+ 			TiXmlAttribute attrib;
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 9ab92012f4..11bc2dde4c 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.t
            file://enforce-use-stl.patch \
            file://entity-encoding.patch \
            file://CVE-2021-42260.patch \
+           file://CVE-2023-34194.patch \
 "
 SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
-- 
2.43.0


