Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KJ26b-00048a-Ob
	for openembedded-devel@openembedded.org; Wed, 16 Jul 2008 10:11:22 +0200
Received: by yw-out-1718.google.com with SMTP id 5so2938720ywr.30
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jul 2008 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:openpgp:content-type;
	bh=tkR/RbgTLfL8UyufIZrOybtak5bFZzE3issDeeBca+U=;
	b=aG7jcPK5LHdjxZDgN6VKJf89HZyZjKL/+gtgei0GeYfEdadPXms5C5tSNFHSRpse+1
	MFcuHaGPP8e2hUczm4PM8FOSkZ+lZv+J8EQ+1TjjOgHOudLbo4lFeb/VBYSpJfmprk0M
	NcEx0RDmlQn7lY8UFS1FD2XggDpGcUeVPWRDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:openpgp:content-type;
	b=FVCSVWhrOF1wToaWeqWz2MiZV6flcBIhr8F+LErBXP/SFsPwIhxeGxPatLsDlAwWYR
	gwTvTZUm63vFVpjZzpelAcw+Na0Ep/NagInozL2bOnWS+oNvc8yaJLEPAjg5jVjjSxss
	pVRCIl9UdFOl9nv0cRrk09alVl6UtygDVCRa0=
Received: by 10.114.201.1 with SMTP id y1mr20274967waf.93.1216195841617;
	Wed, 16 Jul 2008 01:10:41 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id a8sm12650121poa.12.2008.07.16.01.10.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 16 Jul 2008 01:10:41 -0700 (PDT)
Message-ID: <487DACFF.5010504@gmail.com>
Date: Wed, 16 Jul 2008 01:10:39 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <1216087105.10214.7.camel@isis>
In-Reply-To: <1216087105.10214.7.camel@isis>
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
X-List-Received-Date: Wed, 16 Jul 2008 08:11:22 -0000
Content-Type: multipart/mixed; boundary="------------000802030001070807020802"

--------------000802030001070807020802
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj wrote:
> Hi,
> 
> I have faced a problem which took me a while to understand. I was
> working on uclibc and therefore I needed to rebuild uclibc many times
> and thats when I saw this issue.
> 
> When I rebuilt only uclibc after a complete rebuild. Suddenly in the new
> root file system with new uclibc application wont load properly
> complaining about missing symbols (symbols were from libgcc like
> __aeabi_*)
> 
> Looking at it the problem is that right now we build uclibc with a
> intermediate compiler(gcc-cross-initial) which is build with
> --disable-shared. We use this uclibc and its headers and dev-libs and we
> rebuild a fresh full cross-gcc (gcc-cross) with -shared-lib support to
> build the rest of system/image.
> 
> Therefore the uclibc we build in subsequent time will be build using
> cross-gcc and not cross-gcc-initial. 
> 
> What happens is that some of the libgcc symbols get linked into
> uclibc/libc.so when it is built with a gcc without shared lib
> support(gcc-initial). When building whole sytem different
> applications(e.g. gawk) which need these symbols link as if they will
> get these symbols from libc.so at runtime, which is correct if I ran
> with the first time build uclibc but when I rebuilt just uclibc all
> these symbols were not being resolved by ld.so because there were no
> DT_NEEDED entry for libgcc_s.so in the application binary as it was
> build to get these symbols from libc.so, but rebuilt uclibc now do not
> export these symbols because it was built with a compiler that supports
> shared-libs(cross-gcc).
> 
> Then I went to see the toolchain build order. Currently we do
> 
> cross-binutils -> kernel-headers -> uclibc-headers -> cross-gcc
> (--disable-shared) -> uclibc -> cross-gcc
> 
> I think this can be improved and I implemented the following steps.
> 
> cross-binutils -> cross-gcc (--disable-shared) -> kernel-headers ->
> eglibc/glibc/uclibc headers + startup files + dummy libc.so -> cross-gcc
> (--enable-shared) -> glibc/eglibc/uclibc -> cross-gcc
> 
> These steps work same for uclibc as well as glibc/eglibc toolchains
> irrespective of architectures.
> 
> These steps work for both NPTL and LinuxThreads toolchains. 
> 
> Given we use these steps, we will have same toolchain build sequence in
> all circumstances and will help to reduce the current complex toolchain
> builds we have.
> 
> We will not need glibc-intermediate step and we will introduce a new
> step called cross-gcc-intermidiate.
> 
> I have so far tested this sequence on arm uclibc and it works well and
> understandably solves the issue I am seeing.
> 
> I have used this sequence in external scripts to build toolchains too
> and it has worked well.
> 
> Now, I have a prototype patch for uclibc-0.9.29+gcc-4.2.4 based
> toolchain which I am attaching here.
> 
> If we agree on this aproach I can go ahead and do the same for
> eglibc/glibc toolchains too.
> 
> I have not tested it on older compiler/library combinations but I think
> it will work there too as I have build various combinations in the past
> with same sequence outside OE.
> 
> Comments and feedback is welcome.
> 
> Thanks
> 
> -Khem

