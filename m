Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD9607BFB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 14:50:05 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id h6so8817302lfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eY0papp2K3f/c0uj0ZwnZYtjy0m7QDGak5mS901NJ2A=;
	b=bZdCIR8BWXAvVyKmv3ppnl9gk8x1ib9wGvPqDFFXOoZ89asEyFCcwnlGiJwPhKFQ9n
	rwbdgHZY4d2vDHMh2c3nk4rdOpJLQMjvh2rI9m7Ic0LHhAf+plTuVvlLCjj34NjADbbH
	odIKFs1UhvvKAK/G0adRnxpn2eR2qFpeVK211Jo1BxsJrOGmKnHHosP3Sr/HnRBqf8pX
	WwIcnFG5A9eZjmhlAlMvX60QJCm/t0EZ2PcdN/xHdReKd1LK2xUGcqVTFAkQzKu8/Rgb
	ZzbVpSLdqWy4Vvn7UJ3tfBP6mqv1Ss4VpXQHc72YKdGQ/Mv3d6UzXCR3gGVr54v6b6RS
	50Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eY0papp2K3f/c0uj0ZwnZYtjy0m7QDGak5mS901NJ2A=;
	b=EZKTipghsKsUHVSdjqUjXhX3/w50a//mpuLw8YXxuOQtYsO/FfWquRfLopbP1embEY
	C8cG8J7I3OvupaA+aryJgdZj2WcE5TH2aJ/y/i2cOhBEmIAyDZV2kR1lRATfRALCakAH
	D7SOK2VVQDq9tXsH9ymHl4vPGsN48OT8hrVa5dsvwOv2ei8zb9RtYRIH5Kfkz3pjwCSA
	VmpOrCUjA0QDz7dyUuJriS0og9EAcLjw1vCc50mXkiNKhzjUxvE+xs3jMptQ0RSqp8XX
	9gIVyytNG8HRWEQjMpPQdVPJ6Ukd7W422I8CUHkmJhWWW9dNCeAsF7+613x9mbmdTKWj
	ooeg==
X-Gm-Message-State: APjAAAXPduUL/rAxskmG3u4/sNPWSAajUwqyPEqCp6DiIiKYnud6LlU7
	uaDuBpTUNCWLbHpik7HDMNp2kBID/+o=
X-Google-Smtp-Source: APXvYqxAX6nZFkmLrnoDpsB2FN1AnG/7FqZ/diqnDMd5bK3MPSiNgHaNLNMIPMM5DbpPNPeK61fR9w==
X-Received: by 2002:a19:7613:: with SMTP id c19mr4950059lff.105.1552747806043; 
	Sat, 16 Mar 2019 07:50:06 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s73sm1014204lfs.62.2019.03.16.07.50.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 07:50:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 15:49:36 +0100
Message-Id: <20190316144936.4768-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] openconnect: update to 8.02
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
X-List-Received-Date: Sat, 16 Mar 2019 14:50:06 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../openconnect/openconnect_git.bb                 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
index c944144e2..050a2833c 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -2,7 +2,11 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
+SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
+SRCREV = "6487ee8763e1b6345718684909aca970befbc49d"
+
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
+RDEPENDS_${PN} = "bash python"
 
 PACKAGECONFIG ??= "gnutls lz4 libproxy"
 
@@ -14,10 +18,7 @@ PACKAGECONFIG[libproxy]  = "--with-libproxy,--without-libproxy,libproxy,"
 # not config defaults
 PACKAGECONFIG[pcsc-lite] = "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
 
-PV = "7.08"
-
-SRCREV = "9697bea0e50952cab57063238b43a7099e498cbb"
-SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
+PV = "8.02"
 
 S = "${WORKDIR}/git"
 
@@ -25,3 +26,8 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
                  --disable-static"
+
+do_configure_append() {
+    # script has /usr/bin/python2 path hardcoded
+    sed -i -e 's=python2\.*=python=g' ${S}/trojans/tncc-wrapper.py
+}
-- 
2.17.1


