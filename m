Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E5127731A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 21:18:02 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b205so83692118wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=tN30pQ1z6FX73bQoBkuMi/I64lQcVwTv6uQA6x4KRs8=;
	b=me59BTBgFhL72Oqq3/tTCIeZHECqw4fm5G43oSFoAPdgeMW+RLX4iS5PdAk+riUzyx
	WFhKLKXViLzLB+n5rB4OjRF1r57sKbMd09BA+A4xIJvWpzMNg525Desupz/0KnjbzaSI
	jHuRwjKaJhACDjIrkJfbKmTpaUg61qk3MM9e1TX/PzxXG8swwD7nIzSTnTuRCzwOlxCJ
	yn6QomPUtAsI6nXOrGGFqI+ttDZJgCyDDjo3OtK63A570q8p8HPmqmkAwbjgOSx1I1mR
	+Dq9evqw3f60wPiQ3eWMwJH9JyEoVHajk5K1FDZGdMMYe4ppTnW0iOBLHsAuEfJ+sPIM
	HvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=tN30pQ1z6FX73bQoBkuMi/I64lQcVwTv6uQA6x4KRs8=;
	b=jLhxdrbN+q48TTnT8cznb6zr0UIY715iT2GrSPF6tgt2bWLQ1Sa/WjpW4oS3U/ZHIy
	9PgYJHG8QA74vLzHvM2NTpeuRLX/V1Vk5cEVJA7bYPSpCP7WMV3CShWKFHfBQjZY+Zak
	875ZCQglk2GO4yATJH8eakgdrk+sLNj03Y26anEhzUYkSnxTlVHQS3NcEgg82LXpd1AA
	JG/BwlcTDN3dt7ttGbl0fpZkSSWe1JBNWroUdkZb1DpF4w/J4vCuKAOhfaijOQc2xQDt
	WlePyjt5pB/ikoxAR5XqxBGKu962SWVubahH7u7TiG162SVCAOmrsexKvFB7oetsYTj9
	Wmpg==
X-Gm-Message-State: AG10YOQVB3V1onLfiXR4xyaWti4ZXNP/G7Odr/ZG/a1+JgZT7vO79QLABBnBG1+ESqJDyg==
X-Received: by 10.28.54.197 with SMTP id y66mr14268240wmh.16.1455571082864;
	Mon, 15 Feb 2016 13:18:02 -0800 (PST)
Received: from localhost.localdomain (p5B0A09DF.dip0.t-ipconnect.de.
	[91.10.9.223]) by smtp.googlemail.com with ESMTPSA id
	t8sm25773276wjy.41.2016.02.15.13.18.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 13:18:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2016 22:17:51 +0100
Message-Id: <1455571071-10666-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libsdl2-mixer: initial add 2.0.1
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
X-List-Received-Date: Mon, 15 Feb 2016 21:18:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libsdl-mixer/libsdl2-mixer_2.0.1.bb            | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
new file mode 100644
index 0000000..2dc48e4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Simple DirectMedia Layer mixer library V2"
+SECTION = "libs"
+DEPENDS = "virtual/libsdl2 flac libmikmod libvorbis"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=29d8bc7c38aa44b1cf3a633a46589917"
+
+SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c6c4f556d4415871f526248f5c9a627d"
+SRC_URI[sha256sum] = "5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f"
+
+S = "${WORKDIR}/SDL2_mixer-${PV}"
+
+inherit autotools-brokensep
+
+EXTRA_AUTORECONF += "--include=acinclude"
+EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
+
+PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
+
+do_configure_prepend () {
+    # Remove old libtool macros.
+    MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
+    for i in ${MACROS}; do
+        rm -f acinclude/$i
+    done
+}
-- 
2.5.0


