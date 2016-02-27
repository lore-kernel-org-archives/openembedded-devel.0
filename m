Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 79D927687B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 17:47:06 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id w128so21904519pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 09:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3N/FSmvYtsVrKQYO6+f41oAVszqWngjop2sxbe0SzKI=;
	b=BzdbzwSN1eHoFy4r9CFPZbTMmi2IXR/2a4BHSm/oUGW4DYk7Z/skXfvG/cw2TLLMe8
	cpSvQpYydmiqxqI4DZby6d2haqsUcN6Wfbds7HbZI7DlxvV13cKiag8QIDZ3y8vf33aF
	gjyj+X3khCW0CYPsdMd0AcsQn3tMGcuTpCl0hnaUUusLZ8CBuTlttuicjUSxxr356ftg
	/8ve1BlJV3y8NaJRL3jBSMrKwEwWzHLKxXAAxA1ZyWB2q0v5J1gU4lsfLP9e5u/X4fdB
	wehbFleMvpHlAKg6Qkscx76TMSda74nG5VgL4fZmy/zGKAA4qJ1fg/zbHyJxkYXyC0Cy
	35qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3N/FSmvYtsVrKQYO6+f41oAVszqWngjop2sxbe0SzKI=;
	b=hVGkFIt+pnOmty3jFRF9HTH4QL80LAeK43H95tAlBfVCwv5OG/EmuRgTd9SqcL7MWJ
	nQ+UP5KfZwqoJPVcUtiD84QioVWNZtlBY6Bw3N+553cDV80XY84MuHxZEiGa6dOp8M9N
	dEIixa0z3NNAmnHmZy9cF+DTw61wLTmIq9mr61xF6nPTNO9/jBXzfEXrt1QVMDzGpm8S
	tpyNNUQAsGElwwxwymq90c5RcBxNHTzOXa8P0gicrJfwd8TjOPpvAVsrtLLFihgK7bgL
	fVN9olyuRfcLg3ncw0764/gSAzaAI5ry4RNsrOdH4LcB/uj2kw+MP1958lpEbpFHXUSu
	EB+w==
X-Gm-Message-State: AD7BkJJxCZta9pqFSEUO4EGqNEeonysg+6olxVZ33gTjo5rUPaUqQRQenHH95Ad1cNzWLw==
X-Received: by 10.98.18.201 with SMTP id 70mr11010310pfs.104.1456595227029;
	Sat, 27 Feb 2016 09:47:07 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	a21sm27403011pfj.40.2016.02.27.09.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Feb 2016 09:47:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, joe_macdonald@mentor.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2016 09:46:54 -0800
Message-Id: <1456595214-25158-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: 2.0.2 update including security
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Feb 2016 17:47:07 -0000

The following vulnerabilities have been fixed:
* [1]wnpa-sec-2016-01
  DLL hijacking vulnerability. [2]CVE-2016-2521
* [3]wnpa-sec-2016-02
  ASN.1 BER dissector crash. ([4]Bug 11828) [5]CVE-2016-2522
* [6]wnpa-sec-2016-03
  DNP dissector infinite loop. ([7]Bug 11938) [8]CVE-2016-2523
* [9]wnpa-sec-2016-04
  X.509AF dissector crash. ([10]Bug 12002) [11]CVE-2016-2524
* [12]wnpa-sec-2016-05
  HTTP/2 dissector crash. ([13]Bug 12077) [14]CVE-2016-2525
* [15]wnpa-sec-2016-06
  HiQnet dissector crash. ([16]Bug 11983) [17]CVE-2016-2526
* [18]wnpa-sec-2016-07
  3GPP TS 32.423 Trace file parser crash. ([19]Bug 11982) [20]CVE-2016-2527
* [21]wnpa-sec-2016-08
  LBMC dissector crash. ([22]Bug 11984) [23]CVE-2016-2528
* [24]wnpa-sec-2016-09
  iSeries file parser crash. ([25]Bug 11985) [26]CVE-2016-2529
* [27]wnpa-sec-2016-10
  RSL dissector crash. ([28]Bug 11829) [29]CVE-2016-2530 [30]CVE-2016-2531
* [31]wnpa-sec-2016-11
  LLRP dissector crash. ([32]Bug 12048) [33]CVE-2016-2532
* [34]wnpa-sec-2016-12
  Ixia IxVeriWave file parser crash. ([35]Bug 11795)
* [36]wnpa-sec-2016-13
  IEEE 802.11 dissector crash. ([37]Bug 11818)
* [38]wnpa-sec-2016-14
  GSM A-bis OML dissector crash. ([39]Bug 11825)
* [40]wnpa-sec-2016-15
  ASN.1 BER dissector crash. ([41]Bug 12106)
* [42]wnpa-sec-2016-16
  SPICE dissector large loop. ([43]Bug 12151)
* [44]wnpa-sec-2016-17
  NFS dissector crash.
* [45]wnpa-sec-2016-18
  ASN.1 BER dissector crash. ([46]Bug 11822)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.0.1.bb => wireshark_2.0.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.1.bb => wireshark_2.0.2.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
index 49b5de6..b140099 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "c1610ab2238965363b811e5188750fb1"
-SRC_URI[sha256sum] = "c9bd07dd0d0045d6ca7537390a1afbcdf33716d193ea7d7084ae4f6c30b683ab"
+SRC_URI[md5sum] = "204d053e0796c7da09292e0b54bc8503"
+SRC_URI[sha256sum] = "e921fb072085a5654d899949bb561d0687f4819f7b63ba35777bb949a9b6b9c1"
 
 PE = "1"
 
-- 
2.3.5


