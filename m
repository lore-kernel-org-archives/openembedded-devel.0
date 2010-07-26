Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdUT2-0005Dg-Mj
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:40:09 +0200
Received: by ywe9 with SMTP id 9so489338ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kdUxWWuW/UJB9tDQ7PtFqaWqlz+rI1jjOBu/tWdQgU0=;
	b=FZBco8PkZmeckqSWP+U3a8ngcca4tS5DSHX1rjQ8K25QcM+5itzD53UEMpdYh/Symw
	q3YOLVsFtKJGQL46ZEpGgu+70sSOYu9dKNt8B/wu54xCwJfVKhO71OumA8PXhK/m1sEu
	dkC5krIIeQB61lJzW31Y3hTFVb7E/2BzMe9rw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=H5YhBSi126g27fdEKBFP79E9aCWRnKxwEgblAx2Yc/EJOVmo0GoFDRM86NR7CPZh4X
	8eZMBYpDhmo2zKQ6p7xwcDYABviS0F7lIyX4le2j0CrQasaxHvLCE51Pguw703SA7kaN
	48jdKh14kRl5JSPP3OizD7ziHo+4zYhg2b86I=
Received: by 10.101.10.22 with SMTP id n22mr8163871ani.224.1280176791189; Mon, 
	26 Jul 2010 13:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Mon, 26 Jul 2010 13:39:30 -0700 (PDT)
In-Reply-To: <i2kr8p$tsv$1@dough.gmane.org>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com> 
	<1280174528-27682-8-git-send-email-raj.khem@gmail.com>
	<i2kqgc$ql1$1@dough.gmane.org> 
	<AANLkTik5Jq0YOAh3kmDzFZ55681Q4Q7z13RnR8sX6tB3@mail.gmail.com> 
	<i2kr8p$tsv$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jul 2010 13:39:30 -0700
Message-ID: <AANLkTinYWkr3k4qCqQXm=Mvy=9Av8wpX2USesMEUC-2K@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/7] recipes: Replace usage of MULTIMACH_TARGET_SYS with TARGET_SYS
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
X-List-Received-Date: Mon, 26 Jul 2010 20:40:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2010 at 1:30 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-07-10 22:24, Khem Raj wrote:
>> On Mon, Jul 26, 2010 at 1:17 PM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>> Khem,
>>
>> What does '${TARGET_SYS}' expand to for machine specific recipes? The TI
>> tools need to go into sysroots/machine/, not sysroot/arch/ in the
>> current setup.
>>
>>> for qemuarm
>>
>>> TARGET_SYS=3D"arm-v5te_oe-linux-uclibceabi"
>>
>>> for beagleboard
>>
>>> TARGET_SYS=3D"arm-v7a_oe-linux-uclibceabi"
>
> Right, that won't work then, the TI recipes need to so into
> sysroots/beagleboard-foo-bar-baz/, not sysroots-v7a-bar-baz/.
>

ok I will use MACHINE_SYS for it then which will expand to
what you just mentioned above. Will that be ok ?

