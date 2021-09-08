Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.5072.1631181429794196861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NGUBkMvD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181428; i=@fujitsu.com;
	bh=bCi7JNUyRLInJW4ttUYx/arraf9ZeZIYo9d6UiWqS9A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NGUBkMvD0F4gN1xbGjwjfYMbBUhy/rE17829IMyqadzhG5w+UTeKhBZmYfRJqrSOx
	 hcaSBIO+du2sxl4XwWBDpTzm3UfveLqFXQkqHUB6GmcHUWn1DfJuCY+DpXZMcYfwMQ
	 O/URBNl/sk+N6i+V7fzoY76X0sRoFnlyGmOUplFCA5uEPanHYY6LAsEh3AUWvC3pyZ
	 y2/A4BoqipP1F1wrrzoc4H+yryFwdcqMHnntXHEkSwSpgo7QtB+7aonTDRj5oLIt1I
	 C+0Q6Ud0mo1BNfhCgkvUJN2NUEMWlOIpsaE7FHrdeGP5rb2yk3nBqlwI54w7jG21I+
	 aUEfmHMh/aW1A==
Received: from [100.113.6.150] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 4B/EE-23198-47AD9316; Thu, 09 Sep 2021 09:57:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYolt8yzL
  R4MB8Q4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNO5z32giccFQ0H/zI3MN5j72Lk4hASmMUk
  MW/SFzYIZzejxJYLO4EcTg42AV2Jc4/XsoPYIgL6Ektn72EGsYUF7CXW7d7LCGKzCKhIHFv3i
  AXE5hXwlHj6Yw9YvYSAgsSUh++ZIeKCEidnPgGrYRaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2Ndc2ALL3EKt0kvdRS3eTUvJKiRKC
  kXmJ5sV5xZW5yTopeXmrJJkZgGKUUsnHtYHz6+oPeIUZJDiYlUV6zm5aJQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR4E64D5QSLUtNTK9Iyc4AhDZOW4OBREuFVA0nzFhck5hZnpkOkTjEqSonzW
  oLMFABJZJTmwbXB4ugSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHewyBTeDLzSuCmvwJazA
  S02PeaBcjikkSElFQDk/Ol6bMs/iy7X2VQYOs31UHXbONm4ZV8f2/v/XXv0wMjrtQnlhczlYI
  0V6+97TyfPXGLSVbc/a4Y9XtXctZdnr1PS6Qj4GVp6cMd///PrNo89ZHtK9X4WlEtfaMzRr5K
  K65HRj1yWHooOds8rl8rtEotZL35vcb7d2p+S9amiEwU3/2Gz/V48oZgwcNX9+VufBDJPuGeq
  K6JAJPNrLUmIk+un9LO2P5cZ8my/y0a2/+IhixZW1Pr6PJe4tgWq7xIlwOl576ktK5atoB/ma
  DBt29BdqUtB/tE335jqC0z+VSxrpd187J4e7+kxeYZLj9fL7njfF6p1nOLhl5KwCbPN/Vf2Bh
  sc/d0b78h/LNgkxJLcUaioRZzUXEiALdrrLceAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-245.messagelabs.com!1631181427!80697!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4183 invoked from network); 9 Sep 2021 09:57:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:57:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899v7dE010974
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:57:07 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:57:06 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.7 -> 0.1.8
Date: Wed, 8 Sep 2021 15:07:36 +0800
Message-ID: <1631084856-101162-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Version 0.1.8
~~~~~~~~~~~~~
Released: 2021-05-24

Bugfixes:
 - Fix a warning when used in a subproject (Richard Hughes)
 - Fix compilation on FreeBSD (Richard Hughes)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.7.bb => libjcat_0.1.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.7.bb => libjcat_0.1.8.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.7.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.7.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb
index e96ef004a3..977c3213f5 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.7.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git \
     file://run-ptest \
 "
-SRCREV = "e5307885528cf07058be073d0621624749cc10df"
+SRCREV = "356cd2faf2d2197156b0dae7984482cf781d64db"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala
-- 
2.25.1

