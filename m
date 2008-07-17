Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KJP5Z-00061o-GL
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jul 2008 10:43:50 +0200
Received: by rv-out-0708.google.com with SMTP id f25so6803243rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2008 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:openpgp:content-type;
	bh=siqlzw0UGXsKuSaHPpBzskzwdbb8uRvnYxkdjiksp8s=;
	b=USFT+n0WyFdoUEWRWJ+VKBvxagbsoE6flHlMmnJOu/1FKzNJ/jqxA7j+5jrQgtEoOR
	9muvf6UIqKM+tXaJFAu0NAvr3Yu4Oj9K/PVVgIxf4o2t1NzcwkrZHaAe5gcMJ3uPPUFQ
	2U9Jzp1QxHaVQY3gvQhLKc06d8MDUYlSRBy9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:openpgp:content-type;
	b=ODmKW/LRLypSyoJoFmwbCbeVdk2rnEIqvqDQr1bxyX6VXfUkWwtr+aIRppPs0qu5y3
	mvgIw9TAPvLmJ9vex1aYCbid9erHrUG4QhSgoYf+/3XL0x5BaNsroDuvL5xi4ALl20BY
	wDJtuoBJi4Q5WWuATJEKEpkVVpEFGpSLb02fs=
Received: by 10.141.114.19 with SMTP id r19mr1025546rvm.146.1216284185194;
	Thu, 17 Jul 2008 01:43:05 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id g31sm15737187rvb.2.2008.07.17.01.43.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 17 Jul 2008 01:43:04 -0700 (PDT)
Message-ID: <487F0615.1070801@gmail.com>
Date: Thu, 17 Jul 2008 01:43:01 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
In-Reply-To: <c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
X-Enigmail-Version: 0.95.0
OpenPGP: id=A57A7A6E;
	url=pool.sks-keyservers.net
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 17 Jul 2008 08:43:50 -0000
Content-Type: multipart/mixed; boundary="------------040702040104080005090105"

--------------040702040104080005090105
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg wrote:
> Khem,
> 
> On Wed, Jul 16, 2008 at 10:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> I have not tested it on older compiler/library combinations but I think
>>> it will work there too as I have build various combinations in the past
>>> with same sequence outside OE.
>>>
>>> Comments and feedback is welcome.
>>>
> 
> I will try some combinations over the next few days.
> 
> anyone: This would be a perfect candidate for some good testing
> outside of .dev, what would be the best approach for that currently
> besides the posted patch?
> 
> Excellent work by the way!
> 
> Regards,


while testing I figured out that I did not add PREFERRED_VERSION for new recipe gcc-cross-intermediate
This updated patch is doing so. 

Do we need to have glibc 2.3.x base tested is someone using it ? same question for gcc 3.3.x

Thanks

- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIfwYUHnJKy6V6em4RAioMAKCwa4q50tYZDrXuHrslv41WZv+ttQCgl5+M
VEvqhmG4jSGoK9RIVhLd5Fs=
=gEdv
-----END PGP SIGNATURE-----
#
# old_revision [7c35ba48773d0fc91a71187282272fd30fc3be0e]
#
# delete "packages/eglibc/eglibc-intermediate.inc"
# 
# delete "packages/eglibc/eglibc-intermediate_svn.bb"
# 
# delete "packages/glibc/glibc-intermediate.inc"
# 
# delete "packages/glibc/glibc-intermediate_2.3.2+cvs20040726.bb"
# 
# delete "packages/glibc/glibc-intermediate_2.3.6.bb"
# 
# delete "packages/glibc/glibc-intermediate_2.4.bb"
# 
# delete "packages/glibc/glibc-intermediate_2.5.bb"
# 
# delete "packages/glibc/glibc-intermediate_2.6.1.bb"
# 
# delete "packages/glibc/glibc-intermediate_2.7.bb"
# 
# delete "packages/glibc/glibc-intermediate_cvs.bb"
# 
# add_file "packages/gcc/gcc-cross-intermediate.inc"
#  content [4b265f0f3a4cb31194b9db1bdbf28b9290477fbe]
# 
# add_file "packages/gcc/gcc-cross-intermediate_3.3.3.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
# 
# add_file "packages/gcc/gcc-cross-intermediate_3.3.4.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
# 
# add_file "packages/gcc/gcc-cross-intermediate_3.4.3.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
# 
# add_file "packages/gcc/gcc-cross-intermediate_3.4.4.bb"
#  content [65e5d97bbf12d5db9a90b7522e39e7911d577562]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.0.2.bb"
#  content [d6632d3d523fcb2d4e71bab2c5a7effd7c819ba5]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.1.0.bb"
#  content [211f0593c75ca9fb9078df3e4a57d18d80e1385f]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.1.1.bb"
#  content [3fc0ba21af09070a730a4b3e0b726ee8918c8f65]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.1.2.bb"
#  content [211f0593c75ca9fb9078df3e4a57d18d80e1385f]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.2.1.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.2.2.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.2.3.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.2.4.bb"
#  content [90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4]
# 
# add_file "packages/gcc/gcc-cross-intermediate_4.3.1.bb"
#  content [30ce0ad3e7c44f2ebfbeb6ee12d62890fbc34086]
# 
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2005q3.bb"
#  content [bdfa3b2a9bb38d911fcba484a8f6a57ab9c6a6d8]
# 
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2006q1.bb"
#  content [7ca0df097d7377b3d3e86f9ab60edc17327fc874]
# 
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb"
#  content [b41165d11071d72ef03ff2bb5742b410f82555ab]
# 
# add_file "packages/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb"
#  content [b41165d11071d72ef03ff2bb5742b410f82555ab]
# 
# add_file "packages/glibc/glibc-2.3.6/glibc-2.3.6-linuxthreads-pthread-raise.patch"
#  content [1233a371e51da2cb27c42ec18bc33f11a9288f28]
# 
# add_file "packages/glibc/glibc-2.3.6/glibc-arm-socket-weakalias.patch"
#  content [3cb1771cb1ffb55fd118435cae54bade8a5c7d4e]
# 
# add_file "packages/glibc/glibc-2.3.6/glibc-rtld-libcc-eh.patch"
#  content [f31f3425ae1f8afcb869cd8e0f3c414d01aa211f]
# 
# patch "conf/distro/angstrom-2008.1.conf"
#  from [f64ebcf55e85b504d3be169befac3c7981aa74d9]
#    to [36506d6829c3a09fa715f64051654c4cb2856058]
# 
# patch "conf/distro/celinux-test.conf"
#  from [beca92fe305476a03cc17be4ecf3f9b8a0b134c9]
#    to [66a80241ae6781107ec011f3678266b510545e62]
# 
# patch "conf/distro/chinook-compat.conf"
#  from [61ddfe57a63bdd965dd857bd75478e87045007b9]
#    to [9971a4fa7bfe8235c9a5bf7d2ce134318f664a83]
# 
# patch "conf/distro/gmustix.conf"
#  from [88db2db3032412eac284ef6efa7a4668c79a29b2]
#    to [e5a0ed1602a23b5cbddbee1a07669efa041cd191]
# 
# patch "conf/distro/include/angstrom-2007-for-openmoko.inc"
#  from [4e926bdf5178cce4d068eeb210aba5adf7982351]
#    to [85b9d88526b7e40205f13f547c01c721f42fa32f]
# 
# patch "conf/distro/include/angstrom-eglibc.inc"
#  from [e0e7b6758775be96c0a58faecff645b05ef7c3e2]
#    to [e56df3f5a1f620f0dfa7795ff188661bf1524389]
# 
# patch "conf/distro/include/angstrom-glibc.inc"
#  from [64060b7ace4591e34cd8206bb5cd3ba77c6554d4]
#    to [9a81308293772bcff0ea1b412e0fa3a478a205fe]
# 
# patch "conf/distro/include/insane-srcrevs.inc"
#  from [e685e3b620d54ebf0b096e4709ed95ca3329b08c]
#    to [cbc144484de6ac4d699d0a609a011f4f1f04d2bf]
# 
# patch "conf/distro/include/sane-srcrevs.inc"
#  from [5f05375f9120704a658384ef343ef7df97d3b957]
#    to [3cfde3a808acdb6517d4809c29137d90eb6aef0d]
# 
# patch "conf/distro/include/slugos.inc"
#  from [00976339770c45e02a1ecc25cf9066a2c866eeea]
#    to [ec4b375dd7947ce73c6b009e68b5fb78d4eda73d]
# 
# patch "conf/distro/jlime-donkey.conf"
#  from [50f90b05f62918f1b8efc4d5f311a7d80b424ad9]
#    to [0ba2c9149b03723a7ad76f726d714e348f50b4f0]
# 
# patch "conf/distro/jlime-henchman.conf"
#  from [c5c0029ec6fcea5daaf00874e1a20e1d514d7586]
#    to [83e1df21fb0bbdb8a99da48da0d861cd242a76e9]
# 
# patch "conf/distro/jlime-mongo.conf"
#  from [649596799adddbe974beb9a95120de0c9db17b28]
#    to [9c88e0c767f986ce13c59b2e9173c7b88ebb935e]
# 
# patch "conf/distro/jlime-shrek.conf"
#  from [4aa79fa3f008b3d4c92169d9af94ffa1dc1e8491]
#    to [4960e4997a76b212b2bda2ec3ddab16d81622075]
# 
# patch "conf/distro/mamona.conf"
#  from [fd683d8ddd62359322234b247211b416f546a004]
#    to [2259bb76e74ceface351ef6266ee9f3284c8e414]
# 
# patch "conf/distro/minimal.conf"
#  from [bd599ccea87a555d1025fc9d422556bb405c21d9]
#    to [0528532430720923ec9c329e2c7eba81fb2a6072]
# 
# patch "conf/distro/nylon.conf"
#  from [55b55fd58b093f18dc69ad389287e77c548403ae]
#    to [93b37b27f5a8b665966cdcd8b90187ec5428f2bc]
# 
# patch "conf/distro/openprotium.conf"
#  from [c91df50d1b1b24f6a52eba1264c1e195813952dd]
#    to [191b4f511b2b4e2ded2075e527d6e87588dbf292]
# 
# patch "conf/distro/oplinux-uclibc.conf"
#  from [ded77d3149a141de656d62e5c1ed7e161f1e500d]
#    to [af3019dae5fb6717311d042ac2f3114f99cdd50e]
# 
# patch "conf/distro/oplinux.conf"
#  from [0dbc9a811a5f426f5d3e4ead5a20330b56e51e41]
#    to [007c319d5693215e75c73b455c5c76a0f2465501]
# 
# patch "conf/distro/sharprom-compatible.conf"
#  from [866d17894061cd031cda619513332fa012433fa3]
#    to [89b78178c717a75e6dc950636c6903fbfb6fb989]
# 
# patch "conf/distro/ucslugc.conf"
#  from [13de2c9a77700ae97b0f7a3dbb79971cb6451ca6]
#    to [bb32cc5c8cbf8d2446f2bf2eef140a2ccd04ee1d]
# 
# patch "conf/distro/unslung.conf"
#  from [0ef6d906a67568b77e1f68fc1ac5c65f65586c67]
#    to [a7d66feda58ef5de37cbaf33395cb0dd4e1e7586]
# 
# patch "conf/distro/wrt54oe.conf"
#  from [9d556281a94a6474ec9b7e6edffabcecd876b083]
#    to [511263e0f8d97edcbcab96283a7c703b27f7072b]
# 
# patch "conf/local.conf.sample"
#  from [fa7f5ad0f812c943367b2c88b4e4f7165797959d]
#    to [5164ed855456a3c58975fcfbad1c9da8dd8d60f2]
# 
# patch "conf/machine/native.conf"
#  from [9f73a28ea65b27265df3e4afa2107401f9463ead]
#    to [e4b8c17ba26581950b67bf9e306d9f1664c0741f]
# 
# patch "packages/eglibc/eglibc-initial.inc"
#  from [9cc9a816e903fd588bfe9b6529f690d24297a54b]
#    to [4b2b73384f3c8f940e42387057da88a76435f44c]
# 
# patch "packages/eglibc/eglibc.inc"
#  from [20ecb0b8894a6fa79214db154c8cd4e8458d7237]
#    to [eef22ba34145bef9522d66a4eb30da587ba3e6a2]
# 
# patch "packages/glibc/glibc-initial.inc"
#  from [0480105971d23c66b379db96774c07f2a0913989]
#    to [b63bfe7eb2b35475f853b3d412838a369830b95d]
# 
# patch "packages/glibc/glibc.inc"
#  from [94a32473f1193137d45da97d6ed786ae9e755094]
#    to [d7da3e08d193524257645bad4468dbb3dd7ed044]
# 
# patch "packages/glibc/glibc_2.3.6.bb"
#  from [a180c138b01077df8b234264ee6abd46cbf72314]
#    to [582c26ae42b610a56928589814381bd13bc4c5de]
# 
# patch "packages/meta/external-toolchain.bb"
#  from [ebcd8679c393d51824573b5a70c7a071f8521117]
#    to [fe769763ba169fd561e2c5f1153726281afa9952]
# 
# patch "packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb"
#  from [63c582236d5e631780a864456ba4db4862602a0e]
#    to [8e92e1882cb3bc63515abe5cc42b6577706e118d]
# 
# patch "packages/uclibc/uclibc-initial_0.9.26.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [a184826f227450c3799472708b38d95c759f1457]
# 
# patch "packages/uclibc/uclibc-initial_0.9.27.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [bf5a03c0a95f607474c7585a1cdaec562bbb1747]
# 
# patch "packages/uclibc/uclibc-initial_0.9.28.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [bf5a03c0a95f607474c7585a1cdaec562bbb1747]
# 
# patch "packages/uclibc/uclibc-initial_0.9.29.bb"
#  from [d9cf01fb4dec69ff1f796d39c9078030982eacca]
#    to [af0ccde83d59f1948f1f2b5f7d4952d4855c58bc]
# 
# patch "packages/uclibc/uclibc-initial_svn.bb"
#  from [2715cc791b3fdd1b8e62328291e3ef33973bacc0]
#    to [766c264be7d787f2285f02b13a392f43cb2a87d2]
# 
# patch "packages/uclibc/uclibc.inc"
#  from [48b0ba2e4cff05071b3b812ef0be0861870cd00c]
#    to [4f97a9d058115dbb12ae1c5d047fb84965500a51]
#
============================================================
--- packages/gcc/gcc-cross-intermediate.inc	4b265f0f3a4cb31194b9db1bdbf28b9290477fbe
+++ packages/gcc/gcc-cross-intermediate.inc	4b265f0f3a4cb31194b9db1bdbf28b9290477fbe
@@ -0,0 +1,21 @@
+DEPENDS = "virtual/${TARGET_PREFIX}binutils"
+# @todo Please add comment on why this is (still?) needed?
+DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
+PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate"
+PACKAGES = ""
+
+# This is intended to be a -very- basic config
+# sysroot is needed in case we use libc-initial
+EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${layout_prefix} \
+		--enable-shared \
+		--disable-multilib \
+		--enable-languages=c \
+		--enable-target-optspace \
+		--program-prefix=${TARGET_PREFIX} \
+		--with-sysroot=${STAGING_DIR_TARGET} \
+		--with-build-sysroot=${STAGING_DIR_TARGET} \
+		${@get_gcc_fpu_setting(bb, d)}"
+
+do_install () {
+	:
+}
============================================================
--- packages/gcc/gcc-cross-intermediate_3.3.3.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.3.3.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
============================================================
--- packages/gcc/gcc-cross-intermediate_3.3.4.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.3.4.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
============================================================
--- packages/gcc/gcc-cross-intermediate_3.4.3.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.4.3.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
============================================================
--- packages/gcc/gcc-cross-intermediate_3.4.4.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
+++ packages/gcc/gcc-cross-intermediate_3.4.4.bb	65e5d97bbf12d5db9a90b7522e39e7911d577562
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
============================================================
--- packages/gcc/gcc-cross-intermediate_4.0.2.bb	d6632d3d523fcb2d4e71bab2c5a7effd7c819ba5
+++ packages/gcc/gcc-cross-intermediate_4.0.2.bb	d6632d3d523fcb2d4e71bab2c5a7effd7c819ba5
@@ -0,0 +1,4 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-multilib"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.1.0.bb	211f0593c75ca9fb9078df3e4a57d18d80e1385f
+++ packages/gcc/gcc-cross-intermediate_4.1.0.bb	211f0593c75ca9fb9078df3e4a57d18d80e1385f
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.1.1.bb	3fc0ba21af09070a730a4b3e0b726ee8918c8f65
+++ packages/gcc/gcc-cross-intermediate_4.1.1.bb	3fc0ba21af09070a730a4b3e0b726ee8918c8f65
@@ -0,0 +1,6 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap \
+		--disable-libunwind-exceptions \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.1.2.bb	211f0593c75ca9fb9078df3e4a57d18d80e1385f
+++ packages/gcc/gcc-cross-intermediate_4.1.2.bb	211f0593c75ca9fb9078df3e4a57d18d80e1385f
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.2.1.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.1.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.2.2.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.2.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.2.3.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.3.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.2.4.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
+++ packages/gcc/gcc-cross-intermediate_4.2.4.bb	90a8bfb6cf14f9e38af8a574b9b5fa9d55ccadd4
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap --disable-libgomp \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_4.3.1.bb	30ce0ad3e7c44f2ebfbeb6ee12d62890fbc34086
+++ packages/gcc/gcc-cross-intermediate_4.3.1.bb	30ce0ad3e7c44f2ebfbeb6ee12d62890fbc34086
@@ -0,0 +1,14 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+DEPENDS += "gmp-native mpfr-native"
+
+EXTRA_OECONF += " --disable-libmudflap \
+		  --disable-libgomp \
+		  --disable-libssp"
+
+# Hack till we fix *libc properly
+do_stage_append() {
+        ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
============================================================
--- packages/gcc/gcc-cross-intermediate_csl-arm-2005q3.bb	bdfa3b2a9bb38d911fcba484a8f6a57ab9c6a6d8
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2005q3.bb	bdfa3b2a9bb38d911fcba484a8f6a57ab9c6a6d8
@@ -0,0 +1,2 @@
+require gcc-cross_csl-arm-2005q3.bb
+require gcc-cross-intermediate.inc
============================================================
--- packages/gcc/gcc-cross-intermediate_csl-arm-2006q1.bb	7ca0df097d7377b3d3e86f9ab60edc17327fc874
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2006q1.bb	7ca0df097d7377b3d3e86f9ab60edc17327fc874
@@ -0,0 +1,7 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+S = "${WORKDIR}/gcc-2006q1"
+
+EXTRA_OECONF += "--disable-libmudflap \
+		--disable-libssp"
============================================================
--- packages/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb	b41165d11071d72ef03ff2bb5742b410f82555ab
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb	b41165d11071d72ef03ff2bb5742b410f82555ab
@@ -0,0 +1,12 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+S = "${WORKDIR}/gcc-4.2"
+
+EXTRA_OECONF += "--disable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap "
+
+# Hack till we fix *libc properly
+do_stage_append() {
+	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
============================================================
--- packages/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb	b41165d11071d72ef03ff2bb5742b410f82555ab
+++ packages/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb	b41165d11071d72ef03ff2bb5742b410f82555ab
@@ -0,0 +1,12 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+S = "${WORKDIR}/gcc-4.2"
+
+EXTRA_OECONF += "--disable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap "
+
+# Hack till we fix *libc properly
+do_stage_append() {
+	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
============================================================
--- packages/glibc/glibc-2.3.6/glibc-2.3.6-linuxthreads-pthread-raise.patch	1233a371e51da2cb27c42ec18bc33f11a9288f28
+++ packages/glibc/glibc-2.3.6/glibc-2.3.6-linuxthreads-pthread-raise.patch	1233a371e51da2cb27c42ec18bc33f11a9288f28
@@ -0,0 +1,37 @@
+--- glibc-2.3.6/linuxthreads/sysdeps/unix/sysv/linux/raise.c.org	2008-07-16 22:57:58.000000000 -0700
++++ glibc-2.3.6/linuxthreads/sysdeps/unix/sysv/linux/raise.c	2008-07-16 22:58:26.000000000 -0700
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 1991, 1996, 2002, 2003 Free Software Foundation, Inc.
++/* Copyright (C) 1991, 1996, 2002, 2003, 2005 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -18,10 +18,13 @@
+ 
+ #include <signal.h>
+ #include <unistd.h>
+-#include <bits/libc-lock.h>
+ 
+-#ifndef SHARED
++#ifndef IS_IN_rtld
++# include <bits/libc-lock.h>
++
++# ifndef SHARED
+ weak_extern (__pthread_raise)
++# endif
+ #endif
+ 
+ /* Raise the signal SIG.  */
+@@ -29,8 +32,12 @@ int
+ raise (sig)
+      int sig;
+ {
++#ifdef IS_IN_rtld
++  return __kill (__getpid (), sig);
++#else
+   return __libc_maybe_call2 (pthread_raise, (sig),
+ 			     __kill (__getpid (), sig));
++#endif
+ }
+ libc_hidden_def (raise)
+ weak_alias (raise, gsignal)
============================================================
--- packages/glibc/glibc-2.3.6/glibc-arm-socket-weakalias.patch	3cb1771cb1ffb55fd118435cae54bade8a5c7d4e
+++ packages/glibc/glibc-2.3.6/glibc-arm-socket-weakalias.patch	3cb1771cb1ffb55fd118435cae54bade8a5c7d4e
@@ -0,0 +1,45 @@
+This one was taken from debian.
+
+# DP: Description: Fix __bind redefinition problem
+# DP: Related bugs: 
+# DP: Dpatch author: Phil Blundell
+# DP: Patch author: Daniel Jacobowitz
+# DP: Upstream status: In CVS
+# DP: Status Details:
+# DP: Date: 2005-12-25
+
+Index: sysdeps/unix/sysv/linux/arm/socket.S
+===================================================================
+RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/arm/socket.S,v
+retrieving revision 1.12
+retrieving revision 1.13
+diff -u -r1.12 -r1.13
+--- glibc-2.3.6.ds1.orig/sysdeps/unix/sysv/linux/arm/socket.S	4 Dec 2004 21:20:16 -0000	1.12
++++ glibc-2.3.6.ds1/sysdeps/unix/sysv/linux/arm/socket.S	27 Oct 2005 18:50:12 -0000	1.13
+@@ -1,4 +1,6 @@
+-/* Copyright (C) 1995, 1996, 1997, 1998, 2003 Free Software Foundation, Inc.
++/* Copyright (C) 1995, 1996, 1997, 1998, 2003, 2004, 2005
++   Free Software Foundation, Inc.
++
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -32,7 +34,11 @@
+    The .S files for the other calls just #define socket and #include this.  */
+ 
+ #ifndef __socket
++#ifndef NO_WEAK_ALIAS
+ #define __socket P(__,socket)
++#else
++#define __socket socket
++#endif
+ #endif
+ 
+ #define PUSHARGS_1	str a1, [sp, $-4]!
+@@ -120,4 +126,6 @@
+ 
+ PSEUDO_END (__socket)
+ 
++#ifndef NO_WEAK_ALIAS
+ weak_alias (__socket, socket)
++#endif
============================================================
--- packages/glibc/glibc-2.3.6/glibc-rtld-libcc-eh.patch	f31f3425ae1f8afcb869cd8e0f3c414d01aa211f
+++ packages/glibc/glibc-2.3.6/glibc-rtld-libcc-eh.patch	f31f3425ae1f8afcb869cd8e0f3c414d01aa211f
@@ -0,0 +1,25 @@
+---
+ elf/Makefile |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: glibc-2.3.6/elf/Makefile
+===================================================================
+--- glibc-2.3.6.orig/elf/Makefile	2008-07-17 01:10:39.000000000 -0700
++++ glibc-2.3.6/elf/Makefile	2008-07-17 01:17:18.000000000 -0700
+@@ -279,7 +279,7 @@ $(objpfx)rtld-libc.a: $(objpfx)librtld.m
+ 	$(MAKE) -f $< -f rtld-Rules
+ 
+ $(objpfx)librtld.os: $(objpfx)dl-allobjs.os $(objpfx)rtld-libc.a
+-	$(LINK.o) -nostdlib -nostartfiles -r -o $@ '-Wl,-(' $^ -lgcc '-Wl,-)' \
++	$(LINK.o) -nostdlib -nostartfiles -r -o $@ '-Wl,-(' $^ -lgcc -lgcc_eh '-Wl,-)' \
+ 		  -Wl,-Map,$@.map
+ 
+ generated += librtld.map librtld.mk rtld-libc.a librtld.os.map
+@@ -295,6 +295,7 @@ $(objpfx)ld.so: $(objpfx)librtld.os $(ld
+ 		      -e 's/\. = 0 + SIZEOF_HEADERS;/& _begin = . - SIZEOF_HEADERS;/' \
+ 		  > $@.lds
+ 	$(LINK.o) -nostdlib -nostartfiles -shared -o $@			\
++		  -lgcc -lgcc_eh					\
+ 		  $(LDFLAGS-rtld) -Wl,-z,defs $(z-now-$(bind-now))	\
+ 		  $(filter-out $(map-file),$^) $(load-map-file)		\
+ 		  -Wl,-soname=$(rtld-installed-name) -T $@.lds
============================================================
--- conf/distro/angstrom-2008.1.conf	f64ebcf55e85b504d3be169befac3c7981aa74d9
+++ conf/distro/angstrom-2008.1.conf	36506d6829c3a09fa715f64051654c4cb2856058
@@ -67,12 +67,11 @@ KERNEL_INITRAMFS_PATH = "${KERNEL_INITRA
 KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
 
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers 	= "2.6.23"
+PREFERRED_VERSION_linux-libc-headers 	= "2.6.8.1"
 
 #Prefer glibc 2.6 and uclibc 0.9.29, these have had the most testing.
-PREFERRED_VERSION_glibc 		?= "2.6.1"
-PREFERRED_VERSION_glibc-intermediate 	?= "2.6.1"
-PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
+PREFERRED_VERSION_glibc 		?= "2.3.6"
+PREFERRED_VERSION_glibc-initial 	?= "2.3.6"
 
 #Prefer a newer GTK+ and friends
 PREFERRED_VERSION_gtk+             	?= "2.12.3"
@@ -103,18 +102,20 @@ ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
 ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
 
 #Everybody else can just use this: 
-ANGSTROM_GCC_VERSION 			?= "4.2.4"
+ANGSTROM_GCC_VERSION 			?= "4.1.1"
 
-PREFERRED_VERSION_gcc               ?= "${ANGSTROM_GCC_VERSION}"
-PREFERRED_VERSION_gcc-cross         ?= "${ANGSTROM_GCC_VERSION}"
-PREFERRED_VERSION_gcc-cross-sdk     ?= "${ANGSTROM_GCC_VERSION}"
-PREFERRED_VERSION_gcc-cross-initial ?= "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc                    ?= "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross              ?= "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross-sdk          ?= "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross-initial      ?= "${ANGSTROM_GCC_VERSION}"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "${ANGSTROM_GCC_VERSION}"
 
 #Loads preferred versions from files, these have weak assigments (?=), so put them at the bottom
 require conf/distro/include/preferred-gpe-versions-2.8.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.3.inc
 
+PREFERRED_VERSION_binutils-cross	?= "2.17"
 #avr32 only has patches for binutils 2.17 in OE
 PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
@@ -123,6 +124,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
============================================================
--- conf/distro/celinux-test.conf	beca92fe305476a03cc17be4ecf3f9b8a0b134c9
+++ conf/distro/celinux-test.conf	66a80241ae6781107ec011f3678266b510545e62
@@ -38,6 +38,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # toolchain
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
@@ -49,6 +50,7 @@ PREFERRED_VERSION_gcc-cross-initial = "3
 PREFERRED_VERSION_gcc = "3.4.4"
 PREFERRED_VERSION_gcc-cross = "3.4.4"
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
 
 PREFERRED_VERSION_glibc = "2.3.5+cvs20050627"
 
============================================================
--- conf/distro/chinook-compat.conf	61ddfe57a63bdd965dd857bd75478e87045007b9
+++ conf/distro/chinook-compat.conf	9971a4fa7bfe8235c9a5bf7d2ce134318f664a83
@@ -42,14 +42,15 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 MACHINE_KERNEL_VERSION = "2.6"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
 PREFERRED_PROVIDER_virtual/libc = "glibc"
 
 # NPTL stuff
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-libc-for-gcc = "glibc"
 
 PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-binutils = "binutils-cross"
 PREFERRED_PROVIDER_linux-libc-header = "linux-libc-headers"
@@ -64,6 +65,7 @@ PREFERRED_VERSION_gcc-cross-initial = "4
 PREFERRED_VERSION_gcc = "3.4.4cs2005q3.2"
 PREFERRED_VERSION_gcc-cross = "3.4.4cs2005q3.2"
 PREFERRED_VERSION_gcc-cross-initial = "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate = "4.1.1"
 
 #PREFERRED_VERSION_gcc-cross-initial = "3.4.4cs2005q3.2"
 
@@ -71,7 +73,6 @@ PREFERRED_VERSION_glibc = "2.5"
 PREFERRED_VERSION_linux-libc-headers = "2.6.20"
 
 PREFERRED_VERSION_glibc = "2.5"
-PREFERRED_VERSION_glibc-intermediate = "2.5"
 PREFERRED_VERSION_glibc-initial = "2.5"
 
 PREFERRED_VERSION_libtool = "1.5.6"
============================================================
--- conf/distro/gmustix.conf	88db2db3032412eac284ef6efa7a4668c79a29b2
+++ conf/distro/gmustix.conf	e5a0ed1602a23b5cbddbee1a07669efa041cd191
@@ -8,6 +8,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 IMAGE_FSTYPES = "jffs2"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
@@ -15,6 +16,7 @@ PREFERRED_VERSION_gcc-cross-initial = "3
 PREFERRED_PROVIDER_classpath = "classpath-minimal"
 
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
 PREFERRED_VERSION_gcc-cross = "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk = "3.4.4" 
 PREFERRED_VERSION_gcc = "3.4.4"
============================================================
--- conf/distro/include/angstrom-2007-for-openmoko.inc	4e926bdf5178cce4d068eeb210aba5adf7982351
+++ conf/distro/include/angstrom-2007-for-openmoko.inc	85b9d88526b7e40205f13f547c01c721f42fa32f
@@ -89,21 +89,25 @@ PREFERRED_VERSION_gcc-cross-initial ?= "
 PREFERRED_VERSION_gcc-cross         ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk     ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.2"
 
 PREFERRED_VERSION_gcc_dht-walnut               ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross_dht-walnut         ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk_dht-walnut     ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial_dht-walnut ?= "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate_dht-walnut ?= "4.1.1"
 
 PREFERRED_VERSION_gcc_xilinx-ml403               ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross_xilinx-ml403         ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk_xilinx-ml403     ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial_xilinx-ml403 ?= "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate_xilinx-ml403 ?= "4.1.1"
 
 PREFERRED_VERSION_gcc_mpc8323e-rdb               ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross_mpc8323e-rdb         ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk_mpc8323e-rdb     ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial_mpc8323e-rdb ?= "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate_mpc8323e-rdb ?= "4.1.1"
 
 PREFERRED_VERSION_binutils          ?= "2.18"
 PREFERRED_VERSION_binutils-cross    ?= "2.18"
@@ -115,6 +119,7 @@ PREFERRED_VERSION_gcc-cross-initial_avr3
 PREFERRED_VERSION_avr32-gcc-cross         = "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk_avr32     = "4.0.2"
 PREFERRED_VERSION_gcc-cross-initial_avr32 = "4.0.2"
+PREFERRED_VERSION_gcc-cross-intermediate_avr32 = "4.0.2"
 
 PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
@@ -133,9 +138,6 @@ PREFERRED_VERSION_uclibc-initial_avr32 =
 PREFERRED_VERSION_uclibc_avr32 = "0.9.28"
 PREFERRED_VERSION_uclibc-initial_avr32 = "0.9.28"
 
-PREFERRED_VERSION_glibc-intermediate_i686 ?= "2.4"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
-
 PREFERRED_VERSION_glibc-initial ?= "2.5"
 
 # To use an EABI compatible version 3 series gcc, either uncomment 
@@ -143,6 +145,7 @@ PREFERRED_VERSION_glibc-initial ?= "2.5"
 #
 # PREFERRED_VERSION_gcc-cross = "3.4.4+csl-arm-2005q3"
 # PREFERRED_VERSION_gcc-cross-initial = "3.4.4+csl-arm-2005q3"
+# PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4+csl-arm-2005q3"
 
 #Loads preferred versions from files, these have weak assigments (?=), so put them at the bottom
 require conf/distro/include/preferred-xorg-versions.inc
@@ -153,17 +156,17 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
 #Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc"
+PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
+PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
+PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
 
 PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
 PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
============================================================
--- conf/distro/include/angstrom-eglibc.inc	e0e7b6758775be96c0a58faecff645b05ef7c3e2
+++ conf/distro/include/angstrom-eglibc.inc	e56df3f5a1f620f0dfa7795ff188661bf1524389
@@ -4,13 +4,13 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 PREFERRED_PROVIDER_virtual/libc = "eglibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "eglibc-initial"
 
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc    = "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc  = "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-libc-for-gcc            = "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc${TARGET_VENDOR}-linux-libc-for-gcc        = "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel${TARGET_VENDOR}-linux-libc-for-gcc         = "eglibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc${TARGET_VENDOR}-linux-libc-for-gcc          = "eglibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "eglibc"
+PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc    = "eglibc"
+PREFERRED_PROVIDER_virtual/armeb${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc  = "eglibc"
+PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-libc-for-gcc            = "eglibc"
+PREFERRED_PROVIDER_virtual/powerpc${TARGET_VENDOR}-linux-libc-for-gcc        = "eglibc"
+PREFERRED_PROVIDER_virtual/mipsel${TARGET_VENDOR}-linux-libc-for-gcc         = "eglibc"
+PREFERRED_PROVIDER_virtual/sparc${TARGET_VENDOR}-linux-libc-for-gcc          = "eglibc"
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
============================================================
--- conf/distro/include/angstrom-glibc.inc	64060b7ace4591e34cd8206bb5cd3ba77c6554d4
+++ conf/distro/include/angstrom-glibc.inc	9a81308293772bcff0ea1b412e0fa3a478a205fe
@@ -6,13 +6,13 @@ PREFERRED_PROVIDER_linux-libc-headers ?=
 PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
 
 #Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc"
+PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
+PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
+PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
 
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
@@ -25,13 +25,11 @@ FULL_OPTIMIZATION_pn-perl = "-fexpensive
 FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -Os"
 
 FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
-FULL_OPTIMIZATION_pn-glibc-intermediate = "-O2"
 FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2"
 FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
 
 BUILD_OPTIMIZATION = "-Os"
 BUILD_OPTIMIZATION_pn-perl = "-O1"
-BUILD_OPTIMIZATION_pn-glibc-intermediate = "-O2"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
 BUILD_OPTIMIZATION_sparc = "-O2"
 
============================================================
--- conf/distro/include/insane-srcrevs.inc	e685e3b620d54ebf0b096e4709ed95ca3329b08c
+++ conf/distro/include/insane-srcrevs.inc	cbc144484de6ac4d699d0a609a011f4f1f04d2bf
@@ -4,7 +4,6 @@ SRCREV_pn-eglibc-initial ?= "${AUTOREV}"
 SRCREV_pn-eds-dbus ?= "${AUTOREV}"
 SRCREV_pn-eglibc ?= "${AUTOREV}"
 SRCREV_pn-eglibc-initial ?= "${AUTOREV}"
-SRCREV_pn-eglibc-intermediate ?= "${AUTOREV}"
 SRCREV_pn-ezxd ?= "${AUTOREV}"
 SRCREV_pn-fbgrab-viewer-native ?= "${AUTOREV}"
 SRCREV_pn-fstests ?= "${AUTOREV}"
============================================================
--- conf/distro/include/sane-srcrevs.inc	5f05375f9120704a658384ef343ef7df97d3b957
+++ conf/distro/include/sane-srcrevs.inc	3cfde3a808acdb6517d4809c29137d90eb6aef0d
@@ -28,7 +28,6 @@ SRCREV_pn-eglibc-initial ?= "6229"
 SRCREV_pn-eds-dbus ?= "659"
 SRCREV_pn-eglibc ?= "6229"
 SRCREV_pn-eglibc-initial ?= "6229"
-SRCREV_pn-eglibc-intermediate ?= "6229"
 SRCREV_pn-enlazar ?= "37"
 SRCREV_pn-exalt ?= "79"
 SRCREV_pn-exalt-daemon ?= "78"
============================================================
--- conf/distro/include/slugos.inc	00976339770c45e02a1ecc25cf9066a2c866eeea
+++ conf/distro/include/slugos.inc	ec4b375dd7947ce73c6b009e68b5fb78d4eda73d
@@ -96,13 +96,14 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
 #Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc       = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc     = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc       = "glibc"
+PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc     = "glibc"
 
 # Set the preferred provider for a few toolchain-related items, otherwise
 # these may be selected from the external-toolchain instead.
@@ -118,8 +119,8 @@ PREFERRED_VERSION_gcc-cross-initial  ?= 
 PREFERRED_VERSION_gcc-cross          ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk      ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial  ?= "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate  ?= "4.1.2"
 PREFERRED_VERSION_glibc              ?= "2.5"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
 PREFERRED_VERSION_glibc-initial      ?= "2.5"
 
 # Select the smallest provider of x11 libraries
============================================================
--- conf/distro/jlime-donkey.conf	50f90b05f62918f1b8efc4d5f311a7d80b424ad9
+++ conf/distro/jlime-donkey.conf	0ba2c9149b03723a7ad76f726d714e348f50b4f0
@@ -20,10 +20,11 @@ PREFERRED_PROVIDERS +=  "virtual/${TARGE
 #<> We will set CVS DATE when things are known to work.
 #<>-----------------------------------------------------------------<
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}g++:gcc-cross"
-PREFERRED_PROVIDER_virtual/sh3-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/sh3-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
 
 #<>----------------------------------------------------------------->
 #<> We want this so we can crosscompile the kernel using gcc 3.4.3
@@ -51,10 +52,10 @@ PREFERRED_VERSION_gcc-cross-initial = "4
 PREFERRED_VERSION_gcc = "4.2.2"
 PREFERRED_VERSION_gcc-cross = "4.2.2"
 PREFERRED_VERSION_gcc-cross-initial = "4.2.2"
+PREFERRED_VERSION_gcc-cross-intermediate = "4.2.2"
 PREFERRED_VERSION_linux-libc-headers = "2.6.23"                                             		    
 PREFERRED_VERSION_glibc = "2.6.1"
 PREFERRED_VERSION_glibc-initial = "2.6.1"
-PREFERRED_VERSION_glibc-intermediate = "2.6.1"
 
 #<>------------------------------------------------------------------>
 #<>
============================================================
--- conf/distro/jlime-henchman.conf	c5c0029ec6fcea5daaf00874e1a20e1d514d7586
+++ conf/distro/jlime-henchman.conf	83e1df21fb0bbdb8a99da48da0d861cd242a76e9
@@ -50,12 +50,14 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
 PREFERRED_VERSION_gcc = "4.2.2"
 PREFERRED_VERSION_gcc-cross = "4.2.2"
 PREFERRED_VERSION_gcc-cross-initial = "4.2.2"
+PREFERRED_VERSION_gcc-cross-intermediate = "4.2.2"
 PREFERRED_VERSION_binutils = "2.18"
 PREFERRED_VERSION_binutils-cross = "2.18"
 
@@ -69,12 +71,11 @@ PREFERRED_PROVIDER_virtual/libc = "glibc
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc"
 PREFERRED_VERSION_linux-libc-headers = "2.6.23"
 PREFERRED_VERSION_glibc = "2.5"
-PREFERRED_VERSION_glibc-intermediate = "2.5"
 
 #
 # Bootstrap & Init
============================================================
--- conf/distro/jlime-mongo.conf	649596799adddbe974beb9a95120de0c9db17b28
+++ conf/distro/jlime-mongo.conf	9c88e0c767f986ce13c59b2e9173c7b88ebb935e
@@ -51,12 +51,14 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
 PREFERRED_VERSION_gcc = "4.2.2"
 PREFERRED_VERSION_gcc-cross = "4.2.2"
 PREFERRED_VERSION_gcc-cross-initial = "4.2.2"
+PREFERRED_VERSION_gcc-cross-intermediate = "4.2.2"
 PREFERRED_VERSION_binutils = "2.18"
 PREFERRED_VERSION_binutils-cross = "2.18"
 
@@ -70,12 +72,11 @@ PREFERRED_PROVIDER_virtual/libc = "glibc
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc"
 PREFERRED_VERSION_linux-libc-headers = "2.6.18"
 PREFERRED_VERSION_glibc = "2.5"
-PREFERRED_VERSION_glibc-intermediate = "2.5"
 
 #
 # Bootstrap & Init
============================================================
--- conf/distro/jlime-shrek.conf	4aa79fa3f008b3d4c92169d9af94ffa1dc1e8491
+++ conf/distro/jlime-shrek.conf	4960e4997a76b212b2bda2ec3ddab16d81622075
@@ -12,6 +12,7 @@ PREFERRED_PROVIDERS  =  "virtual/${TARGE
 SRCDATE = "20050518"
 
 PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
@@ -24,6 +25,7 @@ PREFERRED_VERSION_gcc-cross-initial = "3
 PREFERRED_VERSION_gcc = "3.4.3"
 PREFERRED_VERSION_gcc-cross = "3.4.3"
 PREFERRED_VERSION_gcc-cross-initial = "3.4.3"
+PREFERRED_VERSION_gcc-cross-intermediate = "3.4.3"
 PREFERRED_VERSION_linux-libc-headers = "2.6.7.0"                                             		    
 PREFERRED_VERSION_glib-2.0-native = "2.6.2"
 PREFERRED_VERSION_glib-2.0 = "2.6.2"
============================================================
--- conf/distro/mamona.conf	fd683d8ddd62359322234b247211b416f546a004
+++ conf/distro/mamona.conf	2259bb76e74ceface351ef6266ee9f3284c8e414
@@ -34,6 +34,7 @@ PREFERRED_PROVIDERS_virtual/${TARGET_PRE
 
 # gcc
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
@@ -41,6 +42,7 @@ PREFERRED_VERSION_gcc-cross-initial ?= "
 PREFERRED_VERSION_gcc-cross ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.2"
 
 # binutils
 PREFERRED_VERSION_binutils ?= "2.18"
@@ -55,17 +57,15 @@ PREFERRED_VERSION_glibc ?= "2.5"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"
 
 PREFERRED_VERSION_glibc ?= "2.5"
-PREFERRED_VERSION_glibc-intermediate_i686 ?= "2.4"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
 PREFERRED_VERSION_glibc-initial ?= "2.5"
 PREFERRED_VERSION_uclibc ?= "0.9.29"
 
 # NPTL stuff
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-mamona-linux-gnueabi-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-mamona-linux-gnueabi-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-mamona-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/i586-mamona-linux-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-mamona-linux-gnueabi-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/armeb-mamona-linux-gnueabi-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-mamona-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/i586-mamona-linux-libc-for-gcc = "glibc"
 
 # Other Packages
 # ==============
@@ -82,4 +82,4 @@ PREFERRED_VERSION_gpsd ?= "2.33"
 
 PREFERRED_VERSION_apt = "0.7.6"
 PREFERRED_VERSION_gpsd ?= "2.33"
-PREFERRED_VERSION_hal_nokia770 = "0.5.7"
\ No newline at end of file
+PREFERRED_VERSION_hal_nokia770 = "0.5.7"
============================================================
--- conf/distro/minimal.conf	bd599ccea87a555d1025fc9d422556bb405c21d9
+++ conf/distro/minimal.conf	0528532430720923ec9c329e2c7eba81fb2a6072
@@ -37,6 +37,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Binutils & Compiler
 #
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 PREFERRED_PROVIDER_virtual/arm-linux-binutils = "binutils-cross"
@@ -45,6 +46,7 @@ PREFERRED_VERSION_gcc-cross-initial ?= "
 PREFERRED_VERSION_gcc ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.1"
 PREFERRED_VERSION_binutils ?= "2.18"
 PREFERRED_VERSION_binutils-cross ?= "2.18"
 
@@ -61,11 +63,10 @@ PREFERRED_PROVIDER_virtual/libc = "glibc
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 PREFERRED_VERSION_linux-libc-headers ?= "2.6.23"
 PREFERRED_VERSION_glibc ?= "2.5"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
 
 #
 # Bootstrap & Init
============================================================
--- conf/distro/nylon.conf	55b55fd58b093f18dc69ad389287e77c548403ae
+++ conf/distro/nylon.conf	93b37b27f5a8b665966cdcd8b90187ec5428f2bc
@@ -17,6 +17,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 INHERIT += "linux-kernel-base"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
@@ -35,6 +36,7 @@ PREFERRED_VERSION_gcc-cross-initial = "3
 PREFERRED_VERSION_kismet = "2005-01-R1"
 
 PREFERRED_VERSION_gcc-cross-initial = "3.3.4"
+PREFERRED_VERSION_gcc-cross-intermediate = "3.3.4"
 PREFERRED_VERSION_gcc-cross = "3.3.4"
 PREFERRED_VERSION_gcc-cross-sdk = "3.3.4" 
 PREFERRED_VERSION_gcc = "3.3.4"
@@ -50,6 +52,7 @@ PREFERRED_VERSION_gcc-cross-initial_mtx-
 
 #PREFERRED_VERSION_glibc_mtx-3 = "2.3.5+cvs20050627"
 PREFERRED_VERSION_gcc-cross-initial_mtx-3 = "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate_mtx-3 = "3.4.4"
 PREFERRED_VERSION_gcc-cross_mtx-3 = "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk_mtx-3 = "3.4.4" 
 PREFERRED_VERSION_gcc_mtx-3 = "3.4.4"
@@ -71,6 +74,7 @@ PREFERRED_VERSION_gcc-cross-initial_mtx-
 
 #PREFERRED_VERSION_glibc_mtx-3a = "2.3.5+cvs20050627"
 PREFERRED_VERSION_gcc-cross-initial_mtx-3a = "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate_mtx-3a = "3.4.4"
 PREFERRED_VERSION_gcc-cross_mtx-3a = "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk_mtx-3a = "3.4.4" 
 PREFERRED_VERSION_gcc_mtx-3a = "3.4.4"
============================================================
--- conf/distro/openprotium.conf	c91df50d1b1b24f6a52eba1264c1e195813952dd
+++ conf/distro/openprotium.conf	191b4f511b2b4e2ded2075e527d6e87588dbf292
@@ -45,9 +45,9 @@ PREFERRED_VERSION_gcc-cross-initial ?= "
 PREFERRED_VERSION_gcc-cross ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-sdk ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.2"
 
 PREFERRED_VERSION_glibc		     = "2.6.1"
-PREFERRED_VERSION_glibc-intermediate = "2.6.1"
 PREFERRED_VERSION_glibc-initial      = "2.6.1"
 
 PREFERRED_VERSION_linux-libc-headers = "2.6.11.1"
@@ -59,11 +59,12 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 #
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-linux-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/powerpc-linux-libc-for-gcc = "glibc"
 PREFERRED_PROVIDER_virtual/powerpc-linux-libc-initial = "glibc-initial"
 
 PREFERRED_PROVIDER_virtual/libc     = "glibc"
============================================================
--- conf/distro/oplinux-uclibc.conf	ded77d3149a141de656d62e5c1ed7e161f1e500d
+++ conf/distro/oplinux-uclibc.conf	af3019dae5fb6717311d042ac2f3114f99cdd50e
@@ -43,12 +43,14 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
 PREFERRED_VERSION_gcc ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.1"
 PREFERRED_VERSION_binutils ?= "2.17.50.0.5"
 PREFERRED_VERSION_binutils-cross ?= "2.17.50.0.5"
 
============================================================
--- conf/distro/oplinux.conf	0dbc9a811a5f426f5d3e4ead5a20330b56e51e41
+++ conf/distro/oplinux.conf	007c319d5693215e75c73b455c5c76a0f2465501
@@ -35,6 +35,7 @@ PREFERRED_PROVIDERS += "virtual/${TARGET
 TARGET_OS = "linux"
 
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}g++:gcc-cross"
 
@@ -51,14 +52,14 @@ PREFERRED_PROVIDER_virtual/libc ?= "glib
 PREFERRED_PROVIDER_virtual/libc ?= "glibc"
 
 
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-oplinux-linux-gnueabi-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-oplinux-linux-gnueabi-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/powerpc-oplinux-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/mipsel-oplinux-linux-libc-for-gcc = "glibc-intermediate"
-PREFERRED_PROVIDER_virtual/sparc-oplinux-linux-libc-for-gcc = "glibc-intermediate"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-oplinux-linux-gnueabi-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/armeb-oplinux-linux-gnueabi-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/powerpc-oplinux-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/mipsel-oplinux-linux-libc-for-gcc = "glibc"
+PREFERRED_PROVIDER_virtual/sparc-oplinux-linux-libc-for-gcc = "glibc"
 
 
 
@@ -84,6 +85,7 @@ PREFERRED_VERSION_gcc-cross-initial ?= "
 PREFERRED_VERSION_gcc-cross ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-sdk ?= "4.1.1"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.1"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "4.1.1"
 
 PREFERRED_VERSION_binutils ?= "2.17.50.0.5"
 PREFERRED_VERSION_binutils-cross ?= "2.17.50.0.5"
@@ -96,7 +98,6 @@ PREFERRED_VERSION_glibc-initial ?= "2.5"
 PREFERRED_VERSION_linux-libc-headers ?= "2.6.18"
 
 PREFERRED_VERSION_glibc-initial ?= "2.5"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
 PREFERRED_VERSION_glibc ?= "2.5"
 
 PCMCIA_MANAGER = "pcmciautils"
============================================================
--- conf/distro/sharprom-compatible.conf	866d17894061cd031cda619513332fa012433fa3
+++ conf/distro/sharprom-compatible.conf	89b78178c717a75e6dc950636c6903fbfb6fb989
@@ -41,6 +41,7 @@ PREFERRED_PROVIDER_virtual/arm-linux-gcc
 PREFERRED_PROVIDER_virtual/arm-linux-gcc = "sharprom-toolchain-native" 
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 PREFERRED_PROVIDER_virtual/arm-linux-gcc-initial = "sharprom-toolchain-native"
+PREFERRED_PROVIDER_virtual/arm-linux-gcc-intermediate = "sharprom-toolchain-native"
 
 PREFERRED_VERSION_glibc = "2.2.5"
 
============================================================
--- conf/distro/ucslugc.conf	13de2c9a77700ae97b0f7a3dbb79971cb6451ca6
+++ conf/distro/ucslugc.conf	bb32cc5c8cbf8d2446f2bf2eef140a2ccd04ee1d
@@ -10,6 +10,7 @@ PREFERRED_VERSION_gcc-cross-initial = "3
 TARGET_OS = "linux-uclibc"
 
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
 PREFERRED_VERSION_gcc-cross = "3.4.4"
 PREFERRED_VERSION_gcc = "3.4.4"
 
============================================================
--- conf/distro/unslung.conf	0ef6d906a67568b77e1f68fc1ac5c65f65586c67
+++ conf/distro/unslung.conf	a7d66feda58ef5de37cbaf33395cb0dd4e1e7586
@@ -42,6 +42,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 
 # Select between multiple alternative providers, if more than one is eligible.
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
@@ -54,6 +55,7 @@ PREFERRED_VERSION_gcc-cross-initial ?= "
 PREFERRED_VERSION_binutils ?= "2.15.94.0.1"
 PREFERRED_VERSION_binutils-cross ?= "2.15.94.0.1"
 PREFERRED_VERSION_gcc-cross-initial ?= "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate ?= "3.4.4"
 PREFERRED_VERSION_gcc-cross ?= "3.4.4"
 PREFERRED_VERSION_gcc ?= "3.4.4"
 PREFERRED_VERSION_glibc ?= "2.2.5"
============================================================
--- conf/distro/wrt54oe.conf	9d556281a94a6474ec9b7e6edffabcecd876b083
+++ conf/distro/wrt54oe.conf	511263e0f8d97edcbcab96283a7c703b27f7072b
@@ -14,11 +14,13 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 TARGET_OS = "linux-uclibc"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
 
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
+PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
 PREFERRED_VERSION_gcc-cross = "3.4.4"
 PREFERRED_VERSION_gcc-cross-sdk = "3.4.4" 
 PREFERRED_VERSION_gcc = "3.4.4"
============================================================
--- conf/local.conf.sample	fa7f5ad0f812c943367b2c88b4e4f7165797959d
+++ conf/local.conf.sample	5164ed855456a3c58975fcfbad1c9da8dd8d60f2
@@ -51,6 +51,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
 PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
============================================================
--- conf/machine/native.conf	9f73a28ea65b27265df3e4afa2107401f9463ead
+++ conf/machine/native.conf	e4b8c17ba26581950b67bf9e306d9f1664c0741f
@@ -7,7 +7,7 @@ PREFERRED_PROVIDER_virtual/kernel = "nat
 VENDOR = "-oe"
 
 PREFERRED_PROVIDER_virtual/kernel = "native-kernel"
-ASSUME_PROVIDED += "virtual/gcc-initial virtual/gcc virtual/g++ virtual/libc virtual/libintl virtual/libiconv"
+ASSUME_PROVIDED += "virtual/gcc-initial virtual/gcc-intermediate virtual/gcc virtual/g++"
 ASSUME_PROVIDED += "binutils-cross"
 ASSUME_PROVIDED += "virtual/libiconv virtual/libintl virtual/libc"
 
============================================================
--- packages/eglibc/eglibc-initial.inc	9cc9a816e903fd588bfe9b6529f690d24297a54b
+++ packages/eglibc/eglibc-initial.inc	4b2b73384f3c8f940e42387057da88a76435f44c
@@ -1,5 +1,5 @@ SECTION = "libs"
 SECTION = "libs"
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
@@ -9,11 +9,13 @@ do_configure () {
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
 	chmod +x ${S}/configure
-	CC="${BUILD_CC}" CPP="${BUILD_CPP}" LD="${BUILD_LD}" \
+        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+        find ${S} -name "configure" | xargs touch
 	${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
+		--prefix=/usr \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=${STAGING_DIR_TARGET}${layout_includedir} \
-		--enable-hacker-mode
+		--enable-hacker-mode --enable-addons
 }
 
 do_compile () {
@@ -22,8 +24,14 @@ do_stage () {
 
 do_stage () {
 	oe_runmake cross-compiling=yes install_root=${STAGING_DIR_HOST} \
-	includedir='${layout_includedir}' prefix='${layout_prefix}' install-headers
+	includedir='${layout_includedir}' prefix='${layout_prefix}' install-headers \
+	install-bootstrap-headers=yes
+        oe_runmake csu/subdir_lib
 
+        mkdir -p ${STAGING_DIR_TARGET}${layout_libdir}
+        install -m 644 csu/crt[1in].o ${STAGING_DIR_TARGET}${layout_libdir}
+        ${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+                       -o ${STAGING_DIR_TARGET}${layout_libdir}/libc.so
 }
 
 do_install () {
============================================================
--- packages/eglibc/eglibc.inc	20ecb0b8894a6fa79214db154c8cd4e8458d7237
+++ packages/eglibc/eglibc.inc	eef22ba34145bef9522d66a4eb30da587ba3e6a2
@@ -4,12 +4,12 @@ LICENSE = "LGPL"
 PRIORITY = "required"
 LICENSE = "LGPL"
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial', 'virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']} linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd += " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-RDEPENDS += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
-PROVIDES = "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc', '']['nptl' in '${GLIBC_ADDONS}']}"
+#RDEPENDS += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
+PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 
 inherit autotools
============================================================
--- packages/glibc/glibc-initial.inc	0480105971d23c66b379db96774c07f2a0913989
+++ packages/glibc/glibc-initial.inc	b63bfe7eb2b35475f853b3d412838a369830b95d
@@ -1,5 +1,5 @@ SECTION = "libs"
 SECTION = "libs"
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
@@ -9,7 +9,8 @@ do_configure () {
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
 	chmod +x ${S}/configure
-	CC="${BUILD_CC}" CPP="${BUILD_CPP}" LD="${BUILD_LD}" ${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
+	find ${S} -name "configure" | xargs touch
+	${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=${STAGING_DIR_TARGET}${layout_includedir} \
 		--enable-hacker-mode
@@ -31,7 +32,7 @@ do_stage () {
 
 do_stage () {
 	oe_runmake cross-compiling=yes install_root=${STAGING_DIR_HOST} includedir='${layout_includedir}' prefix='${layout_prefix}' install-headers
-
+	oe_runmake csu/subdir_lib
 	# Two headers -- stubs.h and features.h -- aren't installed by install-headers,
 	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
 	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
@@ -42,6 +43,10 @@ do_stage () {
 	if [ -e ${B}/bits/stdio_lim.h ]; then
 		cp ${B}/bits/stdio_lim.h  ${STAGING_INCDIR}/bits/
 	fi
+	mkdir -p ${STAGING_DIR_TARGET}${layout_libdir}
+	install -m 644 csu/crt[1in].o ${STAGING_DIR_TARGET}${layout_libdir}
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${STAGING_DIR_TARGET}${layout_libdir}/libc.so
 }
 
 do_install () {
============================================================
--- packages/glibc/glibc.inc	94a32473f1193137d45da97d6ed786ae9e755094
+++ packages/glibc/glibc.inc	d7da3e08d193524257645bad4468dbb3dd7ed044
@@ -4,12 +4,12 @@ LICENSE = "LGPL"
 PRIORITY = "required"
 LICENSE = "LGPL"
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial', 'virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']} linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd += " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-RDEPENDS += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
-PROVIDES = "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc', '']['nptl' in '${GLIBC_ADDONS}']}"
+#RDEPENDS += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
+PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 
 inherit autotools
============================================================
--- packages/glibc/glibc_2.3.6.bb	a180c138b01077df8b234264ee6abd46cbf72314
+++ packages/glibc/glibc_2.3.6.bb	582c26ae42b610a56928589814381bd13bc4c5de
@@ -19,13 +19,16 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/gli
            ${CROSSTOOL_PATCH_URL}glibc-2.3.6-fix-pr631.patch;patch=1 \
            ${CROSSTOOL_PATCH_URL}glibc-fp-byteorder.patch;patch=1 \
            ${CROSSTOOL_PATCH_URL}glibc-mips-bootstrap-gcc-header-install.patch;patch=1 \
+           ${CROSSTOOL_PATCH_URL}arm-ctl_bus_isa.patch;patch=1 \
            ${CROSSTOOL_PATCH_URL}make-install-lib-all.patch;patch=1 \
            ${CROSSTOOL_PATCH_URL}maybe/glibc-2.3.6-allow-gcc-4.0-powerpc32.patch;patch=1 \
            file://glibc-2.3.6-bind-already-defined-on-powerpc.patch;patch=1 \
            file://glibc-2.3.6-allow-gcc-4.1-powerpc32-initfini.s.patch;patch=1 \
            file://glibc-2.3.6-linuxthreads-allow-gcc-4.1-powerpc32-initfini.s.patch;patch=1 \
-           file://late-install-loop-break.patch \
-	   \
+           file://late-install-loop-break.patch;patch=1 \
+           file://glibc-arm-socket-weakalias.patch;patch=1 \
+           file://glibc-2.3.6-linuxthreads-pthread-raise.patch;patch=1 \
+           file://glibc-rtld-libcc-eh.patch;patch=1 \
            file://etc/ld.so.conf \
 	   file://generate-supported.mk"
 
@@ -60,7 +63,7 @@ do_configure () {
 		exit 1
 	fi
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
-	CPPFLAGS="" oe_runconf
+	CPPFLAGS="" libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes oe_runconf
 }
 
 rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
============================================================
--- packages/meta/external-toolchain.bb	ebcd8679c393d51824573b5a70c7a071f8521117
+++ packages/meta/external-toolchain.bb	fe769763ba169fd561e2c5f1153726281afa9952
@@ -6,6 +6,7 @@ PROVIDES = "\
     linux-libc-headers \
     virtual/${TARGET_PREFIX}gcc \
     virtual/${TARGET_PREFIX}gcc-initial \
+    virtual/${TARGET_PREFIX}gcc-intermediate \
     virtual/${TARGET_PREFIX}binutils \
     virtual/${TARGET_PREFIX}libc-for-gcc \
     virtual/libc \
============================================================
--- packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb	63c582236d5e631780a864456ba4db4862602a0e
+++ packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb	8e92e1882cb3bc63515abe5cc42b6577706e118d
@@ -12,6 +12,7 @@ PROVIDES_sharprom-compatible = "\
   virtual/libiconv \
   virtual/arm-linux-gcc \
   virtual/arm-linux-libc-for-gcc \
+  virtual/arm-linux-gcc-intermediate \
   virtual/arm-linux-gcc-initial "
 PR = "r2"
 
============================================================
--- packages/uclibc/uclibc-initial_0.9.26.bb	4add23305e16ae6d0973c44aae89b3f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.26.bb	a184826f227450c3799472708b38d95c759f1457
@@ -3,20 +3,26 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
 do_stage() {
 	# Install initial headers into the cross dir
-	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		RUNTIME_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
-	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc-initial_0.9.27.bb	4add23305e16ae6d0973c44aae89b3f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.27.bb	bf5a03c0a95f607474c7585a1cdaec562bbb1747
@@ -3,20 +3,27 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
 do_stage() {
 	# Install initial headers into the cross dir
-	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		RUNTIME_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
-	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc-initial_0.9.28.bb	4add23305e16ae6d0973c44aae89b3f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.28.bb	bf5a03c0a95f607474c7585a1cdaec562bbb1747
@@ -3,20 +3,27 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
 do_stage() {
 	# Install initial headers into the cross dir
-	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		RUNTIME_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
-	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc-initial_0.9.29.bb	d9cf01fb4dec69ff1f796d39c9078030982eacca
+++ packages/uclibc/uclibc-initial_0.9.29.bb	af0ccde83d59f1948f1f2b5f7d4952d4855c58bc
@@ -3,7 +3,7 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers ncurses-native"
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
@@ -11,13 +11,20 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
 		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	install -d ${CROSS_DIR}/${TARGET_SYS}	
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc-initial_svn.bb	2715cc791b3fdd1b8e62328291e3ef33973bacc0
+++ packages/uclibc/uclibc-initial_svn.bb	766c264be7d787f2285f02b13a392f43cb2a87d2
@@ -3,7 +3,7 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-cvs', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers ncurses-native"
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
@@ -11,12 +11,18 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
 		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc.inc	48b0ba2e4cff05071b3b812ef0be0861870cd00c
+++ packages/uclibc/uclibc.inc	4f97a9d058115dbb12ae1c5d047fb84965500a51
@@ -22,7 +22,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binut
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-	   virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers ncurses-native"
+	   virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-native"
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
 # Blackfin needs a wrapper around ld

--------------040702040104080005090105--
