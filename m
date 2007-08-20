Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IN5Vo-00007u-42
	for openembedded-devel@openembedded.org; Mon, 20 Aug 2007 13:33:36 +0200
Received: (qmail 22790 invoked by uid 813007); 20 Aug 2007 11:32:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Aug 2007 11:32:41 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2007 13:32:28 +0200
User-Agent: KMail/1.9.7
References: <E1IIPXa-0005bT-C3@linuxtogo.org>
	<1186499800.5653.62.camel@localhost.localdomain>
In-Reply-To: <1186499800.5653.62.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200708201332.29985.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev linux 2.6.22: Alix boards use bzImage	kernels
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2007 11:33:36 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 7 sierpnia 2007, Richard Purdie napisa=B3:
> On Tue, 2007-08-07 at 15:56 +0200, hrw commit wrote:
> > packages/linux/linux.inc	86d436757b3b9cb61a1a381d76950ef21596b40c
> > +++ packages/linux/linux.inc	a948d889b8d420c7a04eb140caaa353601fa7722
> > @@ -11,6 +11,7 @@ inherit kernel
> >
> >  inherit kernel
> >
> > +KERNEL_IMAGETYPE_alix =3D "bzImage"
> >  KERNEL_IMAGETYPE_progear =3D "bzImage"
> >  KERNEL_IMAGETYPE_simpad =3D "zImage"
> >  KERNEL_IMAGETYPE_kb9202 =3D "uImage"
>
> Should these not really go into the machine.conf files?

Right - I looked at it and prepared patch. It removes=20
KERNEL_IMAGETYPE =3D "zImage" entries from kernel recipes and also sets
this variable into bzImage for x86 machines which already use that type
of kernels. Rest of machines are untouched (yet) - I can convert them if
we reach consensus about it.

Please review and comment.

