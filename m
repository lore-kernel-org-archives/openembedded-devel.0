Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TmrXc-0000dw-Ob
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 20:48:56 +0100
Received: by mail-ee0-f43.google.com with SMTP id e49so3220357eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 11:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zXDPyWtvswnXkb3Znat/kvX9R3PpNP9ugmpcLkFUunY=;
	b=R3Y2614pf1GMEDvF4nnlW9Q1Zpsew9jNByCK+k8bOCdgNMyiTYpQ3yBxzR1+ySB4AV
	6w8nRD47ZVKzZO4C/wFyeqAqlTdgGoZUsALvtqt6xyqrTOT3iwEQuyZPD3h4Q+MrMBzH
	lK5EcNSmviGlpq4G+aHNmFuNg/yDT4ovMxRCZZe0dzn/bsHrrxfBELPfOJxZ9agO2qkT
	/qXF23aWw+ZpF83peVfcGdXSfoEF16c+5APj1SsrM7M3Be9+nYf7YXWN1YFFmP+Q1Zof
	7aYUAYDZ+AMg5YifgBQDhUP/hM7DQFdtQXutbV6I3M2O7iUQ/puxNPOFePlnKIm0g1r8
	OqSw==
X-Received: by 10.14.216.70 with SMTP id f46mr50127975eep.12.1356291247808;
	Sun, 23 Dec 2012 11:34:07 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 44sm36647755eek.0.2012.12.23.11.34.06
	(version=SSLv3 cipher=OTHER); Sun, 23 Dec 2012 11:34:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20121223123218.GH8988@jama.palm1.palmone.com>
Date: Sun, 23 Dec 2012 20:34:05 +0100
Message-Id: <171D86C5-6254-4C2D-BF07-D18D7BA2194B@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
	<20121223123218.GH8988@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnS6PfUpS98QKkzZ7JkHa1U1+9h6HkjCT8O7aJS04Zv/6jSCIT1Syn2n/qsybd5QcyJ6gb5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/6] xbmc: first try at making it build for non-GLES platforms
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
X-List-Received-Date: Sun, 23 Dec 2012 19:48:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 dec. 2012, om 13:32 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Fri, Dec 21, 2012 at 03:00:45PM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++---
>> 1 files changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>> index 74bf710..6331306 100644
>> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>> @@ -3,13 +3,13 @@ DESCRIPTION =3D "XBMC Media Center"
>> LICENSE =3D "GPLv2"
>> LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213ffc35ff"
>>=20
>> -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu =
fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug =
libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer =
virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca =
avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl =
jasper zip-native zlib libtinyxml"
>> +DEPENDS =3D "libmad libusb1 libcec libplist expat yajl gperf-native =
libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass =
libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image =
libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre =
boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 =
virtual/libsdl jasper zip-native zlib libtinyxml"
>> #require recipes/egl/egl.inc
>>=20
>> SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
>>=20
>> PV =3D "11.0"
>> -PR =3D "r14"
>> +PR =3D "r15"
>> PR_append =3D "+gitr${SRCPV}"
>> SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Deden;protocol=3Dgi=
t \
>>            =
file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
>> @@ -26,13 +26,14 @@ CACHED_CONFIGUREVARS +=3D " \
>>  ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" =
\
>> "
>>=20
>> +
>> EXTRA_OECONF =3D " \
>>  --disable-rpath \
>> - --enable-gles \
>>  --enable-libusb \
>>  --enable-airplay \
>>  --disable-optical-drive \
>>  --enable-external-libraries \
>> + ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', =
'--enable-gles', d)} \
>> "
>>=20
>> FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations =
-fomit-frame-pointer -O4 -ffast-math"
>=20
> Here it fails on libmad detection:
> | configure:21352: checking for libmad soname
> | configure:21378: result: no
> | configure:21381: error: Unable to determine soname of libmad library

Which architecture? I saw this on x86, but not on armv7a. It should be =
fixed either way, though :)

regards,

Koen=