> regards,
>
> Koen
>
>>
>>
>>
>> regards,
>>
>> Koen
>>
>> On 26-07-10 22:02, Khem Raj wrote:
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> =A0recipes/gnuradio/gnuradio-libusb-compat.inc =A0 =A0 | =A0 =A02 +-
>>>>> =A0recipes/gnuradio/gnuradio.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A02 +-
>>>>> =A0recipes/opencv/opencv-dsp-acceleration_svn.bb =A0 | =A0 =A02 +-
>>>>> =A0recipes/ti/README =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A03 +-
>>>>> =A0recipes/ti/ti-paths.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 34 +++++++++++-----------
>>>>> =A0recipes/ti/ti-staging.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 --
>>>>> =A0recipes/xapian/xapian-bindings-python_1.0.14.bb | =A0 =A02 +-
>>>>> =A07 files changed, 22 insertions(+), 26 deletions(-)
>>>>>
>>>>> diff --git a/recipes/gnuradio/gnuradio-libusb-compat.inc b/recipes/gn=
uradio/gnuradio-libusb-compat.inc
>>>>> index efe2b88..aa4d41a 100644
>>>>> --- a/recipes/gnuradio/gnuradio-libusb-compat.inc
>>>>> +++ b/recipes/gnuradio/gnuradio-libusb-compat.inc
>>>>> @@ -8,7 +8,7 @@ INC_PR =3D "r7"
>>>>> =A0inherit distutils-base autotools autotools_stage pkgconfig
>>>>>
>>>>> =A0export BUILD_SYS
>>>>> -export HOST_SYS=3D${MULTIMACH_TARGET_SYS}
>>>>> +export HOST_SYS
>>>>>
>>>>> =A0CXXFLAGS_powerpc +=3D "-lstdc++"
>>>>>
>>>>> diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradi=
o.inc
>>>>> index 6eaf119..1a08930 100644
>>>>> --- a/recipes/gnuradio/gnuradio.inc
>>>>> +++ b/recipes/gnuradio/gnuradio.inc
>>>>> @@ -8,7 +8,7 @@ INC_PR =3D "r7"
>>>>> =A0inherit distutils-base autotools autotools_stage pkgconfig
>>>>>
>>>>> =A0export BUILD_SYS
>>>>> -export HOST_SYS=3D${MULTIMACH_TARGET_SYS}
>>>>> +export HOST_SYS
>>>>>
>>>>> =A0CXXFLAGS_powerpc +=3D "-lstdc++"
>>>>>
>>>>> diff --git a/recipes/opencv/opencv-dsp-acceleration_svn.bb b/recipes/=
opencv/opencv-dsp-acceleration_svn.bb
>>>>> index 788e8e2..26fc3c6 100644
>>>>> --- a/recipes/opencv/opencv-dsp-acceleration_svn.bb
>>>>> +++ b/recipes/opencv/opencv-dsp-acceleration_svn.bb
>>>>> @@ -22,7 +22,7 @@ export OPENCV_PATH =3D "${STAGING_INCDIR}"
>>>>> =A0export DSPLIB_PATH =3D "${DSPLIB_INSTALL_DIR}"
>>>>>
>>>>> =A0# You need to extract the imglib from the .exe manually and place =
it in /OE/tmp (or somewhere else and change the patch below)
>>>>> -export IMGLIB_PATH =3D "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${inst=
alldir}/imglib_v201"
>>>>> +export IMGLIB_PATH =3D "${STAGING_DIR}/${TARGET_SYS}${installdir}/im=
glib_v201"
>>>>>
>>>>> =A0do_configure() {
>>>>> =A0 =A0 =A0 echo "-l ${DSPLIB_INSTALL_DIR}/dsplib64plus.lib" >> ${S}/=
beagle/server/opencv_unitserver_evm3530/link.cmd
>>>>> diff --git a/recipes/ti/README b/recipes/ti/README
>>>>> index 2fbb9f1..6262c9c 100644
>>>>> --- a/recipes/ti/README
>>>>> +++ b/recipes/ti/README
>>>>> @@ -29,13 +29,12 @@ Since most of the recipes in this directory deal =
with a DSP (e.g OMAP3) or accel
>>>>> =A0The complete unpacked trees are staged to staging/machine/usr/shar=
e/ti/${PN}(-tree) and all the _INSTALL_DIR vars will point to that. To make=
 this work there is a ti-staging.inc which contains:
>>>>>
>>>>> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>> -BASEPKG_HOST_SYS =3D "${MULTIMACH_HOST_SYS}"
>>>>> =A0PACKAGE_STRIP =3D "no"
>>>>>
>>>>> =A0The 'BASEPKG_HOST_SYS' bit is what makes it work, but cause troubl=
e is you want to read from it, so ti-paths.inc does:
>>>>>
>>>>> =A0export CODEGEN_INSTALL_DIR_RECIPE =A0 =A0=3D "${installdir}/ti-cgt=
6x"
>>>>> -export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}/${CODEGEN_INSTALL_DIR_RECIPE}"
>>>>> +export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${TARGET_SYS}/=
${CODEGEN_INSTALL_DIR_RECIPE}"
>>>>>
>>>>> =A0Which will point it to the machine specific staging like we want i=
t to.
>>>>>
>>>>> diff --git a/recipes/ti/ti-paths.inc b/recipes/ti/ti-paths.inc
>>>>> index 27400a1..57af6c5 100644
>>>>> --- a/recipes/ti/ti-paths.inc
>>>>> +++ b/recipes/ti/ti-paths.inc
>>>>> @@ -22,23 +22,23 @@ export BIOSPSP_INSTALL_DIR_RECIPE =A0 =A0=3D "${i=
nstalldir}/ti-biospsp-tree"
>>>>> =A0export AUDIO_SOC_INSTALL_DIR_RECIPE =A0=3D "${installdir}/ti-audio=
-soc-example-tree"
>>>>>
>>>>> =A0# This is where the tools will end up in staging provided PACKAGE_=
ARCH =3D ${MACHINE_ARCH} is set
>>>>> -export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
>>>>> -export XDC_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMAC=
H_TARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
>>>>> -export XDAIS_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_=
TARGET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
>>>>> -export BIOS_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_=
TARGET_SYS}${BIOS_INSTALL_DIR_RECIPE}"
>>>>> -export SYSBIOS_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
>>>>> -export BIOSUTILS_INSTALL_DIR =A0=3D "${STAGING_DIR}/${MULTIMACH_TARG=
ET_SYS}${BIOSUTILS_INSTALL_DIR_RECIPE}"
>>>>> -export FC_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMAC=
H_TARGET_SYS}${FC_INSTALL_DIR_RECIPE}"
>>>>> -export CE_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMAC=
H_TARGET_SYS}${CE_INSTALL_DIR_RECIPE}"
>>>>> -export EDMA3_LLD_INSTALL_DIR =A0=3D "${STAGING_DIR}/${MULTIMACH_TARG=
ET_SYS}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
>>>>> -export LINUXUTILS_INSTALL_DIR =3D "${STAGING_DIR}/${MULTIMACH_TARGET=
_SYS}${LINUXUTILS_INSTALL_DIR_RECIPE}"
>>>>> -export CMEM_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_=
TARGET_SYS}${CMEM_INSTALL_DIR_RECIPE}"
>>>>> -export LINK_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_=
TARGET_SYS}${LINK_INSTALL_DIR_RECIPE}"
>>>>> -export LPM_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMAC=
H_TARGET_SYS}${LPM_INSTALL_DIR_RECIPE}"
>>>>> -export DMAI_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_=
TARGET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
>>>>> -export CODEC_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_=
TARGET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
>>>>> -export DSPLIB_INSTALL_DIR =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
>>>>> -export BIOSPSP_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
>>>>> +export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${TARGET_SYS}$=
{CODEGEN_INSTALL_DIR_RECIPE}"
>>>>> +export XDC_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${TARGET_S=
YS}${XDC_INSTALL_DIR_RECIPE}"
>>>>> +export XDAIS_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${TARGET_SYS=
}${XDAIS_INSTALL_DIR_RECIPE}"
>>>>> +export BIOS_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${TARGET_SYS=
}${BIOS_INSTALL_DIR_RECIPE}"
>>>>> +export SYSBIOS_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${TARGET_SYS}$=
{SYSBIOS_INSTALL_DIR_RECIPE}"
>>>>> +export BIOSUTILS_INSTALL_DIR =A0=3D "${STAGING_DIR}/${TARGET_SYS}${B=
IOSUTILS_INSTALL_DIR_RECIPE}"
>>>>> +export FC_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${TARGET_S=
YS}${FC_INSTALL_DIR_RECIPE}"
>>>>> +export CE_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${TARGET_S=
YS}${CE_INSTALL_DIR_RECIPE}"
>>>>> +export EDMA3_LLD_INSTALL_DIR =A0=3D "${STAGING_DIR}/${TARGET_SYS}${E=
DMA3_LLD_INSTALL_DIR_RECIPE}"
>>>>> +export LINUXUTILS_INSTALL_DIR =3D "${STAGING_DIR}/${TARGET_SYS}${LIN=
UXUTILS_INSTALL_DIR_RECIPE}"
>>>>> +export CMEM_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${TARGET_SYS=
}${CMEM_INSTALL_DIR_RECIPE}"
>>>>> +export LINK_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${TARGET_SYS=
}${LINK_INSTALL_DIR_RECIPE}"
>>>>> +export LPM_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${TARGET_S=
YS}${LPM_INSTALL_DIR_RECIPE}"
>>>>> +export DMAI_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${TARGET_SYS=
}${DMAI_INSTALL_DIR_RECIPE}"
>>>>> +export CODEC_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${TARGET_SYS=
}${CODEC_INSTALL_DIR_RECIPE}"
>>>>> +export DSPLIB_INSTALL_DIR =A0 =A0 =3D "${STAGING_DIR}/${TARGET_SYS}$=
{DSPLIB_INSTALL_DIR_RECIPE}"
>>>>> +export BIOSPSP_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${TARGET_SYS}$=
{BIOSPSP_INSTALL_DIR_RECIPE}"
>>>>>
>>>>> =A0DSPSUFFIX_omapl137 =3D "x674"
>>>>> =A0DSPSUFFIX_omapl138 =3D "x674"
>>>>> diff --git a/recipes/ti/ti-staging.inc b/recipes/ti/ti-staging.inc
>>>>> index 593f094..de2a882 100644
>>>>> --- a/recipes/ti/ti-staging.inc
>>>>> +++ b/recipes/ti/ti-staging.inc
>>>>> @@ -1,8 +1,5 @@
>>>>> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>>
>>>>> -# Allow staging into machine specific dir
>>>>> -BASEPKG_HOST_SYS =3D "${MULTIMACH_HOST_SYS}"
>>>>> -
>>>>> =A0# Search archdir for shlibs instead of machine dir due to above BA=
SEPKG_HOST_SYS
>>>>> =A0SHLIBSDIR =3D "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${HOST_VENDOR}-$=
{HOST_OS}/shlibs"
>>>>>
>>>>> diff --git a/recipes/xapian/xapian-bindings-python_1.0.14.bb b/recipe=
s/xapian/xapian-bindings-python_1.0.14.bb
>>>>> index ae97779..6c24e2d 100644
>>>>> --- a/recipes/xapian/xapian-bindings-python_1.0.14.bb
>>>>> +++ b/recipes/xapian/xapian-bindings-python_1.0.14.bb
>>>>> @@ -18,7 +18,7 @@ EXTRA_OECONF =3D "--with-python --without-php --wit=
hout-ruby --without-tcl \
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-csharp --without-java"
>>>>>
>>>>> =A0do_configure () {
>>>>> - =A0 =A0 =A0 =A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${MULTIMACH_HOST=
_SYS} \
>>>>> + =A0 =A0 =A0 =A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>>>>> =A0 =A0 =A0 =A0 =A0autotools_do_configure
>>>>> =A0}
>>>>>
>>
>>>
>>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMTfBYMkyGM64RGpERAsYzAJ0fCSMs1WTnY4fsQT6stOEus/sYLwCfQ8Pi
> lvYhUHTC7ZRfGZ6G6pvRDOo=3D
> =3Dn/LZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


