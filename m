Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3AA75352
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:52 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id v13-v6so17779632wrp.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=G5IlHjzeI8sR9l/22HqlWK99q/4Sh3KmNvK+C8sEfw0=;
	b=EFAFnBqRf+BExP0QqHDiWWdylrYC0X0S7TwCp+e6GIEjcrmWoD2uk40X/nALUHSk4D
	f5UBd5Z7h9QR84G7pfvV792+jJLCfVIRwHi9S9cW4tyBQYph/3wI83gsps2Mq2K+zfJN
	jNUJSpgtkTXoP1rw0UpN5DU5wxTQiYa/Z3jGB0GXUVb7I6gYhZ/zyRaTIiOK6uEmzRX8
	rcz5gPZWjuI/NzrqrCtD6GqGcKVTHkVNlmckp6tQj+/F2V3G2wsEYo0OsAJwvIdRAzuo
	MTfw9daFxa6/RzPuakdamLQpfD6O2LF737+J7r9Kb6VfjjKGKXRJXlAwAUFs6QzllBi4
	CeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G5IlHjzeI8sR9l/22HqlWK99q/4Sh3KmNvK+C8sEfw0=;
	b=qAZP/dAhqjHH3T9+mWL3Dy96c8q7SsV2L90t7iczO01kc3Oh4QXhdi1dPzT+ttVi+L
	tR7AA1mB3rcNWn8ODcOnW0zwbPVid2Pl2EQ+9JJkcfvglRJDiER0iCgWRFf1kF+MofiK
	XEqsjobn2hJEMOjng4GF0dHriwD6PC4ixPstEUJELBRL+Gb1qnzE6BgWa+27cjEmG+Mf
	KXzqCaPXYz/L+UIPZkVIz3PEVYFvj2R4R/dJWap4eLwKias8PE1JaiG+sbqvyNncNqHT
	qOo9ZWSnniXPk2frYB9Td13XT/yPzd+mshVWZ/n5wL6L+Kd3Ix0O5s16MKk78LQ/D7bj
	KNFA==
X-Gm-Message-State: APt69E30eoY/4aXLNJHeLTzEOVQybE5jJnsEbgHiJDIaKLdDUrO0WERp
	ZGpAoZvzWoFzE/JJnqF43LwpLg==
X-Google-Smtp-Source: ADUXVKJK4GFOzpb2uPTbOMMlZPFArIYJSyakW04uylFh5M/pGjW/J6Loc9t5PGZYiIyQ1nV2QJf2Wg==
X-Received: by 2002:adf:af0a:: with SMTP id
	z10-v6mr10180799wrc.72.1528643332941; 
	Sun, 10 Jun 2018 08:08:52 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:12 +0200
Message-Id: <20180610150821.9536-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 10/19] thunar-archive-plugin: upgrade 0.3.1 -> 0.4.0
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{thunar-archive-plugin_0.3.1.bb => thunar-archive-plugin_0.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.3.1.bb => thunar-archive-plugin_0.4.0.bb} (74%)

diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
similarity index 74%
rename from meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb
rename to meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
index 90ab6af19..144e26069 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.3.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 
 inherit thunar-plugin
 
-SRC_URI[md5sum] = "425f4faaace6dc7a4716a35b7795463a"
-SRC_URI[sha256sum] = "9ad559b0c11308f6897ad56604e5a06dc8f369f649eb20120b2d3018ef5da54c"
+SRC_URI[md5sum] = "0a7738a3a5f84bf218ece3ffb5241c63"
+SRC_URI[sha256sum] = "bf82fa86a388124eb3c4854249c30712b2922e61789607268ee14548549b3115"
 
 # install tap files in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
-- 
2.14.3


