Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jevby-00005r-Gj
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 18:09:58 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jevbs-0006aM-Cu
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 17:09:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 17:09:52 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 17:09:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 27 Mar 2008 18:09:43 +0100
Message-ID: <fsgkcn$n1t$1@ger.gmane.org>
References: <200803271217.41967.thomas.cooksey@trolltech.com>
	<200803271752.07855.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803271752.07855.thomas.cooksey@trolltech.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: LEAD_SONAME?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2008 17:09:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom Cooksey schreef:
| On Thursday 27 March 2008 15:44:02 Holger Freyther wrote:
|> On Thursday 27 March 2008 12:17:41 Tom Cooksey wrote:
|>> I get a warning saying:
|>>
|>> NOTE: Multiple libraries (...) found and LEAD_SONAME not defined
|> this has to do with debian package renaming. This happens when
someone (e.g.
|> your distro as part of its policies) INHERITS the debian bbclass.
|>
|> What is happening:
|> 	Imagine I have a package foo and only install a libfoo.so.1.0.0 in the
|> libdir. AFAIK according to debian packaging policies the package gets
renamed
|> from foo to libfoo1. If you have more than one lib installed OE does
not know
|> which lib name to pick and will print the warning (debian.bbclass:83).
|
| Ok, well I'm not sure I like the idea of packages being renamed
outside my control,
| I wouldn't know which name to use in DEPENDS in other recipies.

OE takes care of that automagically.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH69TXMkyGM64RGpERAky5AKCc5MQXVV0RxJNA4e5hlG3AaNjONgCfaSOo
vaKGmC/9xBygCzMToyC8DPY=
=Mnqv
-----END PGP SIGNATURE-----



