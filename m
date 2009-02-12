Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@ossystems.com.br>) id 1LXebP-0008EP-VH
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:39:52 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id D8ED640394;
	Thu, 12 Feb 2009 12:38:49 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 62DB2740DF;
	Thu, 12 Feb 2009 14:38:48 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CA032610132; Thu, 12 Feb 2009 14:38:35 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:38:34 -0200
Message-Id: <1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.rc0
In-Reply-To: <1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/6] sun-jre6: add 1.6.0.10
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
X-List-Received-Date: Thu, 12 Feb 2009 16:39:52 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 packages/sun-jre/sun-jre6_1.6.0.10.bb |   89 +++++++++++++++++++++++++++++++++
 1 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 packages/sun-jre/sun-jre6_1.6.0.10.bb

diff --git a/packages/sun-jre/sun-jre6_1.6.0.10.bb b/packages/sun-jre/sun-jre6_1.6.0.10.bb
new file mode 100644
index 0000000..d72cfa0
--- /dev/null
+++ b/packages/sun-jre/sun-jre6_1.6.0.10.bb
@@ -0,0 +1,89 @@
+
+DESCRIPTION = "Sun J2SE Runtime Environment"
+
+PR="r0"
+
+LICENSE = "Sun Binary Code License Agreement"
+
+SP = "jdk-6u10-dlj-linux-i586.bin"
+SD = "jdk1.6.0_10"
+S = ${WORKDIR}
+
+SRC_URI = "http://download.java.net/dlj/binaries/jdk-6u10-dlj-linux-i586.bin"
+
+PRIVATE_LIBS = "${@base_read_file('${WORKDIR}/${SD}.shlibs')}"
+
+do_install() {
+	export MORE=10000
+	sh ${WORKDIR}/${SP} --accept-license >/dev/null
+	chmod -R go=u-w ${SD}
+	chmod -R u+w ${SD}
+
+	mkdir -p ${D}${libdir}/sun-java6-${PV}
+	mv ${S}/${SD}/jre/* ${D}${libdir}/sun-java6-${PV}
+
+	mkdir -p ${D}${libdir}/mozilla/plugins
+	cd ${D}${libdir}/mozilla/plugins
+	ln -s ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so .
+
+	cd ${D}${libdir}/sun-java6-${PV}
+
+	for p in `find . -name '*.pack'`; do
+		./bin/unpack200 $p $(echo $p | sed 's,.pack$,.jar,g') || exit 1
+		rm $p
+	done
+
+	for i in	bin/ControlPanel	\
+			bin/javaws	\
+			bin/jcontrol	\
+			bin/keytool	\
+			bin/orbd	\
+			bin/pack200	\
+			bin/policytool	\
+			bin/rmid	\
+			bin/rmiregistry	\
+			bin/servertool	\
+			bin/tnameserv	\
+			bin/unpack200
+	do
+		rm $i
+	done
+
+	rm -rf javaws lib/javaws*
+
+	rm -rf plugin/desktop plugin/i386/ns7-gcc29
+
+	rm -f lib/fontconfig.*.bfc lib/fontconfig.*.properties.src
+
+	rm -f lib/javaws.jar lib/ext/ldapsec.jar lib/cmm/PYCC.pf \
+		lib/audio/soundbank.gm
+
+	rm -rf lib/i386/server lib/i386/motif21 lib/i386/client/classes.jsa \
+		lib/i386/libjavaplugin_nscp_gcc29.so \
+		lib/i386/headless
+
+	rm -rf fonts oblique-fonts man
+
+	rm -rf lib/locale lib/zi lib/management
+	rm -rf lib/desktop LICENSE README COPYRIGHT THIRDPARTYLICENSEREADME.txt \
+	    Welcome.html
+
+	# Find out what shared libs we contain and spit it out to a file
+	find . -name "*.so" -exec basename {} \; | sort | uniq \
+						> ${WORKDIR}/${SD}.shlibs
+}
+
+PACKAGES =+ "${PN}-plugin"
+
+FILES_${PN} = "/usr/"
+FILES_${PN}-dbg += "/usr/*/.debug /usr/*/*/.debug /usr/*/*/*/.debug /usr/*/*/*/*/.debug /usr/*/*/*/*/*/.debug"
+FILES_${PN}-plugin = "${libdir}/firefox-3.0.1/plugins/* ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so"
+
+RDEPENDS_${PN} += "libx11-locale"
+RDEPENDS_${PN}-plugin += "${PN}"
+
+pkg_postinst_${PN} () {
+	grep -v JAVA_HOME /etc/environment > /etc/environment.new
+	mv /etc/environment.new /etc/environment
+	echo "JAVA_HOME=\"${libdir}/sun-java6-${PV}\"" >> /etc/environment
+}
-- 
1.6.2.rc0



