Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdgDH-0003rs-Jz
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 11:12:40 +0200
Received: by iwn34 with SMTP id 34so3661584iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 02:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YdL0xipRTPRz8gVtrScKltupTSHbxbaUpyTSD0GtiSU=;
	b=UF2yUYJeut8nCBaMmMEc1hMgLBmIX880lt+cQLYF+LScfYCvUH/JlfH2zmUkS8CFik
	NL3MEV4/vdItbYgBlvtVQHgsQefphPm5H2U851lZpGQGgXKBRdibLuGUkdLHyU1Ct+ej
	11igJKedbPTNTKj/lwkYIYadaTYsdOhLnIYK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DE+phJ8d+HmKB9Z25EeTXO2Tqus4Cb6P4vZLEyAl9fZ3p1h6GJhJSpwRv11cfRGtBY
	9i5NL9Ge4II8BiElwCHW5GYWmFmcfa204+ivJ7xxKjkv1LQnpOU/EG5m0lCGPe1sczqW
	aCzvV5muOjYP/LMBXRb79hlg515q56gqeHQo8=
Received: by 10.231.168.21 with SMTP id s21mr10235332iby.123.1280221943831; 
	Tue, 27 Jul 2010 02:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Tue, 27 Jul 2010 02:12:03 -0700 (PDT)
In-Reply-To: <i2m01a$qdr$2@dough.gmane.org>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com> 
	<1280213315-5513-8-git-send-email-raj.khem@gmail.com>
	<i2m01a$qdr$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Jul 2010 02:12:03 -0700
Message-ID: <AANLkTi=cC27mT2Pg6+4Bca3B53wu9d-v5njVAto-nL4p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/8] recipes: Replace usage of MULTIMACH_TARGET_SYS with CURRENT_TARGET_SYS
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
X-List-Received-Date: Tue, 27 Jul 2010 09:12:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2010 at 11:57 PM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Does this make the TI recipes live in the same sysroot dir as the
> kernel? Thas was the aim for this.

yes.

