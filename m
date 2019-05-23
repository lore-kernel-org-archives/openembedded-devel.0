Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 354EA7E411
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id m3so4884858wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sXuJ9RPDXbaEQsuP2tCI0cgokP4yfPW2Mf7178BtJOY=;
	b=Kj7UkgDqMy1gI0RPfZ9xHXMQ41l+zzmh7V0rTuC09vbl1gVe5Zagl7YvR4mhlq0GdK
	x+Qp7CRJK+BDyMKBPDMQtBuGYvKyhx8KmzVlIYg9AwQeYxPlMYOReAdnsdWwJNeQyc3a
	v8gVqrDjgWnhgboWxrkWGcLcSBcc7r2KvLF37qisnrf5XIV8cH12r2XKnpX0R9vkXnp6
	JMn+sivghOOPrxVtzC0VZmOiU6Y+/ABverborHFWPIp4H4M8T50pOjJeNjyHMP0ZmueH
	/Nt4WpcqylJzpFqiwVjAWVtfZ62w+VV8LT+sky1RMfl73u8YQQsu74lYcZ/NcnSkhCC+
	yjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sXuJ9RPDXbaEQsuP2tCI0cgokP4yfPW2Mf7178BtJOY=;
	b=kIOAJTlCbAktEXbRwTIBhqzfzUbuxIQwyEjYAgHelsxWvhyAXGu7tdD0P+W6uuX/jX
	YXp086h3U21UC+LTv8bsnp84ErtNMv2uHlKwA6YelpbWurs58p8861Tzxod3/qPjPGz4
	xDPfZCM9J1hAice/yZ8WVW1KDtYLUBxJqT3gEDPM/jeoQrJ/pJpHTdEazVVRmVZt25wg
	/L01j+9R60D7hf11CriWwyXxdpYNAPp1Buvlu52ONdjZwBhmil3CI1yuYfq6rYCObZC5
	gFmEtuZUm7X8EH+m0dB/vilLDxJt0UpICv2FYBH5bgCl8st8iMc+0bN6t0c4+p/qO28j
	kgIw==
X-Gm-Message-State: APjAAAWvs1SWNyjL4TgU8sJ8R4u/J5ibAlocpz4AnGg60IYEjMhPLhg/
	Z4j5vOhYO0dvC9Ow+YQ2Kz3EGhcfG4s=
X-Google-Smtp-Source: APXvYqz5ooxUXRfF/VJ/LMwi1QekrQV0rmvfgQT2RWjKui8ffwBqlesBQrIpb1LlAziguMSykUhb+Q==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr47310035wrq.202.1558594180813; 
	Wed, 22 May 2019 23:49:40 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:56 +0200
Message-Id: <20190523064859.24336-39-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 38/41] libmediaart(-2.0): remove GNOME_COMPRESS_TYPE = "xz"
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
X-List-Received-Date: Thu, 23 May 2019 06:49:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-support/libmediaart/libmediaart.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
index 57dca9c17..c7b368de3 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 inherit gnomebase gtk-doc gobject-introspection
 
 EXTRA_OECONF = "--disable-qt --enable-gdkpixbuf"
-- 
2.20.1


