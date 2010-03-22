Received: from exprod5og106.obsmtp.com ([64.18.0.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte88-0000ic-GL
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:41:09 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob106.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c6dSj7VcnNKygaseCcD59hWQYzoc/j@postini.com;
	Mon, 22 Mar 2010 02:37:59 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:41 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:41 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:56 +0000
Message-ID: <20100322093556.27540.20043.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.182
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 12/12] Add ubuntu verison of ifupdown
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
X-List-Received-Date: Mon, 22 Mar 2010 09:41:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

We need some of the features in the ubuntu version of ifupdown, rather than
the version found in Debian.
---

 recipes/ifupdown/ifupdown-ubuntu-0.6.8/init |   15 +++++++++
 recipes/ifupdown/ifupdown-ubuntu_0.6.8.bb   |   45 +++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/recipes/ifupdown/ifupdown-ubuntu-0.6.8/init b/recipes/ifupdown/ifupdown-ubuntu-0.6.8/init
new file mode 100644
index 0000000..fa415e5
--- /dev/null
+++ b/recipes/ifupdown/ifupdown-ubuntu-0.6.8/init
@@ -0,0 +1,15 @@
+#!/bin/sh -e
+
+case "$1" in
+	start|restart)
+		#create the network directory in the volatile /var directory
+		mkdir -p /var/run/network
+		if [ -e /var/run/network/ifstate ]; then
+			echo -n "Cleaning: /var/run/network/ifstate"
+			echo -n >/var/run/network/ifstate
+			echo "."
+		fi
+		;;
+	stop|reload|force-reload)
+		;;
+esac
diff --git a/recipes/ifupdown/ifupdown-ubuntu_0.6.8.bb b/recipes/ifupdown/ifupdown-ubuntu_0.6.8.bb
new file mode 100644
index 0000000..3c8de81
--- /dev/null
+++ b/recipes/ifupdown/ifupdown-ubuntu_0.6.8.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "High level tools to configure network interfaces \
+This package provides the tools ifup and ifdown which may be used to \
+configure (or, respectively, deconfigure) network interfaces, based on \
+the file /etc/network/interfaces."
+LICENSE = "GPL"
+
+SECTION = "base"
+
+PROVIDES = "ifupdown"
+
+PR = "r2"
+
+inherit update-rc.d
+
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/i/ifupdown/ifupdown_0.6.8ubuntu19.tar.gz;name=ifupdown \
+	file://init"
+
+SRC_URI[ifupdown.md5sum] = "9c4533a289bd55316a9981b1fe41fad4"
+SRC_URI[ifupdown.sha256sum] = "4c86cc0534061896c1f825766a29fe5282607123b8978b623f5c6f1fa5458b4d"
+
+EXTRA_OEMAKE = ""
+
+S = "${WORKDIR}/ifupdown-${PV}ubuntu15"
+
+do_compile () {
+	chmod a+rx *.pl *.sh
+	oe_runmake 'CC=${CC}' "CFLAGS=${CFLAGS} -Wall -W -D'IFUPDOWN_VERSION=\"${PV}\"'"
+}
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d \
+		   ${D}${sysconfdir}/network \
+		   ${D}${mandir}/man8 \
+		   ${D}${mandir}/man5 \
+		   ${D}${base_sbindir}
+	install -m 0755 ifup ${D}${base_sbindir}/
+	ln ${D}${base_sbindir}/ifup ${D}${base_sbindir}/ifdown
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ifup
+	install -m 0644 ifup.8 ${D}${mandir}/man8
+	install -m 0644 interfaces.5 ${D}${mandir}/man5
+	cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
+}
+INITSCRIPT_NAME = "ifup"
+INITSCRIPT_PARAMS = "start 39 S . stop 39 0 6 1 ."
+


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


