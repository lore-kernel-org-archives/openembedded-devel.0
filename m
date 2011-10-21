Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RHGkU-0007Cm-M0
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 17:11:07 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 8CB95CD95
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 17:05:04 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgkbACCJoU5T4zkNPGdsb2JhbAAMN55VimABAQEBN4IgAQEBAQIBAQEBawoGCwshFg8JAwIBAgEVARsUEwYCAQEFh3cItCyIQASCWI8PghqIaYhz
X-IronPort-AV: E=Sophos;i="4.69,386,1315173600"; 
	d="scan'208,217";a="498770793"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph2.telenor.se with ESMTP; 21 Oct 2011 17:05:04 +0200
Message-ID: <4EA18A1F.9040409@telia.com>
Date: Fri, 21 Oct 2011 17:05:03 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
	<1319192173.3766.16.camel@mattotaupa>
In-Reply-To: <1319192173.3766.16.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] 2011.03-maintenance: Bad checksums in binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 15:11:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

2011-10-21 12:16, Paul Menzel skrev:
> Dear Mats,
>
>
> Am Freitag, den 21.10.2011, 06:42 +0000 schrieb Mats K=E4rrman:
>
>> My first patch, please be gentle if i did something wrong ;)
> our commit policy describes how patches should be formatted [1][2]. Mos=
t
> importantly you forgot your Signed-off-by line.
>
>> The following patch is from a local branch tracking
>> 2011.03-maintenance, should it be done different?
I did a similar fix for binutils-2.20.1, and that is apparently not the w=
ay
so this was rejected. (See other discussions on binutils this week).

I sent a new version of binutils-2.20.1 patch today,
which is taken from openembedded-core, and that
combines the new checksums, with downloading a new tarball.

If it follows the same scheme, then:
binutils-2.18.tar.bz2 is only a link to binutils-2.18a.tar.bz2
Your SRC_URI should be pointing at binutils-${PV}a.tar.bz2


> If I read [3] correctly it first has to go into for example the master
> branch. I pushed a similar hopefully correct change there [4]. Please
> send a pull request as described in [3] to get that included in
> 2011.03-maintenance.
>
>> The binutils_2.18 tarball from GNU has changed checksums, ref. to this=
<http://git.openembedded.org/openembedded/commit/recipes/binutils/binutil=
s_2.18.bb?h=3D2011.03-maintenance&id=3Dbc8ddbf7944f82383936d88379619aa46c=
3954a2>
>> As binutils-cross-sdk_2.18.bb includes binutils_2.18.bb it does not ne=
ed to specify its own checksums.
>>
>> diff --git a/recipes/binutils/binutils-cross-sdk_2.18.bb b/recipes/bin=
utils/binutils-cross-sdk_2.18.bb
>> index 837ebbe..2f13b26 100644
>> --- a/recipes/binutils/binutils-cross-sdk_2.18.bb
>> +++ b/recipes/binutils/binutils-cross-sdk_2.18.bb
>> @@ -1,6 +1,3 @@
>>   require binutils_${PV}.bb
>>   require binutils-cross-sdk.inc
>>   PR =3D "${INC_PR}.1"
>> -
>> -SRC_URI[md5sum] =3D "9d22ee4dafa3a194457caf4706f9cf01"
>> -SRC_URI[sha256sum] =3D "487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b=
65632b6c945e961ee9b"
>
> Thanks and I am looking forward to further contributions,
>
> Paul
>
>
> [1] http://www.openembedded.org/wiki/Commit_Policy
> [2] http://www.openembedded.org/wiki/Category:Policy
> [3] http://www.openembedded.org/wiki/2011.03-maintenance
> [4] http://git.openembedded.org/openembedded/commit/?id=3Df2d53aa074d76=
509384e7bb8a9c39e2e27210f4a
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson


