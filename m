Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 501C672EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:21 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z204-v6so5903509wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vVyLzQuJtH/hBJd9vcFKsthfR5Bk6fb3lTpmLfiNcYA=;
	b=Uiy5VcaYNx0LQa3X6XTuWfn+JMl3/C/qPxyYw81mPzY2N1BEIgAFYkcJSGkn69DUFW
	JVA6+4CuGZPz4gfmiTRteHZBFyszIEn0ysZcv98ZQUHqFf3xSCVOeDDY7jJwIzdduS84
	bOCrae5ALPEh1gUQxOoPm35M7jGGUXccspj2qLSi3CTwtqgLC99xxZGBOW5lx+G9qmTy
	D2uQSZoXhInr1zGitplplT++/0Qv0IXn4mIiUtrY4BF+Ro6oXVGSqj4xhF0ZJfmcVKw7
	Kecw08+zawDOQXeNKlac56yJmiRPEt1MKjlJokZ9qEjIFRYAUcrLUTjT7zUB0C3J9tSy
	8y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vVyLzQuJtH/hBJd9vcFKsthfR5Bk6fb3lTpmLfiNcYA=;
	b=R/5gOydICu6pH4tbZY69Z1ffBPEB7Q3GzsjMc8oQWZGDuCK79rISmhztMBOztDGNvr
	gHKDwFlPueMBmeGGkaJmY5rsISNOdt/IYU3dA6yWOGhul3KaCYhNg9CW2idI8V7KILe4
	Vx3rF9sfW6LF1HYGYSIVKDW2Rhj6zwQ0+20JcTlI4AaaFaLRh/vhTyOaKvS6wyqNPJpo
	5NjyTMCh0IszWbcQdyjL/cF8kV5NZiiAORDIUOxosz+zuYczC2csK9JsR0XEWttmjN5d
	c5MmT9JhfnjLNmtrhg0VFck8R/Qmr0yTf+qlmJwuoI6fCgv4d/2vBWCyZdi58A/KyX+f
	0URA==
X-Gm-Message-State: ABuFfohiJrB5WzmWEsq9CpEURgn9JvJteVcfwJ4OUxlkczzFJFjOEfWD
	0toLD0jqWyxKNhd/CdAIOxm5ZYvb
X-Google-Smtp-Source: ACcGV62whAzRDiiJt7Qe2a+XEHDFbuKa6f9nDtwXbprd4dKpXE6btZTEt469B/fbb6JR92cmqBDyMg==
X-Received: by 2002:a1c:8085:: with SMTP id
	b127-v6mr2460526wmd.146.1538594721618; 
	Wed, 03 Oct 2018 12:25:21 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:54 +0200
Message-Id: <20181003192455.24921-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] xfce4-weather-plugin: upgrade 0.8.10 -> 0.9.0
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Yet another smooth GTK3 transition

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-weather-plugin_0.8.10.bb => xfce4-weather-plugin_0.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.10.bb => xfce4-weather-plugin_0.9.0.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.0.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.0.bb
index 649eaaafb..1663bb9af 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.9.0.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "bba7f750b97c8fc3656715268edad792"
-SRC_URI[sha256sum] = "ee6d43c444904631c240470e15e96215c2ce451158bfdbf234bce892bf60eab8"
+SRC_URI[md5sum] = "25d3d9fb2e688a619201655f6eea51c2"
+SRC_URI[sha256sum] = "34368cf2332774ad2a05226b2914ecb60e7550e9b2164be53ebe8f370198bb3d"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.14.4


