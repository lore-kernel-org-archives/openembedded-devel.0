Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.79324.1629424974581963077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 19:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tl0iW+fU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629424972; i=@fujitsu.com;
	bh=FadtXkVZvkp0Egsm1H3TNisxzO7FzoRtr223a1PreJQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tl0iW+fUCr9oJ5V+IP79gy/IKvq5boA3E2r+qmrRQcucpK6tydOYB1qUr/581Urhv
	 OmO9FgWNCQIF+khKbV0p4d2qMP0Wbdvq3aJTRqLw0V1mtTbyT/4IKgLwRVhVOM88hh
	 rGj4rEzBj7UJIbqZwcZ3E2775DCAOMFniHbB5k5nbdU+Ca9Yv6/akO0futpSa1ui9W
	 FZS9PvTuB/Y45c0gx4Ue0lUaV3Eh9uPN42m9s91TklEdLT7/lAwaAyCAtz303ViByu
	 8GEiiaec69KzzpzFLph9JyDgz+elTRSOuvdtmXxWnipm6cNmWp8P0A6ibMAplhmBQ2
	 8P5EBREJaCJAg==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 9F/40-05324-B4D0F116; Fri, 20 Aug 2021 02:02:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MRouvNK59
  oMPk/l8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH51kemgs9cFR1bNBoYb3J2MXJxCAnMZpL4
  3XiHCcI5wShx+MFvli5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBRwk3m+4C
  2azCKhKHH28CayeV8BJYt/u02D1EgIKElMevmeGiAtKnJz5hAVijoTEwRcvoGoUJWZfbmaBsC
  skZs1qY5rAyDsLScssJC0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGloa6ZqY6CVW6SbqpZb
  qlqcWl+ga6iWWF+sVV+Ym56To5aWWbGIEBldKwQGdHYw/X33QO8QoycGkJMp745BcohBfUn5K
  ZUZicUZ8UWlOavEhRhkODiUJ3hoO+UQhwaLU9NSKtMwcYKDDpCU4eJREeGewAaV5iwsSc4sz0
  yFSpxh1Oa6sWrKIWYglLz8vVUqcdyM3UJEASFFGaR7cCFjUXWKUlRLmZWRgYBDiKUgtys0sQZ
  V/xSjOwagkzPsEZApPZl4J3KZXQEcwAR0hpCoLckRJIkJKqoEpT1s+d/Lt0oc33fNC/h08dIz
  jfcH0KHafyIl/7R38DSUbm8XezS6sy7k482b6jsWP/jYoOFxs12KZoS+mvDxFITHyxtUb8r7q
  4gf6z0Tllpr9VL4YHupz78kFnbQ3uW84V0zr37OkfZPN+nMri842zrlx6GKt7bv9JhbRE75Ff
  14Sku3OXn+88XXCqhWPP2b6Gl1ul3q92WtZk+jZx1LF1o261mqTrv77ty6CyTrk4js77qkR15
  +nnsh30Q5nihXYH+FxYVnFAtGGK6wqNX+FrvBveRYnJrmKs5Or4t+c9ZK9J0ONBAxfHs+o23N
  LNM45WH9OF2/IcccV1/aJP/1yTzg11Pmd/YuqG3tmT5mpxFKckWioxVxUnAgAR0524zUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-271.messagelabs.com!1629424970!119088!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12084 invoked from network); 20 Aug 2021 02:02:51 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 02:02:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K22hm2027883
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 03:02:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 03:02:41 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.17.1 -> 1.17.2
Date: Fri, 20 Aug 2021 10:02:25 +0800
Message-ID: <1629424945-45595-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb} | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb} (63%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
similarity index 63%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
index f9575a3fce..857fe3ed09 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,14 +5,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.17.1"
-
-SRC_URI = "\
-    git://github.com/c-ares/c-ares.git \
-    file://cmake-install-libcares.pc.patch \
-    file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
-"
-SRCREV = "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
+PV = "1.17.2"
+
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main \
+           file://cmake-install-libcares.pc.patch \
+           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
+           "
+SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.25.1

