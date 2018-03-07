Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6BA78A47
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:30 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l4so1228967pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aCWDs4+QbB4hLMafYTjGgD1KtGS2ueAJ3X85OBMd57U=;
	b=G3ZZiY2AegPmbkOLXOhpSVPK3F9OF6XLs+B6vSREH4uZYlHOG1+LVfAO9WluiCnNlY
	wehFIGMM7D82c+uWfcHu0q8hbWsPusXxWhEsSh+4SoBBbsFXj1v7nvX/26xTxzeNzW2r
	dvjj5242gkVu2+d2enOYgad2/Q2Po+HXVEVWORtNFM9O+jPotd7Gv3PaJ08DsBilS3fx
	Bd6+i6xxux60V799NETG/ZMVtrsHBJqG5WjUM3rSksV3C4KZ8qt5U7eHSy8vniidiwEY
	ICfarDkTStECOn8YbQB2mUEkJeiCIzGCSgiHfHRXDoXeypTtNYD5AC+un9aeUqQrnUVl
	CAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aCWDs4+QbB4hLMafYTjGgD1KtGS2ueAJ3X85OBMd57U=;
	b=DHX1PyqUQchjZ7dBjfKLqotBmW/E8ZmzY/nzy/DZ+H8J1uOSMhGoNejg8MTlMiarFj
	sjI/DUrfuU6nDk7D+HfoRXOi2fIxXjFOrwasebeMFdpKdDth7BxsVVb8iY7bdVrbf2Eu
	n/a+K9shfvE5rAqiO6GyUUkFhl9aRndXF6ij5Lzfcv4IhYT4fEmKeyYZYhzwYliqSGL9
	55QKSqyOJLTPPtYWQz6tJP+Wmujin4L/vxVXlW3y8fxPMlJmVxkyWKPufGWc7pYy9Od+
	uNv/PlARGFKHegrXzLGCq9YvuGSRn3MkYlxNJI7D7/vDOrtuyvrPE5dtKP0lSs1Tc0Cj
	LgZw==
X-Gm-Message-State: APf1xPDEWD/sYok0TBtVWJqei7/D9Bctubll1exlhrfyETA1AqdszVBC
	hnFh8Vtc0fcUKG0zkxInuhiHQA==
X-Google-Smtp-Source: AG47ELv2BiMJgD84bVOVrxts8ReWFr5vUjZtAle1osEHGM4cCoa3P+DGdo1jGMRAzJPyc3xsm36yLQ==
X-Received: by 10.99.166.10 with SMTP id t10mr18866981pge.198.1520449291695;
	Wed, 07 Mar 2018 11:01:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:02 -0800
Message-Id: <1520449275-29492-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 10/23] libtimezonemap: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:30 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
index d6aeed3..957d7d0 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
@@ -15,7 +15,9 @@ DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native \
 
 B = "${S}"
 
-inherit autotools pkgconfig gobject-introspection
+inherit distro_features_check autotools pkgconfig gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_configure_prepend() {
 	(cd ${S}; NOCONFIGURE="yes" . ${S}/autogen.sh)
-- 
2.7.4


