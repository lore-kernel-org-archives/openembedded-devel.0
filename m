Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 68B4E71637
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 14:44:03 +0000 (UTC)
Received: by qcxn11 with SMTP id n11so9350372qcx.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 06:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=iL8HCOfZFy8a2sBtUw8eOvLugPCWGapqJ9ES0Gl6pkA=;
	b=zorzE7w+GDYgBvc26oeazkkMlXQOZodc7+gmiTpqhkkX2GosRdAe0KPynHRc+IGpJk
	CS7y6sbKVB9zpGSTkNOKJt+LXojfKsH9k2wMDfptEDH7OgbBtnCA3DHh3KzEK+rKYIeb
	EsUU4y2p+dYXXa003vn/oqLO6nnZxn/QDJ3BSimln1CoO5x71zE8dsVYT67QUzFzUXTJ
	vh1WMemzC+6M/K73VrUFPPNp1lvKPcfbVl3AlIyjXZj4dTk0JSFyNoD0pw6SXyZS6A7e
	WW0LVrtQAbGLx2tPtqiDYfEmHYQJmgSxdYaNwF3NZxAviz9cueCvJKGVXDYHVKQ1gwzN
	kTKw==
X-Received: by 10.229.184.66 with SMTP id cj2mr6377144qcb.6.1425480244348;
	Wed, 04 Mar 2015 06:44:04 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.175.83])
	by mx.google.com with ESMTPSA id 59sm2307565qgf.37.2015.03.04.06.44.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 06:44:03 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed,  4 Mar 2015 11:42:21 -0300
Message-Id: <1425480141-18610-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425480141-18610-1-git-send-email-otavio@ossystems.com.br>
References: <1425480141-18610-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] v4l-utils: Split ir-keytable to a specific package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 14:44:03 -0000

The ir-keytable is useful without the other utilities so this splits
the package out. For flexibility a virtual runtime for the keymap
package is also added so, if necessary, a custom one can be used in a
distro.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index f533bff..cea97dc 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -22,11 +22,19 @@ SRC_URI[sha256sum] = "d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a164
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-PACKAGES =+ "media-ctl rc-keymaps libv4l libv4l-dbg libv4l-dev"
+VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
+
+PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dbg libv4l-dev"
 
 FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
+
+FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
+RDEPENDS_ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
+
 FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
+
+FILES_${PN} = "${bindir} ${sbindir}"
+
 FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
                  ${libdir}/libdvbv5*${SOLIBS} \
                  ${libdir}/libv4l/*-decomp"
-- 
2.1.4


