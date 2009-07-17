Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MRrn1-0007w2-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 20:04:11 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MRrZm-0005Zl-C7
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 21:50:31 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jul 2009 21:50:28 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.30-1-amd64; KDE/4.2.4; x86_64; ; )
References: <1247829612-9310-1-git-send-email-khimov@altell.ru>
	<20090717145837.GA567@gmail.com>
In-Reply-To: <20090717145837.GA567@gmail.com>
MIME-Version: 1.0
Message-Id: <200907172150.28360.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9073 [Jul 17 2009]
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH] package.bbclass: introduce KEEP_GNU_DEBUGLINK
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
X-List-Received-Date: Fri, 17 Jul 2009 18:04:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 17 =D0=B8=D1=8E=D0=BB=D1=8F 2=
009 18:58:37 Khem Raj wrote:
> On (17/07/09 15:20), Roman I Khimov wrote:
> > Currently we're keeping .gnu_debuglink section in files after stripping
> > them. It makes binaries from successive builds a bit different, which is
> > not good in situations where you want them to be exactly the same
> > (identical checksums).
> >
> > So, introducing KEEP_GNU_DEBUGLINK which can be set to zero to disable
> > this behavior and get identical result on successive builds for most of
> > the packages.
>
> you lose debugging these binaries if you remove this section.=20

Yep.

> So may be
> there should be options like DEBUG_STRIP, STRIP and NO_STRIP and only one
> of which could be used.

As of now, we have INHIBIT_PACKAGE_STRIP that switches stripping, but it ha=
s=20
strong on/off semantics, so I don't think we can change that. We can replac=
e=20
it with some common PACKAGE_STRIP setting that would work like this:

# No stripping
PACKAGE_STRIP=3Dno
# Strip but leave .gnu_debuglink for debugging
PACKAGE_STRIP=3Ddebug
# Strip everything
PACKAGE_STRIP=3Dfull

But that's more intrusive and will force distro and local config updates. I=
=20
can do it if everyone is OK with such change.

And, BTW, we also have DEBUG_BUILD setting, although that just switches=20
compile flags from what I see.


