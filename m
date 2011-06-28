Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qbc1m-0004Qr-8d
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 19:24:46 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QbbyC-00039F-IW from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 10:21:04 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 28 Jun 2011 10:20:41 -0700
Received: from [172.30.80.197] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 28 Jun 2011 10:21:04 -0700
Message-ID: <4E0A0D7B.3000602@mentor.com>
Date: Tue, 28 Jun 2011 10:20:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>	<iucpq7$uav$1@dough.gmane.org>	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>	<iucsbb$gp2$1@dough.gmane.org>
	<BANLkTinrcfQvNW4=s5vbjD=8FhaqVYpbEQ@mail.gmail.com>
In-Reply-To: <BANLkTinrcfQvNW4=s5vbjD=8FhaqVYpbEQ@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Jun 2011 17:20:41.0671 (UTC)
	FILETIME=[B4DF1D70:01CC35B7]
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 17:24:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/28/2011 10:14 AM, Frans Meulenbroeks wrote:
> 2011/6/28 Koen Kooi <koen@dominion.thruhere.net>
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 28-06-11 16:59, Otavio Salvador wrote:
>>> On Tue, Jun 28, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>>> I'm not going pull those in, since the whole point was to not make them
>>>> machine specific. RP has pushed a workaround for it so parsing
>>>> continues. I'll push a proper fix for systemd later.
>>>
>>> What's the difference if the package will be built from same source?
>>>
>>> In case you change anything you'll need to rebuild all packages anyway
>>> so I see no gain in having it per package.
>>
>> It makes it easier to deploy updates for the main packages (e.g.
>> sysvinit, systemd) to all the targets without having to build it for all
>> targets. It's a weird optimization, but makes life a lot easier for
>> people needing to support a ton of machines :)
>>
> 
> Hm. saving some CPU cycles and wall clock time makes life a lot easier.
> Guess you haven't too much of a life then :-)
> No kidding, why not keep things simple. and elegant.
> (and actually people needing to maintain a lot of machines and keeping them
> up to date is somewhat an oddity anyway; My experience is that most embedded
> developers need to support only a few machines and typically freeze their
> sources and stabilize their product).

Really?  One of those big requests we see a lot is for things like "how
can I support the N different revs of the board for this product".
Looking over at the kernel side of things that was one of the drivers
for device tree stuff.  So yes, outside of community based distributions
like Angstrom and SHR and SlugOS and ... there are commercial uses for
this change as well.  And it doesn't change the world of one machine
embedded products at all.

-- 
Tom Rini
Mentor Graphics Corporation


