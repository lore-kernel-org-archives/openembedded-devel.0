Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcgTt-0004lA-ND for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 17:17:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcgTd-00037F-KO for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 17:17:25 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 17:17:25 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 17:17:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 24 Jul 2010 17:17:08 +0200
Message-ID: <i2f05l$pne$1@dough.gmane.org>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>	<4C4AE42C.5000306@welchs.me.uk>	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>
	<4C4B0125.1040304@vollmann.ch>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C4B0125.1040304@vollmann.ch>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sat, 24 Jul 2010 15:17:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-07-10 17:05, Detlef Vollmann wrote:
> On 07/24/10 16:35, Frans Meulenbroeks wrote:
>> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
>>
>>> Can anyone point me to any documentation that describes what legacy
>>> staging
>>> is and roughly what needs to be done to remove it?
> 
>>
>> There was a post half a year or so ago from Koen, but I can't find it.
>> Basically it boils down to removing do_stage from a recipe in which case
>> do_install is used to install things in staging
>> in some cases do_install need to be modified to deal with
>> peculiarities that
>> were done in do_stage
>>
>> For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.
> That's not really much of an explanation.
> Let's take an example.  I have two out of tree kernel modules A and B.
> B depends on A.
> With "legacy" staging, in A_1.0.bb I have a do_install, that copies
> the kernel object, and a do_stage, that copies the header file at
> a place where B_1.0.bb can find it.
> 
> How do I do that with non-"legacy" staging?

You copy the header in do_install to ${D}${includedir} or a subdir of
that depending on the header.

Cheat sheet:

STAGING_BINDIR -> ${D}${bindir}
STAGING_INCDIR -> ${D}${includedir}
STAGING_LIBDIR -> ${D}${libdir}
STAGING_DATADIR -> ${D}${datadir}

And if your recipe uses BBCLASS_EXTEND = native *and* 'make install'
doesn't do the job (e.g. using do_install_append), use
NATIVE_INSTALL_WORKS = "1"

If you use packaged-staging it's easy to do dpkg-deb -c on the staging
packages before and after the changes.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMSwP0MkyGM64RGpERAlrAAJ0Rn/6RY3f/wSuN++NEFJjRW4y6nwCgn+js
2prw5jIj56+M4syM4ZOIHtU=
=tisQ
-----END PGP SIGNATURE-----



