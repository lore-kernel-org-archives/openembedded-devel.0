Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19EB078A91
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d26so6339551pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LwKQUs5kIB+LdeibvXYCE/Ka9vsyNzk6ZUQVv95MD4E=;
	b=RS6BcD5CZzIIrkR8QqyylFxDFewMVxdhRyYlHlRyn9hIWZQIijqoMHl578pDw1gfE+
	WAyxTGdliKXnmLCcj3wi1dumJXwiiF9bh+Eqpu62vTAS4QvI4A36Cbp0091+SeYYke9j
	uPsQ+3+fOqAq0sEb52WVnUfwyVI05wqg6dLjPMT7TDk1YyCfBJxqWmwZo+56XkerwS6F
	H67oJYJ+KsmSusT0Q4ONU6S2j3z5r84ZWQt9t8gBbQMt55m1SYtgvNTiuWuFWJ4HnDQ/
	Z5vQhyycgvrg9xRkptRImSMQGXdNKCqNVRmmUHy8QWGY0A8dEAI7EQtYQfOGa1w5NeVP
	faQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LwKQUs5kIB+LdeibvXYCE/Ka9vsyNzk6ZUQVv95MD4E=;
	b=ix4ZQ71hBf3kgfo5/2+QKoTQBfGABu57VeiyuH1rY7MDAsCzPwk1mQN+F8quaNswrL
	xd2yAzX1STL2mGM439V6ZyTK8WA0hCuDFBly0o9hBVx3CMlo3ZtLEXziHQPIDSBTVm9R
	KFWT7uGPc23oVz0ODpD6lPrUPg8rlgUEIwmR/x3mPQZTHkWpc3nmaqpFRJlLtEH4q7MY
	wHeCVwP/3Htksl/sk7uWX+q1kj+4lSPWWhN7Crfds1OsoJIRjWGTsogZUF/71wt/DRn8
	E3IQn0/KVetY/T41AjOqp8PIGu5/zdizHdtndH1aJMtG38D2M3Q4nZPsRVNkeSrRuUVM
	xIJQ==
X-Gm-Message-State: APf1xPBlbmKvV4m7k92vH9AQCHnBHTdDCcIOEszMHQzIXMx9uCx/bRyU
	51JpKidCxaYAVGuYikPncLU4+A==
X-Google-Smtp-Source: AG47ELvYj4fzgaV6N7NwOXLRcdMEpIw7zj5PFmzIkxa0WlzJ160FJ0sLu8d1dcU0tzK2Tu1rQKoUPA==
X-Received: by 10.98.67.78 with SMTP id q75mr12763978pfa.98.1520196108988;
	Sun, 04 Mar 2018 12:41:48 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:29 -0800
Message-Id: <20180304204130.23962-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304204130.23962-1-raj.khem@gmail.com>
References: <20180304204130.23962-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] libsdl2-mixer: Upgrade to 2.0.2
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:48 -0000

Copyright year changed
https://github.com/emscripten-ports/SDL2_mixer/commit/d7c0736d233f573e519297d7bd69cd1b1bb8e684

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libsdl-mixer/{libsdl2-mixer_2.0.1.bb => libsdl2-mixer_2.0.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/libsdl-mixer/{libsdl2-mixer_2.0.1.bb => libsdl2-mixer_2.0.2.bb} (77%)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.2.bb
similarity index 77%
rename from meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
rename to meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.2.bb
index 8276b446d..718f3f5fd 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.2.bb
@@ -2,12 +2,12 @@ SUMMARY = "Simple DirectMedia Layer mixer library V2"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl2 flac libmikmod libvorbis"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=29d8bc7c38aa44b1cf3a633a46589917"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=95e0c3cf63f71b950911e698a54b7fc5"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c6c4f556d4415871f526248f5c9a627d"
-SRC_URI[sha256sum] = "5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f"
+SRC_URI[md5sum] = "aaa0551393993c14a13f72b339c0ed6c"
+SRC_URI[sha256sum] = "4e615e27efca4f439df9af6aa2c6de84150d17cbfd12174b54868c12f19c83bb"
 
 S = "${WORKDIR}/SDL2_mixer-${PV}"
 
-- 
2.16.2