Hello All,

I have meanwhile developed a relatively complete patch. I have tested it on uclibc-0.9.29 glibc_2.6.1 and eglibc_svn and all have worked well. I have also booted the console-images produced.

Here is the revised patch.

As its a fundamental change and its not possible for me to test all combos. Any testing will be highly appreciated.

Thanks

- -Khem

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIfaz+HnJKy6V6em4RAlQmAJ9YyF1UTn4zhbZ6uTcoS/IKr05uyACdHyhu
a/DEZHuwPPCR0wR5T4NXaMY=
=X5/H
-----END PGP SIGNATURE-----

--------------000802030001070807020802
Content-Type: text/x-diff;
 name="oe-new-toolchain-build-sequence.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="oe-new-toolchain-build-sequence.patch"

#
# old_revision [641a15c42908d49a2d22b32302275bdcee06d601]
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
#  content [211f0593c75ca9fb9078df3e4a57d18d80e1385f]
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
# patch "conf/distro/angstrom-2008.1.conf"
#  from [f64ebcf55e85b504d3be169befac3c7981aa74d9]
#    to [8703f595671685f632e51c96d1be75cdceddfe83]
# 
# patch "conf/distro/celinux-test.conf"
#  from [beca92fe305476a03cc17be4ecf3f9b8a0b134c9]
#    to [bdd5c5b24a8a64570690719c1718c54aa9b7e040]
# 
# patch "conf/distro/chinook-compat.conf"
#  from [61ddfe57a63bdd965dd857bd75478e87045007b9]
#    to [93924b593b85319b4802d8a7f484af532249bffa]
# 
# patch "conf/distro/gmustix.conf"
#  from [88db2db3032412eac284ef6efa7a4668c79a29b2]
#    to [2b724e665142c8756cd372024844dab692c13934]
# 
# patch "conf/distro/include/angstrom-2007-for-openmoko.inc"
#  from [4e926bdf5178cce4d068eeb210aba5adf7982351]
#    to [476d580172727456c05df8ea8b59d7d3fb738051]
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
#  from [c24a6b6487621a87f028138310d8af27665e8ab3]
#    to [08be0854d3bcee895a80ca1e871dc0fe29954dd8]
# 
# patch "conf/distro/include/slugos.inc"
#  from [00976339770c45e02a1ecc25cf9066a2c866eeea]
#    to [e1f0d5f66c6d127b240660bc34b67a2be7b046ae]
# 
# patch "conf/distro/jlime-donkey.conf"
#  from [50f90b05f62918f1b8efc4d5f311a7d80b424ad9]
#    to [4a982f4afe5f74d6cb95968061b4b2ea87f0cecb]
# 
# patch "conf/distro/jlime-henchman.conf"
#  from [c5c0029ec6fcea5daaf00874e1a20e1d514d7586]
#    to [67c13540c7a0b1c2c91d011c9dcbfac4c98fe5da]
# 
# patch "conf/distro/jlime-mongo.conf"
#  from [649596799adddbe974beb9a95120de0c9db17b28]
#    to [3ebb725f06773e26010c95c25fd4189ca8419294]
# 
# patch "conf/distro/jlime-shrek.conf"
#  from [4aa79fa3f008b3d4c92169d9af94ffa1dc1e8491]
#    to [7da188f8cd828d10ef57f503be471621ce47bee7]
# 
# patch "conf/distro/mamona.conf"
#  from [fd683d8ddd62359322234b247211b416f546a004]
#    to [0b55b7e50737a7003497a6a3a14f7911317ad862]
# 
# patch "conf/distro/minimal.conf"
#  from [bd599ccea87a555d1025fc9d422556bb405c21d9]
#    to [daf53521710448ae534d9c015c119c2543b37d0a]
# 
# patch "conf/distro/nylon.conf"
#  from [55b55fd58b093f18dc69ad389287e77c548403ae]
#    to [7c6cb5856944ad2ee3fc41113898316d6749fd5a]
# 
# patch "conf/distro/openprotium.conf"
#  from [c91df50d1b1b24f6a52eba1264c1e195813952dd]
#    to [097d78161ffbbcc47fe5b0e8c1749859d98dfc59]
# 
# patch "conf/distro/oplinux-uclibc.conf"
#  from [ded77d3149a141de656d62e5c1ed7e161f1e500d]
#    to [6535d97b4b048850feda85f2e417dcb5c83b6d18]
# 
# patch "conf/distro/oplinux.conf"
#  from [0dbc9a811a5f426f5d3e4ead5a20330b56e51e41]
#    to [cc1ebc8e8f1d1ee5b614698053ca46d139be9ed7]
# 
# patch "conf/distro/sharprom-compatible.conf"
#  from [866d17894061cd031cda619513332fa012433fa3]
#    to [89b78178c717a75e6dc950636c6903fbfb6fb989]
# 
# patch "conf/distro/unslung.conf"
#  from [0ef6d906a67568b77e1f68fc1ac5c65f65586c67]
#    to [e482d634afd26f12871e55a0ec8caa4bc7bd70ac]
# 
# patch "conf/distro/wrt54oe.conf"
#  from [9d556281a94a6474ec9b7e6edffabcecd876b083]
#    to [1253df366c87e03cae180335a881c1f9bd08b4e7]
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
#    to [87152e05358bc4ae69665b334c5965435f72285d]
# 
# patch "packages/uclibc/uclibc-initial_0.9.27.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [f5c365faad4564b4e89f07778573e5722ee8267b]
# 
# patch "packages/uclibc/uclibc-initial_0.9.28.bb"
#  from [4add23305e16ae6d0973c44aae89b3f01d0f5bf8]
#    to [f5c365faad4564b4e89f07778573e5722ee8267b]
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
--- packages/gcc/gcc-cross-intermediate_4.1.1.bb	211f0593c75ca9fb9078df3e4a57d18d80e1385f
+++ packages/gcc/gcc-cross-intermediate_4.1.1.bb	211f0593c75ca9fb9078df3e4a57d18d80e1385f
@@ -0,0 +1,5 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
+EXTRA_OECONF += "--disable-libmudflap \
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
--- conf/distro/angstrom-2008.1.conf	f64ebcf55e85b504d3be169befac3c7981aa74d9
+++ conf/distro/angstrom-2008.1.conf	8703f595671685f632e51c96d1be75cdceddfe83
@@ -70,9 +70,8 @@ PREFERRED_VERSION_linux-libc-headers 	= 
 PREFERRED_VERSION_linux-libc-headers 	= "2.6.23"
 
 #Prefer glibc 2.6 and uclibc 0.9.29, these have had the most testing.
