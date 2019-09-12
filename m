Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 94A2C7E08E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:02:22 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j16so25137892ljg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VO0IqM1dVe7876S06YLJR/JQtNVFj5RyCqYqZPtcdtY=;
	b=A/uLfVm15kVT3OOAtBtCOJSMMgR5S2Vkzk6yv8iZvRexqp1CBss6fKBv6QDhK4bQwO
	SH2ooVwunoFq/y2mC2sThdemEkCv1sB4hUc5iGO92B9W7GeyZ69go9F966CJd44mGyG4
	3hnQOhKdIgOukC1+AJ6dS69CUnjFmod1n6d6iMrfkz3DCSIH3LSLgqkoGyHbKyy3RmE6
	0Wlhvg1lTP3Ke5t7KBsZ9V13Y84qE0D0qasCXI6cR9ekFhNrFvfdMnjtjTd3RZAqDRad
	IzFTb1z4hA3v22VmetDzYCWhjnOqLkZE7A7aQCJmpRcmekANk7HoOk3LV8WS6E2Ectjd
	/RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VO0IqM1dVe7876S06YLJR/JQtNVFj5RyCqYqZPtcdtY=;
	b=DiLFZsrtAFTV2uLlmxK6e+tLChYcIOJyWXOSWQuEaKVW2Duy1irStoa7F8y/hxrSVD
	DoaK0oFyTeq4Ps7KzOFJN8wP0oRppqPz430nXZmEp6WDvH9m+OWZkAUSNI7fER5rAn86
	V/0YGjgRIe1ACXfe8p7/H9cJS6XlzAftpzL09EISSH2lr5BmkRmL1H8vSWWr9F8+M50C
	uQz/nxzYjn5mKNU3tV1At02QqYlvjWI3qIpA1hlALM5UbbqZ8jxJJlRQT11it0tSk0sM
	Socjg5wYaKGMEULQjYGwknVRi3kS1NNX/mRvTk2iki048A0qvSetf72TzGW9qAu8WbTE
	CI8A==
X-Gm-Message-State: APjAAAXjJ+9rMW013Vts6h95FSBAlwCOirh6k+PgQIwnOu3jA7Nr1bws
	LAKMKSwTnqDfJC5Q6xGevvxbIz5Y/uY=
X-Google-Smtp-Source: APXvYqwf7OiQIQ+BN5Hp1rrOJchh6W/k8BwKVhA4AmvDOHBJQuN/FPlqkX+OoSPpOv+q7ziIWLepBA==
X-Received: by 2002:a2e:9757:: with SMTP id f23mr28206708ljj.63.1568325742852; 
	Thu, 12 Sep 2019 15:02:22 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	l23sm5880668lje.106.2019.09.12.15.02.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:02:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:02:15 +0200
Message-Id: <20190912220215.11677-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libnice: update to 0.1.16
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
X-List-Received-Date: Thu, 12 Sep 2019 22:02:23 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../farsight/{libnice_0.1.14.bb => libnice_0.1.16.bb}      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/farsight/{libnice_0.1.14.bb => libnice_0.1.16.bb} (90%)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.14.bb b/meta-oe/recipes-support/farsight/libnice_0.1.16.bb
similarity index 90%
rename from meta-oe/recipes-support/farsight/libnice_0.1.14.bb
rename to meta-oe/recipes-support/farsight/libnice_0.1.16.bb
index 967beeba4..7bd6478d4 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.16.bb
@@ -1,9 +1,6 @@
 SUMMARY = "Interactive Connectivity Establishment library"
 DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Connectivity Establishment standard (ICE)."
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"
-SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
-SRC_URI[md5sum] = "c9b9b74b8ae1b3890e4bd93f1b70e8ff"
-SRC_URI[sha256sum] = "be120ba95d4490436f0da077ffa8f767bf727b82decf2bf499e39becc027809c"
 
 LICENSE = "LGPLv2.1 & MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
@@ -11,6 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
+SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
+SRC_URI[md5sum] = "5ad936c43d3c6d33117b2c64982f2fd9"
+SRC_URI[sha256sum] = "06b678066f94dde595a4291588ed27acd085ee73775b8c4e8399e28c01eeefdf"
+
 DEPENDS = "glib-2.0 gnutls"
 
 PACKAGECONFIG ??= "gstreamer1.0"
-- 
2.17.1


