Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83EBC0218F
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.15098.1737828194552739353
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lQEXNDfk;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21a7ed0155cso52743485ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828194; x=1738432994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bb884nGgfFzrgplaBx26eolesA5wi8cZfYBTg6e7pa8=;
        b=lQEXNDfkFa8LlkucFWg0OGSsYr9Ld0osEdDrihAfO8BmG+uJbkVNTDzezzUa/8FE+q
         lDiG76RX7GZ8aGcg6YqOdUi5s0pGH42llTeubabyFkkzh9uXYn2vEMLnfsMthv7HG2fl
         g6MQNsHSAp0RSGm17ADlu4Tjq3VmS0wWv9g63RaNP4BQGUJsDMTzlLq8R5I1FlszQFQq
         s9SSZGVxrIdPZcTlp/gI/g3ldMwofYSHjmOdpCtfcdESEe8NyI0dNteJlkpWI6TscxNr
         aUZkiGfeNTT3NHrrUWLB8RWNAfOm61mUZHIsGpQTF21QWYW24EWlTXLTRZOoltL9uVmt
         Uzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828194; x=1738432994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bb884nGgfFzrgplaBx26eolesA5wi8cZfYBTg6e7pa8=;
        b=rhbkeR2yqnVfAqzB0UNjRbi2/bRsAmUbWBCNsMLm3BeJjqvlmumhYruUHuUoJYmbsN
         Vyo/Rd5XQxBp5kvVHtP6aIHXzcCYGefFZ1613Z27OItKCm5H2L1KTKxjh6tlbdNm4jHY
         vdBsvl5RO+iVYci/P4K/ec+li1YgDe7Sf74O1tefb23lfPGi2fYOeIKXSGMPD9dIT1II
         GUvYA5pBQCzPUDHXsVHi8SmuaNVDygoGlga+rWLwHGZ17VUwvmpzUlsplvGFCy/bGR/i
         GatFn3ST7Ki0IOj3ID+aVjosli6bkxuOCGzTktwh/zJO33sc2fa6WeASNm1E73LGR2S1
         vAVw==
X-Gm-Message-State: AOJu0YzaeotVz8zh2pa3Dcg0yGqK2SCbwH2bzSZT/FcqmiSYW96vhz2N
	gqpTskqh8ZaueeApGFMMshyop6XCw0k9YEFbY3WY4cGDhQ+8/YRZiIErzQ==
X-Gm-Gg: ASbGncsMq/26rWibajnNbFfWB6rAvOh6dBJ8PF0kJpeksEIKembL97gO+PL2mqFq+6O
	rwI7aeY8BMnKHJJkGC1RdsY4g0/+Qs0hBVbZSxk9AuFPVlr+Sn3CR3qhdqvYBtLyaz/D7CpOo5x
	K7ofy+JQuT/PCJdPHgc6SMTn6/K514nAxaghFVYQxLeOdnBMGmcNnGCAuTjSwXmrDQnsBWuqOPl
	rJdPVBm9fOGpHfCAiRn6MfI6pSrzJ8jTzHOEWOCpwCskSchC6iSiuXxGPhm8XiKrOCskJG44WXi
	EX2pvwdlhiCSmdbHkwm+uOO+gGM=
X-Google-Smtp-Source: AGHT+IEF2KK8G4UaOB97JuT/Fnkzul3ZTLOuQsYgKSmA7l87/X1fLpMsdC13KDilAqOQyAnh+SudEQ==
X-Received: by 2002:a05:6a00:ad8d:b0:72a:ae66:3050 with SMTP id d2e1a72fcca58-72daf931cd0mr45794091b3a.1.1737828193707;
        Sat, 25 Jan 2025 10:03:13 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 04/14] libtinyxml: patch CVE-2021-42260
Date: Sat, 25 Jan 2025 10:02:58 -0800
Message-ID: <20250125180308.7856-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115087

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian:
https://salsa.debian.org/debian/tinyxml/-/commit/38db99c12e43d7d6e349403ce4d39a706708603d

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 066cf35ae588ef5f81266b216624b95d37777661)
[Fixup for styhead context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtinyxml/CVE-2021-42260.patch           | 27 +++++++++++++++++++
 .../libtinyxml/libtinyxml_2.6.2.bb            |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
new file mode 100644
index 0000000000..8fc623744c
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
@@ -0,0 +1,27 @@
+Description: In stamp always advance the pointer if *p= 0xef
+ .
+ The current implementation only advanced if 0xef is followed
+ by two non-zero bytes. In case of malformed input (0xef should be
+ the start byte of a three byte character) this leads to an infinite
+ loop. (CVE-2021-42260)
+Origin: https://sourceforge.net/p/tinyxml/git/merge-requests/1/
+
+CVE: CVE-2021-42260
+Upstream-Status: Inactive-Upstream [lastrelease: 2011]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/tinyxmlparser.cpp
++++ b/tinyxmlparser.cpp
+@@ -274,6 +274,12 @@ void TiXmlParsingData::Stamp( const char* now, TiXmlEncoding encoding )
+ 						else
+ 							{ p +=3; ++col; }	// A normal character.
+ 					}
++					else
++					{
++						// TIXML_UTF_LEAD_0 (239) is the start character of a 3 byte sequence, so
++						// there is something wrong here. Just advance the pointer to evade infinite loops
++						++p;
++					}
+ 				}
+ 				else
+ 				{
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 2a7ca30a9d..9ab92012f4 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -10,7 +10,9 @@ CVE_PRODUCT = "tinyxml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
-           file://entity-encoding.patch"
+           file://entity-encoding.patch \
+           file://CVE-2021-42260.patch \
+"
 SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
 
-- 
2.43.0


