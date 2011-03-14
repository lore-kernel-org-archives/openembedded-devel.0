Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pz4RH-0001NX-FM
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 10:51:47 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 3E434CA9586
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 10:50:07 +0100 (CET)
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id BBD544B02C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 10:41:52 +0100 (CET)
Message-ID: <4D7DE2DF.708@eukrea.com>
Date: Mon, 14 Mar 2011 10:41:51 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300035425-15984-1-git-send-email-eric@eukrea.com>	<1300035425-15984-3-git-send-email-eric@eukrea.com>
	<1300092673.9169.0.camel@localhost>
In-Reply-To: <1300092673.9169.0.camel@localhost>
Subject: Re: [PATCH 3/4] slugos: prefer busybox 1.18.4
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
X-List-Received-Date: Mon, 14 Mar 2011 09:51:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Marcin,

On 14/03/2011 09:51, Marcin Juszkiewicz wrote:
> Dnia 2011-03-13, nie o godzinie 17:57 +0100, Eric B=C3=A9nard pisze:
>> --- a/conf/distro/include/preferred-slugos-versions.inc
>> +++ b/conf/distro/include/preferred-slugos-versions.inc
>> @@ -24,7 +24,7 @@ PREFERRED_VERSION_autoconf                    ?=3D
>> "2.65"
>>   PREFERRED_VERSION_autoconf-native              ?=3D "2.65"
>>   PREFERRED_VERSION_automake                     ?=3D "1.11.1"
>>   PREFERRED_VERSION_automake-native              ?=3D "1.11.1"
>> -PREFERRED_VERSION_busybox                      ?=3D "1.18.3"
>> +PREFERRED_VERSION_busybox                      ?=3D "1.18.4"
>
> Can't it be handled by DEFAULT_PREFERENCE_slugos =3D "1" in
> busybox_1.18.4.bb recipe? Less reparsing.
>
that is a distro choice so if distro want to track the latest stable busy=
box,=20
they can remove this PREFERRED_VERSION_busybox line and the latest stable=
=20
version will be used as a default.
For next version I'll use a 1.19 PV and will only increase PR when fixes =
are=20
added, that will make less changes in the preferred-versions.inc files.

Eric


