Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 79B637F4A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:56 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y22so1082013pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fnH8vvetr8vW1tpy8sndizyn2Tl6Hp3cYRaWhgVOSxI=;
	b=ckf4aARQfQ1vCHoToVz9YGR2JlOIaRgKWOMKhDTo7vaCUHDOTGeDmDIWElxsqCRU3q
	27FeSWzCCyit8e3HKACy1b37/u4OYklN2z060mu8KE4svoE5oE2QRlJC6mE7Qh7iMKOB
	LkzzFtjR56GQb/97zqvpgnqzCj2IUtObIZ3cW5TDY2FrDam7qrQatRB5IS+Y5WqbBBcf
	hREJEr7OWBpQYS53SJ2WkexSla0BbsLtGJkE/M6AbCoO85QwVybVSsQdjqsrzZHLfWub
	Bc636H/pORhdUqKWznvTKWbdx/6Qwm5EJicIGs0OnsO2WOTp0G1pl79DIeafkkZfYHhd
	ZTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fnH8vvetr8vW1tpy8sndizyn2Tl6Hp3cYRaWhgVOSxI=;
	b=lF830mdjPbgM2u3gz5Ni094K16GoRAwcRkPsYRkMxxpimJhnpcLIqdgRfzO7UIiRzh
	sfyusrqGprwimohQjZAegecX4+6iX8MgPVvqCBtJDWucRExo+jJSuz2LMC+F91MiSAdx
	quDvuEDIO8W8eKX73BG8LeSOFXt9Ip3lRIC58SUyLvtBdvTF97zS16KYykiRF2205KDr
	xSBdKBHmexa2GdBys2ZLAd0HmmfGbqrBW0EoTuxHG6jYgkrzWlPgOTLflBHojbczZu5+
	gm6TyBr9Zp2QBbrDAg5AQzHV4P0Tw84zFMoHsfOXU62XelnkfbKmCUMBYjxkyruiftoB
	kS2g==
X-Gm-Message-State: APjAAAXfpcHZfk2FMWN1D26n41mfgzOzNBCgrntM/+tUPBDWGYPKAA+n
	ii4ls2ejeYCSShTYIVZE+MX+1rlq
X-Google-Smtp-Source: APXvYqyztbkrwFCcRJbw+wBlZSWH7fQwCEdsCGNBPDQ114tQo4vf0Ng109CuxX2emY8AKMRACriKeQ==
X-Received: by 2002:a63:6ec1:: with SMTP id
	j184mr18644040pgc.232.1567287117503; 
	Sat, 31 Aug 2019 14:31:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:32 -0700
Message-Id: <e17f3657c9949c0c3316d94bc0f75ef3b62f86c9.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 11/23] net-snmp: update SRC_URI
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:57 -0000

From: Kai Kang <kai.kang@windriver.com>

Replace source zip ball with tarball for net-snmp to avoid zip bomb issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 673142b..0b3fa62 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"
 
 DEPENDS = "openssl libnl pciutils"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
+SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://init \
            file://snmpd.conf \
            file://snmptrapd.conf \
@@ -28,8 +28,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://reproducibility-accept-configure-options-from-env.patch \
            file://0001-net-snmp-fix-compile-error-disable-des.patch \
            "
-SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
-SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
+SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
+SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.7.4


