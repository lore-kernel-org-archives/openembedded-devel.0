Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1Qoip0-000218-BV
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 23:17:54 +0200
Received: by fxg11 with SMTP id 11so51740fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 14:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=fdqlANbgylvbg6MJloF8R1PN4HWeuNQ0UaL+DPQP55E=;
	b=axEfgiPRckHBjxGe748AM5lt+s05NBXhFp4xtnAMz2FBX5pUZgrZeppgt7w6nMbcB/
	HYzo5JtIHIkOF0TTVtC05duPYfmVchVq4vGjYF+mHfHKK4jL4xyM2CYvrSWzEY51sFnC
	DCm/ARqyZ3dGGy8yPxIvuDZyHEQIa3JbmVOyk=
Received: by 10.223.88.204 with SMTP id b12mr15504fam.94.1312406000393;
	Wed, 03 Aug 2011 14:13:20 -0700 (PDT)
Received: from [192.168.0.7] (pD957CCD0.dip.t-dialin.net [217.87.204.208])
	by mx.google.com with ESMTPS id 3sm776227fat.37.2011.08.03.14.13.17
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 14:13:18 -0700 (PDT)
Message-ID: <4E39B9ED.4050009@googlemail.com>
Date: Wed, 03 Aug 2011 23:13:17 +0200
From: Josua Mayer <josua.mayer97@googlemail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
	rv:1.9.2.18) Gecko/20110616 SUSE/3.1.11 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312309735-1628-1-git-send-email-josua.mayer97@googlemail.com>
	<1312321885.3658.262.camel@mattotaupa>
In-Reply-To: <1312321885.3658.262.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] mokomaze: fix project urls
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
X-List-Received-Date: Wed, 03 Aug 2011 21:17:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for these hints, though I rna into problems about the
SOURCEFORGE_MIRROR variable
. more below
Am 02.08.2011 23:51, schrieb Paul Menzel:
> Dear Josua,
>
>
> thank you for your patch. (I will try to push your other patches as soon
> as possible.)
>
> Am Dienstag, den 02.08.2011, 20:28 +0200 schrieb Josua Mayer:
>> * Mokomaze moved to sourceforge
>>   Homepage and download link were changed accordingly
Ok so I will in a v2 patch take care of the capitalisation.
> Please start the commit summary with a capital letter.
>
>> Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
>> ---
>>  recipes/mokomaze/mokomaze_0.5.5.bb |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/mokomaze/mokomaze_0.5.5.bb b/recipes/mokomaze/mokomaze_0.5.5.bb
>> index 9ef8771..d4c2541 100644
>> --- a/recipes/mokomaze/mokomaze_0.5.5.bb
>> +++ b/recipes/mokomaze/mokomaze_0.5.5.bb
>> @@ -1,5 +1,5 @@
>>  DESCRIPTION = "Classic game where you control a steel ball by tilting a wooden labyrinth"
>> -HOMEPAGE = "http://mokomaze.projects.openmoko.org/"
>> +HOMEPAGE = "http://mokomaze.sourceforge.net/"
>>  SECTION = "x11/games"
>>  PRIORITY = "optional"
>>  LICENSE = "GPLv3"
>> @@ -9,7 +9,7 @@ RRECOMMENDS_${PN}_shr = "fsoraw"
>>  PV = "0.5.5+git8"
>>  PR = "r7"
>>  
>> -SRC_URI = "http://mokomaze.projects.openmoko.org/files/${PN}-${PV}.tar.gz"
>> +SRC_URI = "http://mokomaze.sourceforge.net/files/${PN}-${PV}.tar.gz"
I dont think I can use this variable for mokomaze. It seems to store the
source files in a way that makes them only available through
mokomaze.sourceforge.net/files. Maybe someone else can check this, I
wasnt able to produce a different download link.
> There is a variable `SOURCEFORGE_MIRROR` defined. Can you try to use
> that?
>
>         $ git grep SOURCEFORGE_MIRROR
>         conf/bitbake.conf:SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
>         […]
>
>>  SRC_URI_append_shr = " file://fsoraw.patch"
>>  SRC_URI_append_shr = " file://0001-Fix-accelerometers-with-2.6.34-kernels.patch"
>>  SRC_URI_append_shr = " file://0001-Fix-vibration-on-gta02-with-2.6.34-kernel.patch"
> When sending iterations of patches, please also note under the first
> `---` what you changed in the iterations.
>
>         ---
>         v2: Remove bogus `From` line.
>         ---
>          recipes/mokomaze/mokomaze_0.5.5.bb |    4 ++--
>         […]
>
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


