Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 00A6E7CE3D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 01:51:01 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v16so12691147ljg.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 17:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=FFGeYb/wbcaZbFkWpUjFxdOjUWa769tygThrNRCuS5U=;
	b=urJ4HMgNq3QsH7WyzQbQCEzSHMuWb1+u8oVfBcXp9atjo5C4EP4+QZFyw9IwSV4kiB
	0oimWLNIY5lqMYvKegZcWyb9ScodlrS1PQvinJd92C7H5tA4lesE1uaTv/yd1OYo96Zo
	MVIUedqFJCSx3C1iDdelbKLk4j4Oy0al5xSci52rpYu324Xcbf8z2PQQ6EkByuMiourZ
	RBqujR2/GfVfUA0sZiPjSXriE2KGVaOF3GvuehCbipVJ2dftRaY5V5LrXEtDY3J9PVUs
	pml5+w8wUIDZKTx4d1ONN5xyABmvJGnFWNaq4phAGnGZYFrD6Hpzrz6xmHrxpEjKvEQv
	Jufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FFGeYb/wbcaZbFkWpUjFxdOjUWa769tygThrNRCuS5U=;
	b=XVkUkirr16ALlWO2cwuEpRuUrR+tyHj1XjWz7kei5/gJwxEnu69XW1hZGsfuB6NAZZ
	FTQ/ZAzwjUrMj03GhVbfxEtobjtA5yAf+7G+SjhRC3HM55n8N/yQVtnXwh2DjFf9PINS
	QM3ivS8vp+1odGLUTdv6+MdZRNPvif4C91CF25S0/rLoMZeQnVlkPdCWm9GMHsvAWpz8
	rY5/wyUuwXmDC+z99Ohprskj+au6xm3qBbmEYt8f+ZT31cAy2lrnrNw4ilb+EaWU6rS0
	wNbcdh2BXSjqJW4qOwk/lk1b3yhG/yfp7/SDuTv4J+Nfw0r5va/JOj5rCh1bF0imPzJz
	D6Fw==
X-Gm-Message-State: APjAAAWbhB8mGxFiDgNKmY3Qg89nndj60u6ZPygC9UXXzN6cYHBs5N9F
	O12maSUlfO21Arfd+zNH1xy1/srWNbM=
X-Google-Smtp-Source: APXvYqxQI9lZVXJp8Ir7I5BCT6exDnUrfGlA3ONjHEq9QJhdUbgIY37i8uOSee9cHFJ4SJYqMgZ91Q==
X-Received: by 2002:a2e:2c0d:: with SMTP id s13mr4433255ljs.96.1551923462147; 
	Wed, 06 Mar 2019 17:51:02 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z22sm585961lfb.66.2019.03.06.17.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 17:51:01 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 02:50:59 +0100
Message-Id: <20190307015059.18407-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Thu, 07 Mar 2019 01:51:02 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{wireshark_2.6.6.bb => wireshark_3.0.0.bb}       | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_3.0.0.bb} (89%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
similarity index 89%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
index 4699f6798..d940a4567 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
@@ -4,22 +4,20 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native git"
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
-           file://0001-Add-libm-to-link-for-fmod-API.patch \
-          "
+SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
-SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
+SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
+SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
 
 PE = "1"
 
-inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
+inherit cmake pkgconfig python3native perlnative upstream-version-is-even
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
2.17.1


