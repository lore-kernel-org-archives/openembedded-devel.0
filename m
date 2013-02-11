Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U50AR-0004MS-IE
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 21:40:07 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so2854393dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ruOEdBEIRhIV4Q9N+wYYY0abE5h786Q9+NLPwIHqUqw=;
	b=XkPv7fSbLPi9fNnksiQWoOjntvdhzqk1EgpSW/xUcra/QSlX6UP6hRKUqsQhIdWFAw
	di86XFVmGQLL0OBGPyfHBV88YHNIoQfJ4qxtaU6IhJZgEGUMghAOCPg8gIqSuDJUdAPZ
	oP7llpioqWOUBa04GN0K5iO0xVHKoLisn+79G4go1y4j2a114P1i2Q6t5pYTAl5duoGs
	WL+uAIUckQNZ6MJcbsw39DfQXoikWqtddwcxe26rjGIA2T0aBd3kg331MwhFFLLLeHAn
	/aoPK0+uh6Jbmi5GShNBevm9tjMuTDnQQiE9Iio00wCfFJ0ZeYLnttopm3ApvcQVEZQW
	qeuQ==
X-Received: by 10.66.73.105 with SMTP id k9mr44332017pav.37.1360614240186;
	Mon, 11 Feb 2013 12:24:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l5sm68983893pax.10.2013.02.11.12.23.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 12:23:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 21:23:51 +0100
Message-Id: <1360614231-21036-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-oe] ca-certificates: upgrade to 20130119
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 20:40:07 -0000

* old archive is no longer on upstream URL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{ca-certificates_20120623.bb => ca-certificates_20130119.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20120623.bb => ca-certificates_20130119.bb} (89%)

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
similarity index 89%
rename from meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
rename to meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
index 66150f0..5ad4485 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=6135800ff6d893c7904d7aad90972eb5
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
            file://0001-update-ca-certificates-remove-c-rehash.patch"
 
-SRC_URI[md5sum] = "5105d4cc086f0d4ecf7bf2e4c4667289"
-SRC_URI[sha256sum] = "878cd1130ba056fe5f96decde7e5fc1b71d35eb8565a1515744912e100731ee9"
+SRC_URI[md5sum] = "1fbbec2028a33cf865b79c204aa2e626"
+SRC_URI[sha256sum] = "fb51ec9a2c551838cc1646a0b3c9e6bea5c1bb20ff5d71c542451fac4b191c22"
 
 inherit autotools allarch
 
-- 
1.8.1.2



