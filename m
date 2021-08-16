Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web08.18589.1629077115353052416
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 18:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NeUqfp7A;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629077113; i=@fujitsu.com;
	bh=kwHuXX3D54ThIxojBIftxwMOuTOlPxGADmoymLNOUG4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NeUqfp7Ah5StJyMy9Jeba8r4OYwNjlACFb8LnH3vw0u+9AkKwjieFBw9Gf0dk5puB
	 UXvO3gyLObPxu7q3Dl4pzHS4t2CPHTtpDMUd7w3n0tOA3a5Tw39u3UuRd+xukJMy8/
	 bHEnpIyRbuYa2TEzDOoWvzKucVEWl25CbfDt2HD/KnbUIdjPXDCCctbXJonYTR/98n
	 cO3WVaq6jYcowZ+iNghGO7P4bjmILTmYLxEpotrYJFUBJCfcuyQ1bjYkzAmryp1LEy
	 tsyazlZMjSODktSbAGHKcGFEm2YQ9jjCUuMpPu2zA/IseBq50bjv/c+QN1Hd1Fch5w
	 ibt/UUyD2Ujyg==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 60/72-05324-87EB9116; Mon, 16 Aug 2021 01:25:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRbdin2S
  iwamNrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bB2VfYCy6KV2z/8om5gfGjSBcjF4eQwGwm
  iT37HrJBOHsZJRoOLWbpYuTkYBPQkNg99TIziC0ioC+xdPYeMJtZQE3i6MufYLawQJHE5Wl7m
  EBsFgFVifO7N7CB2LwCrhK7vswBsyUEFCSmPHwPVs8p4Caxp7cPzBYCqtl+fQsTRL2gxMmZT1
  gg5ktIHHzxghmiV0ni7aU9jBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwM
  DXUNDI11DSyA2MdFLrNJN1Est1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzIlIIDE3Yw7n/9
  Qe8QoyQHk5Iob8YhiUQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwsuyQThQSLUtNTK9Iyc4DRA
  ZOW4OBREuFt3gKU5i0uSMwtzkyHSJ1iVJQS51XaC5QQAElklObBtcEi8hKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYV47kCk8mXklcNNfAS1mAlrsYwC2uCQRISXVwNT7c76fDKvjvwz2OK3
  JK1bIP+EtFTl4utFUrqkjaNeV8zcWHdxndu21xm75WN10IZ7GmtQY8/x5lyat3K7d9yw27Ypb
  S/DxP/N13U50CO0+uHiW2NxDJ1fz2BbHvtdyao2fpNI1Q35ZNWf2lJY10UnqaYaPH6hc+L5g/
  Xe3ivvXT59Q/luySG7BpZbIfWdMduX5MsxgEfS78VIhZ2PRtc68sh0ZmyOCN0r4HeB+LxQXZX
  5K4LLm4skfhEtSlkyO0HQq355/oKr65P/DmSy3GKeyfXm+dRNf9Hdtf7ayKZU2RrPl9HY3PxX
  vrP/jcOHvtKBjxr8zp/XFbAvoaF71UeOpmINj75+fct1e1///mKrEUpyRaKjFXFScCAA7h4eu
  QwMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-11.tower-267.messagelabs.com!1629077111!137997!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13468 invoked from network); 16 Aug 2021 01:25:12 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Aug 2021 01:25:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17G1P646019068
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Aug 2021 02:25:11 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 16 Aug 2021 02:25:06 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH v2] [PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
Date: Mon, 16 Aug 2021 18:24:58 +0800
Message-ID: <1629109498-55444-2-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629109498-55444-1-git-send-email-leimaohui@fujitsu.com>
References: <1629109498-55444-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

- Moved it to ttf-fonts directory.
- Rename to ttf-takao.
- Use ttf.inc instead of rewrite do_install.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../packagegroups/packagegroup-meta-oe.bb        |  2 +-
 .../ttf-takao_003.03.01.bb}                      | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/{takao-fonts/takao-fonts_003.03.01.bb => ttf-fonts/ttf-takao_003.03.01.bb} (56%)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d46447d33..b7abe2197 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -493,7 +493,6 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     packagegroup-fonts-truetype \
     qrencode \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
-    takao-fonts \
     leptonica \
     libvncserver \
     libmng \
@@ -537,6 +536,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     ttf-noto-emoji-regular \
     ttf-sazanami-gothic \
     ttf-sazanami-mincho \
+    ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho \
     ttf-tlwg \
     ttf-roboto \
     ttf-wqy-zenhei \
diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
similarity index 56%
rename from meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
index 9ddfc6ae7..be0e544cc 100644
--- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
@@ -1,3 +1,5 @@
+require ttf.inc
+
 SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
 DESCRIPTION = "Takao Fonts are a community developed derivatives of IPA Fonts."
 
@@ -6,14 +8,18 @@ SECTION = "User Interface/X"
 
 LICENSE = "IPA"
 LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
+
 SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
-SRC_URI[md5sum] = "8cd3fe724faa5034a9369e98cf108d2d"
 SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"
 
 S = "${WORKDIR}/TakaoFonts_00303.01"
-do_install() {
-    install -m 0755 -d ${D}/${datadir}/fonts
-    install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
-}
+
+PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
+FONT_PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
+
+FILES:ttf-takao-pgothic = "${datadir}/fonts/truetype/TakaoPGothic.ttf"
+FILES:ttf-takao-gothic = "${datadir}/fonts/truetype/TakaoGothic.ttf"
+FILES:ttf-takao-pmincho = "${datadir}/fonts/truetype/TakaoPMincho.ttf"
+FILES:ttf-takao-mincho = "${datadir}/fonts/truetype/TakaoMincho.ttf"
 
 FILES:${PN} += "${datadir}/fonts/*.ttf"
-- 
2.25.1