-PREFERRED_VERSION_glibc 		?= "2.6.1"
-PREFERRED_VERSION_glibc-intermediate 	?= "2.6.1"
-PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
+PREFERRED_VERSION_glibc 		?= "2.3.6"
+PREFERRED_VERSION_glibc-initial 	?= "2.3.6"
 
 #Prefer a newer GTK+ and friends
 PREFERRED_VERSION_gtk+             	?= "2.12.3"
@@ -103,7 +102,7 @@ ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
 ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
 
 #Everybody else can just use this: 
-ANGSTROM_GCC_VERSION 			?= "4.2.4"
+ANGSTROM_GCC_VERSION 			?= "3.4.4"
 
 PREFERRED_VERSION_gcc               ?= "${ANGSTROM_GCC_VERSION}"
 PREFERRED_VERSION_gcc-cross         ?= "${ANGSTROM_GCC_VERSION}"
@@ -123,6 +122,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
============================================================
--- conf/distro/celinux-test.conf	beca92fe305476a03cc17be4ecf3f9b8a0b134c9
+++ conf/distro/celinux-test.conf	bdd5c5b24a8a64570690719c1718c54aa9b7e040
@@ -38,6 +38,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # toolchain
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
============================================================
--- conf/distro/chinook-compat.conf	61ddfe57a63bdd965dd857bd75478e87045007b9
+++ conf/distro/chinook-compat.conf	93924b593b85319b4802d8a7f484af532249bffa
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
@@ -71,7 +72,6 @@ PREFERRED_VERSION_glibc = "2.5"
 PREFERRED_VERSION_linux-libc-headers = "2.6.20"
 
 PREFERRED_VERSION_glibc = "2.5"