#
# old_revision [2940479bcfd956eef260cc704db455cc804377b8]
#
# patch "conf/machine/alix.conf"
#  from [76cc73f8bf7af8542d445c5d919516e000352bb2]
#    to [6ac777208694aa9b00784052d5baca787f429532]
#=20
# patch "conf/machine/epia.conf"
#  from [641965dd32edeeb4a10890be1b0bc3339fe13559]
#    to [b9d513ffac950087fa7ca9ed84684b6186b32006]
#=20
# patch "conf/machine/geodegx.conf"
#  from [5e1cc5910b747a31bf87753033236a9d383249a7]
#    to [444f8e041fee062b1341f33d482b9e8283d8f612]
#=20
# patch "conf/machine/geodelx.conf"
#  from [bb33a4392a78a281646a05e283d68c64bdca7024]
#    to [aa16341564f7ffa56c1ca89a603a1f1a6b15efd2]
#=20
# patch "conf/machine/guinness.conf"
#  from [83ad2351ae9b942f6123ebaa254deff0ea2ecdce]
#    to [a0afdf0c7e1609a6ccdc964544650fb1848ec71d]
#=20
# patch "conf/machine/i586-generic.conf"
#  from [9ade4b2570050666438641b4db85710e2d9ec721]
#    to [c5fd72db431ef2ed503db0c88c5b22e788be90bd]
#=20
# patch "conf/machine/i686-generic.conf"
#  from [0c20422ac9dbb45e4ed402a12f60f084001e1950]
#    to [669fc531794bbc10ec2d56acd9c276fa190eb66f]
#=20
# patch "conf/machine/netvista.conf"
#  from [9156f4e8eef6278994d8a65b98af005cc02ce8c3]
#    to [5fa034197f2e35cab1099297e0461c05d84a1401]
#=20
# patch "conf/machine/progear.conf"
#  from [f90862448b84e7a6b56bc57d0fdbff0c74afb962]
#    to [22e49b5432e36f46f19bdb061e0226cda4016d6c]
#=20
# patch "conf/machine/wrap.conf"
#  from [395efcd512a7f26154822bf1fccb616d13530b41]
#    to [7364205fdb720403971f54dc88bc58479794a3a2]
#=20
# patch "conf/machine/x86.conf"
#  from [b21f06ca6ceca10e06c6a04b1468646cee2ab1ed]
#    to [fd2741fa548e1bd37870753be26d6fdbf6a1c609]
#=20
# patch "packages/linux/compulab-pxa270_2.6.16.bb"
#  from [aa641b64bcb45bd089254790a8c5e4761f3d34cd]
#    to [0c6af5bfc65c32891fcb4178365c351daae00104]
#=20
# patch "packages/linux/compulab-pxa270_2.6.22.bb"
#  from [1bdb034c9f1a50b53b64d34bec8b58051d785b39]
#    to [5ebc3263cfaa5a0c4ad824cad9c7edf5b0ada3e8]
#=20
# patch "packages/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb"
#  from [dcd35fc04c8610d3401b02f9fceb83aba1bc7af5]
#    to [1b6e37dd7b8a233d87a5541a13384e0b92f09551]
#=20
# patch "packages/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb"
#  from [e1963406fa064a6a1e03de76279a0d8a5b0a4d18]
#    to [a452af7d69c3d884966354e28c8547c6bcb16b6b]
#=20
# patch "packages/linux/gumstix_2.6.5-gnalm1-gum0.bb"
#  from [87f733f6a1faf24ee781daaaca1bd22630c3983a]
#    to [fdc1fc004816ab2ba19c67c750089f372b1b79d6]
#=20
# patch "packages/linux/ixp4xx-kernel.inc"
#  from [5df5d3d8b85636bea02f6cffa26e60e0ef7a3395]
#    to [b22efce3723a42731a6940b02489811fb8a36033]
#=20
# patch "packages/linux/linux-bast_2.4.25-vrs1-bast1.bb"
#  from [faece28efc9c896b9809dfacdabb4a939cf68a1c]
#    to [df048a34175cab1b8c85c6245f75d98d956c7cea]
#=20
# patch "packages/linux/linux-dht-walnut_2.6.20.bb"
#  from [f23c8800451f8371e22b01fd97f62d7bc93b9c4a]
#    to [62bdf8a25e2c69fa6d78f11a236567cc8e3205ea]
#=20
# patch "packages/linux/linux-efika_2.6.18+2.6.19-rc6.bb"
#  from [26c6ea4ead01ea2614688932a93b68c6215afdac]
#    to [9854e7470109cece86c7335b8261fa4a6c33df31]
#=20
# patch "packages/linux/linux-efika_2.6.20.11.bb"
#  from [be89150b4d46aed07ccd431fe8c4963bef2deba2]
#    to [53022093ad12a60cc0933f2a6810354444e127ba]
#=20
# patch "packages/linux/linux-efika_2.6.20.bb"
#  from [d3982290372da2fd491b19ad60ebd0d5c7121940]
#    to [3d646a13d61ed36e48613a5d62ae4c153c42616e]
#=20
# patch "packages/linux/linux-efika_2.6.21+git.bb"
#  from [ac553b761959b48ae473369a31200d64d21b8bc1]
#    to [b07652616db0ca693ab942e5d21576b84f04e3e9]
#=20
# patch "packages/linux/linux-epia_2.6.11.bb"
#  from [903103f0ec8d78b208a8660071f47ec2baf873f5]
#    to [93e75918088864b7f04aca262d615924e10a2833]
#=20
# patch "packages/linux/linux-epia_2.6.12.bb"
#  from [903103f0ec8d78b208a8660071f47ec2baf873f5]
#    to [93e75918088864b7f04aca262d615924e10a2833]
#=20
# patch "packages/linux/linux-epia_2.6.19.2.bb"
#  from [d1c3796fe52187e52ff416e1d81febd760d7346e]
#    to [c84d3200e46f529c77d4c00bd469fd83108d5b99]
#=20
# patch "packages/linux/linux-epia_2.6.8.1.bb"
#  from [14f1634043c8b7c1bca6c32092bf7852f4e3e1bb]
#    to [bdc528707a6e7d014e266824d5c4d1687d85335a]
#=20
# patch "packages/linux/linux-geodegx_2.4.24.bb"
#  from [0f8264df74e53af065156b9188da82b8c7e2bc88]
#    to [4dcd1289300ea012a8a58e81c2327f6488b8711c]
#=20
# patch "packages/linux/linux-geodelx_2.6.11.bb"
#  from [f4d7f194aba34c9e9821faca92f46ee79cc0a1ee]
#    to [3c040c734a2e18dcf441027c590fb3f91ced1c97]
#=20
# patch "packages/linux/linux-jlime-jornada6xx_2.6.11.bb"
#  from [af7ddf2a65542bb32bcb4691213b37d5ba6eb1dc]
#    to [e5690ef11fcf56b6afea05914a8d0cc43fdd8ddd]
#=20
# patch "packages/linux/linux-jlime-jornada6xx_2.6.17.bb"
#  from [fede3cfe1e098ea6500541a69e670e1b3cd14334]
#    to [1812cd357f386bde56fd123ad05f999bfbfc523f]
#=20
# patch "packages/linux/linux-jlime-jornada6xx_2.6.21rc5.bb"
#  from [01422f4f26a644bed8747acc10c7d4d714ffeb36]
#    to [d8e50205bd984595d687ef8c1029648c350148b2]
#=20
# patch "packages/linux/linux-jlime-jornada7xx_2.6.17.bb"
#  from [3a1791a967a683726c05fac49fb7c14f160a700f]
#    to [118cea8f14b2829631e191683adac8664625d2dc]
#=20
# patch "packages/linux/linux-jlime-jornada7xx_2.6.18.bb"
#  from [ff55a9efa019d3d8e21af011e07ee01100b91848]
#    to [90de1d3f21ac6715b8d8969408329c528a928370]
#=20
# patch "packages/linux/linux-jlime-jornada7xx_2.6.19rc6.bb"
#  from [3959ca27f5a06b424f0bb1f9a59522912c2eb7c4]
#    to [6677636ce3a207ec5a71b92b00c6a6b00c6164e3]
#=20
# patch "packages/linux/linux-ks8695_2.6.16.bb"
#  from [88d34854638d1b8af246b4fb121a7dabe93f1e68]
#    to [e5f8049819e2048b2ea04c0f1163f86c9d33187e]
#=20
# patch "packages/linux/linux-magicbox_2.6.18.6.bb"
#  from [36f1edd7d1aeb89d96beb3deeab687c7fce9d186]
#    to [2863c6191e6edd688014663327d3b35bfd47e9ea]
#=20
# patch "packages/linux/linux-magicbox_2.6.19.2.bb"
#  from [05dda399b21a75a6c9d941f43fac2a79cbde0ed3]
#    to [b03c2ca7543c5914973b54ef5b3ea159fbef77ed]
#=20
# patch "packages/linux/linux-navman_2.6.18.bb"
#  from [6699ef3cc099f09038308c948fd95a1ad4dff05a]
#    to [170d50b807364f5b39aaf8a74d85700e2d5ef059]
#=20
# patch "packages/linux/linux-smdk2440_2.6.20+git.bb"
#  from [18356541f23103914af0a85b4f7fa0aa4b86be62]
#    to [c6bddc2c20ea68b01d4e8457000fdb982a675840]
#=20
# patch "packages/linux/linux-smdk2443_2.6.20+git.bb"
#  from [c27379189e17f0ff7e634ba08b7076848bbe8924]
#    to [43c2952116b3749fac68666c3f67f36bf48154fe]
#=20
# patch "packages/linux/linux-titan-sh4_2.6.21.bb"
#  from [e75fe7d65a0714c1b8a9f6739c3f014b837f5d5e]
#    to [6fefbc4900cda6b0514fd2a743a6e165079f97e3]
#=20
# patch "packages/linux/linux-wrap-geode_2.6.17.bb"
#  from [4f19f4bd6b8a65202b6cf9f5c9d9432abd812843]
#    to [1019b36ade3b6c60f90d75052adcaf855a84cf1e]
#=20
# patch "packages/linux/linux-wrt_2.4.20.bb"
#  from [bddab456f7d0a6cc9beb1b053e0262d1beb250e4]
#    to [ce82a3361914a1863ec5646e35eb6492f5babb69]
#=20
# patch "packages/linux/linux-wrt_2.4.30.bb"
#  from [b8aa4db419b43497fbc60f270fe96bf5c378ba29]
#    to [fe9df0285b627d50369b865bce0ec5e3c3756664]
#=20
# patch "packages/linux/linux-x86_2.6.17.9.bb"
#  from [fd8dcd3d6f94f7678520d2e58dfcdc840f519383]
#    to [d9e906c9c879542774e10ad7ffa98e7efd2aff28]
#=20
# patch "packages/linux/linux-x86_2.6.20.bb"
#  from [3d74ce752eaf5a8499ddde36a0737d0fd00be798]
#    to [51976b5e538dd765ee4a066c915c690bd1869f13]
#=20
# patch "packages/linux/linux-z_2.6.20.bb"
#  from [9328ed9184d55acca2eb8706c5c5269a50db4c18]
#    to [ccf3caf757e0af9ff958e12378d47c28314dd53a]
#=20
# patch "packages/linux/linux_2.6.14.bb"
#  from [5f4838349e488f7892c5923ac0b8a867dd363d0e]
#    to [b82a29e8d88496dc90966389ceb094a394c9afcf]
#=20
# patch "packages/linux/logicpd-pxa270_2.6.17-rc5.bb"
#  from [3bd76ea4a1dfbbacb419d79f9dc40e4435ef7975]
#    to [9fab46f9b5a54dc6a7f752e4fefaff2e81d1f54d]
#=20
# patch "packages/linux/logicpd-pxa270_2.6.19.2.bb"
#  from [f4207e81635c59f6a4f04f0ea09683fef6ed465d]
#    to [3e9ccae6c92fe9092727de6d7d781be339abbb88]
#=20
# patch "packages/linux/mainstone-kernel_2.6.11.bb"
#  from [3acf3eec7603bddb52b95b3b47ffe7213a53761b]
#    to [d5a9b182d8e86b8f4b7b579cdfcfe40bf7616703]
#=20
# patch "packages/linux/mainstone-kernel_2.6.18.bb"
#  from [6b8c146d01ed8d62508ecbafffdd9f60c5991534]
#    to [76dd39cb1faf78b2f6fd5770e7aba9d18413bf23]
#=20
# patch "packages/linux/mx21ads-kernel_2.6.19rc6.bb"
#  from [77fadc2dc3f30fb6620948536b9602e884556195]
#    to [eb89e283bb375e8deefb9398a9f77334e4b32a4d]
#=20
# patch "packages/linux/mx31ads-kernel_2.6.19rc6.bb"
#  from [717a846d8445eaa78401ae66b0426d3f3bbf7e37]
#    to [3c6294ce239293d9c65f68e973f7ea4a89f122aa]
#=20
# patch "packages/linux/netbook-pro-kernel_2.6.17.bb"
#  from [9f5625d59ad0b17c2102d8b094c980839c691827]
#    to [adcec4915e8ffc89681f8dd32ddca0cbcaed2d47]
#=20
# patch "packages/linux/triton-kernel_2.6.11.bb"
#  from [113a96e8e2dcc8fe143af2ad0feb6c53179f1ebc]
#    to [5c76121264ec80611a8d410d965dadb3d129cee5]
#=20
# patch "packages/linux/unslung-kernel_2.4.22.l2.3r63.bb"
#  from [f75223758a267c3ed4d7b73bcb5deb2688268664]
#    to [3cf3e65980ff2941b1b15dd46f53d088a8f88462]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/alix.conf	76cc73f8bf7af8542d445c5d919516e000352bb2
+++ conf/machine/alix.conf	6ac777208694aa9b00784052d5baca787f429532
@@ -22,3 +22,5 @@ MACHINE_EXTRA_RRECOMMENDS =3D "\
 MACHINE_EXTRA_RRECOMMENDS =3D "\
 	kernel-modules \
 	"
