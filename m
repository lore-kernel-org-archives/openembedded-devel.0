Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.3519.1622097779565655672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 23:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zq6QotPy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622097777; i=@fujitsu.com;
	bh=fsOgKY1bonjPH6YKosTcH6PcmWxG0tQ3KjhVWoc9Sa4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Zq6QotPy0ALHhnztINs7ILU+NCq/DrvoQcQRNDGnaGC1/ks0m3IZ4Ap+q72s2spSu
	 J86WfjHRLbP5G3VdA8FzMTkOrWV0L5LUE3UnrmqTlqr1wHwan7s+PdvJQRli887XEf
	 T0wdNvYh7PF63dFWl/t4PmXFRJ5cql8x4rD2BF8iWZGWUIapjGMrXkJZ0DbOk2WS7F
	 FpiNkEwMrlnxakHkKmZqjMxKkebzrSXzOrRWRrU0EzBxH6szcL70c1K1jH+QQBcHRi
	 bsgoL6iv+h+T+9EtE7x/6PWWLwXmCCQEitVp/YFc+T20aUY4Fb2C/JDQUCPofe3NtC
	 kMMJrhQGdvb5w==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 82/A7-63525-07F3FA06; Thu, 27 May 2021 06:42:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MxRbfAfn2
  Cwa4vihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ad1z/YC+ZyVcw5spqtgXE/ZxcjF4eQwGwm
  idOzFjN3MXICOScYJT6214PYbAI6Eh0vullAbBEBfYmls/eA1QgL+Eg839rD1sXIwcEioCrx/
  5cVSJhXwF3i2roLYOUSAgoSUx6+Z4aIC0qcnPkELM4sICFx8MULZogaRYntO89A1VdIzJixjW
  0CI88sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6hrZGCul1ilm6iXWqqbnJpXUpQ
  IlNVLLC/WK67MTc5J0ctLLdnECAyjlELG8zsYp775oHeIUZKDSUmUd4LO+gQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKErwL7YBygkWp6akVaZk5wJCGSUtw8CiJ8E60BkrzFhck5hZnpkOkTjHac
  7xcu2QRM0fTvbtAcsqCg6uZOe60H1rNLMSSl5+XKiXOe8MWqE0ApC2jNA9uKCwGLzHKSgnzMj
  IwMAjxFKQW5WaWoMq/YhTnYFQS5s0GuY0nM68EbvcroLOYgM4SSlwHclZJIkJKqoGpf13pryf
  h/cUzhJp2Vcbv8/i46HRA9441tf71d9q5oyZpT53OH7Rgp/3sXa38dS3W3+Rv799+/87UczWh
  k3UjNR9/2+8YIlN7+t/DSYmtv32ii+8fSU9212C543qgm6U1N076wwXV11kKqSz9a1UztgkdO
  rc6R1264+OZgn/O/1r9mfxvWJlxJV1hUQi8sc568bTMD1/6J/18Il1hUj5na3ik+lpfvnkvTK
  s/C59adye7wmZqgHLyj2v6Xfbf9cNee5uXLZVXfuvy+8GFSL5VrzS+r/48Z8WaFLXJ5+TF3qU
  fZuqJkgt1fLn42w1+1YX5y+KPqKr9vaeSE7csiF3lF5NfS8Gbxk7zuY27iiYqsRRnJBpqMRcV
  JwIAGvgG/DwDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-232.messagelabs.com!1622097775!77365!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19846 invoked from network); 27 May 2021 06:42:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 06:42:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R6gt7N018205
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:42:55 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 07:42:54 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 3.34.1 -> 3.34.5
Date: Thu, 27 May 2021 14:42:47 +0800
Message-ID: <1622097767-10482-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{gnome-bluetooth_3.34.1.bb => gnome-bluetooth_3.34.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.34.1.bb => gnome-bluetooth_3.34.5.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
index 77c89d95c2..31d3bf6eb7 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
@@ -18,7 +18,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # gtk-icon-cache bbclass will take care of this for us.
 EXTRA_OEMESON = "-Dicon_update=false"
 
-SRC_URI[archive.md5sum] = "09b6bab7ceaafb35da766a5476fbc466"
-SRC_URI[archive.sha256sum] = "3ec91076c2822cd1f9abdc8e27663c3bda4c9c8a7a9773f9e92bfbf2b745d386"
+SRC_URI[archive.md5sum] = "d83faa54abaf64bb40b5313bc233e74e"
+SRC_URI[archive.sha256sum] = "6c949e52c8becc2054daacd604901f66ce5cf709a5fa91c4bb7cacc939b53ea9"
 
 RDEPENDS_${PN} += "bluez5"
-- 
2.25.1

