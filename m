Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98D7F7471C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id h76so15715626wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wql0uZw9LP1QkIg60I0cD1IwjLNw8j47RpYvD+j4wRs=;
	b=bXiHN3iwzhGACvPj8nMzlFu+Fh1+mJ4PZlQRemjvE0CsICdXKQOiN+12MOG3KTB4ps
	5hByaZv5hxOYneGD/b+QBncLROaLV+DbXuueEoY44TycendRi+tMg5Hl80FTHtHmKQf/
	k6PNx3VEY7wQwERU3J47jmotAv0xfwiPCN2FAYO9jv7FDfz8GvPWa+jbYXuIbj06tysc
	Dl6fiHnhyoDdvzx/uez6KpPBnYxS9ObrvgOJ9m43sNVCKY4VZamMm4kRsikaRANzi1g2
	QqsZ1BQ+Ce514vsbq+rmJZyzUInBAv8l1ZU5mtaFDJfAnoZnPAW6fVx+fdXzfMB5ipbL
	9JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wql0uZw9LP1QkIg60I0cD1IwjLNw8j47RpYvD+j4wRs=;
	b=BtwD7ttAO5IEwIgCEBTmGmU4FZkduOMgQzHKh6OrRr73/PPTbdHpE3863X6rddFo21
	5RUOZJasX2kWrPrq/XJ5THXANk6TicA5cg4VAPTerAw2aavLUZ+nJDvEoYuFVuzbT8VG
	Bq9beH0HNwwo3FvWpxnWIUTSm50UcAZEeCjiaNE4nWCMu2F+DrIUgp3cB1KRH4E2A1Qd
	Sjznr2hsKxEwwtItdwmdy5Dp7w0nYYcQXy6wjEA9hFTQSBmIfkV15NP0j8K60MGoLxMX
	n5JTGBuYDyB9jBa6lMODDJyeX1wCbrZLEJoB4IFHWKT/dXMojcu+ohmB3dB3TsDIy6Fq
	MN1g==
X-Gm-Message-State: AElRT7EsCHcZr2PBJWaEt3F9418eRSxRQHZ+S9dIxKp6iiJx8AOO4SPj
	H8DhBURTmTBtCLW7bnXJoOAKoA==
X-Google-Smtp-Source: AIpwx48PBEuTge1F4CtiTB77C+05x2n6Pxb7Ck8t1Y3RKmOFxZkR25OdSjjf320cTpqQy85p5LXZvQ==
X-Received: by 10.28.45.209 with SMTP id t200mr2355468wmt.90.1522416758038;
	Fri, 30 Mar 2018 06:32:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:46 +0200
Message-Id: <20180330133151.25882-35-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 34/39] mpd: update 0.19.21 -> 0.20.18
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Depend on lastest libupnp
* Depend on pulseaudio only if distro says so.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../musicpd/{mpd_0.19.21.bb => mpd_0.20.18.bb}                 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.18.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.18.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.18.bb
index 2eb21a369..6754f347e 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.18.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     curl \
     sqlite \
     bzip2 \
-    pulseaudio \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
     tcp-wrappers \
     openal-soft \
     yajl \
@@ -36,18 +36,18 @@ DEPENDS += " \
     dbus \
     expat \
     zlib \
-    libupnp1.6 \
+    libupnp \
 "
 
 # While this item does not require it, it depends on mpg123 which does
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
-    http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
+    http://www.musicpd.org/download/${BPN}/0.20/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "fc19f76b512bd471b6af5214965ff7c5"
-SRC_URI[sha256sum] = "8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730"
+SRC_URI[md5sum] = "8dc87ba95473fd738f2aff9bd69cc212"
+SRC_URI[sha256sum] = "6a582dc2ae90b94ff3853f9ffd7d80b2c2b5fe2e2c35cb1da0b36f3f3dfad434"
 
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-- 
2.14.3