+
+KERNEL_IMAGETYPE =3D "bzImage"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/epia.conf	641965dd32edeeb4a10890be1b0bc3339fe13559
+++ conf/machine/epia.conf	b9d513ffac950087fa7ca9ed84684b6186b32006
@@ -5,6 +5,7 @@ OLDEST_KERNEL =3D "2.6.5"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-epia"
 OLDEST_KERNEL =3D "2.6.5"
+KERNEL_IMAGETYPE =3D "bzImage"
=20
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/geodegx.conf	5e1cc5910b747a31bf87753033236a9d383249a7
+++ conf/machine/geodegx.conf	444f8e041fee062b1341f33d482b9e8283d8f612
@@ -8,3 +8,5 @@ udevdir =3D "/dev"
 BOOTSTRAP_EXTRA_RDEPENDS =3D "kernel pciutils udev kernel-modules"
=20
 udevdir =3D "/dev"
+
+KERNEL_IMAGETYPE =3D "bzImage"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/geodelx.conf	bb33a4392a78a281646a05e283d68c64bdca7024
+++ conf/machine/geodelx.conf	aa16341564f7ffa56c1ca89a603a1f1a6b15efd2
@@ -5,3 +5,5 @@ SELECTED_OPTIMIZATION_glibc :=3D "${@'${SE
 PREFERRED_PROVIDER_virtual/kernel=3D"linux-geodelx"
