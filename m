Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D970777685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:34:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so38497959wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K/ftMkCo3ge/sIHCGx+wgs1GV5eDpshJ88QWtmXJumk=;
	b=FB+aIKVPpxogl95/jVUF360QeJOepHxC5gYRG19vhxpg0ZO699pJdkLObjws6zGmi6
	bI25Tl76FGbUW9Sh9J/GWUd7JntQP1ls2tTgql93YyA3eCYznbw8WfjsTROFuO1RypnQ
	8HCBNoqDuU3xG+LWofD2CJSAzlAgMhmxDqZ4vjUv7LDa1fnakWdCV3T0RoP6QxLkou4R
	7G7JgcOu+8KZd+aSAlJrtZZXOxIfcCLfk0sYvaidKcdzzaTrHCThy2Ur0cR3tx4IPF8m
	f0CNfLWuPuzs5uw9RV/nRKy+9KiDfyH2KRarxOwAYTA2MNU7loxnPb0Q4Gns86F1Ship
	gQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K/ftMkCo3ge/sIHCGx+wgs1GV5eDpshJ88QWtmXJumk=;
	b=jrPV5ktiA8evRCdVxDX4yGrmnnzX41P6BPGUnGDJRK+Q3tDrir2aisC8uq/ikv1iLe
	eQnxq0D6UF2xrOcIZvxvjXgcQL5dzGn7UkP72lahb3LHXFnX5SPvj2nqn4sJsyZhj8TC
	get3ALN2rGZGBPQRX1CEQ+er1X8ZXT1Dio3HELOWGqABNu7tGAoLV3DGIuPnFXptUGIX
	1p2xnfCNvRLeK5CUK2yD9aiiDgQA+keeAwAA7HpDD9KAaNvCK+lR82UVpQ4fcetDQieL
	P+6NdlJAJC0Kv46aqF1Ro6FKFneTFWJ5X1/2rIvxi87TK00dQ4B8et6lPTlxjQIFGEhR
	onOg==
X-Gm-Message-State: AIkVDXLwTmbt3v2fsDfUQaqeLzsJWCe1aLQ3FcGqMoa3ECZFHh0SNhrZPpRNNB8KE0IIgg==
X-Received: by 10.28.68.137 with SMTP id r131mr12886668wma.72.1482446042390;
	Thu, 22 Dec 2016 14:34:02 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.34.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:34:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:35 +0100
Message-Id: <1482446018-17187-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] geany-plugins: update to 1.29
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
X-List-Received-Date: Thu, 22 Dec 2016 22:34:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

geanylipsum was renamed to lipsum [1]. We keep geanylipsum in package name
to avoid package feed trouble

[1] http://lists.geany.org/pipermail/devel/2016-November/010182.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../geany/{geany-plugins_1.28.bb => geany-plugins_1.29.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.28.bb => geany-plugins_1.29.bb} (97%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
similarity index 97%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
index ff7944f..89bb966 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
@@ -25,8 +25,8 @@ DEPENDS = " \
 inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "54ad042b6f91ff8e7a497c22faa2db4b"
-SRC_URI[sha256sum] = "b13471e0a4cb76d04a96bb21c965087b50c16390edee0c6b3bbd920d8ac17745"
+SRC_URI[md5sum] = "2059c63ac0ec29d2da66b6243ae792e1"
+SRC_URI[sha256sum] = "2827e0cf8f58a45759c82b690af5401dbd3ea0ec8dac310e4caea55547637bd7"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
@@ -106,8 +106,8 @@ FILES_${PN}-geanylatex = "${libdir}/geany/geanylatex.so"
 RDEPENDS_${PN}-geanylatex = "${PN}"
 
 PLUGINS += "${PN}-geanylipsum"
-LIC_FILES_CHKSUM += "file://geanylipsum/COPYING;md5=4325afd396febcb659c36b49533135d4"
-FILES_${PN}-geanylipsum = "${libdir}/geany/geanylipsum.so"
+LIC_FILES_CHKSUM += "file://lipsum/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-geanylipsum = "${libdir}/geany/lipsum.so"
 RDEPENDS_${PN}-geanylipsum = "${PN}"
 
 # no lua: max supported version is 5.2
-- 
2.5.5


