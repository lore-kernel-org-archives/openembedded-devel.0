Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RYFFn-000884-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 12:01:35 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB7Asf93022940
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Dec 2011 11:54:46 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 7 Dec 2011 11:54:41 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2] libpam_1.1.1: remove directory preventing /var/run
	from being volatile
Thread-Index: AQHMtMl6wYuMbGz5zUyhykPIyCIJeg==
Date: Wed, 7 Dec 2011 10:54:40 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A508F@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: [PATCH v2] libpam_1.1.1: remove directory preventing /var/run from being volatile
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
X-List-Received-Date: Wed, 07 Dec 2011 11:01:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

New version with less differences to oe-core. Honestly I have not been able=
 to test this version but I have reviewed it and think it is equivalent to =
the patch I had before. // Mats=0A=
=0A=
=0A=
The libpam make install creates a /var/run/sepermit folder that prevents=0A=
the later creation of a sym-link /var/run --> /var/volatile/run. This is=0A=
a problem because it causes additional wear to FLASH file systems.=0A=
=0A=
The solution here is roughly the same as the solution applied in the libpam=
=0A=
recipes of oe-core but v1.1.1 does not exist there and the corresponding fi=
x=0A=
was already a part of the original recipes for later versions.=0A=
=0A=
Signed-off-by: Mats K=E4rrman <mats.karrman@tritech.se>=0A=
=0A=
------=0A=
=0A=
diff --git a/recipes/pam/files/99_libpam b/recipes/pam/files/99_libpam=0A=
new file mode 100644=0A=
index 0000000..5ae0c8e=0A=
--- /dev/null=0A=
+++ b/recipes/pam/files/99_libpam=0A=
@@ -0,0 +1,3 @@=0A=
+# Create sepermit folder in volatile fs=0A=
+d root root 0755 /var/run/sepermit none=0A=
+=0A=
diff --git a/recipes/pam/libpam_1.1.1.bb b/recipes/pam/libpam_1.1.1.bb=0A=
index 09bc554..2b679a1 100644=0A=
--- a/recipes/pam/libpam_1.1.1.bb=0A=
+++ b/recipes/pam/libpam_1.1.1.bb=0A=
@@ -15,7 +15,7 @@ DEPENDS =3D "flex flex-native"=0A=
 # PAM is not a lot of use without configuration files and the plugins=0A=
 RRECOMMENDS_${PN} =3D "libpam-meta libpam-base-files"=0A=
 =0A=
-PR =3D "r2"=0A=
+PR =3D "r3"=0A=
 =0A=
 # The project is actually called Linux-PAM but that gives=0A=
 # a bad OE package name because of the upper case characters=0A=
@@ -26,6 +26,7 @@ S =3D "${WORKDIR}/${p}"=0A=
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/${p}.tar.bz2 \=
=0A=
            file://pam-nodocs.patch \=0A=
            file://define-HAVE_DBM.patch \=0A=
+           file://99_libpam \=0A=
           "=0A=
 =0A=
 UCLIBC_PATCHES =3D " file://Linux-PAM-1.1.0-uclibc.patch \=0A=
@@ -71,6 +72,17 @@ python populate_packages_prepend () {=0A=
        packages.append(metapkg)=0A=
        bb.data.setVar('PACKAGES', ' '.join(packages), d)=0A=
 }=0A=
+=0A=
+do_install_append () {=0A=
+    # Remove erroneously created /var/run dir=0A=
+    rm -rf ${D}${localstatedir}/run=0A=
+=0A=
+    # Install volatiles specification to make sure dir is created in run-t=
ime=0A=
+    install -d ${D}${sysconfdir}/default=0A=
+    install -d ${D}${sysconfdir}/default/volatiles=0A=
+    install -m 0644  ${WORKDIR}/99_libpam  ${D}${sysconfdir}/default/volat=
iles/=0A=
+}=0A=
+=0A=
 SRC_URI[md5sum] =3D "9b3d952b173d5b9836cbc7e8de108bee"=0A=
 SRC_URI[sha256sum] =3D "608d3eb9d7a5e1a7505fff62e6a583fdb6e52dc05bf54dc966=
1c5f395=0A=
 =0A=