=20
 SELECTED_OPTIMIZATION_glibc :=3D "${@'${SELECTED_OPTIMIZATION}'.replace('-=
fomit-frame-pointer', '')}"
+
+KERNEL_IMAGETYPE =3D "bzImage"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/guinness.conf	83ad2351ae9b942f6123ebaa254deff0ea2ecdce
+++ conf/machine/guinness.conf	a0afdf0c7e1609a6ccdc964544650fb1848ec71d
@@ -11,6 +11,8 @@ udevdir =3D "/dev"
=20
 udevdir =3D "/dev"
=20
+KERNEL_IMAGETYPE =3D "bzImage"
+
 OLDEST_KERNEL =3D "2.6.17"
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/i586-generic.conf	9ade4b2570050666438641b4db85710e2d9ec7=
21
+++ conf/machine/i586-generic.conf	c5fd72db431ef2ed503db0c88c5b22e788be90bd
@@ -12,6 +12,8 @@ OLDEST_KERNEL =3D "2.6.18"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
 OLDEST_KERNEL =3D "2.6.18"
=20
+KERNEL_IMAGETYPE =3D "bzImage"
+
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/i686-generic.conf	0c20422ac9dbb45e4ed402a12f60f084001e19=
50
+++ conf/machine/i686-generic.conf	669fc531794bbc10ec2d56acd9c276fa190eb66f
@@ -11,6 +11,8 @@ OLDEST_KERNEL =3D "2.6.20"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
 OLDEST_KERNEL =3D "2.6.20"
=20
+KERNEL_IMAGETYPE =3D "bzImage"
+
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/netvista.conf	9156f4e8eef6278994d8a65b98af005cc02ce8c3
+++ conf/machine/netvista.conf	5fa034197f2e35cab1099297e0461c05d84a1401
@@ -9,6 +9,8 @@ XSERVER =3D "xserver-kdrive-vesa"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
 XSERVER =3D "xserver-kdrive-vesa"
=20
+KERNEL_IMAGETYPE =3D "bzImage"
+
 # todo: convert to task-base
 # BOOTSTRAP_EXTRA_RDEPENDS =3D "kernel pciutils udev kernel-modules"
 MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/progear.conf	f90862448b84e7a6b56bc57d0fdbff0c74afb962
+++ conf/machine/progear.conf	22e49b5432e36f46f19bdb061e0226cda4016d6c
@@ -9,6 +9,8 @@ PREFERRED_PROVIDER_virtual/xserver =3D "xs
 PREFERRED_PROVIDER_virtual/kernel =3D "linux"
 PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
=20
+KERNEL_IMAGETYPE =3D "bzImage"
+
 OLDEST_KERNEL =3D "2.6.17"
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/wrap.conf	395efcd512a7f26154822bf1fccb616d13530b41
+++ conf/machine/wrap.conf	7364205fdb720403971f54dc88bc58479794a3a2
@@ -32,3 +32,5 @@ GLIBC_EXTRA_OECONF =3D "--with-tls"
 # glibc
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
+
+KERNEL_IMAGETYPE =3D "bzImage"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- conf/machine/x86.conf	b21f06ca6ceca10e06c6a04b1468646cee2ab1ed
+++ conf/machine/x86.conf	fd2741fa548e1bd37870753be26d6fdbf6a1c609
@@ -7,6 +7,8 @@ PREFERRED_PROVIDER_virtual/kernel =3D "lin
 # TARGET_VENDOR =3D "-oe"
 PACKAGE_EXTRA_ARCHS =3D "x86"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-x86"
+
+KERNEL_IMAGETYPE =3D "bzImage"
 # todo: convert to task-base
 # BOOTSTRAP_EXTRA_RDEPENDS =3D "kernel pciutils udev kernel-modules"
 MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/compulab-pxa270_2.6.16.bb	aa641b64bcb45bd089254790a8c5=
