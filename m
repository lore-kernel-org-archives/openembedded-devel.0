Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oxyea-0001tx-5h
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:56:54 +0200
Received: (qmail 19710 invoked by uid 503); 21 Sep 2010 09:10:03 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 09:10:03 -0000
Received: (qmail 5642 invoked by uid 503); 21 Sep 2010 08:39:33 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 08:39:32 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 10:56:42 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 10:56:40 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 10:56:01 +0200
Message-Id: <1285059363-2190-7-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285059363-2190-6-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
	<1285059363-2190-2-git-send-email-eric@eukrea.com>
	<1285059363-2190-3-git-send-email-eric@eukrea.com>
	<1285059363-2190-4-git-send-email-eric@eukrea.com>
	<1285059363-2190-5-git-send-email-eric@eukrea.com>
	<1285059363-2190-6-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8306889512909974863
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] hplip: add 3.10.6
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
X-List-Received-Date: Tue, 21 Sep 2010 08:56:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* tested on armv5te using HP PSC inkjet printers
* DEFAULT_PREFERENCE = "-1" until it's more tested

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/hplip/hplip_3.10.6.bb |   59 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 recipes/hplip/hplip_3.10.6.bb

diff --git a/recipes/hplip/hplip_3.10.6.bb b/recipes/hplip/hplip_3.10.6.bb
new file mode 100644
index 0000000..d9dfe1d
--- /dev/null
+++ b/recipes/hplip/hplip_3.10.6.bb
@@ -0,0 +1,59 @@
+DESCRIPTION = "HP Linux Imaging and Printing"
+LICENSE = "GPL, MIT, BSD"
+
+# currently, we build a stripped down version that only includes IJS
+# and components required to implement a minimal printing system
+# for embedded systems.
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \
+	"
+
+PR = "r1"
+DEFAULT_PREFERENCE = "-1"
+
+inherit autotools
+
+EXTRA_OECONF = ' \
+                BUILD_SYS="" HOST_SYS="" \
+		--enable-hpijs-install \
+                --disable-network-build \
+                --disable-doc-build \
+                --disable-pp-build \
+                --disable-scan-build \
+                --disable-gui-build \
+                --disable-fax-build \
+                --disable-dbus-build \
+                --disable-foomatic-drv-install \
+                --disable-foomatic-rip-hplip-install \
+               '
+
+# needed by python checks in configure
+EXTRA_OEMAKE = 'BUILD_SYS="" HOST_SYS=""'
+
+PACKAGES += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter"
+RDEPENDS_${PN} += "python-syslog python-pprint python-compression python-shell python-xml python-unixadmin python-html python-resource python-terminal"
+
+# need to snag the debug file or OE will fail on backend package
+FILES_${PN}-dbg += "\
+     ${libdir}/cups/backend/.debug \
+     ${libdir}/python2.6/site-packages/.debug \
+     ${libdir}/cups/filter/.debug "
+
+FILES_${PN}-ppd = "\
+     ${datadir}/ppd"
+
+FILES_${PN}-cups = "\
+     ${datadir}/cups"
+
+FILES_${PN}-backend = "\
+     ${libdir}/cups/backend"
+
+FILES_${PN}-filter = "\
+     ${libdir}/cups/filter"
+
+FILES_${PN} += "\
+     ${libdir}/python2.6/site-packages/*.so"
+
+SRC_URI[md5sum] = "96c36e3baf35e93cf9436a772f0c9ef4"
+SRC_URI[sha256sum] = "3ee0e68a613d2b966dcb6df9fd8e074c4c3e590249e61c0d792de3373b84fdeb"
+
-- 
1.6.3.3



