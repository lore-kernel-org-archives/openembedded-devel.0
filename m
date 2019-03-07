Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB8887CE3D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 01:48:53 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z7so12742069lji.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 17:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NZeYvu5LXWkgaf7k76U1Ykk/jP9Msz2bApvgqEzxyJg=;
	b=cHJCpab9fUoLaml2jUOJxIhiHQ3bOr/rfU4CnB+VWDM+BaH0SG33eNTgfNWZM9hKuD
	Vfmlo90IY5KUo7td3KehQkwmTke/i31EQN1D02+4UFTRHvnPVgddw2vmuTazBKrpZMQs
	RJyQFge5JxPQpPXC5OrfYHMSgTXzuFoQhGfSEvOpG2KesyJllSOh7zldZBQpy5+dzPY6
	kOVMPa/gBwH9yfJVGGtVk6Afw+AfWIEmmQZdi41ue5I/DuPbRVd1WkIZAcQW6FgjM3NX
	7BRPW1a9kdy3m/U6lTGEgWMA13CpqiOZSdMExaGIWGw+nGKwzgroF8lTFgnoKVGQYxRe
	t4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NZeYvu5LXWkgaf7k76U1Ykk/jP9Msz2bApvgqEzxyJg=;
	b=kqEjClVDhn+/rAA/6nf/rzf1xyai5d0FOLVtENg/GPr/cApw0YddeKhBTHGbRzmDnL
	7T94xSgLxfLY7KNgnQUy1kilFCFl8279KAGaf8um+hgTyjHX51QLjFFa0nDdQQYEcmu+
	zhThemkBXeVofjhG2nmwZ0jCvrpl6m/p3b04CbwDBOIyU71skCh3FT54dZUqaMhmD5Sm
	NEZf+Y2vft+DZfFk+waQLf8Pp4wVH+Ds0AEQP2D9LBm+Wn1ZJabjw79IfGjS5pNHjeg5
	Dc7yWr0ufRaftqsfTrsPF6AdfLk16/ksT3zt/LM7t44nf7u5TYA1OCW7AIlGfGiT9Wo8
	E01w==
X-Gm-Message-State: APjAAAXVOnyu/9hERvHelVvQq74UDqc0htjbCjhxH4tQ5VyP9Rb4hjh2
	0jMl+FreCaET1qmpo9ZJ8He5JH/as2A=
X-Google-Smtp-Source: APXvYqybSMX0joC/H9cvsYy19nNG0O84RFczcQWbblCCBFj1zowgtKo7v9PDp2BKyrZIC0nbIIzVBw==
X-Received: by 2002:a2e:81c1:: with SMTP id s1mr3821579ljg.29.1551923333587;
	Wed, 06 Mar 2019 17:48:53 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id t14sm585486lfe.51.2019.03.06.17.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 17:48:53 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 02:48:42 +0100
Message-Id: <20190307014842.5560-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Thu, 07 Mar 2019 01:48:54 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{wireshark_2.6.6.bb => wireshark_3.0.0.bb}       | 12 +++++-------
 .../nano/{nano_3.0.bb => nano_3.2.bb}                |  0
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_3.0.0.bb} (89%)
 rename meta-oe/recipes-support/nano/{nano_3.0.bb => nano_3.2.bb} (100%)

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
 
diff --git a/meta-oe/recipes-support/nano/nano_3.0.bb b/meta-oe/recipes-support/nano/nano_3.2.bb
similarity index 100%
rename from meta-oe/recipes-support/nano/nano_3.0.bb
rename to meta-oe/recipes-support/nano/nano_3.2.bb
-- 
2.17.1


