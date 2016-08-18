Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1B16010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:06:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I76CxT019754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 00:06:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 18 Aug 2016 00:06:11 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 15:05:11 +0800
Message-ID: <1471503911-28428-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] lftp: 4.6.3a -> 4.7.3
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
X-List-Received-Date: Thu, 18 Aug 2016 07:06:13 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Upgrade lftp from 4.6.3a to 4.7.3
* Add readline and expat to PACKAGECONFIG and update
  zlib to add detailed prefix as better configure checks
  is included in 4.7.3 as below commit from lftp repo
  https://github.com/lavv17/lftp.git

  commit c2ef3838421ca954c378d109c0328fdeea3fc89e
  Author: Alexander V. Lukyanov <lavv17f@gmail.com>
  Date:   Mon Dec 14 11:34:38 2015 +0300

     use better configure checks for expat, zlib, readline

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../lftp/{lftp_4.6.3a.bb => lftp_4.7.3.bb}                    | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.6.3a.bb => lftp_4.7.3.bb} (60%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
similarity index 60%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index b25db8b..e4a8e49 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -5,23 +5,24 @@ HOMEPAGE = "http://lftp.yar.ru/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "readline"
 
 SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
-SRC_URI[md5sum] = "2777dd514d21fe1da764bedd1d0ab36c"
-SRC_URI[sha256sum] = "a8b53e5ca2c1acbecd181c87f21a8673ca9038dc9f2be6ab8c23790bd91fd446"
+SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
+SRC_URI[sha256sum] = "ce6519831603c19c2cf2e3c10b41d6ddc87a16049b99383e7b9b77fbc7707214"
 
 inherit autotools gettext pkgconfig
 
 EXTRA_OECONF += "--with-modules"
 
-PACKAGECONFIG ??= "libidn openssl zlib gnutls"
+PACKAGECONFIG ??= "libidn openssl zlib gnutls readline expat"
 PACKAGECONFIG[libidn] = "--with-libidn, --without-libidn, libidn"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
+PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_INCDIR}/.., --without-zlib, zlib"
 PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
+PACKAGECONFIG[readline] = "--with-readline --with-readline-inc=${STAGING_INCDIR} --with-readline-lib=-lreadline, , readline"
+PACKAGECONFIG[expat] = "--with-expat=${STAGING_INCDIR}/.. --with-expat-inc=${STAGING_INCDIR} --with-expat-lib=-lexpat, , expat"
 
 FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
 RDEPENDS_${PN} = "perl bash readline"
-- 
2.8.1


