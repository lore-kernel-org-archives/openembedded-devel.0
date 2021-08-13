Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.33540.1628838864960487621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Aug 2021 00:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Db4X69bP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628838861; i=@fujitsu.com;
	bh=8id1S13PcnWxSLRhyD6DO8u23LcZQ4xrObf0ubQG4lk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Db4X69bP49OXE73mwEmiqlZGymjr1OeZm4NXBAEDli2ENplBhh3+IMeH49la4R6NB
	 aGto4G75nYy4UpSwzhGuaKqcHFYbV8ax+nMsy431UnWKMAgsoTfKSaeFa0LI66h3q/
	 pDuAtT+eC9zhV0Iu5Fps17Jhs038E/I01YvY0Za2qq0JZ+hFvOKTSuNmi2vT8djEvi
	 CGszYPyFdt+k3ZVVnd4Aeppyxn7MLCPbrnVhbUyv+E7d2j25nyUqy26JL33TxCyp46
	 1cE8+kSiEA9vgGs8DYCxzGZNDthN2OUUamEKg87rjoQN5jqn7q0wZ5aShreAaUuZWI
	 ve28e5pATMUKg==
Received: from [100.113.7.180] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 97/51-20707-DCB16116; Fri, 13 Aug 2021 07:14:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxVfestFi
  iwdtVEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8at7smsBU8EKpYeXc3SwNjN38XIxSEkMJtJ
  4uaLt8wQzl5GiedzJrJ1MXJysAloSOyeepkZxBYR0JdYOnsPmM0soCZx9OVPMFtYIF3ix/yNr
  CA2i4CqxPoLpxlBbF4BF4l536YzgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWqUJN5e2s
  MIYVdIzJrVxjSBkXcWkpZZSFoWMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWNdM1MjHQS6zSTdJ
  LLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBIZYSiHbhx2MU9580DvEKMnBpCTKu+GsSKIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5gCbFEIcGi1PTUirTMHGC4w6QlOHiURHhfSQKleYsLE
  nOLM9MhUqcYFaXEectBEgIgiYzSPLg2WIxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMGw
  WMWCGezLwSuOmvgBYzAS1eZy0KsrgkESEl1cAke8DqS/Bpr2qR3fMX7DGsqBCs/hpw1ZY9ZG6
  y/NYjKR/e9G5h1OO+4rSM62Om23kG/vxL/S+uvRNgMArVVZ/28Wba6x/znBcfMg7cnTr7a0tU
  y9Iv3YaTjpevWWgfu3VpuEjrgRdH9X4piDxxyQ4Pub1sxxLrQxxcIhumZbZfY23tlNN1nxLAf
  z78MF/J7oMXnTNbn7voKp6Ma3p4eMn5z1MKlBftfCtxakcvX0Dn1GrXfIE1c/tvP81786zTlk
  VCvvLytFbb7JOzbLfIfTrV/mth+57/Tg/ZAsUvLjB+qOv/eJ3hZY6vArvOutW0Hsz76Lz41PV
  e21cK8c/15gUlX5X66KZUfvAzI/s23er/SizFGYmGWsxFxYkA7lqnpSwDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-12.tower-248.messagelabs.com!1628838860!103388!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6123 invoked from network); 13 Aug 2021 07:14:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Aug 2021 07:14:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17D7EFVu016779
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 08:14:20 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 13 Aug 2021 08:14:13 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
Date: Sat, 14 Aug 2021 00:14:04 +0800
Message-ID: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
 .../ttf-takao_003.03.01.bb}                      | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/{takao-fonts/takao-fonts_003.03.01.bb => ttf-fonts/ttf-takao_003.03.01.bb} (57%)

diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
similarity index 57%
rename from meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
index 9ddfc6ae7..2c373f946 100644
--- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
@@ -1,3 +1,5 @@
+require ttf.inc
+
 SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
 DESCRIPTION = "Takao Fonts are a community developed derivatives of IPA Fonts."
 
@@ -6,14 +8,20 @@ SECTION = "User Interface/X"
 
 LICENSE = "IPA"
 LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
+PR = "r0"
+
 SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
 SRC_URI[md5sum] = "8cd3fe724faa5034a9369e98cf108d2d"
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

