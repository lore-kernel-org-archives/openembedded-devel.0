Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SasVK-0006rk-S8
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 19:52:47 +0200
Received: by vbbfr13 with SMTP id fr13so2065515vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5zEqKNmdn1+SRYWgcxbbdowzY1yMQzyXh/ZxMV0ScaU=;
	b=xBL2HDWhV+EKnm6Gz1m/fucyBuEj9cfCs1IE7GIkm2yRhmhvPZqb6iJ3bLb0FLKslu
	ZkC7Pi7F22HtqgdyK+lO9IAL2iWstBeT3FTiwgGM3z5qu1ctSic4GsT/7yprtTp7K92c
	oi3lb57coFBlclR8BaHxD2fSfKhcvdOIFRR2fhx7jnqFYkNiF9LCPzr7NCRHzW/F/aYd
	SuWJD/2p+gIxwqq8XnChXHvwjYyUaWxuO3dl9TdoJOVsN51oFXDTin/gKxmkM8SemNYM
	YAS27eq0uQ2JahXCRVbtfUzMnK4xIfh02JJ9+y6x0PAm5mXBwhBbdRXK6Q23/g+4Wog6
	fLcQ==
Received: by 10.52.95.203 with SMTP id dm11mr6170314vdb.70.1338658944142;
	Sat, 02 Jun 2012 10:42:24 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id bj6sm8849957vdc.12.2012.06.02.10.42.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 10:42:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:42:14 -0300
Message-Id: <a20787649045d7684ab8b36a596cc09aa43163d5.1338658900.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1338658900.git.otavio@ossystems.com.br>
References: <cover.1338658900.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1338658900.git.otavio@ossystems.com.br>
References: <cover.1338658900.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/2] owfs: enable/disable modules to make build predicable
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
X-List-Received-Date: Sat, 02 Jun 2012 17:52:47 -0000

We enforce the avaiability of w1 kernel support and owfs filesystem
but disable Perl, Python and PHP buildings for now.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
1.7.2.5