>
> On 27-07-10 08:48, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/gnuradio/gnuradio-libusb-compat.inc =A0 =A0 | =A0 =A02 +-
>> =A0recipes/gnuradio/gnuradio.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
>> =A0recipes/opencv/opencv-dsp-acceleration_svn.bb =A0 | =A0 =A02 +-
>> =A0recipes/ti/README =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A03 +-
>> =A0recipes/ti/ti-paths.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 34 +++++++++++-----------
>> =A0recipes/ti/ti-staging.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A04 +-
>> =A0recipes/xapian/xapian-bindings-python_1.0.14.bb | =A0 =A02 +-
>> =A07 files changed, 24 insertions(+), 25 deletions(-)
>>
>> diff --git a/recipes/gnuradio/gnuradio-libusb-compat.inc b/recipes/gnura=
dio/gnuradio-libusb-compat.inc
>> index efe2b88..aa4d41a 100644
>> --- a/recipes/gnuradio/gnuradio-libusb-compat.inc
>> +++ b/recipes/gnuradio/gnuradio-libusb-compat.inc
>> @@ -8,7 +8,7 @@ INC_PR =3D "r7"
>> =A0inherit distutils-base autotools autotools_stage pkgconfig
>>
>> =A0export BUILD_SYS
>> -export HOST_SYS=3D${MULTIMACH_TARGET_SYS}
>> +export HOST_SYS
>>
>> =A0CXXFLAGS_powerpc +=3D "-lstdc++"
>>
>> diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradio.i=
nc
>> index 6eaf119..1a08930 100644
>> --- a/recipes/gnuradio/gnuradio.inc
>> +++ b/recipes/gnuradio/gnuradio.inc
>> @@ -8,7 +8,7 @@ INC_PR =3D "r7"
>> =A0inherit distutils-base autotools autotools_stage pkgconfig
>>
>> =A0export BUILD_SYS
>> -export HOST_SYS=3D${MULTIMACH_TARGET_SYS}
>> +export HOST_SYS
>>
>> =A0CXXFLAGS_powerpc +=3D "-lstdc++"
>>
>> diff --git a/recipes/opencv/opencv-dsp-acceleration_svn.bb b/recipes/ope=
ncv/opencv-dsp-acceleration_svn.bb
>> index 788e8e2..1a2d7bb 100644
>> --- a/recipes/opencv/opencv-dsp-acceleration_svn.bb
>> +++ b/recipes/opencv/opencv-dsp-acceleration_svn.bb
>> @@ -22,7 +22,7 @@ export OPENCV_PATH =3D "${STAGING_INCDIR}"
>> =A0export DSPLIB_PATH =3D "${DSPLIB_INSTALL_DIR}"
>>
>> =A0# You need to extract the imglib from the .exe manually and place it =
in /OE/tmp (or somewhere else and change the patch below)
>> -export IMGLIB_PATH =3D "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${install=
dir}/imglib_v201"
>> +export IMGLIB_PATH =3D "${STAGING_DIR}/${MACHINE_SYS}${installdir}/imgl=
ib_v201"
>>
>> =A0do_configure() {
>> =A0 =A0 =A0 echo "-l ${DSPLIB_INSTALL_DIR}/dsplib64plus.lib" >> ${S}/bea=
gle/server/opencv_unitserver_evm3530/link.cmd
>> diff --git a/recipes/ti/README b/recipes/ti/README
>> index 2fbb9f1..9a36f70 100644
>> --- a/recipes/ti/README
>> +++ b/recipes/ti/README
>> @@ -29,13 +29,12 @@ Since most of the recipes in this directory deal wit=
h a DSP (e.g OMAP3) or accel
>> =A0The complete unpacked trees are staged to staging/machine/usr/share/t=
i/${PN}(-tree) and all the _INSTALL_DIR vars will point to that. To make th=
is work there is a ti-staging.inc which contains:
>>
>> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> -BASEPKG_HOST_SYS =3D "${MULTIMACH_HOST_SYS}"
>> =A0PACKAGE_STRIP =3D "no"
>>
>> =A0The 'BASEPKG_HOST_SYS' bit is what makes it work, but cause trouble i=
s you want to read from it, so ti-paths.inc does:
>>
>> =A0export CODEGEN_INSTALL_DIR_RECIPE =A0 =A0=3D "${installdir}/ti-cgt6x"
>> -export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TARGE=
T_SYS}/${CODEGEN_INSTALL_DIR_RECIPE}"
>> +export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MACHINE_SYS}/${=
CODEGEN_INSTALL_DIR_RECIPE}"
>>
>> =A0Which will point it to the machine specific staging like we want it t=
o.
>>
>> diff --git a/recipes/ti/ti-paths.inc b/recipes/ti/ti-paths.inc
>> index 27400a1..de8893a 100644
>> --- a/recipes/ti/ti-paths.inc
>> +++ b/recipes/ti/ti-paths.inc
>> @@ -22,23 +22,23 @@ export BIOSPSP_INSTALL_DIR_RECIPE =A0 =A0=3D "${inst=
alldir}/ti-biospsp-tree"
>> =A0export AUDIO_SOC_INSTALL_DIR_RECIPE =A0=3D "${installdir}/ti-audio-so=
c-example-tree"
>>
>> =A0# This is where the tools will end up in staging provided PACKAGE_ARC=
H =3D ${MACHINE_ARCH} is set
>> -export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TARGE=
T_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
>> -export XDC_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_T=
ARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
>> -export XDAIS_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TAR=
GET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
>> -export BIOS_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_TAR=
GET_SYS}${BIOS_INSTALL_DIR_RECIPE}"
>> -export SYSBIOS_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TARGE=
T_SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
>> -export BIOSUTILS_INSTALL_DIR =A0=3D "${STAGING_DIR}/${MULTIMACH_TARGET_=
SYS}${BIOSUTILS_INSTALL_DIR_RECIPE}"
>> -export FC_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_T=
ARGET_SYS}${FC_INSTALL_DIR_RECIPE}"
>> -export CE_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_T=
ARGET_SYS}${CE_INSTALL_DIR_RECIPE}"
>> -export EDMA3_LLD_INSTALL_DIR =A0=3D "${STAGING_DIR}/${MULTIMACH_TARGET_=
SYS}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
>> -export LINUXUTILS_INSTALL_DIR =3D "${STAGING_DIR}/${MULTIMACH_TARGET_SY=
S}${LINUXUTILS_INSTALL_DIR_RECIPE}"
>> -export CMEM_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_TAR=
GET_SYS}${CMEM_INSTALL_DIR_RECIPE}"
>> -export LINK_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_TAR=
GET_SYS}${LINK_INSTALL_DIR_RECIPE}"
>> -export LPM_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_T=
ARGET_SYS}${LPM_INSTALL_DIR_RECIPE}"
>> -export DMAI_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_TAR=
GET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
>> -export CODEC_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TAR=
GET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
>> -export DSPLIB_INSTALL_DIR =A0 =A0 =3D "${STAGING_DIR}/${MULTIMACH_TARGE=
T_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
>> -export BIOSPSP_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${MULTIMACH_TARGE=
T_SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
>> +export CODEGEN_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TARGET_=
SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
>> +export XDC_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TAR=
GET_SYS}${XDC_INSTALL_DIR_RECIPE}"
>> +export XDAIS_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TARGE=
T_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
>> +export BIOS_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TARGE=
T_SYS}${BIOS_INSTALL_DIR_RECIPE}"
>> +export SYSBIOS_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TARGET_=
SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
>> +export BIOSUTILS_INSTALL_DIR =A0=3D "${STAGING_DIR}/${CURRENT_TARGET_SY=
S}${BIOSUTILS_INSTALL_DIR_RECIPE}"
>> +export FC_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TAR=
GET_SYS}${FC_INSTALL_DIR_RECIPE}"
>> +export CE_INSTALL_DIR =A0 =A0 =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TAR=
GET_SYS}${CE_INSTALL_DIR_RECIPE}"
>> +export EDMA3_LLD_INSTALL_DIR =A0=3D "${STAGING_DIR}/${CURRENT_TARGET_SY=
S}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
>> +export LINUXUTILS_INSTALL_DIR =3D "${STAGING_DIR}/${CURRENT_TARGET_SYS}=
${LINUXUTILS_INSTALL_DIR_RECIPE}"
>> +export CMEM_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TARGE=
T_SYS}${CMEM_INSTALL_DIR_RECIPE}"
>> +export LINK_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TARGE=
T_SYS}${LINK_INSTALL_DIR_RECIPE}"
>> +export LPM_INSTALL_DIR =A0 =A0 =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TAR=
GET_SYS}${LPM_INSTALL_DIR_RECIPE}"
>> +export DMAI_INSTALL_DIR =A0 =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TARGE=
T_SYS}${DMAI_INSTALL_DIR_RECIPE}"
>> +export CODEC_INSTALL_DIR =A0 =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TARGE=
T_SYS}${CODEC_INSTALL_DIR_RECIPE}"
>> +export DSPLIB_INSTALL_DIR =A0 =A0 =3D "${STAGING_DIR}/${CURRENT_TARGET_=
SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
>> +export BIOSPSP_INSTALL_DIR =A0 =A0=3D "${STAGING_DIR}/${CURRENT_TARGET_=
SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
>>
>> =A0DSPSUFFIX_omapl137 =3D "x674"
>> =A0DSPSUFFIX_omapl138 =3D "x674"
>> diff --git a/recipes/ti/ti-staging.inc b/recipes/ti/ti-staging.inc
>> index 593f094..c32f01c 100644
>> --- a/recipes/ti/ti-staging.inc
>> +++ b/recipes/ti/ti-staging.inc
>> @@ -1,10 +1,10 @@
>> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> =A0# Allow staging into machine specific dir
>> -BASEPKG_HOST_SYS =3D "${MULTIMACH_HOST_SYS}"
>> +HOST_SYS =3D "${CURRENT_TARGET_SYS}"
>>
>> =A0# Search archdir for shlibs instead of machine dir due to above BASEP=
KG_HOST_SYS
>> -SHLIBSDIR =3D "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST=
_OS}/shlibs"
>> +SHLIBSDIR =3D "${STAGING_DIR}/${HOST_SYS}/shlibs"
>>
>> =A0PACKAGE_STRIP =3D "no"
>>
>> diff --git a/recipes/xapian/xapian-bindings-python_1.0.14.bb b/recipes/x=
apian/xapian-bindings-python_1.0.14.bb
>> index ae97779..6c24e2d 100644
>> --- a/recipes/xapian/xapian-bindings-python_1.0.14.bb
>> +++ b/recipes/xapian/xapian-bindings-python_1.0.14.bb
>> @@ -18,7 +18,7 @@ EXTRA_OECONF =3D "--with-python --without-php --withou=
t-ruby --without-tcl \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-csharp --without-java"
>>
>> =A0do_configure () {
>> - =A0 =A0 =A0 =A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${MULTIMACH_HOST_SY=
S} \
>> + =A0 =A0 =A0 =A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> =A0 =A0 =A0 =A0 =A0autotools_do_configure
>> =A0}
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMToNlMkyGM64RGpERAsFnAJ9+UXehtRlhzUMvFHpuokdGjyHgMQCfQWg3
> wNICOn4mFRWBj/gSN2iI/nQ=3D
> =3DSKRJ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