e4761f3d34cd
+++ packages/linux/compulab-pxa270_2.6.16.bb	0c6af5bfc65c32891fcb4178365c35=
1daae00104
@@ -23,7 +23,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 FILES_kernel-image =3D ""
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/compulab-pxa270_2.6.22.bb	1bdb034c9f1a50b53b64d34bec8b=
58051d785b39
+++ packages/linux/compulab-pxa270_2.6.22.bb	5ebc3263cfaa5a0c4ad824cad9c7ed=
f5b0ada3e8
@@ -34,7 +34,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 FILES_kernel-image =3D ""
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb	dcd35fc04c8610d3401=
b02f9fceb83aba1bc7af5
+++ packages/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb	1b6e37dd7b8a233d87a55=
41a13384e0b92f09551
@@ -16,7 +16,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb	e1963406fa064a6a1e0=
3de76279a0d8a5b0a4d18
+++ packages/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb	a452af7d69c3d88496635=
4e28c8547c6bcb16b6b
@@ -15,7 +15,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/gumstix_2.6.5-gnalm1-gum0.bb	87f733f6a1faf24ee781daaac=
a1bd22630c3983a
+++ packages/linux/gumstix_2.6.5-gnalm1-gum0.bb	fdc1fc004816ab2ba19c67c7500=
89f372b1b79d6
@@ -16,7 +16,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config || die "no default conf=
iguration for ${MACHINE} available."
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/ixp4xx-kernel.inc	5df5d3d8b85636bea02f6cffa26e60e0ef7a=
3395
+++ packages/linux/ixp4xx-kernel.inc	b22efce3723a42731a6940b02489811fb8a360=
33
@@ -156,7 +156,6 @@ ARCH =3D "arm"
 inherit kernel
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 # To specify the console set KERNEL_CONSOLE in the .bb file.
 # CMDLINE_ROOT contains the boot options, these will be
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-bast_2.4.25-vrs1-bast1.bb	faece28efc9c896b9809df=
acdabb4a939cf68a1c
+++ packages/linux/linux-bast_2.4.25-vrs1-bast1.bb	df048a34175cab1b8c85c624=
5f75d98d956c7cea
@@ -16,7 +16,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure_prepend() {
 	cp ${WORKDIR}/defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-dht-walnut_2.6.20.bb	f23c8800451f8371e22b01fd97f=
62d7bc93b9c4a
+++ packages/linux/linux-dht-walnut_2.6.20.bb	62bdf8a25e2c69fa6d78f11a23656=
7cc8e3205ea
@@ -21,7 +21,6 @@ ARCH =3D "ppc"
=20
 export OS =3D "Linux"
 ARCH =3D "ppc"
=2DKERNEL_IMAGETYPE =3D "zImage"
 KERNEL_OUTPUT =3D "arch/ppc/boot/images/zImage.elf"
=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-efika_2.6.18+2.6.19-rc6.bb	26c6ea4ead01ea2614688=
932a93b68c6215afdac
+++ packages/linux/linux-efika_2.6.18+2.6.19-rc6.bb	9854e7470109cece86c7335=
b8261fa4a6c33df31
@@ -19,7 +19,6 @@ export ARCH=3D"powerpc"
=20
 export ARCH=3D"powerpc"
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure() {
 		install -m 644 ${WORKDIR}/defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-efika_2.6.20.11.bb	be89150b4d46aed07ccd431fe8c49=
63bef2deba2
+++ packages/linux/linux-efika_2.6.20.11.bb	53022093ad12a60cc0933f2a6810354=
444e127ba
@@ -53,7 +53,6 @@ export ARCH=3D"powerpc"
=20
 export ARCH=3D"powerpc"
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure() {
 		install -m 644 ${WORKDIR}/defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-efika_2.6.20.bb	d3982290372da2fd491b19ad60ebd0d5=
c7121940
+++ packages/linux/linux-efika_2.6.20.bb	3d646a13d61ed36e48613a5d62ae4c153c=
42616e
@@ -50,7 +50,6 @@ export ARCH=3D"powerpc"
=20
 export ARCH=3D"powerpc"
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure() {
 		install -m 644 ${WORKDIR}/defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-efika_2.6.21+git.bb	ac553b761959b48ae473369a3120=
0d64d21b8bc1
+++ packages/linux/linux-efika_2.6.21+git.bb	b07652616db0ca693ab942e5d21576=
b84f04e3e9
@@ -16,7 +16,6 @@ export ARCH=3D"powerpc"
=20
 export ARCH=3D"powerpc"
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_fetch () {
 	cd ${WORKDIR}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-epia_2.6.11.bb	903103f0ec8d78b208a8660071f47ec2b=
af873f5
+++ packages/linux/linux-epia_2.6.11.bb	93e75918088864b7f04aca262d615924e10=
a2833
@@ -15,7 +15,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 # Don't want kernel in rootfs
 FILES_kernel =3D ""
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-epia_2.6.12.bb	903103f0ec8d78b208a8660071f47ec2b=
af873f5
+++ packages/linux/linux-epia_2.6.12.bb	93e75918088864b7f04aca262d615924e10=
a2833
@@ -15,7 +15,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 # Don't want kernel in rootfs
 FILES_kernel =3D ""
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-epia_2.6.19.2.bb	d1c3796fe52187e52ff416e1d81febd=
760d7346e
+++ packages/linux/linux-epia_2.6.19.2.bb	c84d3200e46f529c77d4c00bd469fd831=
08d5b99
@@ -14,7 +14,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 # Don't want kernel in rootfs
 FILES_kernel =3D ""
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-epia_2.6.8.1.bb	14f1634043c8b7c1bca6c32092bf7852=
f4e3e1bb
+++ packages/linux/linux-epia_2.6.8.1.bb	bdc528707a6e7d014e266824d5c4d1687d=
85335a
@@ -14,7 +14,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 # Don't want kernel in rootfs
 FILES_kernel =3D ""
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-geodegx_2.4.24.bb	0f8264df74e53af065156b9188da82=
b8c7e2bc88
+++ packages/linux/linux-geodegx_2.4.24.bb	4dcd1289300ea012a8a58e81c2327f64=
88b8711c
@@ -19,7 +19,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-geodelx_2.6.11.bb	f4d7f194aba34c9e9821faca92f46e=
e79cc0a1ee
+++ packages/linux/linux-geodelx_2.6.11.bb	3c040c734a2e18dcf441027c590fb3f9=
1ced1c97
@@ -19,7 +19,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${KV}.tar.bz2=
 \
 	http://www.amd.com/files/connectivitysolutions/geode/geode_lx/${AMD_DRIVE=
R_LABEL}.patch;patch=3D1 \
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-jlime-jornada6xx_2.6.11.bb	af7ddf2a65542bb32bcb4=
691213b37d5ba6eb1dc
+++ packages/linux/linux-jlime-jornada6xx_2.6.11.bb	e5690ef11fcf56b6afea059=
14a8d0cc43fdd8ddd
@@ -15,7 +15,6 @@ ARCH =3D "sh"
 inherit kernel
=20
 ARCH =3D "sh"
=2DKERNEL_IMAGETYPE =3D "zImage"
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-jlime-jornada6xx_2.6.17.bb	fede3cfe1e098ea650054=
1a69e670e1b3cd14334
+++ packages/linux/linux-jlime-jornada6xx_2.6.17.bb	1812cd357f386bde56fd123=
ad05f999bfbfc523f
@@ -22,7 +22,6 @@ ARCH =3D "sh"
 KERNEL_CCSUFFIX =3D "-3.4.4"
=20
 ARCH =3D "sh"
=2DKERNEL_IMAGETYPE =3D "zImage"
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-jlime-jornada6xx_2.6.21rc5.bb	01422f4f26a644bed8=
747acc10c7d4d714ffeb36
+++ packages/linux/linux-jlime-jornada6xx_2.6.21rc5.bb	d8e50205bd984595d687=
ef8c1029648c350148b2
@@ -20,7 +20,6 @@ ARCH =3D "sh"
 KERNEL_CCSUFFIX =3D "-3.4.4"
=20
 ARCH =3D "sh"
=2DKERNEL_IMAGETYPE =3D "zImage"
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-jlime-jornada7xx_2.6.17.bb	3a1791a967a683726c05f=
ac49fb7c14f160a700f
+++ packages/linux/linux-jlime-jornada7xx_2.6.17.bb	118cea8f14b2829631e1916=
83adac8664625d2dc
@@ -30,7 +30,6 @@ ARCH =3D "arm"
 KERNEL_CCSUFFIX =3D "-3.4.4"
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-jlime-jornada7xx_2.6.18.bb	ff55a9efa019d3d8e21af=
011e07ee01100b91848
+++ packages/linux/linux-jlime-jornada7xx_2.6.18.bb	90de1d3f21ac6715b8d8969=
408329c528a928370
@@ -18,7 +18,6 @@ ARCH =3D "arm"
 KERNEL_CCSUFFIX =3D "-3.4.4"
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-jlime-jornada7xx_2.6.19rc6.bb	3959ca27f5a06b424f=
0bb1f9a59522912c2eb7c4
+++ packages/linux/linux-jlime-jornada7xx_2.6.19rc6.bb	6677636ce3a207ec5a71=
b92b00c6a6b00c6164e3
@@ -19,7 +19,6 @@ ARCH =3D "arm"
 KERNEL_CCSUFFIX =3D "-3.4.4"
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-ks8695_2.6.16.bb	88d34854638d1b8af246b4fb121a7da=
be93f1e68
+++ packages/linux/linux-ks8695_2.6.16.bb	e5f8049819e2048b2ea04c0f1163f86c9=
d33187e
@@ -17,7 +17,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 CMDLINE =3D "ttyS0,115200n8 root=3D/dev/mtdblock2 init=3D/linuxrc"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-magicbox_2.6.18.6.bb	36f1edd7d1aeb89d96beb3deeab=
687c7fce9d186
+++ packages/linux/linux-magicbox_2.6.18.6.bb	2863c6191e6edd688014663327d3b=
35bfd47e9ea
@@ -30,7 +30,6 @@ ARCH =3D "ppc"
=20
 export OS =3D "Linux"
 ARCH =3D "ppc"
=2DKERNEL_IMAGETYPE =3D "zImage"
 KERNEL_OUTPUT =3D "arch/ppc/boot/images/zImage.elf"
=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-magicbox_2.6.19.2.bb	05dda399b21a75a6c9d941f43fa=
c2a79cbde0ed3
+++ packages/linux/linux-magicbox_2.6.19.2.bb	b03c2ca7543c5914973b54ef5b3ea=
159fbef77ed
@@ -63,7 +63,6 @@ ARCH =3D "ppc"
=20
 export OS =3D "Linux"
 ARCH =3D "ppc"
=2DKERNEL_IMAGETYPE =3D "zImage"
 KERNEL_OUTPUT =3D "arch/ppc/boot/images/zImage.elf"
=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-navman_2.6.18.bb	6699ef3cc099f09038308c948fd95a1=
ad4dff05a
+++ packages/linux/linux-navman_2.6.18.bb	170d50b807364f5b39aaf8a74d85700e2=
d5ef059
@@ -17,7 +17,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure() {
         rm -f ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-smdk2440_2.6.20+git.bb	18356541f23103914af0a85b4=
f7fa0aa4b86be62
+++ packages/linux/linux-smdk2440_2.6.20+git.bb	c6bddc2c20ea68b01d4e8457000=
fdb982a675840
@@ -15,7 +15,6 @@ COMPATIBLE_MACHINE =3D "smdk2440"
=20
 COMPATIBLE_HOST =3D "arm.*-linux"
 COMPATIBLE_MACHINE =3D "smdk2440"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure() {
 	install ${WORKDIR}/defconfig-smdk2440 ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-smdk2443_2.6.20+git.bb	c27379189e17f0ff7e634ba08=
b7076848bbe8924
+++ packages/linux/linux-smdk2443_2.6.20+git.bb	43c2952116b3749fac68666c3f6=
7f36bf48154fe
@@ -25,7 +25,6 @@ COMPATIBLE_MACHINE =3D "smdk2443"
=20
 COMPATIBLE_HOST =3D "arm.*-linux"
 COMPATIBLE_MACHINE =3D "smdk2443"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 do_configure() {
 	install ${WORKDIR}/defconfig-smdk2443 ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-titan-sh4_2.6.21.bb	e75fe7d65a0714c1b8a9f6739c3f=
014b837f5d5e
+++ packages/linux/linux-titan-sh4_2.6.21.bb	6fefbc4900cda6b0514fd2a743a6e1=
65079f97e3
@@ -16,7 +16,6 @@ ARCH =3D "sh"
 inherit kernel
=20
 ARCH =3D "sh"
=2DKERNEL_IMAGETYPE =3D "zImage"
 KERNEL_OUTPUT =3D "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
=20
 #
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-wrap-geode_2.6.17.bb	4f19f4bd6b8a65202b6cf9f5c9d=
9432abd812843
+++ packages/linux/linux-wrap-geode_2.6.17.bb	1019b36ade3b6c60f90d75052adca=
f855a84cf1e
@@ -14,7 +14,6 @@ ARCH =3D "i386"
 inherit kernel
=20
 ARCH =3D "i386"
=2DKERNEL_IMAGETYPE =3D "bzImage"
 KERNEL_OUTPUT =3D "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-wrt_2.4.20.bb	bddab456f7d0a6cc9beb1b053e0262d1be=
b250e4
+++ packages/linux/linux-wrt_2.4.20.bb	ce82a3361914a1863ec5646e35eb6492f5ba=
bb69
@@ -26,7 +26,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE ?=3D "zImage"
 CMDLINE_CONSOLE ?=3D "ttyS0,115200n8"
 CMDLINE_ROOT ?=3D "root=3D/dev/mtdblock2 noinitrd"
 # CMDLINE_INIT =3D "init=3D/bin/busybox ash"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-wrt_2.4.30.bb	b8aa4db419b43497fbc60f270fe96bf5c3=
78ba29
+++ packages/linux/linux-wrt_2.4.30.bb	fe9df0285b627d50369b865bce0ec5e3c375=
6664
@@ -75,7 +75,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE ?=3D "zImage"
 KERNEL_OUTPUT =3D "arch/mips/brcm-boards/bcm947xx/compressed/piggy"
 CMDLINE =3D "root=3D/dev/mtdblock2 rootfstype=3Dsquashfs,jffs2 console=3Dt=
tyS0,115200"
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-x86_2.6.17.9.bb	fd8dcd3d6f94f7678520d2e58dfcdc84=
0f519383
+++ packages/linux/linux-x86_2.6.17.9.bb	d9e906c9c879542774e10ad7ffa98e7efd=
2aff28
@@ -11,7 +11,6 @@ COMPATIBLE_HOST =3D "i.86.*-linux"
 inherit kernel
=20
 COMPATIBLE_HOST =3D "i.86.*-linux"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-x86_2.6.20.bb	3d74ce752eaf5a8499ddde36a0737d0fd0=
0be798
+++ packages/linux/linux-x86_2.6.20.bb	51976b5e538dd765ee4a066c915c690bd186=
9f13
@@ -15,7 +15,6 @@ COMPATIBLE_HOST =3D "i.86.*-linux"
 inherit kernel
=20
 COMPATIBLE_HOST =3D "i.86.*-linux"
=2DKERNEL_IMAGETYPE =3D "bzImage"
=20
 do_configure_prepend_x86() {
 	install -m 0644 ${WORKDIR}/i486-defconfig ${S}/.config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-z_2.6.20.bb	9328ed9184d55acca2eb8706c5c5269a50db=
4c18
+++ packages/linux/linux-z_2.6.20.bb	ccf3caf757e0af9ff958e12378d47c28314dd5=
3a
@@ -15,7 +15,6 @@ COMPATIBLE_MACHINE =3D '(shark)'
 COMPATIBLE_MACHINE =3D '(shark)'
=20
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux_2.6.14.bb	5f4838349e488f7892c5923ac0b8a867dd363d=
0e
+++ packages/linux/linux_2.6.14.bb	b82a29e8d88496dc90966389ceb094a394c9afcf
@@ -42,10 +42,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "bzImage"
=2DKERNEL_IMAGETYPE_simpad =3D "zImage"
=2DKERNEL_IMAGETYPE_acern30 =3D "zImage"
=2D
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
 }
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/logicpd-pxa270_2.6.17-rc5.bb	3bd76ea4a1dfbbacb419d79f9=
dc40e4435ef7975
+++ packages/linux/logicpd-pxa270_2.6.17-rc5.bb	9fab46f9b5a54dc6a7f752e4fef=
aff2e81d1f54d
@@ -17,7 +17,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 FILES_kernel-image =3D ""
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/logicpd-pxa270_2.6.19.2.bb	f4207e81635c59f6a4f04f0ea09=
683fef6ed465d
+++ packages/linux/logicpd-pxa270_2.6.19.2.bb	3e9ccae6c92fe9092727de6d7d781=
be339abbb88
@@ -38,7 +38,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
 FILES_kernel-image =3D ""
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/mainstone-kernel_2.6.11.bb	3acf3eec7603bddb52b95b3b47f=
fe7213a53761b
+++ packages/linux/mainstone-kernel_2.6.11.bb	d5a9b182d8e86b8f4b7b579cdfcfe=
40bf7616703
@@ -14,7 +14,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 #CMDLINE_CONSOLE ?=3D "ttyS0,115200n8"
 #CMDLINE_ROOT =3D "root=3D/dev/slug rootfstype=3Dext2,jffs2 initrd=3D0x010=
00000,10M mem=3D32M@0x00000000"
 #CMDLINE_ROOT =3D "root=3D/dev/mtdblock4 rootfstype=3Djffs2 mem=3D32M@0x00=
000000"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/mainstone-kernel_2.6.18.bb	6b8c146d01ed8d62508ecbafffd=
d9f60c5991534
+++ packages/linux/mainstone-kernel_2.6.18.bb	76dd39cb1faf78b2f6fd5770e7aba=
9d18413bf23
@@ -14,7 +14,6 @@ ARCH =3D "arm"
 inherit package
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 #CMDLINE_CONSOLE ?=3D "ttyS0,115200n8"
 #CMDLINE_ROOT =3D "root=3D/dev/slug rootfstype=3Dext2,jffs2 initrd=3D0x010=
00000,10M mem=3D32M@0x00000000"
 #CMDLINE_ROOT =3D "root=3D/dev/mtdblock4 rootfstype=3Djffs2 mem=3D32M@0x00=
000000"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/mx21ads-kernel_2.6.19rc6.bb	77fadc2dc3f30fb6620948536b=
9602e884556195
+++ packages/linux/mx21ads-kernel_2.6.19rc6.bb	eb89e283bb375e8deefb9398a9f7=
7334e4b32a4d
@@ -18,7 +18,6 @@ ARCH =3D "arm"
 inherit kernel
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 RPROVIDES_kernel-image +=3D "hostap-modules"
=20
 #CMDLINE_ROOT =3D "root=3D/dev/mtdblock4 rootfstype=3Djffs2 mem=3D32M@0x00=
000000"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/mx31ads-kernel_2.6.19rc6.bb	717a846d8445eaa78401ae66b0=
426d3f3bbf7e37
+++ packages/linux/mx31ads-kernel_2.6.19rc6.bb	3c6294ce239293d9c65f68e973f7=
ea4a89f122aa
@@ -18,7 +18,6 @@ ARCH =3D "arm"
 inherit kernel
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 RPROVIDES_kernel-image +=3D "hostap-modules"
=20
 #CMDLINE_ROOT =3D "root=3D/dev/mtdblock4 rootfstype=3Djffs2 mem=3D32M@0x00=
000000"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/netbook-pro-kernel_2.6.17.bb	9f5625d59ad0b17c2102d8b09=
4c980839c691827
+++ packages/linux/netbook-pro-kernel_2.6.17.bb	adcec4915e8ffc89681f8dd32dd=
ca0cbcaed2d47
@@ -16,7 +16,6 @@ inherit kernel
=20
 inherit kernel
=20
=2DKERNEL_IMAGETYPE =3D "zImage"
=20
=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/triton-kernel_2.6.11.bb	113a96e8e2dcc8fe143af2ad0feb6c=
53179f1ebc
+++ packages/linux/triton-kernel_2.6.11.bb	5c76121264ec80611a8d410d965dadb3=
d129cee5
@@ -17,7 +17,6 @@ ARCH =3D "arm"
 inherit kernel
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 CMDLINE ?=3D "root=3D/dev/mtdblock2 rw rootfstype=3Djffs2 reboot=3D5"
=20
 do_configure_prepend() {
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/unslung-kernel_2.4.22.l2.3r63.bb	f75223758a267c3ed4d7b=
73bcb5deb2688268664
+++ packages/linux/unslung-kernel_2.4.22.l2.3r63.bb	3cf3e65980ff2941b1b15dd=
46f53d088a8f88462
@@ -38,7 +38,6 @@ ARCH =3D "arm"
 inherit kernel
=20
 ARCH =3D "arm"
=2DKERNEL_IMAGETYPE =3D "zImage"
 KERNEL_SUFFIX =3D "ixp4xxbe"
 CMDLINE_CONSOLE ?=3D "ttyS0,115200"
 CMDLINE_ROOT =3D "root=3D/dev/mtdblock4 rootfstype=3Djffs2 rw init=3D/linu=
xrc mem=3D32M@0x00000000"


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      Wyk=B3ad o podr=F3=BFach w czasie odb=EAdzie si=EA w zesz=B3y wtorek