-PREFERRED_VERSION_glibc-intermediate = "2.5"
 PREFERRED_VERSION_glibc-initial = "2.5"
 
 PREFERRED_VERSION_libtool = "1.5.6"
============================================================
--- conf/distro/gmustix.conf	88db2db3032412eac284ef6efa7a4668c79a29b2
+++ conf/distro/gmustix.conf	2b724e665142c8756cd372024844dab692c13934
@@ -8,6 +8,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 IMAGE_FSTYPES = "jffs2"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
============================================================
--- conf/distro/include/angstrom-2007-for-openmoko.inc	4e926bdf5178cce4d068eeb210aba5adf7982351
+++ conf/distro/include/angstrom-2007-for-openmoko.inc	476d580172727456c05df8ea8b59d7d3fb738051
@@ -133,9 +133,6 @@ PREFERRED_VERSION_uclibc-initial_avr32 =
 PREFERRED_VERSION_uclibc_avr32 = "0.9.28"
 PREFERRED_VERSION_uclibc-initial_avr32 = "0.9.28"
 
-PREFERRED_VERSION_glibc-intermediate_i686 ?= "2.4"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
-
 PREFERRED_VERSION_glibc-initial ?= "2.5"
 
 # To use an EABI compatible version 3 series gcc, either uncomment 
@@ -153,17 +150,17 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
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
--- conf/distro/include/sane-srcrevs.inc	c24a6b6487621a87f028138310d8af27665e8ab3
+++ conf/distro/include/sane-srcrevs.inc	08be0854d3bcee895a80ca1e871dc0fe29954dd8
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
+++ conf/distro/include/slugos.inc	e1f0d5f66c6d127b240660bc34b67a2be7b046ae
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
@@ -119,7 +120,6 @@ PREFERRED_VERSION_glibc              ?= 
 PREFERRED_VERSION_gcc-cross-sdk      ?= "4.1.2"
 PREFERRED_VERSION_gcc-cross-initial  ?= "4.1.2"
 PREFERRED_VERSION_glibc              ?= "2.5"
-PREFERRED_VERSION_glibc-intermediate ?= "2.5"
 PREFERRED_VERSION_glibc-initial      ?= "2.5"
 
 # Select the smallest provider of x11 libraries
============================================================
--- conf/distro/jlime-donkey.conf	50f90b05f62918f1b8efc4d5f311a7d80b424ad9
+++ conf/distro/jlime-donkey.conf	4a982f4afe5f74d6cb95968061b4b2ea87f0cecb
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
@@ -54,7 +55,6 @@ PREFERRED_VERSION_glibc-initial = "2.6.1
 PREFERRED_VERSION_linux-libc-headers = "2.6.23"                                             		    
 PREFERRED_VERSION_glibc = "2.6.1"
 PREFERRED_VERSION_glibc-initial = "2.6.1"
-PREFERRED_VERSION_glibc-intermediate = "2.6.1"
 
 #<>------------------------------------------------------------------>
 #<>
============================================================
--- conf/distro/jlime-henchman.conf	c5c0029ec6fcea5daaf00874e1a20e1d514d7586
+++ conf/distro/jlime-henchman.conf	67c13540c7a0b1c2c91d011c9dcbfac4c98fe5da
@@ -50,6 +50,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
@@ -69,12 +70,11 @@ PREFERRED_PROVIDER_virtual/libc = "glibc
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
+++ conf/distro/jlime-mongo.conf	3ebb725f06773e26010c95c25fd4189ca8419294
@@ -51,6 +51,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
@@ -70,12 +71,11 @@ PREFERRED_PROVIDER_virtual/libc = "glibc
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
+++ conf/distro/jlime-shrek.conf	7da188f8cd828d10ef57f503be471621ce47bee7
@@ -12,6 +12,7 @@ PREFERRED_PROVIDERS  =  "virtual/${TARGE
 SRCDATE = "20050518"
 
 PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
