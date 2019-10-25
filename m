Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 458097FA4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v9so1050175wrq.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bERpPeq4n2ZH+L7Xzf2dRP8agKWCkgwm/Wmr075A+NA=;
	b=DBuDDffc+w6iQapBGXkWyfdbq4Ye5e79+BJgqRz3dZ4JeijkQAMM+0VG9hgKhzrWAW
	wn2ujpszVQ5c0HHmi7mb2lvanA645zVXx3X8KRJoczMqZr0tHn+PSJ58HN4AaM4chX6r
	klU1V2k200tfvxha8ylL80RwXkQJUZFhj7cC9FiZ3f9ukg8AGNJUvBbulk76NFZixs4q
	9EifeIcmxGzjNHvatbzH9Nj8/E33Iwroy+J4N0Ha3UqLZSIYXh1AjtKZ0+sZfOc7AbWd
	1sPpn5MF1/WzGy/6rZxD6z8lNWcSjzFKEBolX5hHctOx2SzHcR1jwQfkP0rBWlKoQXoR
	3Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bERpPeq4n2ZH+L7Xzf2dRP8agKWCkgwm/Wmr075A+NA=;
	b=tHp/pgeY6M57lFFE47gBEzUKQdSNBizx99GO2unJb1ZKzO/kSJ06tW6e/HuRnglFom
	Hsp4tcVJcB7+WKZYRD3LkhJf6RGeaJlmT050y6ToKUAQyv9ZwHQADBuRivAqk+4dJGoi
	W0BOf2Dsct/8pTwv1/HookqW2lWpnQwbMqDL8q6pgTZs6NZPsljAfh7KqdjLTLX846pV
	9xGkAG9IID1yuB6Nz4Yw7tn0wisVBPszgzk9UbABLAMLeBfaOYLq5HxL5NrXbmTpxitZ
	F+3NWz+8A/ntzgTuL7iyCzEGYluQzhsB7USOUGLuf8q3qgjOeG0FpppWAu3IlyG2QoZ+
	JbKg==
X-Gm-Message-State: APjAAAVKhB+Ft0gb+3YydcZ6iacrXalGScBrzfA/V13TfPmpG6KpsHGL
	v23YGYCafQt4SUMwi5xGh6inXC7N
X-Google-Smtp-Source: APXvYqyrJDdLC3VdNcdWX9COjyeJHx5JWp8zMIuehzeAirbulGyY7sZLrE9a8B53zVL6eufwaFxFjA==
X-Received: by 2002:adf:f343:: with SMTP id e3mr1413908wrp.315.1571988095691; 
	Fri, 25 Oct 2019 00:21:35 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:08 +0200
Message-Id: <20191025072113.11172-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/15] glibmm: upgrade 2.60.0 -> 2.62.0
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This version corresponds to glib-2.0 2.62.1 in oe-core master

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../glib-2.0/{glibmm_2.60.0.bb => glibmm_2.62.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.60.0.bb => glibmm_2.62.0.bb} (87%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.60.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
similarity index 87%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.60.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
index 7163212b5..75eea4e58 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.60.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
@@ -13,8 +13,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI += " \
     file://remove-examples.patch \
 "
-SRC_URI[archive.md5sum] = "0f6180d185c067bdb2aa30d035f9b867"
-SRC_URI[archive.sha256sum] = "a3a1b1c9805479a16c0018acd84b3bfff23a122aee9e3c5013bb81231aeef2bc"
+SRC_URI[archive.md5sum] = "7da228e3f0c6a10024b9a7708c53691e"
+SRC_URI[archive.sha256sum] = "36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.21.0


