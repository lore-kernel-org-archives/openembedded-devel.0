Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web08.5551.1621325037366692743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BpCTT1St;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325034; i=@fujitsu.com;
	bh=Vb4zA9OUrckyFqg379woi7walyyKOV5uuIuyxYacf+4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BpCTT1StLgmHTP2kao7JWwgvx904lg2Gdn6jXgMKGBQkgkjFcMa3Io37xjMfn3gBO
	 HSG+l/Oab3Zrozb6Tc7O9QfB7PC9/Nqa1HJvLZ0zA5SxhgQvDP0DaJ3DfZcicoc/Le
	 ASiRNe2tPK0TOTZtGNbvc5kaDp6TXpz5YRpqG22o9TWQv5GH6hBO5P3qCrV115EOrG
	 mADjoGF/SFJgIhjsgDTEpuBbYrfFG6SLP92uO374J41qMXeuFsuaCszAz04AOXTMOs
	 wjqp3b+yLZ+lfl9OtrpRWs7cuUTHXwh1IMz5Dn0yBsN3sw/JKV7v4CrKEd8UQ0WIzU
	 rU9CZaNTVO/Aw==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 83/B1-16595-AE473A06; Tue, 18 May 2021 08:03:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MRqvuqZHG
  CwbKp3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a7tcfYCw6IVvQ3RTQwfhDsYuTiEBKYzSSx
  +tpkpi5GTiDnBKPErsP+IDabgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg9jCArYSd1cdA
  etlEVCVmPbvPxuIzSvgJHF78gywGgkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNYoSsy83s0
  DYFRKvD19insDIOwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGusa6xqaGeolVukm6qW
  W6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECwyulkHnhDsYfrz/oHWKU5GBSEuU1u78oQYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IEb2zR4gQhwaLU9NSKtMwcYKjDpCU4eJREeDkKgdK8xQWJu
  cWZ6RCpU4yxHO9+Ll7EzPFm7RIg+RZMtt27CyTbweTMBQdXM3PMApP32w8ByQcgUoglLz8vVU
  qcN7UYaKgAyNCM0jy4lbC4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcdZApPZl4J3GW
  vgI5mAjr6f+MikKNLEhFSUg1MZXpLFn/3z1wzfUGY1V+R3a28WlYvQtfWmO2J3qYjbaMZUcSb
  +776RwTHR3c9zTC5O88mT+JutNnJ5rNZNsB3RZlWZ83Kh6EmKwp3WCyyS393M2HVnrtKTa9fB
  Z7/WuXrxSV26I/urXtWPM69jK+FLxm2JR8uC52xNd9Nf9GNSSxf2539M4OmcBzSY5D0apDUDf
  fa8u/tAd03Ty5dKVopeGpL/qTVZ7xYJN50cT5g4W/ld/n8umhyurXCX1bbOQ0Cdr/U1l8qWX+
  wKyP6QLPe9WkrXX98qzBh1dYsExOcd2iC+fEJX6Q+y6V+nnrYPzA/M74oVa9jTtqa9bdlhHPE
  Q9R3FTm6/ZPYuvNdercSS3FGoqEWc1FxIgCNs+bkZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-232.messagelabs.com!1621325033!76990!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9271 invoked from network); 18 May 2021 08:03:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:03:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I83mri006904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:03:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:03:46 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 1/7] exiv2: Fix CVE-2021-29457
Date: Tue, 18 May 2021 16:03:28 +0800
Message-ID: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

  References
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29457

  The heap overflow is triggered when Exiv2 is used to write metadata into a crafted image file.
  An attacker could potentially exploit the vulnerability to gain code execution, if they can
  trick the victim into running Exiv2 on a crafted image file.

  Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e07ce6e66d1ebdf22]
  CVE: CVE-2021-29457

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-29457.patch          | 26 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
new file mode 100644
index 000000000..e5d069487
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
@@ -0,0 +1,26 @@
+From 13e5a3e02339b746abcaee6408893ca2fd8e289d Mon Sep 17 00:00:00 2001
+From: Pydera <pydera@mailbox.org>
+Date: Thu, 8 Apr 2021 17:36:16 +0200
+Subject: [PATCH] Fix out of buffer access in #1529
+
+---
+ src/jp2image.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 88ab9b2d6..12025f966 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -776,9 +776,10 @@ static void boxes_check(size_t b,size_t m)
+ #endif
+                 box.length = (uint32_t) (io_->size() - io_->tell() + 8);
+             }
+-            if (box.length == 1)
++            if (box.length < 8)
+             {
+-                // FIXME. Special case. the real box size is given in another place.
++                // box is broken, so there is nothing we can do here
++                throw Error(kerCorruptedMetadata);
+             }
+ 
+             // Read whole box : Box header + Box data (not fixed size - can be null).
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index ed1e8de5c..a13db42ed 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -9,7 +9,8 @@ SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
 inherit dos2unix
-SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch"
+SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
+            file://CVE-2021-29457.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.25.1