============================================================
--- conf/distro/mamona.conf	fd683d8ddd62359322234b247211b416f546a004
+++ conf/distro/mamona.conf	0b55b7e50737a7003497a6a3a14f7911317ad862
@@ -34,6 +34,7 @@ PREFERRED_PROVIDERS_virtual/${TARGET_PRE
 
 # gcc
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDERS_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
@@ -55,17 +56,15 @@ PREFERRED_VERSION_glibc ?= "2.5"
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
@@ -82,4 +81,4 @@ PREFERRED_VERSION_gpsd ?= "2.33"
 
 PREFERRED_VERSION_apt = "0.7.6"
 PREFERRED_VERSION_gpsd ?= "2.33"
-PREFERRED_VERSION_hal_nokia770 = "0.5.7"
\ No newline at end of file
+PREFERRED_VERSION_hal_nokia770 = "0.5.7"
============================================================
--- conf/distro/minimal.conf	bd599ccea87a555d1025fc9d422556bb405c21d9
+++ conf/distro/minimal.conf	daf53521710448ae534d9c015c119c2543b37d0a
@@ -37,6 +37,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
 # Binutils & Compiler
 #
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 PREFERRED_PROVIDER_virtual/arm-linux-binutils = "binutils-cross"
@@ -61,11 +62,10 @@ PREFERRED_PROVIDER_virtual/libc = "glibc
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
+++ conf/distro/nylon.conf	7c6cb5856944ad2ee3fc41113898316d6749fd5a
@@ -17,6 +17,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 INHERIT += "linux-kernel-base"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
============================================================
--- conf/distro/openprotium.conf	c91df50d1b1b24f6a52eba1264c1e195813952dd
+++ conf/distro/openprotium.conf	097d78161ffbbcc47fe5b0e8c1749859d98dfc59
@@ -47,7 +47,6 @@ PREFERRED_VERSION_glibc		     = "2.6.1"
 PREFERRED_VERSION_gcc-cross-initial ?= "4.1.2"
 
 PREFERRED_VERSION_glibc		     = "2.6.1"
-PREFERRED_VERSION_glibc-intermediate = "2.6.1"
 PREFERRED_VERSION_glibc-initial      = "2.6.1"
 
 PREFERRED_VERSION_linux-libc-headers = "2.6.11.1"
@@ -59,11 +58,12 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
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
+++ conf/distro/oplinux-uclibc.conf	6535d97b4b048850feda85f2e417dcb5c83b6d18
@@ -43,6 +43,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 # Binutils & Compiler
 #
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
============================================================
--- conf/distro/oplinux.conf	0dbc9a811a5f426f5d3e4ead5a20330b56e51e41
+++ conf/distro/oplinux.conf	cc1ebc8e8f1d1ee5b614698053ca46d139be9ed7
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
 
 
 
@@ -96,7 +97,6 @@ PREFERRED_VERSION_glibc-initial ?= "2.5"
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
--- conf/distro/unslung.conf	0ef6d906a67568b77e1f68fc1ac5c65f65586c67
+++ conf/distro/unslung.conf	e482d634afd26f12871e55a0ec8caa4bc7bd70ac
@@ -42,6 +42,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 
 # Select between multiple alternative providers, if more than one is eligible.
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
============================================================
--- conf/distro/wrt54oe.conf	9d556281a94a6474ec9b7e6edffabcecd876b083
+++ conf/distro/wrt54oe.conf	1253df366c87e03cae180335a881c1f9bd08b4e7
@@ -14,6 +14,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGE
 TARGET_OS = "linux-uclibc"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
+PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
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
+++ packages/uclibc/uclibc-initial_0.9.26.bb	87152e05358bc4ae69665b334c5965435f72285d
@@ -3,7 +3,7 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
@@ -11,12 +11,18 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
 		RUNTIME_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc-initial_0.9.27.bb	4add23305e16ae6d0973c44aae89b3f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.27.bb	f5c365faad4564b4e89f07778573e5722ee8267b
@@ -3,7 +3,7 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
@@ -11,12 +11,19 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
 		RUNTIME_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
+	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so
+
 }
 
 do_install() {
============================================================
--- packages/uclibc/uclibc-initial_0.9.28.bb	4add23305e16ae6d0973c44aae89b3f01d0f5bf8
+++ packages/uclibc/uclibc-initial_0.9.28.bb	f5c365faad4564b4e89f07778573e5722ee8267b
@@ -3,7 +3,7 @@ FILESPATH = "${@base_set_filespath([ '${
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-DEPENDS = "linux-libc-headers"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 PACKAGES = ""
 
@@ -11,12 +11,19 @@ do_stage() {
 	# Install initial headers into the cross dir
 	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
 		RUNTIME_PREFIX=${UCLIBC_STAGING_PREFIX}/ \
-		pregen install_dev
+		install_headers
+	make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
 
 	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
 	# This conflicts with the c++ version of this header
 	rm -f ${UCLIBC_STAGING_PREFIX}/include/bits/atomicity.h
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

--------------000802030001070807020802--
