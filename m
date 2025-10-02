Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19759CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.7547.1759409974036909902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LkXh6NEQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6364eb32535so1814876a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409972; x=1760014772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZvv48Px9o/DMmplii7NhMuBO9sdnFKQgervs0iBYj4=;
        b=LkXh6NEQZ+1XRLtlpHfhtI9YoiBUJFUZRq0wgfgWnZzesLmCROMO7m3q28JKmd1C3d
         hqmgIHd9H2y1q6WkCDQa2vfLIupw5UiCc18nTqKl0iabkAw4CkYKR+1c6Kv5/8PrbQ7g
         991xV0TymCCd6t2QSCRQUbOyfJCbhgC34sgiKW01J6f74b4GrSnqgUqa8+K8DRFz2MUb
         nyS+KWjJaYUDZ4RhM8+iisbMADKsJZFXqcFbIQSS7evVg6SAXif0UHrUVdPLRXNDTLbk
         BhoHTUzBXfizl+deHuMjYpUySiUpau9MgQB6vhfXgkPZAdPasiQ08fWF5jJjdoml2naI
         xS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409972; x=1760014772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZvv48Px9o/DMmplii7NhMuBO9sdnFKQgervs0iBYj4=;
        b=iaIvUkH2IcW06rP7r4lmQi2U0i5oqa62tCU0AxzvF/mJVbGrXjF0Jpjh6T9ZdAPYAd
         6qx+SiPE5FKbRmtUhnpaPGWeBDQGMhkWvkLtAEg6uzsp1hDeyCK0Di8VKrt12oqpCPlP
         phpZ9YpiOyHWbo5bo3/Po+xZhD+jfCQ6rnKg5k/7v8K3WkQYbMDc2Dibwv/2pgBmqmrp
         ia0jzDFgrTtYUAn64FkCB67FoQhhVD8OFaVaQbtIsII6+9mNIA/6P1G3q81ZBLQrgYmO
         jbZHMBrKqvyucSoVmUkezQB4Zk2EW8eCVlgo8Y3VcQXJ6dOOfW/D5bHIa3D1MF6B6107
         mAjg==
X-Gm-Message-State: AOJu0Yw+GSAuy1k84U66I8nA+wU0djGrgZ9OdrWPuLFBmrjrGFxt27ut
	+2RzCofWraJ49hkQufbIY9bwk7y10KubY+XcPf+aDDZyzvKqOxooEyZaxhNXvA==
X-Gm-Gg: ASbGncshYGdUAGecWKEuY+LQ+TwM0hfhOyGHfu/r253NDzIXRSzCM+qTC3NmVDGCfsq
	6wiZ4wUwXbwuvnc3LgA/iWUNQNQJZAZ3/ge/MWpQ5rMbhvY1VQZx8/FD2Bak/xdrEmxUQLaxFY1
	t1Zsk6t111Cxgga4bfpers+NCjHGutZ0XzWc67XRkPjY2Wr/AbMWR4zMa/sL/QnOYRYjY7ix2fH
	//AtwNGHqax5On0P0ivt+ebW+MLIkXowBI5u5K2CKNtYcBnOM6mBriK1Qe408i6Wt63Xupm9C4b
	sFVOsr30IEOiNlilduoKM7Qi4fxAwV2rM8YkYn/8WugAlggNCibiKzlGEjtHCPJ8uWVQt1qmBfk
	T35gQ/8xRJ8hubW7jWcRBqdudBvNCZ9wCgkyvs3thr9TkA9E4DO3TWJwHlwNklDML+g==
X-Google-Smtp-Source: AGHT+IGsQuAn+rv3RX/rgMzifreNS7Hrt3z7q35GCNzpkR0yw/F3jMug8hul7ElYI2lUYOWebuJfGw==
X-Received: by 2002:a17:907:7212:b0:b43:b7ec:b891 with SMTP id a640c23a62f3a-b46e3ae19e4mr903184566b.28.1759409972316;
        Thu, 02 Oct 2025 05:59:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/26] libtinyxml: patch CVE-2023-34194
Date: Thu,  2 Oct 2025 14:59:06 +0200
Message-ID: <20251002125926.2624522-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120175

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian:
https://salsa.debian.org/debian/tinyxml/-/commit/2366e1f23d059d4c20c43c54176b6bd78d6a83fc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f4a6966bf0cc48ee7fa83c64c2eec2c4fbf91eb4)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index 96c765299b..9480249167 100644
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

