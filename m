Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 220E57F339
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:33:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so666876wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lx1fzu8YXZzot3GqkVkTVaJyDa79fquqiOZDyC/W+ik=;
	b=PYxhleJ12cwfZ9asOBlxbr53hh0dE1p64xKF5qNp5lYUxwY+UfMbkZDrBiQolw+zEA
	JEMYiUdTqjrGV1w3CPfxyKmqqTLV7rJOHlwPKh319VWUXYe9NWRWI4JtCycHi3I9aO3e
	b8fAgjQM2eJmI8r3LEK9ZOTJb5aH7Uft5Kv93OAJE7e00pNJ7RTyj3jV8bvZvca3f0lC
	en+Xwewhx8owNxNkfWto8NDh6kifiIGgD7rmK79v1kJr7wnki7mPsjZwRs00+GYlbwk9
	eJlqyE/Te2rmO64A3pFDKpw4FKNfbFWJsVPlKGtuhWZkgP0vN41ZVkjeerkT5Kp1IEc5
	JPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lx1fzu8YXZzot3GqkVkTVaJyDa79fquqiOZDyC/W+ik=;
	b=aDaS3xnS9RJcBH+xiehP38Re/CUHA1imi8b5tLJr6ovmXk9xVw2y96gGrmhMexH2GG
	PH6Z8gcIFqEYBxXuuIXsWu0Jw6OuLerKKjZuNMT/SwyfbnGUzwItj+qcqvRRpIhsuOMD
	0nSJkFXfKe0G2cn4l3tVi1wRRaUwOVTg5ine4jSC6pEbmUOnN12uS0woMxusiIwSlhKM
	I01iGeWIFetRXraqT38KUk1gUQmUO3CvILICghiSxHGcHJ0lCvOniZpjcQnklM5a1v7U
	/5lI2r0RhokLIhdH0+uzoaWD/+agcsO67WD1Z3NpOOiedlgeMvSlfM1O3V8jg6jl5HXF
	wq+A==
X-Gm-Message-State: APjAAAU8lZ1HjcZRSkqu5wLh2fEgF0qXr8o3d5bW8LlnzhNQsVDSDPz+
	Ttu4d/mYiJ3nm4CfPTCnQD3sgfd9
X-Google-Smtp-Source: APXvYqxfgSdNIPdskybalCaT+J00KnecCCAWnG+dKV32O2C6rxf/J5QLFRtOmP5cVryyfhJwbDjZrg==
X-Received: by 2002:adf:f504:: with SMTP id q4mr596891wro.299.1575315234672;
	Mon, 02 Dec 2019 11:33:54 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y139sm465420wmd.24.2019.12.02.11.33.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:33:54 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:33:41 +0000
Message-Id: <20191202193343.12298-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202193343.12298-1-alex.kiernan@gmail.com>
References: <20191202193343.12298-1-alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 3/5] ostree: Change PACKAGECONFIG to use manpages
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
X-List-Received-Date: Mon, 02 Dec 2019 19:33:54 -0000

Change PACKAGECONFIG to use manpages and inherit same so we build mandb
correctly when api-documentation is enabled.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index ac1e49048098..efbbeb6a500d 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -38,7 +38,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
 S = "${WORKDIR}/git"
 
-inherit autotools bash-completion gobject-introspection gtk-doc pkgconfig ptest-gnome systemd
+inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
 
 # Package configuration - match ostree defaults, but without rofiles-fuse
 # otherwise we introduce a dependendency on meta-filesystems
@@ -63,7 +63,7 @@ PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
 PACKAGECONFIG[libarchive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libmount] = "--with-libmount, --without-libmount, util-linux"
-PACKAGECONFIG[man] = "--enable-man, --disable-man, libxslt-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] = "--enable-man, --disable-man, libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[mkinitcpio] = "--with-mkinitcpio, --without-mkinitcpio"
 PACKAGECONFIG[no-http2] = "--disable-http2, --enable-http2"
 PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl"
-- 
2.17.1


