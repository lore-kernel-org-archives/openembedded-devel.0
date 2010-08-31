Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OqMlI-0001L0-1B
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 11:04:31 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OqMka-0001Az-OY from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 02:03:28 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 31 Aug 2010 11:03:26 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5042F10F6@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1283245084-32023-1-git-send-email-noor_ahsan@mentor.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH] tcl: Run oe-stylize.py script and modify the recipe
	accordingly
Thread-Index: ActI6rSh2PwhM7+pS+SGQBi7Om4aZwAAKMEg
References: <1283245084-32023-1-git-send-email-noor_ahsan@mentor.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tcl: Run oe-stylize.py script and modify the recipe accordingly
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
X-List-Received-Date: Tue, 31 Aug 2010 09:04:39 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.

-----Original Message-----
From: Ahsan, Noor=20
Sent: Tuesday, August 31, 2010 1:58 PM
To: openembedded-devel@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [PATCH] tcl: Run oe-stylize.py script and modify the recipe
accordingly

* Run the oe-stylize.py script on the recipe and modify the recipe
according to the output of the script.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/tcltk/tcl_8.5.8.bb |   45
++++++++++++++++++++-----------------------
 1 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
index 9d030b9..e07815e 100644
--- a/recipes/tcltk/tcl_8.5.8.bb
+++ b/recipes/tcltk/tcl_8.5.8.bb
@@ -1,8 +1,7 @@
 DESCRIPTION =3D "Tool Command Language"
-LICENSE =3D "tcl"
-SECTION =3D "devel/tcltk"
 HOMEPAGE =3D "http://tcl.sourceforge.net"
-
+SECTION =3D "devel/tcltk"
+LICENSE =3D "tcl"
 PR =3D "r7"
=20
 SRC_URI =3D "\
@@ -16,43 +15,41 @@ SRC_URI =3D "\
   file://tclprivate.diff;striplevel=3D2 \
   file://mips-tclstrtod.patch;striplevel=3D0 \
 "
-
 SRC_URI[md5sum] =3D "7f123e53b3daaaba2478d3af5a0752e3"
 SRC_URI[sha256sum] =3D
"6b090c1024038d0381e1ccfbd6d5c0f0e6ef205269ceb9d28bd7bd7ac5bbf4a7"
=20
 S =3D "${WORKDIR}/tcl${PV}/unix"
+SYSROOT_PREPROCESS_FUNCS =3D+ "tcl_sysroot"
=20
 inherit autotools binconfig
=20
 EXTRA_OECONF =3D "--enable-threads"
=20
 do_compile_prepend() {
-	echo > ../compat/fixstrtod.c
-	sed -i -e 's:./tclsh :tclsh :g' Makefile
+        echo > ../compat/fixstrtod.c
+        sed -i -e 's:./tclsh :tclsh :g' Makefile
 }
-
-BINCONFIG_GLOB =3D "*Config.sh"
-
 do_install() {
-	autotools_do_install
-	# Stage a few extra headers to make tk happy
-	install -d ${D}${includedir}/tcl-${PV}/generic
-	install -m 0644 ../generic/*.h
${D}${includedir}/tcl-${PV}/generic
-	install -m 0644 *.h ${D}${includedir}/tcl-${PV}/generic
-	install -d ${D}${includedir}/tcl-${PV}/unix
-	install -m 0644 *Unix*.h ${D}${includedir}/tcl-${PV}/unix/
-	rm -f ${D}${includedir}/regex.h
-	ln -sf tclsh8.5 ${D}${bindir}/tclsh
-}
-
-SYSROOT_PREPROCESS_FUNCS =3D+ "tcl_sysroot"
-
-tcl_sysroot() {
-	sed -i 's:/usr/include/tcl-private:${STAGING_INCDIR}/tcl-${PV}:'
tclConfig.sh
+        autotools_do_install
+        # Stage a few extra headers to make tk happy
+        install -d ${D}${includedir}/tcl-${PV}/generic
+        install -m 0644 ../generic/*.h
${D}${includedir}/tcl-${PV}/generic
+        install -m 0644 *.h ${D}${includedir}/tcl-${PV}/generic
+        install -d ${D}${includedir}/tcl-${PV}/unix
+        install -m 0644 *Unix*.h ${D}${includedir}/tcl-${PV}/unix/
+        rm -f ${D}${includedir}/regex.h
+        ln -sf tclsh8.5 ${D}${bindir}/tclsh
 }
=20
 PACKAGES =3D+ "${PN}-lib"
+
 FILES_${PN}-lib =3D "${libdir}/libtcl8.5.so.*"
 FILES_${PN} +=3D "${libdir}/tcl*"
 FILES_${PN}-dev +=3D "${libdir}/tclConfig.sh"
=20
+BINCONFIG_GLOB =3D "*Config.sh"
+
+tcl_sysroot() {
+        sed -i
's:${includedir}/tcl-private:${STAGING_INCDIR}/tcl-${PV}:' tclConfig.sh
+}
+
--=20
1.6.3.3



