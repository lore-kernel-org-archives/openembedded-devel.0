Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HEPTq-0006JH-E3
	for openembedded-devel@openembedded.org; Tue, 06 Feb 2007 13:31:26 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l16CVNLr028436 for <openembedded-devel@openembedded.org>;
	Tue, 6 Feb 2007 13:31:23 +0100
Message-ID: <45C87517.5040808@dominion.kabel.utwente.nl>
Date: Tue, 06 Feb 2007 13:31:19 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45BB64DC.1080601@dominion.kabel.utwente.nl>	<45C85593.3060603@dominion.kabel.utwente.nl>	<74d0deb30702060248p7d13b997w6d997f1d9b804721@mail.gmail.com>	<45C85F79.7040201@dominion.kabel.utwente.nl>
	<1170763266.5826.31.camel@localhost.localdomain>
In-Reply-To: <1170763266.5826.31.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: diet-x11, small-x11 and fat-x11
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
X-List-Received-Date: Tue, 06 Feb 2007 12:31:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2007-02-06 at 11:59 +0100, Koen Kooi wrote:
>>> One thing I'd like to see would be a different package name for all
>>> three of them, so we can actually have all versions in the feeds
>>> (currently both libx11 and diet-x11 build packages with the same
>>> name).
>> However annoying, it is a feature which we can exploit. If we take care that PR_small-x11
>> < PR_medium-x11 < PR_big-x11 we can split those into different feeds containing libx11 +
>> dependant apps.
> 
> Its probably unrealistic to maintain that and it will end up in a mess.

We could try...

> 
> If we are going down this route, we should probably have applications
> say which flavour of libx11 they want through some virtual namespaces.
> virtual/libx11 would mean they'll work with any of the versions.

It basically boils down to:

a) I need basic x11 (gtk+, qt, etc)
b) I need cms (rxvt, icewm) (+32kB iirc)
c) I need xkb (xserver-xorg, xkb*) (+80kB iirc)
d) I need obsolete stuff (Xaw) (+2MB iirc)

a -> libx11-minimal.bb
b -> libx11-cms.bb
c -> libx11-cms-xkb.bb
d -> libx11-full.bb

Is that like you want?

> I'm also not keen on your naming. As Philipp said, it mixes different
> naming styles and we should really have one.

right, I agree

Regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFyHUXMkyGM64RGpERAgbXAJ9jRkQlw6BNLIewEG7jwSsS5VaF6wCgoTaD
68eTtzTNFBf454GycnE9Syk=
=aqpG
-----END PGP SIGNATURE-----


