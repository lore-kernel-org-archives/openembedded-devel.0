Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAhKE-0007t4-0p for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:41:06 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAhBa-0003U1-4J for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:32:10 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 13:32:10 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 13:32:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 13:32:01 +0100
Message-ID: <jkf63s$8hf$1@dough.gmane.org>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<20120322100758.GG4010@jama.jama.net>
	<FD67157F-A373-42D4-93CE-3FF8A142CA56@dominion.thruhere.net>
	<jkeurg$cb8$1@dough.gmane.org>
	<CAMKF1sqXOfFU+qG-8xzP0TqGTYVADxf44rHW112eLiVHzJH=NQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CAMKF1sqXOfFU+qG-8xzP0TqGTYVADxf44rHW112eLiVHzJH=NQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 12:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-03-12 13:23, Khem Raj schreef:
> On Thu, Mar 22, 2012 at 3:27 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote: Op 22-03-12 11:15, Koen Kooi schreef:
>>>> 
>>>> Op 22 mrt. 2012, om 11:07 heeft Martin Jansa het volgende
>>>> geschreven:
>>>> 
>>>>> On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
>>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>> 
>>>>> Why not move them?
>>>> 
>>>> This was done to have people test it in the oe-core +
>>>> meta-toolchain setup. And to avoid bblayers.conf conflicts
>>>> 
>>>>> Or create stub of meta-toolchain in 1st patch for people to add
>>>>> it to bblayers and then move it in 2nd.
>>>> 
>>>> That sounds like a better way to do it. Maybe Eric will do that in
>>>> his patchset :)
> 
> I don't have a strong opinion on this and if Eric wants me to respin the
> RFC I'll gladly do that. But I would prefer that I can be lazy and just
> merge other peoples patches :)
> 
>> yes git move should be better since then we can do git log --follow I 
>> dont know if that works with copied files too or not.
> 
>> meta-toolchain may not be the best name since we already have 
>> meta-toolchain as a target for sdk generation. that should actually 
>> have been called sdk but here we will create a confusion. but may be 
>> target in OE-Core should ve renamed too

I'm fine with calling it 'toolchain-layer' and not using the 'meta' prefix.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPaxu+AAoJEHZqAkdh1vT6GL8P/3ctciJfWKTgKaOLlSdtTvCD
M1f6p06mm81ZRy2jvrxiB0Ui/TVI7QBRnRZ7Cq+FaCe9vOFXLmINL1ljIYSB3Fkz
CxZBc+wj6BDuPGk6SHN13lhYJgZmKcTY/mfYT2sp4R+VEC/Zv4M8o2SB7qUuLxuY
wWtP8O1/ydJTvdk/IcPMDSoRtNRM+pHBd/grt20N2l7c8/80SYM2xFQAG/ACDNmt
oHFFzNfg46c9YaB9aAey02OLaC/sh0r9NrZ6vQcRZp1bDf0RlIprTpBBDANfp2ss
hEQhZTZmYN44JtmrJBK7fnpxxjNvRK1E24+rWFQSR+0rFzFNBsOtOGypegxN5VAs
ypcOjUBvNF4TivxZUAcxLOTEN4YgW93pbp/lDVhGgiGIAPYMclHPP8By8dhI6ErE
JLbWrQGAV87wux+KKAkYzXzO25NeMGo0TZc35wnTsT+P+/q4aqZyK9eV9b+p73lF
O1GqN5MyGHWOGM8Xbfjx6ycaeArrUxBqdk5omcxlmM/ieeDwAQWrGKWNxChmXbN9
Mu7dMqSLCnCV4d8xSX8HCZuIhhdqDGVmL5MSTAW5930+6Sdaa8OfdRd6m9Y26Mpf
SYAparX2d6YBdvTCDrO8O1Bukx+6LXXN5PThP975euhdL5pasOwjl3M77J87LGJh
oznZSDS/uXbq9lRFSx6+
=nkR0
-----END PGP SIGNATURE-----



