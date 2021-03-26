Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.7134.1616724393876665096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 19:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r/25VPJ5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616724391; i=@fujitsu.com;
	bh=E8p2xCrEeqhr5rC31gSufUAGHJc7w8s9woQKn8xqNPw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r/25VPJ5rFxD/lrgky0Fex2lSuUjTBws5EOxbngDwv3Nu0HiTDUllVTJPQhjeROFR
	 An4mHxtSBo1GzIDe3rqYWd3FJwyEqMWUiQLxQaReCP7pyXlh4lmAXGTNVLCyDoNKgZ
	 RHfsMeqXmgF2PBNzzijh+S+0P4KYSsTs8mulazuAZJI5TD82+QpjGjZTEsEwaIS6nU
	 wzL+e93U2aBacGfFkxgrFndNisGxlPrpBHh66rJhJs+DeaG0N4XoTXJDYFuRe0ba6L
	 XCHpyfAUxXWfIycjUjuvFzGXqXGntYF/0Jc1ob6aWOQ8nKL/0S8EItip6g5ZGbykuZ
	 4J7RAXyN6DQuQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id DA/98-38244-7A14D506; Fri, 26 Mar 2021 02:06:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqrvcMTb
  B4NhnNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP3rstMBRs4Kp4sdWlgPMLexcjFISSwhUli
  /b8pjBDOCUaJpTPnAjmcHGwCOhIdL7pZQGwRAX2JpbP3MIPYwgIOEo0HbrCB2CwCqhLLbz0Gs
  3kF3CXev3oIViMhoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPECqkZRYvvOM0BxDiC7SuLITLUJjD
  yzkHTMQtKxgJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxrrGuoaWJXmKVbqJeaqlucmpeSVEiUFY
  vsbxYr7gyNzknRS8vtWQTIzCMUgqZD+1gfPL6g94hRkkOJiVR3kMnYhKE+JLyUyozEosz4otK
  c1KLDzHKcHAoSfBOdYhNEBIsSk1PrUjLzAGGNExagoNHSYT3hy1Qmre4IDG3ODMdInWKUZfjy
  6oli5iFWPLy81KlxHkZQGYIgBRllObBjYDF1yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwr
  xcwGgV4snMK4Hb9AroCCagIzb+iAQ5oiQRISXVwKR6/uFZtulKJoY/zZjUVxuKufjLeyUJvxB
  XFmUOezvvkOytdRLiL9lcTY4/EOwukJOLtpbPvBerGFG0xPpEvdC2Bh2nu++LmT8/0X11/Mnb
  VUah7/4rc4X9ulduX8CmdVHjyNuIFINoxqklYh//9E5/ufPbEwbXkO6+go0ZzXzFcrnOQXNXd
  O85cpFffF3dNs8LPSuEnVVCNhadkz/nqRlySO/U/smaAda7/NYsr6uprpp1x0PI7LOa6NlVyi
  c7qr+sZZl36MOLdfuEI5mn3a9vEF0rucStdXPqb/GDwneFVzDvM1jMs9Rprvylx72CB4QLfR3
  lk0rupjRtPpwjznr3g1DIM6/amRqyf0MWKLEUZyQaajEXFScCAJreieMqAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-232.messagelabs.com!1616724390!90045!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29863 invoked from network); 26 Mar 2021 02:06:31 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-18.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 02:06:31 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q26UR0007520
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 02:06:30 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 02:06:29 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mg: upgrade 20200723 -> 20210314
Date: Fri, 26 Mar 2021 10:06:22 +0800
Message-ID: <1616724382-25449-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/mg/{mg_20200723.bb => mg_20210314.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mg/{mg_20200723.bb => mg_20210314.bb} (95%)

diff --git a/meta-oe/recipes-support/mg/mg_20200723.bb b/meta-oe/recipes-support/mg/mg_20210314.bb
similarity index 95%
rename from meta-oe/recipes-support/mg/mg_20200723.bb
rename to meta-oe/recipes-support/mg/mg_20210314.bb
index b73f93756..9275dd233 100644
--- a/meta-oe/recipes-support/mg/mg_20200723.bb
+++ b/meta-oe/recipes-support/mg/mg_20210314.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://version.c;md5=1895eb37bf6bd79cdc5c89d8166fabfb"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "60fa3582f5f735b9d43825f5bdcc4ea5f0740f91"
+SRCREV = "598f7a028f01f85f0dee0e798753bccf93233add"
 SRC_URI = "git://github.com/hboetes/mg \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
-- 
2.25.1

