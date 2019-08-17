Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2757F370
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:13:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z11so3677019wrt.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b2WwVPsIgFj2hf2ykVOTJr86pncURVnD5COXaDB+6sI=;
	b=ezJqUIJJ/j/YoxpYhJKQD8ig0RKhqGB5KH3sFVJHXtWJnkuSSP8Ul5imA6H4HSUto8
	yYTmhe7Il2erpbf/6OJ6H1IwVKB6GNne7MaMV/KgzbYv715u1F6FVn8R4X5V/tZXtvAv
	Sx8P1/P5UVA+OxTiR8ZHweXuCPisQmKyD2U/YzyXv1WP6rg71INHLvHgk0CnbRCH3b/K
	Ui5JmPRWLiVlf9GzDleV8aHTO7l/bpuj+F9TBNHumRL+dA7rgqoyepzogvjP8fVUAeaJ
	9RTHqGalWJ5EJRzG70dZgAoe5c/wHGj2dKvkECijfZof1SCxU7aUWarE3DVjOSb7Twy8
	dLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b2WwVPsIgFj2hf2ykVOTJr86pncURVnD5COXaDB+6sI=;
	b=NeFebk6iLRZOMQ9q6eTetlc/w1c63g9/h4WkT80JL8hXx+naV0iHxhZgNMtQImUdLC
	O69rC7Caq8sTqXoEhhrYPywNSxTenHsMTYEc46yaHuZHaYnmeuM0WtbQTEuvUSxVaEWa
	lUWide4f7NYlGey4k1wFM5TNoGIr/1Ysv3eeJo7NTFQS66abrebekDqJQYGjFu9BsT/O
	HelPrAfM+hh+mqt99SoMxPmnn2MsSaZXCPigNKo8/ICcaZ/b3XscI5TSid1zbpeoOKM1
	1asmUMWQpWJDSkFlq25CR15ifJs5BwCaCF4s7Ns75H11bF+Mq/r7Exvguc5W4qWrqdhs
	jHpA==
X-Gm-Message-State: APjAAAXqTJ4/x+/1H0qrfF4RQi2k4TA6oudUqI/SuwlIxEAeworeYUFe
	ZO0eIgyzpGPnyHgOStP/mbhpjrEU
X-Google-Smtp-Source: APXvYqycSo1Ekhyh8eeVl+wNOjy8bajj2jrIeq0yuwlUDYnqWedAH6sfu6dEUHF1DKRZwzuq8HH6NA==
X-Received: by 2002:adf:f991:: with SMTP id f17mr14446450wrr.233.1566029632620;
	Sat, 17 Aug 2019 01:13:52 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2D875347F2BEDFD5FFA793.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8753:47f2:bedf:d5ff:a793])
	by smtp.gmail.com with ESMTPSA id
	q124sm7592567wma.33.2019.08.17.01.13.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 01:13:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 17 Aug 2019 10:13:39 +0200
Message-Id: <20190817081339.22253-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817081339.22253-1-schnitzeltony@gmail.com>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [warrior][PATCH 4/4] vlc: Remove the obsolete dependency on dbus-glib
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
X-List-Received-Date: Sat, 17 Aug 2019 08:13:52 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 0bedc5da9..5c38be31f 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
-   dbus dbus-glib libxml2 gnutls \
+   dbus libxml2 gnutls \
    tremor faad2 ffmpeg flac fluidsynth alsa-lib \
    lua-native lua libidn \
    avahi jpeg xz libmodplug mpeg2dec \
-- 
2.20.1


