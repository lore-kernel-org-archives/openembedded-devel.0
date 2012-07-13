Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6a-0006VU-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:08 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=DVPLsC8ddrPfWvFlTt7RDaanjTQnnEAhF/PvR3o7WG0=;
	b=mvCldKP+W4bSf1SZWcMP/Og5RK73No1hNiPFJgLuKyV5MuMvLc4QO5vKXPraBfooA8
	rLhYM+nTIexgEPBgIB0bkb1RkMozapS11p4vm0FooEygf0R/S1uVdHtAU2ALhGQSCiBK
	twlu9rAcS9y9GkshK9MvlJ7ltBEZae6oPEklEhJBfV6D4g65EsgbIlp0B5dU/azkrczp
	H+qVATSPXSWFKg+IEpoWiblEgt8NxcZcTndFJIusFmwfnF2pdnvpfVTzy7aIaJl+fIXx
	AFRj4UnBQ5ig8VEYveB8Ei6o6OaJOhBn00x4wz8YXq8vMYMIdSE4vTrZZCnXWLzKYFOs
	yfiQ==
Received: by 10.14.47.208 with SMTP id t56mr84690eeb.38.1342170775839;
	Fri, 13 Jul 2012 02:12:55 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id x52sm23162585eea.11.2012.07.13.02.12.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:57 +0200
Message-Id: <1342170730-14982-11-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkeTLgByxXqVNiLgTzxPcMEYjkBnoD3zAyZGZf/C9CyX3jNFgSEcZbGdKs8BXl4h+poiGfG
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>, eric@eukrea.com
Subject: [for-denzil][meta-oe 11/24] owfs: enable/disable modules to make build predicable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 09:24:08 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

We enforce the avaiability of w1 kernel support and owfs filesystem
but disable Perl, Python and PHP buildings for now.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
index 451aaae..d7c5040 100644
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
+++ b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "fuse virtual/libusb0"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
            file://owhttpd \
            file://owserver "
@@ -19,11 +21,16 @@ inherit autotools update-rc.d
 EXTRA_OECONF = " \
                  --with-fuseinclude=${STAGING_INCDIR} \
                  --with-fuselib=${STAGING_LIBDIR} \
+                 --enable-owfs \
                  --enable-owhttpd \
                  --enable-cache \
                  --enable-mt \
+                 --enable-w1 \
                  --disable-swig \
                  --disable-owtcl \
+                 --disable-owphp \
+                 --disable-owpython \
+                 --disable-owperl \
                  "
 
 do_install_prepend() {
-- 
1.7.10



