Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3A8v-0003sB-2Y for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 18:13:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3A8e-0006Zt-3b for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 18:13:12 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 18:13:12 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 18:13:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 05 Oct 2010 18:13:02 +0200
Message-ID: <i8fiqe$f3b$1@dough.gmane.org>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>	<i8ev7s$ts9$1@dough.gmane.org>
	<4CAB4112.3070505@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <4CAB4112.3070505@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 16:13:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-10-10 17:15, Tom Rini wrote:
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 05-10-10 09:43, Khem Raj wrote:
>>> Hi
>>>
>>> Following set of patches is intial support for getting libtool 2.4 into
>>> openemebedded. I have so far built minimal-image for two machines
>>> successfully
>>>
>>> The big change that libtool 2.4 brings is sysroot support and I have
>>> added
>>> support to use this feature. It should make our life easier.
>>
>> I'm a bit concerned about the way this is implemented, it seems to for
>> libtool 2.4 onto everyone since it changes e.g. autotools.bbclass. Is
>> that intended? If so we need signoffs from each and every distro
>> maintainer *and* from the maemo-compat folks as well.
>> Unless there is a way to make the new features conditional on the
>> libtool version.
> 
> It shouldn't be too bad, implementation wise, to set LIBTOOL_HAS_SYSROOT
> or similar and test for that. 

That was I was thinking, make it opt in for now and have the
trailblazers (angstrom, shr) find & fix issues before RFC it to make it
the default.

> But can we also set a phase out date for
> older libtool, even if maemo-compat isn't possible (given chinhook pins
> to 1.5, I bet it's not) ?

A phase-out would be good, I'm not sure how many people are going to use
maemo-compat (and friends) from .dev in a few months from now.

Doing something like this is a lot bigger than a toolchain change, so I
don't think 2 signoffs is enough.

My proposal:

1) add libtool recipes to .dev
2) create branch for sysroot changes (with or without LIBTOOL_HAS_SYSROOT)
3) gather test reports for said branch
4) fix issues
5) create branch with LIBTOOL_HAS_SYSROOT and propose for merging.

Does that sounds like a decent plan to go forward?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMq06OMkyGM64RGpERAkfXAJ0YMrdthZ0hG6JzeV56QkV8ZO/oKACdHXlF
dH1LJFmKhCVg1dB8xMDJOIU=
=uLnX
-----END PGP SIGNATURE-----



