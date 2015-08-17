Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A5305759CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:31:06 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so54007531pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=2e8nZca1ZrKBmeyl5TF5SQEF2CrF1SLcvd0TvJR606o=;
	b=rNDukAVP5D3qNBRxE9ddmG3EzuXHjlreSRy1IvW0Q2c4FOCDQSDAxATXsNPj+DnImy
	z6Q0Y4lfMKM5RN+DZ9m+0tt5/d9W4q79WTT9LF70DaYog3sO3V42KVsUISFk56d6FJgo
	zGea88/tvC/k7eNZtpfVkXrr7VaLRJ+KjRXBrsIik2idHU7X2iWqBdYjqmPXS3Ou+Owd
	Iv0pTncE2Ve5MjHzhqbOPXJ5hOaRrnMWXo/51IJsLEYwbYzDA5m8tG6QncjUFO2gn59c
	dMKKMrqwhRHtFCH+u4ahutRMt8/Vw1lTxHNRrKu1q1ZZbdM9X9Qagp64+cvo6dGs6FB8
	0n4w==
X-Received: by 10.66.246.228 with SMTP id xz4mr50412238pac.46.1439778667066;
	Sun, 16 Aug 2015 19:31:07 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	fw15sm12703420pdb.26.2015.08.16.19.31.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 19:31:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Sun, 16 Aug 2015 19:31:00 -0700
Message-Id: <1439778660-13516-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: Update package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 02:31:09 -0000

minor recipe updates.

This update contains several security updates:
* [1]wnpa-sec-2015-21
  Protocol tree crash. ([2]Bug 11309)
* [3]wnpa-sec-2015-22
  Memory manager crash. ([4]Bug 11373)
* [5]wnpa-sec-2015-23
  Dissector table crash. ([6]Bug 11381)
* [7]wnpa-sec-2015-24
  ZigBee crash. ([8]Bug 11389)
* [9]wnpa-sec-2015-25
  GSM RLC/MAC infinite loop. ([10]Bug 11358)
* [11]wnpa-sec-2015-26
  WaveAgent crash. ([12]Bug 11358)
* [13]wnpa-sec-2015-27
  OpenFlow infinite loop. ([14]Bug 11358)
* [15]wnpa-sec-2015-28
  Ptvcursor crash. ([16]Bug 11358)
* [17]wnpa-sec-2015-29
  WCCP crash. ([18]Bug 11358)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.6.bb => wireshark_1.12.7.bb}        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.6.bb => wireshark_1.12.7.bb} (86%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.6.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.7.bb
similarity index 86%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.7.bb
index 936ad62..f8ab3ca 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.7.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
 DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
-SRC_URI = "https://2.na.dl.wireshark.org/src/wireshark-${PV}.tar.bz2"
+SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "25ad2bc1c2a21396827c238fcff51bf3"
-SRC_URI[sha256sum] = "22ac0cc872f12cef9bb2cacfe0720eed8533dc5cea102d21de511620606cb3b6"
+SRC_URI[md5sum] = "c8ae53f648b1dcbf6e74495401a0f1ab"
+SRC_URI[sha256sum] = "c74a1c14e72ce0f198a93d832e71742c7f312cbbe719e5def9ecef176860f92c"
 
 inherit autotools pkgconfig
 
@@ -35,10 +35,12 @@ PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
+PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
 PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
 PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
 PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
+PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 
 # these next two options require addional layers
 PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
-- 
2.3.5


