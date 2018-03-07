Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1F678A79
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:42 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i14so1240723pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bGsPPnXsnDWWD30hACJeKxgZJ3aadfH8MMroGHeHMm4=;
	b=P0ksYmKs6HdCK0IvU9qfczYi3L5ILP4l7QND4VEtMgAWGt3eLJz2k0aRt/w8R2N94p
	ZKY0cTacon8B580vPjRX247yZ3j+G9KkMZF2zeQfyBEbShNk5w1kWn8KiLmI5u1F3hIn
	bh0nIbhStlbHwhDifAf1r6MfCoarx3vmDrKPfLECzPWePX44zv10+JzMGN2cig2CC0oq
	w4TB+lq+RIqVUkUNOkrDjIp7BB1HxUDKG4/QgqFXz2Fr8xfz8ajMmP1t91sp98qUksEC
	7bTKUe9mENPE9FdYjZYOd+RO/2uwSHAuzfI/lMA5wXNVn91Rx2S/VY0oKU7bY4ecu5py
	9AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bGsPPnXsnDWWD30hACJeKxgZJ3aadfH8MMroGHeHMm4=;
	b=foN8HRpTorbFknkdv2kUw2w/2/cNZb8u2R2y21YrUQ3KGZKwQxQyXalmpCR2Ciuwlz
	ToOLCavRCfszuuX2xc1vRJYrQ17L5xnjIoRKQ3V0urQXpj9/eCKwv5Iy7GuWSolUj7Zq
	XTchGJCOkrm0X0difYcBbvXrsfNr7WkokdXs9MuxNW+pcU4K/C/Fy61UXmW1WRdSulhC
	bXopuhLtogunbokAsJqsoJlh6bmD1jHNBy2KKmwprEjA58nNjyf21Ri9noZcp28T8q53
	Ee49CfUZefa3qrugya9ZlWgzIny4xcJnofAHXTb+zbzjKowtvvb7M3MOyYlq8hh9NVXX
	5uuw==
X-Gm-Message-State: APf1xPBfV6IntkN4bKWlBIq1StB7na8s7xbbeeYdqSpM/MEimWapq5vX
	4rlRb0U5JlnRJ8n2mfdmIoqQFg==
X-Google-Smtp-Source: AG47ELvicH0zNDKBSvnBOheTR7Qjb2bWKl2X7lWdtJa5Gd4i5HSQJdOUexo6ywPM9kmAo8Bju3IZfg==
X-Received: by 10.101.98.17 with SMTP id d17mr19075640pgv.221.1520449303987;
	Wed, 07 Mar 2018 11:01:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:14 -0800
Message-Id: <1520449275-29492-22-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 22/23] libgdata: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:42 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
index 9b02512..80cbae3 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 
 DEPENDS = "gnome-common-native libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
 
-inherit gnomebase pkgconfig autotools-brokensep gettext gtk-doc vala gobject-introspection
+inherit distro_features_check gnomebase pkgconfig autotools-brokensep gettext gtk-doc vala gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_configure_prepend_class-target () {
     # introspection.m4 pre-packaged with upstream tarballs does not yet
-- 
2.7.4


