Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TWqDL-00086k-Ob
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Nov 2012 16:09:48 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA9EttFu012663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2012 06:55:55 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.225]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0318.004;
	Fri, 9 Nov 2012 06:55:54 -0800
From: "Little, Morgan" <Morgan.Little@windriver.com>
To: "MacDonald, Joe" <Joe.MacDonald@windriver.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up
	recipes
Thread-Index: AQHNuQRP+AN4kqQM1EqoOUmaUBsKvZfXQZ4AgANLEgCABxXBqw==
Date: Fri, 9 Nov 2012 14:55:54 +0000
Message-ID: <FCBA1E696337B442ADB5A7C30428F0689AE6E4@ALA-MBB.corp.ad.wrs.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<4865473.CrnCVaFvWL@helios> <20121102141401.GJ4416@windriver.com>
	<3131993.6qyQprBZ04@helios>,<20121104184340.GB12556@windriver.com>
In-Reply-To: <20121104184340.GB12556@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.216]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Fri, 09 Nov 2012 15:09:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 11/04/2012 01:43 PM, Joe MacDonald wrote:=0A=
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes]=
 On 12.11.02 (Fri 17:26) Paul Eggleton wrote:=0A=
>=0A=
>> On Friday 02 November 2012 10:14:02 Joe MacDonald wrote:=0A=
>>> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipe=
s] On =0A=
>> 12.11.02 (Fri 14:10) Paul Eggleton wrote:=0A=
>>>> On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:=0A=
>>>>> On 12.11.02 (Fri 13:38) Paul Eggleton wrote:=0A=
>>>>>> I have to say I think that these days this could be better implement=
ed=0A=
>>>>>> as one ntp recipe with a PACKAGECONFIG that you can use to enable=0A=
>>>>>> OpenSSL support if desired. (At the time the ntp/ntp-ssl split was=
=0A=
>>>>>> done, PACKAGECONFIG did not exist). Then it becomes a distro-level=
=0A=
>>>>>> choice as to whether this is enabled as I believe was originally=0A=
>>>>>> intended.=0A=
>>>>>=0A=
>>>>> I'm also perfectly fine with that.  Question, though.  Do you mean th=
at=0A=
>>>>> the presence of OpenSSL in the distro would then mean you get ntp-ssl=
=0A=
>>>>> all the time?  That would be fine for me, but I wonder if anyone else=
=0A=
>>>>> might want OpenSSL on their system but a non-ssl-enabled ntp?  Probab=
ly=0A=
>>>>> a silly case to be thinking about anyway.=0A=
>>>>=0A=
>>>> The idea with PACKAGECONFIG is it allows per-recipe control over this =
kind=0A=
>>>> of thing. The default would be for OpenSSL support to be disabled, but=
 it=0A=
>>>> could be enabled with a bbappend containing PACKAGECONFIG +=3D "openss=
l";=0A=
>>>> alternatively you could do PACKAGECONFIG_append_pn-ntp =3D " openssl" =
in the=0A=
>>>> distro .conf file or even local.conf.=0A=
>>>>=0A=
>>>> I'll send a patch.=0A=
>>>=0A=
>>> Great.  Thanks, Paul.=0A=
>>=0A=
>> Unfortunately when I tested the OpenSSL part I found that it's not=0A=
>> actually linking against the OpenSSL libraries (!) This is due to=0A=
>> libssl and libcrypto being split between /usr/lib and /lib=0A=
>> respectively instead of being in the same directory as the configure=0A=
>> script expects.=0A=
>=0A=
> Is that intentional?  I mean is that a misconfiguration or something=0A=
> reasonably easily changed, or are there specific reasons for that split,=
=0A=
> do you know?=0A=
>=0A=
>> Also the OpenSSL include directory being specified does not match with=
=0A=
>> what the configure script tests for (it's supposed to be the parent of=
=0A=
>> the openssl directory, not the openssl directory itself).=0A=
>=0A=
> Yeah, that's interesting.  Present in the existing recipe as well, from=
=0A=
> what I can see, so I'm thinking that hasn't worked since at least the=0A=
> update to 4.2.6p5.=0A=
>=0A=
> Morgan, can you confirm that you've got SSL support working in your=0A=
> updated recipe(s)?=0A=
Looking at the configure output, it seems that my builds don't take ssl in =
either.=0A=
I'm not sure if 4.2.6p3 worked since without changes the old recipe doesn't=
 build.=0A=
=0A=
>=0A=
>> I've also noticed that the ${PN}-utils package ends up empty and the ${P=
N}-bin =0A=
>> directory contains a bunch of binaries I would have assumed belonged in =
that =0A=
>> package. What should be in these packages? Should there just be one?=0A=
>=0A=
> I think so.  Given that ntpd lives in FILES_${PN}, I'm thinking=0A=
> everything listed in -bin looks appropriate for -utils.  Or dumping=0A=
> -utils and leaving them in -bin.  Looking at the recipe it seems like=0A=
> -utils was intended to be a housecleaning collection.  Did you find=0A=
> other non-named binaries living in ${bindir} on some builds, Morgan?=0A=
>=0A=
I didn't find any non-named binaries living in ${bindir}.=0A=
=0A=
//Morgan=


