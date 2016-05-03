Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id BEE5E71E63
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 21:12:44 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id iv1so15033363pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 14:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=j61Vv75sc7OdZHq3u0x3/1Jisw14MZFBU9p65xi+lUA=;
	b=FqKVggzTojHLGv1DMS0rIUasnxYWep2dS2uWy+Mv9G678BmXcDeKWu+GeYNhdugLlp
	Ko5AYu+nboIpmm/oug0dp3WYezrgcantqV4dOfXmzCEB6h+bj5gdlW230ON6Ph+Erb9/
	kk2tfZUHrcHtU+mIUSLuR9JbFdyFG+zdGSPUcUONVnvsngNKvFm9n9ErA2T/g1YjRRRC
	oeauYiYMVA3tXcspg+Dv4OhbtBSqnt4CGzo5PZaC5qhUKT1PiML++x26qydiHINScj5l
	eg2/k8x+fiGlF5QOI1DiLWedia0umnE431D3R452jGrVCRH/uGHZ60eL0NtnupfArAQT
	hLgg==
X-Gm-Message-State: AOPr4FUztSmODwEVZJ+OFWYT5xKahxG44ihk73ngy6RUfbOs6OPBUoQ9h8+n0yguHHuaUA==
X-Received: by 10.66.248.6 with SMTP id yi6mr6744990pac.86.1462309965277;
	Tue, 03 May 2016 14:12:45 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id l88sm286056pfb.79.2016.05.03.14.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 14:12:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 18:12:37 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 May 2016 18:12:36 -0300
Message-Id: <1462309956-19552-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg dependencies for opencv-java and opencv-locales
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
X-List-Received-Date: Tue, 03 May 2016 21:12:45 -0000

The opencv-java is not always generated so we ought to include it,
only if it is available. The opencv-locales is not available and ought
to be skipped.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Fix handling of package when java support is disabled
- Avoids rdepends on -locale packages
- Improve commit log

 meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index c1f9802..789512f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -79,7 +79,8 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+PACKAGES += "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
+             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)}"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
@@ -104,7 +105,7 @@ python populate_packages_prepend () {
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
     bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 
-- 
2.8.2


