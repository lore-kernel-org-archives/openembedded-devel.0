Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte28-0004wg-1w
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:34:56 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c5AT4EyXqfaqWhc5iezie+P4HhadyD@postini.com;
	Mon, 22 Mar 2010 02:31:46 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip08.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:43 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:44 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:00 +0000
Message-ID: <20100322093459.27540.50744.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.186
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/12] commit 1484faec83f86877d1fa8c267de035e0016e4386
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
X-List-Received-Date: Mon, 22 Mar 2010 09:34:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add traceroute application

    This is provided by busybox, but the full version is required if building
    without busybox.
---

 recipes/traceroute/traceroute_2.0.12.bb |   32 +++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/recipes/traceroute/traceroute_2.0.12.bb b/recipes/traceroute/traceroute_2.0.12.bb
new file mode 100644
index 0000000..04678a6
--- /dev/null
+++ b/recipes/traceroute/traceroute_2.0.12.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "GNU traceroute"
+HOMEPAGE = "http://traceroute.sourceforge.net"
+SECTION = "network"
+LICENSE = "GPLv2"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute-${PV}.tar.gz;name=traceroute"
+
+SRC_URI[traceroute.md5sum] = "2262a9d30ae85f12b759a38ef827f8f7"
+SRC_URI[traceroute.sha256sum] = "d9609699982ac500cf361a34bd0685a1e5d71d001b6087e4eb68236048ff078f"
+
+do_compile() {
+	rm -rf ${S}/patches
+	export LDFLAGS="${TARGET_LDFLAGS} -L${S}/libsupp"
+	oe_runmake "env=yes"
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 755 ${S}/traceroute/traceroute ${D}${bindir}
+	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${PN}
+}
+
+pkg_postinst() {
+	update-alternatives --install ${bindir}/traceroute traceroute ${bindir}/traceroute.${PN} 100
+	update-alternatives --install ${bindir}/traceroute6 traceroute6 ${bindir}/traceroute.${PN} 100
+}
+
+pkg_postrm() {
+	update-alternatives --remove traceroute ${bindir}/traceroute.${PN}
+	update-alternatives --remove traceroute6 ${bindir}/traceroute.${PN}
+}


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


