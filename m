Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdMhj-0008G1-3k for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 14:22:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdMhT-0007e6-2P for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 14:22:31 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 14:22:31 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 14:22:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jul 2010 14:22:19 +0200
Message-ID: <i2julr$fbh$1@dough.gmane.org>
References: <4C4D586A.5040202@kernelconcepts.de> <i2jrnl$4j3$2@dough.gmane.org>
	<AANLkTimRxtBib-WUkcm75eNLQvws8Rw-Nf-Z6uQvFetR@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTimRxtBib-WUkcm75eNLQvws8Rw-Nf-Z6uQvFetR@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native preferences
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
X-List-Received-Date: Mon, 26 Jul 2010 12:22:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-07-10 14:08, Frans Meulenbroeks wrote:
> 2010/7/26 Koen Kooi <k.kooi@student.utwente.nl>
> 
> On 26-07-10 11:42, Florian Boor wrote:
>>>> Hi all,
>>>>
>>>> I tried to build a "minimal" distribution image lately and ran into some
> trouble
>>>>  because the old-style native packages seem to be preferred over the new
> ones
>>>> using BBCLASSEXTEND.
>>>> In this case we have glib-2.0-native 2.24.1 provided by the new mechanism
> and
>>>> 2.22.1 gets build which is the latest old-style native bb.
> 
> That's minimals broken by design behaviour, it refuses to pin any
> version. So either pin the version or switch to a sane distro like
> angstrom or shr.
> 
> 
> 
>> Hm. I would expect that if there is a glib-2.0 recipe 2.24.1 with
>> BBCLASSEXTEND = "native" and  no pinning and no DEFAULT_PREFERENCE being in
>> effect, that 2.24.1 gets build and not 2.22.1 which has a real native
>> recipe. To me recipes with -native and implict ones with BBCLASSEXTEND =
>> "native" are equivalent prioritywise, so I'd say this is a bug in the class
>> code.

And that bug has been known for months and reported multiple times by
people attempting to use minimal. And for so far the bug has been fixed
in bitbake 1.10, but minimal still refuses to pin versions, so the
advice to switch distro still stands.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMTX37MkyGM64RGpERArnKAJ9jd/pPEhb/XdRXTJstqJq0/5zD6ACfSToc
5nInC0ZKEPbp3x1zlBNPuDI=
=IBvv
-----END PGP SIGNATURE-----



