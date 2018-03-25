Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 677087867C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:47 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d1so4209480wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wql0uZw9LP1QkIg60I0cD1IwjLNw8j47RpYvD+j4wRs=;
	b=m7LDDGI8KYqzhbkz4Nz1LpxvtS3+9S2BawVkx3e3CejmqJLckp1eGPw63XUxrF/box
	9eAEU3YU95iUFhYA8gPAgqnhxSbEki79+nFTxcW6ldPRABXHZK6qAfQDospn0vXTI78P
	4tRRj+k9pAYVvXkaqCUF64rwM5nr32dUM82oM3eelK8PPWm6/XYLVgyX6Qjk/DlKo6Eu
	rYYz1y1jkULfFBpVUIfHNwkqeR24iE/i7zhf174v+ztK32z4rOMxwd+ifCpb6f+c3QSH
	AJEysBXDPb0WCVVhnmEYPktCYaSu/PjWDjtmUB529DJuew8FyKE9l2IpC7UjnJ8N7mMh
	hD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wql0uZw9LP1QkIg60I0cD1IwjLNw8j47RpYvD+j4wRs=;
	b=plj+N9cyH45bi55mfaieJRvxrks2KVY8Elz89awDFAJGaXiH4GJ4T8PwpBEh+N7tMj
	Fx4xB8or26LpY8YdswDbSM9Du5bSklK9d2mBk0BvwK1IkOCiU8LMX3U+bQiWZ4keZL9e
	Kaf9PX4UPnPI6rFRQVkNfcQjt/elmuRpuLLC8EKw+tcvQ87W9oeq0nTMyjxk+rpA1Oni
	feLzAD+vSYBQf0KzEU/8iUqrM7F5fQLL321cPp105XBpRaG653jnTcz4D6Gu+v308WJj
	TKfPiuQigOqcse/XvizuHd41ZzhHLlEQpoXgilXvvX++aXhBeoNhi9him17DCG7ztSlp
	+aYQ==
X-Gm-Message-State: AElRT7Gncavyqd4Ad1bvkLETMCVmS0syjcW8sUz/SyTY+gybkXnKjFOo
	Srd0AkFYgHrsgvtAIUAOFZXrLA==
X-Google-Smtp-Source: AG47ELtVOMuWmqE36zAhQlxn7rM3yBzADNWVyPLxVLMfQk+V5589X4taJ/ZS3iNBfEvmOeyH9nfBKg==
X-Received: by 10.223.170.152 with SMTP id h24mr26938226wrc.193.1521981348364; 
	Sun, 25 Mar 2018 05:35:48 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:18 +0200
Message-Id: <20180325123520.16452-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/20] mpd: update 0.19.21 -> 0.20.18
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:47 -0000
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


