Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SxzZg-0003qZ-CD
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 14:04:48 +0200
Received: (qmail 29983 invoked by uid 1003); 5 Aug 2012 11:53:04 -0000
Received: from unknown (HELO ?192.168.1.105?) (philip@opensdr.com@71.171.25.17)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	5 Aug 2012 11:53:04 -0000
Message-ID: <501E5E9F.4010005@balister.org>
Date: Sun, 05 Aug 2012 07:53:03 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
	<CAMKF1spLej1gvXiSYX_OfqhaFK0D2bLZ-hi-8HGHiTUVG9V29w@mail.gmail.com>
	<jvk125$nh$1@dough.gmane.org>
	<CAMKF1srqhPKJfmGG+5uvkHnv18U9Ye5TM56V1C3tWKHwKHhWbA@mail.gmail.com>
	<jvlm7n$r75$2@dough.gmane.org>
In-Reply-To: <jvlm7n$r75$2@dough.gmane.org>
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Sun, 05 Aug 2012 12:04:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2012 07:42 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 04-08-12 22:50, Khem Raj schreef:
>> On Sat, Aug 4, 2012 at 1:35 PM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>>> On Fri, Aug 3, 2012 at 8:36 AM, Koen Kooi
>>>> <koen@dominion.thruhere.net> wrote:
>>>>> Move gitpkgv into oe-core
>>>>
>>>> OK until I fight moving it into OE-Core :) , I have sent a V4 of
>>>> patchset which creates a copy of gitpkgv.bbclass in meta-systemd. I
>>>> believe it will be short lived. Please take a look at them and
>>>> install if ok
>>>
>>> Can't you just symlink it from meta-oe? It will be in the same git
>>> repo anyway. That would avoid having 2 copies
>>
>> we dont have synlinks in repo I didnt want to create first one and its
>> reaching across layers moreover this calss seldom changes. If you prefer
>> symlink I can redo that bit
>
> Please use a symlink. Whenever there is manual synchronization needed people
> *will* screw up, just look at kernel.bbclass in meta-oe :)

Can someone provide a clear explanation of exactly what the gitpkgv 
class does and why it is needed? Furthermore, does oe-core provide 
something that could be used? It is clear that ther eis a desire for 
something like this in two layers, and that makes it a candidate for 
oe-core.

Symlinking stuff across layers is just wrong. The underlying issue has 
to be resolved.

Philip

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQHlw/MkyGM64RGpERAsFEAJ9GGd0Q8NjGqRGUxLxBTMe/modZ0ACbB2we
> FCmtXTuVV0fgxg8lUi+Zpbw=
> =WDO3
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


