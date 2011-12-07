Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RYE3P-0005l7-2o
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 10:44:43 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB79bnE6022668
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Dec 2011 10:37:54 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 7 Dec 2011 10:37:49 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] libpam_1.1.1: remove directory preventing /var/run
	from being volatile
Thread-Index: Acy0w0B26OdOmEKpQIGJ4GsOHCYL5A==
Date: Wed, 7 Dec 2011 09:37:48 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A5055@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] libpam_1.1.1: remove directory preventing /var/run from being volatile
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
X-List-Received-Date: Wed, 07 Dec 2011 09:44:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The libpam make install creates a /var/run/sepermit folder that prevents
the later creation of a sym-link /var/run --> /var/volatile/run. This is
a problem because it causes additional wear to FLASH file systems.

The solution is ~equivalent to the solution applied in libpam recipes of
oe-core but v1.1.1 does not exist there and the corresponding fix was a
part of the original recipes for later versions.

Signed-off-by: Mats K=E4rrman <mats.karrman@tritech.se>

------

diff --git a/recipes/pam/files/05_libpam b/recipes/pam/files/05_libpam
new file mode 100644
index 0000000..5ae0c8e
--- /dev/null
+++ b/recipes/pam/files/05_libpam
@@ -0,0 +1,3 @@
+# Create sepermit folder in volatile fs
+d root root 0755 /var/run/sepermit none
+
diff --git a/recipes/pam/libpam_1.1.1.bb b/recipes/pam/libpam_1.1.1.bb
index 09bc554..ba35d0c 100644
--- a/recipes/pam/libpam_1.1.1.bb
+++ b/recipes/pam/libpam_1.1.1.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "flex flex-native"
 # PAM is not a lot of use without configuration files and the plugins
 RRECOMMENDS_${PN} =3D "libpam-meta libpam-base-files"

-PR =3D "r2"
+PR =3D "r3"

 # The project is actually called Linux-PAM but that gives
 # a bad OE package name because of the upper case characters
@@ -26,6 +26,7 @@ S =3D "${WORKDIR}/${p}"
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/${p}.tar.bz2 \
            file://pam-nodocs.patch \
            file://define-HAVE_DBM.patch \
+           file://05_libpam \
           "

 UCLIBC_PATCHES =3D " file://Linux-PAM-1.1.0-uclibc.patch \
@@ -71,6 +72,17 @@ python populate_packages_prepend () {
        packages.append(metapkg)
        bb.data.setVar('PACKAGES', ' '.join(packages), d)
 }
+
+do_install_append () {
+    # Remove erroneously created /var/run dir
+    rm -rf ${D}${localstatedir}/run
+
+    # Install volatiles specification to make sure dir is created in run-t=
ime
+    install -d ${D}${sysconfdir}/default
+    install -d ${D}${sysconfdir}/default/volatiles
+    install -m 0644  ${WORKDIR}/05_libpam  ${D}${sysconfdir}/default/volat=
iles/
+}
+
 SRC_URI[md5sum] =3D "9b3d952b173d5b9836cbc7e8de108bee"
 SRC_URI[sha256sum] =3D "608d3eb9d7a5e1a7505fff62e6a583fdb6e52dc05bf54dc966=
1c5f395



