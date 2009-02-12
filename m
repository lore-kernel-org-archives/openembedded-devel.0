Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXlJl-0004te-Gi
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 00:50:06 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 3165C4025B;
	Thu, 12 Feb 2009 19:49:01 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id B199C740D9;
	Thu, 12 Feb 2009 21:48:58 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id D56046101F6; Thu, 12 Feb 2009 21:48:45 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
	<gn1m9a$5tl$5@ger.gmane.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 21:48:45 -0200
In-Reply-To: <gn1m9a$5tl$5@ger.gmane.org> (Koen Kooi's message of "Thu, 12 Feb
	2009 18:29:13 +0100")
Message-ID: <87y6wbmd2a.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 5/6] sun-jre6: add 1.6.0.10
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
X-List-Received-Date: Thu, 12 Feb 2009 23:50:09 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 12-02-09 17:38, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>> ---
>
> NACK:
>
>> +PACKAGES =+ "${PN}-plugin"
>> +
>> +FILES_${PN} = "/usr/"
>> +FILES_${PN}-dbg += "/usr/*/.debug /usr/*/*/.debug /usr/*/*/*/.debug /usr/*/*/*/*/.debug /usr/*/*/*/*/*/.debug"
>> +FILES_${PN}-plugin = "${libdir}/firefox-3.0.1/plugins/* ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so"
>
> it would be better to install the plugin to /usr/lib/mozilla/plugins
> and have a postinst that symlinks it to ${libdir}/firefox-*,
> ${libdir}/fennec-*, ${libdir}/iceweasle when those are present. That
> way other browser implement NPAPI (webkit...) can use the one in
> mozilla/plugins.

I've not added the symbolic links since it is quite easy to make firefox
to use that dir. In fact, it has already been done at
d09c754ec52a3f09f1cad6a34d12b9ef7283bc17 and can be done for others I
think.

I've fixed the style issues and the plugin installation as you've
spot. Please check and ack if it is all OK.



-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=0005-sun-jre6-add-1.6.0.10.patch

From 3fe02f9bc58405b518731064ad7fbe82d0bb0f1b Mon Sep 17 00:00:00 2001
From: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 10 Feb 2009 15:53:16 -0200
Subject: [PATCH 5/6] sun-jre6: add 1.6.0.10

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 packages/sun-jre/sun-jre6_1.6.0.10.bb |   71 +++++++++++++++++++++++++++++++++
 1 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 packages/sun-jre/sun-jre6_1.6.0.10.bb

diff --git a/packages/sun-jre/sun-jre6_1.6.0.10.bb b/packages/sun-jre/sun-jre6_1.6.0.10.bb
new file mode 100644
index 0000000..f67894c
--- /dev/null
+++ b/packages/sun-jre/sun-jre6_1.6.0.10.bb
@@ -0,0 +1,71 @@
+DESCRIPTION = "Sun J2SE Runtime Environment"
+LICENSE = "Sun Binary Code License Agreement"
+RDEPENDS_${PN} += "libx11-locale"
+RDEPENDS_${PN}-plugin += "${PN}"
+PR = "r1"
+PRIVATE_LIBS = "${@base_read_file('${WORKDIR}/${SD}.shlibs')}"
+
+SRC_URI = "http://download.java.net/dlj/binaries/jdk-6u10-dlj-linux-i586.bin"
+
+SP = "jdk-6u10-dlj-linux-i586.bin"
+SD = "jdk1.6.0_10"
+S = "${WORKDIR}"
+
+do_install() {
+    export MORE=10000
+    sh ${WORKDIR}/${SP} --accept-license >/dev/null
+    chmod -R go=u-w ${SD}
+    chmod -R u+w ${SD}
+    mkdir -p ${D}${libdir}/sun-java6-${PV}
+    mv ${S}/${SD}/jre/* ${D}${libdir}/sun-java6-${PV}
+    mkdir -p ${D}${libdir}/mozilla/plugins
+    cd ${D}${libdir}/mozilla/plugins
+    ln -s ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so .
+    cd ${D}${libdir}/sun-java6-${PV}
+    for p in `find . -name '*.pack'`; do
+    ./bin/unpack200 $p $(echo $p | sed 's,.pack$,.jar,g') || exit 1
+    rm $p
+    done
+    for i in bin/ControlPanel \
+             bin/javaws       \
+             bin/jcontrol     \
+             bin/keytool      \
+             bin/orbd         \
+             bin/pack200      \
+             bin/policytool   \
+             bin/rmid         \
+             bin/rmiregistry  \
+             bin/servertool   \
+             bin/tnameserv    \
+             bin/unpack200
+    do
+    rm $i
+    done
+    rm -rf javaws lib/javaws*
+    rm -rf plugin/desktop plugin/i386/ns7-gcc29
+    rm -f lib/fontconfig.*.bfc lib/fontconfig.*.properties.src
+    rm -f lib/javaws.jar lib/ext/ldapsec.jar lib/cmm/PYCC.pf \
+        lib/audio/soundbank.gm
+    rm -rf lib/i386/server lib/i386/motif21 lib/i386/client/classes.jsa \
+        lib/i386/libjavaplugin_nscp_gcc29.so \
+        lib/i386/headless
+    rm -rf fonts oblique-fonts man
+    rm -rf lib/locale lib/zi lib/management
+    rm -rf lib/desktop LICENSE README COPYRIGHT THIRDPARTYLICENSEREADME.txt \
+        Welcome.html
+    # Find out what shared libs we contain and spit it out to a file
+    find . -name "*.so" -exec basename {} \; | sort | uniq > ${WORKDIR}/${SD}.shlibs
+}
+
+PACKAGES =+ "${PN}-plugin"
+FILES_${PN} = "/usr/"
+FILES_${PN}-dbg += "/usr/*/.debug /usr/*/*/.debug /usr/*/*/*/.debug /usr/*/*/*/*/.debug /usr/*/*/*/*/*/.debug"
+FILES_${PN}-plugin = "${libdir}/mozilla/plugins/* ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so"
+
+pkg_postinst_${PN} () {
+                grep -v JAVA_HOME /etc/environment > /etc/environment.new
+                mv /etc/environment.new /etc/environment
+                echo "JAVA_HOME=\"${libdir}/sun-java6-${PV}\"" >> /etc/environment
+}
+
+COMPATIBLE_HOST = "i.86.*-linux"
-- 
1.6.2.rc0


--=-=-=--
