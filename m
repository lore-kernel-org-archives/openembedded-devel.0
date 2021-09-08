Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web09.12274.1631112382583834703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f+Ic7HPx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112380; i=@fujitsu.com;
	bh=s0pFzVEtraFLoDrhaJ9r0+bKaw8YRnSfR0ZdR/Ygr5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f+Ic7HPxkBGH/6xAvxgsOm111ie/8E6kjx9Msqe+bwBFY1f+ou6hB22ZMf8lVGa9k
	 U+/NN8PZMJUJDdOhdF/rMDju5Wsd3gxxFGtFoTKxq88FQ571uLV7lAA7Hql7HRv/7l
	 9WbehUEq3qUjMTQ0BjaC42d/WkvgCH8oKBGLuesofdOsNsq+hMMwrT0rUr68b1zXpW
	 qccykMPAJgb9DXnWSUCGyQyAjWX+JrZ3v87qgOEniKv/DHGqwb8ozGMZD8CebeZwMB
	 0Jh6d5EQ7xcpUpEVlMsHG4xe1W7QyqmSrKtmm9S+/aUfE1uum14Es9SIYDoonYrdJL
	 LQs6+CffqukDQ==
Received: from [100.113.7.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 7B/A8-15923-CBCC8316; Wed, 08 Sep 2021 14:46:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxVXfPGYt
  Eg/2nFC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy3E2wLtvNX7J7/i6WB8QdvFyMXh5DALCaJ
  zpkrmCCc44wSf05NYe1i5ORgE1CTmH7rBpgtIqAvsXT2HmYQm1lAReLF7x52EFtYwE7iyvz5T
  CA2C1C8Z9otsDivgJNE88bJbCC2hICCxJSH78F6OQWcJeZMbwOrEQKq+XXzJyNEvaDEyZlPWC
  DmS0gcfPGCGaJXUWL25WYWCLtCYtasNqYJjPyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYG
  uoaGxrqmukbGFXmKVbpJeaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzAgUwpZ3+1gfPb6
  g94hRkkOJiVR3l27LRKF+JLyUyozEosz4otKc1KLDzHKcHAoSfBqngLKCRalpqdWpGXmAKMDJ
  i3BwaMkwut0BCjNW1yQmFucmQ6ROsWoKCXOO/c0UEIAJJFRmgfXBovIS4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEeZ+ATOHJzCuBm/4KaDET0OK2hyYgi0sSEVJSDUwZl6aWqjN9537txth
  svGqj2N5TyqHsGZbOegdvMTKuT0+f1ygvE1Tg/Gt+z6O42pspZnNaEnVU5LaIN9v78TyNzVEu
  0dja4Fq/7MpKHeHvi701M4v+5hZqnnj0f55XsKehnTuH9ONuAYalYTstzyt9XBrJy1Eq+VxHe
  ec7V97XsZ6b0osdHr697lF+/sWi50uWx/t8uHJxkbtt7i/pnIKwo9sV5vjK+Z17veGd16ry5v
  iV76x7Lfe/tl0UcF5f/Z5mo93JmSzfE9rne1Zsfe2zTHXy49f93zjaRYt6Lh/86HpRjE3g+D3
  2qU0PXzxdH38x9pyI4bJ/vZuXsaQ0WvH5Ors88Fu+s/7Z88VCy5VYijMSDbWYi4oTAciLXxhD
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-238.messagelabs.com!1631112380!53991!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7599 invoked from network); 8 Sep 2021 14:46:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:46:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EkKuh016645
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 15:46:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:46:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dfu-util: upgrade 0.10 -> 0.11
Date: Wed, 8 Sep 2021 22:46:00 +0800
Message-ID: <1631112363-19399-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
References: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

o Fix suffix check regression on Windows with Large File Support
o Skip setting alternate interface when not needed
o Only clamp transfer size on Linux
o Quirk for GD32 leave request
o Improve status and error messages and exit codes
o dfuse: Process all alternate interfaces in a DfuSe file
o dfuse-pack.py: Fix alternate settings if first is 0

2021-09-05 Tormod Volden <debian.tormod@gmail.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{dfu-util-native_0.10.bb => dfu-util-native_0.11.bb}       | 0
 .../dfu-util/{dfu-util_0.10.bb => dfu-util_0.11.bb}            | 3 +--
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/dfu-util/{dfu-util-native_0.10.bb => dfu-util-native_0.11.bb} (100%)
 rename meta-oe/recipes-support/dfu-util/{dfu-util_0.10.bb => dfu-util_0.11.bb} (72%)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.11.bb
similarity index 100%
rename from meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util-native_0.11.bb
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.10.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
similarity index 72%
rename from meta-oe/recipes-support/dfu-util/dfu-util_0.10.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
index 86353712db..5a1e4aac5f 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.10.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://dfu-util.sourceforge.net/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "8cf55663703cdc6b40f377f999eb8d3d"
-SRC_URI[sha256sum] = "a03dc58dfc79c056819c0544b2a5970537566460102b3d82cfb038c60e619b42"
+SRC_URI[sha256sum] = "b4b53ba21a82ef7e3d4c47df2952adf5fa494f499b6b0b57c58c5d04ae8ff19e"
 
 inherit autotools pkgconfig
-- 
2.25.1

