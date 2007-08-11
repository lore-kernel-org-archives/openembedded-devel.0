Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJqha-0004Xc-6A
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 15:08:25 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7BD5N1R031483 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2007 15:05:24 +0200
Message-ID: <46BDB40D.4000301@dominion.kabel.utwente.nl>
Date: Sat, 11 Aug 2007 15:05:17 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>	<1186761021.6405.45.camel@localhost.localdomain>	<74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
	<1186836221.5859.32.camel@localhost.localdomain>
In-Reply-To: <1186836221.5859.32.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Sat, 11 Aug 2007 13:08:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> Hi,
> 
> On Sat, 2007-08-11 at 12:20 +0200, pHilipp Zabel wrote:
>> Ah, great. I guessed something similar would have to exist, as the process would
>> be pretty much the same as for usual -dbg packages, right?
> 
> Yes, its exactly the same.
> 
>> I was just wondering because most of the packages that explicitly set
>> the PACKAGES variable in OE overwrite it completely, thus disabling
>> -dev and -dbg.
> 
> They shouldn't do that.
> 
>> The code you speak of is not enabled for OE.dev as far as I can see,
>> for example all angstrom -dbg task packages have the same dependencies
>> as the main ones.
>> How can I enable this?
> 
> It looks to be enabled already in OE.dev:
> 
> DEPCHAIN_POST = "-dbg -dev" in bitbake.conf
> 
>> Yes, and in a few places PACKAGE_ARCH is set to "${MACHINE_ARCH}" although
>> it should be kept at "all" and only some subpackages should be marked
>> as machine specific. I think "all" is a sane default.
> 
> I'm not 100% sure. Would debian renaming work differently on different
> ARCHS for example?
> 
>> Now my question is, do you, too, like the idea of introducing another
>> bbclass for those defaults? :)
> 
> I'm not agsinst it but I'm not sure I see the point for a file that will
> be two lines long. How much code do we have for it?
> 
>> I guess it should to something like
>> PACKAGES = "${PN} ${PN}-dbg ${PN}-dev" or not touch packages at all,
>> if the code also works for -doc and -locale and enable that code,
>> however it is done.
> 
> PACKAGES shouldn't need touching. Empty -doc and -locale packages won't
> get created.

Even with ALLOW_EMPTY="1"?


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGvbQNMkyGM64RGpERAtysAKCbSQtDOz6uHfvxjrE6mX3LmgIY5ACfQleu
El8G9fzWg/CGfw9ZCfKOSsM=
=D+5Z
-----END PGP SIGNATURE-----


