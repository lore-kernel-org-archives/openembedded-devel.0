Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D18577184
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:21:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so10291664wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yZ//3DPUYAXrjDhchknQZ/zDuVKt//F/zXjW+bZFdrI=;
	b=MXkHDnySt5FzFQjob+ut3RQYjt93Un5UCaRdMf5qYoPqKQqByq28743ajU7dywHNuz
	WgS+C3vsYN+aPy7CR3WzegV/gxDIpnx319pvmLca+L6D+zsR0W6/GCB2jY8UZC/uDEeS
	uTImBZMVWE5nnwx37V3sg6wZGdKjmAxk8UHAMwTUIRXliUDqzhHbS9ytAiDdxgE63PWL
	vt+X0rLBfxokecvqNCYtcQ6zb52KRt9XEWaCinvN9vG+xz16ic+tN9WOvlT2DaM4j8Dx
	l/wwgIsCSpnfcA+hPuJDe2/Wses/Fs3yastTPXhIFABVEnVnUbS7Dqb0G48zeyv6xUG6
	L1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yZ//3DPUYAXrjDhchknQZ/zDuVKt//F/zXjW+bZFdrI=;
	b=C8nC/Vuz4/zCKWEFk/qlHwwi6ZZ1w5WGQwdxAizwazDPa5ETRSZeCirELPU15SGZJC
	ei02QX0QLSCA1yoeiQy9JvXraQA0dzw0QSgHl2NzN6eHP0QalxRzmlTfAQCEQYlerf7B
	q4dPWx35qK6QICWaIklHsykBmp7+3HF0GDbhVklLZZAkuVYLQVm+2vtqCRIsCeD7W5HZ
	PdCthF7LIJy2GQzvjdTDjiL29gf70m7gdDY0WEHThU9n9yn9TZWP43gMW/b2gOiL++JB
	0dATuk7bZPceQTObYPx5DiDjpBQWSZv7tvGP98hpfTd84IV2lkPSaufJRe1XZMLGGTG9
	un4Q==
X-Gm-Message-State: AEkoousaqjQAWyqaPcXMoFmG2GNxcS89108SfBkULVvTyeq5y5TkcDrx5QHBb1tLD/r07g==
X-Received: by 10.28.113.135 with SMTP id d7mr13444088wmi.43.1471256468724;
	Mon, 15 Aug 2016 03:21:08 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w129sm15819721wmd.9.2016.08.15.03.21.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:21:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:49 +0200
Message-Id: <20160815102049.3291-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/11] rygel: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:21:08 -0000

* fixes:
  | ../rygel-0.28.2/configure: line 18228: syntax error near unexpected token `0.40.0'
  | ../rygel-0.28.2/configure: line 18228: `IT_PROG_INTLTOOL(0.40.0)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
index 5cb7d43..79ff6e2 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://src/rygel/rygel-main.vala;endline=27;md5=99324118da4c012d25edae2f779ae9b3"
 
-DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3"
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
-- 
2.9.2


