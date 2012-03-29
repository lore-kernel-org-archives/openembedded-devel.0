Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SDD4r-0005H4-0C
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 12:59:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 620F2315A423
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 12:50:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id S2fhJdZiPdBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 12:50:25 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf1a1.pool.mediaWays.net
	[89.12.241.161])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6682E315A702
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 12:50:25 +0200 (CEST)
Message-ID: <4F743E70.1080502@opendreambox.org>
Date: Thu, 29 Mar 2012 12:50:24 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1332969613-445-1-git-send-email-obi@opendreambox.org>
	<CALbNGRSbH0aoR3BY3=kUM_KZfz2QVyvPMdrkwCR7zMv5qshCJg@mail.gmail.com>
In-Reply-To: <CALbNGRSbH0aoR3BY3=kUM_KZfz2QVyvPMdrkwCR7zMv5qshCJg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] faad2: create -staticdev packages
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
X-List-Received-Date: Thu, 29 Mar 2012 10:59:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 29.03.2012 08:29, Andreas M=FCller wrote:
> On Wed, Mar 28, 2012 at 11:20 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> * Fixes QA warnings:
>>
>> | faad2-2.7: non -staticdev package contains static .a library: libfaa=
d-dev
>> | faad2-2.7: non -staticdev package contains static .a library: libmp4=
ff-dev
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta-oe/recipes-multimedia/faad2/faad2_2.7.bb |   10 ++++++----
>>  1 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.7.bb
>> index 462837f..3a64b6b 100644
>> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
>> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
>> @@ -1,6 +1,7 @@
>>  DESCRIPTION =3D "Library for reading some sort of media format."
>>  SECTION =3D "libs"
>>  LICENSE =3D "GPLv2"
>> +PR =3D "r1"
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D381c8cbe277a7bc1ee2ae6083a=
04c958"
>>
>> @@ -12,13 +13,14 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/faac/faad2-src/=
faad2-${PV}/${PN}-${PV}.tar.bz2;
>>  SRC_URI[faad2.md5sum] =3D "4c332fa23febc0e4648064685a3d4332"
>>  SRC_URI[faad2.sha256sum] =3D "14561b5d6bc457e825bfd3921ae50a6648f377a=
9396eaf16d4b057b39a3f63b5"
>>
>> -PACKAGES =3D+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"
>> +PACKAGES =3D+ "libfaad libfaad-dev libfaad-staticdev libmp4ff libmp4f=
f-dev libmp4ff-staticdev"
>>
>>  FILES_${PN} =3D "${bindir}/faad"
>>
>>  FILES_libfaad =3D "${libdir}/libfaad.so.*"
>> -FILES_libfaad-dev =3D "${libdir}/libfaad.so ${libdir}/libfaad.la ${li=
bdir}/libfaad.a ${includedir}/faad.h"
>> +FILES_libfaad-dev =3D "${libdir}/libfaad.so ${libdir}/libfaad.la ${in=
cludedir}/faad.h"
>> +FILES_libfaad-staticdev =3D "${libdir}/libfaad.a"
>>
>>  FILES_libmp4ff =3D "${libdir}/libmp4ff.so.*"
>> -FILES_libmp4ff-dev =3D "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la $=
{libdir}/libmp4ff.a ${includedir}/mp4ff.h"
>> -
>> +FILES_libmp4ff-dev =3D "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la $=
{includedir}/mp4ff.h"
>> +FILES_libmp4ff-staticdev =3D "${libdir}/libmp4ff.a"
>> --
> Looks like
>=20
> http://patches.openembedded.org/patch/24713/

Oops! I didn't notice your patch. :-)

Regards,
Andreas


