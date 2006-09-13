Received: from [64.233.162.193] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <papercrane@gmail.com>) id 1GNXHE-0003Q4-W7
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 18:07:53 +0200
Received: by nz-out-0102.google.com with SMTP id m22so836950nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2006 09:04:19 -0700 (PDT)
Received: by 10.35.95.1 with SMTP id x1mr13245387pyl;
	Wed, 13 Sep 2006 09:04:19 -0700 (PDT)
Received: by 10.35.119.19 with HTTP; Wed, 13 Sep 2006 09:04:19 -0700 (PDT)
Message-ID: <432beae0609130904y233c2021k540a8a91fff5f3a1@mail.gmail.com>
Date: Wed, 13 Sep 2006 09:04:19 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4507EEAA.2030004@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
	<1158139503.5540.10.camel@localhost.localdomain>
	<74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
	<4507E64D.3040105@dominion.kabel.utwente.nl>
	<74d0deb30609130425qa0394bbl9d5e8374e97793ae@mail.gmail.com>
	<4507EEAA.2030004@dominion.kabel.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 16:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/13/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> pHilipp Zabel schreef:
> > On 9/13/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> pHilipp Zabel schreef:
> >>
> >>> btw,
> >>> http://www.openembedded.org/repo/org.openembedded.dev/packages/udev/files/mount.sh
> >>> returns a 403
> >> We'd welcome input from apachache/web savvy people on how to get .sh/.py/.php files to
> >> display as text when accessed from http://www.openembedded.org/repo/ or
> >> http://www.openembedded.org/filebrowser.
> >
> > I'm not -savvy, but perhaps this could work:
> >
> > AddType text/plain sh
> > AddType text/plain py
> > AddType text/plain php
> >
> > in repo/.htaccess
>
> That doesn't work :(
>

Hmmm, works for me. Perhaps you have a rule set elsewhere that is
disallowing access to potentially dangerous files such as sh and py?
You should be able to override it for this directory and make them
text/plain instead.

-- 
Justin Patrin


