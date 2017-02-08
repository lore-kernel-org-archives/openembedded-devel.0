Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D109071AD9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:31:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so33533811wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KrMm4C+euvxPKoHs7UB4sqxDk2fTcfKWnpOwtIRHLzU=;
	b=LGIYZEeRocZAkOen2VEgxJCIcnNQ2wUHm52QyxJBG/3+yu2JTTLPqEL6WWGyzMfRw4
	7pKjjcrcqlyEzMULj/7uw5gzevv9C9zKmPAf04S+4HSGAoh53GQhXm4IY6rDiBA6UaF6
	1lrlyos/htCGYGlmSB905O+4DzT+11ceXCwmwogeFLrRFQzgP9O9j9xxKCBGzsTryh8g
	D9c0Hrk0uZAfSoeGWAEdYhtBRaPmM7vqJE7hgu7csMOvN/eWe55pmOogC4YE2TkYLpwX
	baIrtJAeeUJsHacocCBu06dbg0v65ph2Mwkk34SFDhKv0IqRUjfQ5rdOkRBm4nuMnFMi
	ZI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KrMm4C+euvxPKoHs7UB4sqxDk2fTcfKWnpOwtIRHLzU=;
	b=YYYZdwaiMs0x5kjZiZ+VNLHP7qUujx9gK1EqLVvHOjkSpb20llFBeZ9VtzewR4PoAH
	j8GZAeOuxt5E258ApjdHisHGbjDQzWmjRS5Wy9H4UkexjWqZD/HY5Dw8rt6aVeDfS9ZA
	LVR6fMs/ke7VdQqMZc9LRsFPXyKl6f8ygMkdYQ8UXSwnrsdPVQch0GbsKJYx8bfigNb/
	1wT4qZ0hPb7D5o8+DejcGjJ2+n4ltpUjUKhDkRoifuePWeq7idpjAo8JgaFXX7GURl8+
	9kT212y96de0NeC8gMiMiIh/+si01ycGSEAOojyNqUSoTE+LXMZfzGOTk5AUO9ugr6mN
	d+Cg==
X-Gm-Message-State: AMke39mW3Cp1RxP/oo2bcHmp5eso+LYDuqEzmu6dF9NErUZH6TuczjsjGRo/6Iv45+wehA==
X-Received: by 10.28.66.88 with SMTP id p85mr18386441wma.64.1486564314456;
	Wed, 08 Feb 2017 06:31:54 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id 36sm13283196wrz.8.2017.02.08.06.31.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:31:53 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:31:38 +0100
Message-Id: <20170208143140.22903-2-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208143140.22903-1-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
	<20170208143140.22903-1-andreas.kling@gmail.com>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-gnome][PATCH v02 1/3] dconf: depends on dbus
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
X-List-Received-Date: Wed, 08 Feb 2017 14:31:56 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  configure of dconf requires dbus

  | checking for dbus... no
  | configure: error: Package requirements (dbus-1) were not met:
  |
  | No package 'dbus-1' found
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index f38be880f..2830e717b 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "glib-2.0 gtk+3 libxml2 intltool-native"
+DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native"
 
 inherit vala gtk-doc distro_features_check
 
-- 
2.11.0


