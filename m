Return-Path: <yisooan@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCB77943D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 05:00:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k19-v6so6270792pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Aug 2018 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RLat7FrrhZ4STnv5NXExoLxc3LuK4rsttQ3eKTPx4HY=;
	b=YE+EoBianEMaD/ngrWYpP8P5ac5gNFolarxS2rUOswqMZARhJVY4zwgTWBRYZPwEMw
	KXwbXSSosh/HAe8XRBkho4vGEew3XzUEywz5thUho+JNdlFNC/rmaFpInjl2VGHpjIkx
	XFtub1dWOj2+yJVlGpidlSsWn8LUyZPENI1FGNOoVEOj3qVdjyIfh485j9m+ejDxS//e
	99wFY0THsE2kuH04lyPRpOVPxoGR9Dgyb6BLRAZYLZ9EhK2JjDWUO0a4jqnSoQOu2zs0
	Dm//0u8tMQ2I4AkEQEtMOR4RO6/1eXezaFRuPt4CA7ooEHpKWr8AUYI4Fz92Jowl9f+Y
	4HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RLat7FrrhZ4STnv5NXExoLxc3LuK4rsttQ3eKTPx4HY=;
	b=r+E6/OQfdYqGrvii7hNPboWqGA6eHkLh5xJ//NS+v9l5ofD1IwqEQ0sN1srk18CvXV
	V3UCP/bm/4FSguTVVvorlDkK/h5BJ3z5jJ/UXXkXilRbI3INGHZAmEjuhJbaDRMrHCXw
	plITxGUYgkMPAZ5m9qL2TXzpYBvq7zSPDi02HBkQZJ4raWLomcG7JNS7rMt3Khir4Dya
	1HbkKQHXvORDwzs9Z5Tqx0qBw+ymlrRTF12HJcOuMZKwMF1TjYLjYclPwuApom+sg887
	BGFTdAXzRllJNixz6zFH7KMawkAqnR0ITGlY5Vb449YoMF5+Q8ggW9A2MAHTDIJ6igW2
	mz9A==
X-Gm-Message-State: APzg51BLZqEC/fW20bQwk3XSxK/Pzs0bidyIRem2xWUnhUhPo+lejGks
	XeSisUxVxxvAr+35YdAX6t8XPU0Wovc=
X-Google-Smtp-Source: ANB0VdZbktqeieWwp2yBr7rrUcrZKRXzFlQbxhdudqsp4QPqHb1N+XYCH5vVVe/TJN6SovjbV9FC7A==
X-Received: by 2002:a63:555c:: with SMTP id
	f28-v6mr7782936pgm.37.1535259644275; 
	Sat, 25 Aug 2018 22:00:44 -0700 (PDT)
Received: from localhost.localdomain ([118.42.82.236])
	by smtp.gmail.com with ESMTPSA id
	l27-v6sm22941741pfi.180.2018.08.25.22.00.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 Aug 2018 22:00:43 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Aug 2018 13:57:35 +0900
Message-Id: <20180826045735.7732-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][morty][PATCH v2] libconfig: fix SRC_URI
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
X-List-Received-Date: Sun, 26 Aug 2018 05:00:43 -0000

It causes a fetch error since hyperrealm has moved to github
and the current SRC_URI is not available any longer.

To fix the error, use github repository.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
index fb6e50e51..a0b3a9471 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
@@ -1,14 +1,14 @@
 SUMMARY = "C/C++ Configuration File Library"
 DESCRIPTION = "Library for manipulating structured configuration files"
-HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
+SRC_URI = "https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
-SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
+SRC_URI[md5sum] = "e92a91c2ddf3bf77bea0f5ed7f09e492"
+SRC_URI[sha256sum] = "cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8"
-- 
2.17.1


