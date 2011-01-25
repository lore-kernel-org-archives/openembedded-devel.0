Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Phgje-0006PO-BR for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 12:06:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Phgiv-0002qh-UH for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 12:06:09 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 12:06:09 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 12:06:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 12:05:58 +0100
Message-ID: <ihmaqm$eho$1@dough.gmane.org>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 11:06:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-11 18:48, Khem Raj wrote:
> On Mon, Jan 24, 2011 at 8:39 AM, Philip Balister <philip@balister.org> wrote:
>> On 01/19/2011 06:48 AM, Graeme Gregory wrote:
>>>
>>> Hi, this email is sent as an ordinary member of OE.
>>>
>>> It seems to be on a technical level we are agreed that we should split
>>> parts of OE out into the so called openembedded-core which will have a
>>> stricter commit access and higher QA requirements on changes.
>>>
>>> I therefore think it is time to actually create the repository and let
>>> the people who are interested in merging the good stuff from poky with
>>> the good stuff from openembedded to create our "core". I don't think
>>> there is any need to wait on the political part of the Yocto/OE
>>> collaboration as its something we have agreed in principal to do anyway.
>>>
>>> I would request then that the TSC drive this forward with the server
>>> admins and create this repo so work can happen.
>>
>>
>> Has anything happened on this email? Has the TSC had a meeting to discuss? I
>> know it has only been a week, but people are starting to do work based on
>> these ideas and need some support from the TSC.
>>
> 
> Yes I think we should start action on it soon. I would suggest to set
> up the repository
> as first step. As someone raised question about pull model it could be
> TSC who decided
> to appoint one gatekeeper based upon availability interest and
> capability and it could be
> rotated.secondly sane Starting point would be importing yocto and then
> apply the OE improvements
> on top thirdly breakdown oe into oe-meta repo to glue with the oe-core

Ignoring the timeline a bit, since ideally we would do this around a
yocto milestone to get them to use this straight after their freeze.

The technical roadmap/todo:

* setup openembedded-core repo on oe.org
* setup oe-core ml on oe.org
* add oe-core ml to patchwork
* import yocto-core in oe-core
* start an integration branch
 o remove bitbake
 o cleanup namespace (s/yocto/OE/, s/poky/OE/)
 o split out superfluous layers (e.g. ememlow)
* start merging in OE things
 o e.g. OE gcc 4.5, toolchains for avr32, bfin, etc
* switch meta-oe to build on top of oe-core, fix issues

When that is done meta-oe can start to expand.

The non-technical roadmap/todo:

* Assign 2 gatekeepers to oe-core, one from yocto, one from OE
* sketch out decision tree (RP -> gatekeepers -> maintainers)
* work out model for meta-oe
* appoint OE member to yocto SC
* work out how to marry yocto goals (4 archs, one toolchain) to OE goals
(zillion archs, as much toolchains as we can manage)
* Work out OE roadmap and align with yocto

The above tries to restrict itself to dealing with the new oe-core, not
with how OE is going to split into layers (meta-oe, meta-graveyard, etc).
It also ignores the maintainer aspects since we will be dealing with
yocto metadata at the start. After oe-core reaches a ready enough state
we can start looking at assigning maintainers, but for the time being
let's get things done first.

So, let's start fleshing out the above roadmaps and implement them!

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPq6WMkyGM64RGpERAmViAKCYKgJPEcLTCL+G1uugO6wQwEkfAACgrq8C
zanbxmzVZb4tgNbdwTV/fS0=
=tMf8
-----END PGP SIGNATURE-----



