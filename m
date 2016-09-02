Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 838E576FFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 05:15:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u825FK35011804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Sep 2016 22:15:20 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 1 Sep 2016 22:15:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Sep 2016 12:59:27 +0800
Message-ID: <20160902045927.9988-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] upower: add systemd support
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
X-List-Received-Date: Fri, 02 Sep 2016 05:15:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* inherit systemd
* Add PACKAGECONFIG for systemd and control
  it based on DISTRO_FEATURES

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/upower/upower_0.99.4.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/recipes-support/upower/upower_0.99.4.bb
index 770f333..2573f12 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
@@ -8,13 +8,17 @@ SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "78800e1ac7f92b24aabdf433e38f75d2"
 SRC_URI[sha256sum] = "9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee31e2e5b17648037b0"
 
-inherit autotools pkgconfig gettext gobject-introspection
+inherit autotools pkgconfig gettext gobject-introspection systemd
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
+PACKAGECONFIG[systemd] = "--with-systemdutildir=${systemd_unitdir} --with-systemdsystemunitdir=${systemd_system_unitdir}, \
+                          --without-systemdutildir --without-systemdsystemunitdir,systemd"
 
 EXTRA_OECONF = " --with-backend=linux"
 
+SYSTEMD_SERVICE_${PN} = "upower.service"
+
 do_configure_prepend() {
     sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
     sed -i -e 's: doc : :g' ${S}/Makefile.am
-- 
1.8.5.2


