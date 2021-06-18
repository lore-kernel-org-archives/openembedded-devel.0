Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.2555.1623982253763923279
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VLtlvfNm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982252; i=@fujitsu.com;
	bh=l07/MxX/ARZWwlvocD9n9kmxnxC36p0trDqYnAazvDk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VLtlvfNmDraXGp/LCrT+tWlHMjNDEGh+U+/1+OxDHSV2G/O74cwEJPFNm3vu1YPKU
	 efjWpFq9CqcTmRxxd+E9ViQc6+/v1Xqi0GXZtc3VHYC8YZce/8b28z13ESJSHjm2PD
	 pu80Hpc99vXikc/c0LyED3yF174GSrqMsU3CVNRAOpy7PNQYtzl2EIkEtLKd/ZvTHz
	 WUvr6lly/d/rNxJxFMTsHkvNgFvkxweQycNulv25NNzLoDaGKDM2gd1ziiWpidgGi5
	 69I5flZ/JCfV4yytKHqyCn8FvHWA0+ifGf6Pn+Z6/Eb4Y194Lgqb+/limw1JByIR9X
	 cmwnmuERSlNRw==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id E5/81-36719-BA00CC06; Fri, 18 Jun 2021 02:10:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYorua4Uy
  Cwfz5EhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aibVYFczkqPl/vYm5g3M/excjFISQwm0ni
  3p5+ZgjnBKNEx9HvLF2MnBxsAjoSHS+6wWwRAX2JpbP3MIPYwgL2EttX3QeyOThYBFQlVjRZg
  4R5BdwkfuxuZgOxJQQUJKY8fM8MEReUODnzCdgYZgEJiYMvXjBD1ChKbN95hgXCrpCYMWMb2w
  RGnllIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJC19DYQC+xSjdJL7VUtzy1uET
  XUC+xvFivuDI3OSdFLy+1ZBMjMIhSCo417WA8+fqD3iFGSQ4mJVFeq5enE4T4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8Kr8B8oJFqWmp1akZeYAAxomLcHBoyTCy/QXKM1bXJCYW5yZDpE6xagoJ
  c7bBtInAJLIKM2Da4NF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwSIFN4MvNK4Ka/Al
  rMBLS4TegUyOKSRISUVAOTlIWBe6/Urj3H0yZnPDrKnfq0dmU2R9UO7TkW8f3y22ctXBKyfX/
  oJB2JHY0qsh7sNvXrH2w5VuhiKG+fk9IYobio/ANrEd+saY3Sc8znTyiLPn9IpS5uxa3CLX6F
  Lj/XRvQvkO4zdmIuuBq0PyfOp7mh0NJO4nFWbffUgqUpdWvNxHl7/ovsOSr4WtWL42nyOacpn
  pasB98cO979QXqdt/Zr5hPfOtepp+33algc4JdZHLCF7UDGi4WrGXpfz911nqvXblF/wO8TE7
  cuN11/6sGB45x505Lm/VdVqT/0sb3bKkzF6LfRHu65yaJl983KBK27vj5mKdNiytHqFPrHZ+S
  zYGVav/OnnhvnriixFGckGmoxFxUnAgDiI0RTHQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-287.messagelabs.com!1623982251!75053!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27167 invoked from network); 18 Jun 2021 02:10:51 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:10:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2ApNY004069
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:10:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:10:49 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] evince: upgrade 40.1 -> 40.2
Date: Fri, 18 Jun 2021 22:10:43 +0800
Message-ID: <1624025443-7083-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_40.1.bb => evince_40.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_40.1.bb => evince_40.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_40.1.bb b/meta-gnome/recipes-gnome/evince/evince_40.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/evince/evince_40.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_40.2.bb
index 3b1a978c64..fa5125b53e 100644
--- a/meta-gnome/recipes-gnome/evince/evince_40.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_40.2.bb
@@ -24,7 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "7a666363c350af2e3bbba7f14b3c1befc5012f9ed3d9d073447f4c59f33dcf2d"
+SRC_URI[archive.sha256sum] = "0ff7ec79376a8a97ac4cd274d32e804c7e236ef2d2d5d3f646de6eb882a63c77"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1

