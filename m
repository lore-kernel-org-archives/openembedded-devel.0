Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB5B6F12A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 15:27:48 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so2565205pdi.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 07:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=8YqvVTHwetlZfdQhSfCfJ3dlIEfZGnuKdsr82BM8SXQ=;
	b=PAGtEkVsssQstd4VnPUgh4ShHJP+L0jMOPmEDfG10Jb2NwVE12mNUJLX13D/oXdeQG
	KejitqG1X/wI6aOUZzFvp2qIh++YegeVDhWQPITJRLHTfXWuTQgYf0CcTNkLsTmYE/+u
	hm1XysTRqYCEyddr/NH7b78uefSwucwFDO3Cxk+C3GGSQjOcWN5gS1fqN8pwZM89dySL
	tPMdDvPQXmTrHKZbELb6DpMuz11pQny7HkxQaZjF6B1IQ2nza6/wWBpG7xhKmVkv+XkX
	2XBFC5ZfGrz5WfbEbAMol3NDEl9hSYbT6RUQaEqMBt4e86aq8Z4uoP79tKL49nQhPJCz
	6m3w==
X-Received: by 10.66.144.227 with SMTP id sp3mr15993359pab.100.1393514869938; 
	Thu, 27 Feb 2014 07:27:49 -0800 (PST)
Received: from [192.168.1.136] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	sy2sm14525884pbc.28.2014.02.27.07.27.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 07:27:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Timothy Orling <ticotimo@gmail.com>
In-Reply-To: <20140227114037.GA26981@jama>
Date: Thu, 27 Feb 2014 07:27:42 -0800
Message-Id: <24D9AD93-97C2-4D69-9424-E77679C8786F@gmail.com>
References: <1393485271-24402-1-git-send-email-ticotimo@gmail.com>
	<20140227114037.GA26981@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-multimedia][PATCH] libmusicbrainz: workaround for build-native/do_configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 15:27:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 27, 2014, at 3:40 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Wed, Feb 26, 2014 at 11:14:31PM -0800, Tim Orling wrote:
>> From: Tim Orling <TicoTimo@gmail.com>
>>=20
>> * drop PR
>> * default cmake_do_configure deletes build/ which wipes out =
build-native
>> * workaround to stash build-native first
>> * <ugly>hack</ugly>
>=20
> I've just noticed libmusicbraniz failing like this:
>=20
> NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r1: task =
do_configure: Started
> ERROR: Function failed: do_configure (log file is located at =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/temp/log.do_confi=
gure.2213)
> ERROR: Logfile of failure stored in: =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/temp/log.do_confi=
gure.2213
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', =
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', =
'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | fatal: Not a git repository (or any parent up to mount parent =
/home/jenkins/oe/shr-core-branches/shr-core)
> | Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not =
set).
> | WARNING: exit code 128 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r1/temp/log.do_confi=
gure.2213)
> NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r1: task =
do_configure: Failed
>=20
> Is it fix for this problem? or have you seen this?
>=20
No, I have not seen that error. Hunch: that might be caused by the "git =
clean ..." in do_configure_prepend...
It might also be something with jenkins. I'm still running manually =
(even though I maintain the jenkins server at work... go figure).

The first error I saw was not being able to find CMakeLists.txt so I =
changed the target for cmake from .. to ${S}
After that, the second error was being unable to find =
build-native/ImportExecutables.cmake, which I fixed by the do_configure =
hack.
> =20
>>=20
>> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
>> ---
>> .../musicbrainz/libmusicbrainz_git.bb              | 49 =
+++++++++++++++++++++-
>> 1 file changed, 47 insertions(+), 2 deletions(-)
>>=20
>> diff --git =
a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb =
b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> index f6a8f53..b4d1ad3 100644
>> --- =
a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> +++ =
b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING.txt;md5=3Dfbc093901857fcd118f065f900982c24"
>> DEPENDS =3D "expat neon"
>>=20
>> PV =3D "5.0.1+git${SRCPV}"
>> -PR =3D "r1"
>=20
> This would make the whole package version going backwards, so please
> remove it only when incrementing PV/PE/SRCREV.
>=20

Still learning :)
I'll bump it in v2.

>> SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>> SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
>> @@ -30,9 +29,55 @@ do_configure_prepend() {
>>           -DCMAKE_C_COMPILER=3D${BUILD_CC} \
>>           -DCMAKE_CXX_FLAGS=3D${BUILD_CXXFLAGS} \
>>           -DCMAKE_CXX_COMPILER=3D${BUILD_CXX} \
>> -          ..
>> +          ${S}=20
>>     make make-c-interface
>>     cd ..
>> +
>> +    # the first thing cmake_do_configure does is delete ${B}
>> +    # stash it first
>> +    cp -r build-native ..
>> +}
>> +
>> +# recreate default here, with work around for build-native
>> +cmake_do_configure() {
>> +	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
>> +		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH =
and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds =
with B=3DWORKDIR/build."
>> +	fi
>> +
>> +	if [ "${S}" !=3D "${B}" ]; then
>> +		rm -rf ${B}
>> +		mkdir -p ${B}
>> +		cd ${B}
>> +	fi
>> +
>> +	# bring build-native back into build/
>> +	mv ../build-native .
>> +
>> +	# Just like autotools cmake can use a site file to cache result =
that need generated binaries to run
>> +	if [ -e ${WORKDIR}/site-file.cmake ] ; then
>> +		OECMAKE_SITEFILE=3D" -C ${WORKDIR}/site-file.cmake"
>> +	else
>> +		OECMAKE_SITEFILE=3D""
>> +	fi
>> +
>> +	cmake \
>> +	  ${OECMAKE_SITEFILE} \
>> +	  ${S} \
>> +	  -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
>> +	  -DCMAKE_INSTALL_BINDIR:PATH=3D${bindir} \
>> +	  -DCMAKE_INSTALL_SBINDIR:PATH=3D${sbindir} \
>> +	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=3D${libexecdir} \
>> +	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=3D${sysconfdir} \
>> +	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D${sharedstatedir} \
>> +	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D${localstatedir} \
>> +	  -DCMAKE_INSTALL_LIBDIR:PATH=3D${libdir} \
>> +	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=3D${includedir} \
>> +	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=3D${datadir} \
>> +	  -DCMAKE_INSTALL_SO_NO_EXE=3D0 \
>> +	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
>> +	  -DCMAKE_VERBOSE_MAKEFILE=3D1 \
>> +	  ${EXTRA_OECMAKE} \
>> +	  -Wno-dev
>> }
>>=20
>> EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:PATH=3D${libdir} \
>> --=20
>> 1.8.3.2
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--Tim=

