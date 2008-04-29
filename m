Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JqpaH-0001kq-Ra
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 15:09:26 +0200
Received: by an-out-0708.google.com with SMTP id b33so1277782ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=D3aXTxK1NeD1E+vm7ITmkYTbQ+et3hUeCnNhr5kW3ts=;
	b=MuY+KCom+sgyEtg2lhjCmualcstRUh3P3pIgXs9uDm4ItQjZbZBOIw71v/1aIMMvoi5aObmExbg/0M2fQFEF6cyjRodCIo94lPSflAUliEIeZ/GtkvioRBUxOx7U+JzzDuU0zY2KFNXMwavdTOURMARLs46crMp4xWRDgBDNv1Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=VaCYWZFYo9GVAdxEsHCdIwOr6rtZtGbYqBS4/nkAxZFkDpjGG8fA1qrcHKryIkiQFMAQcQUdxtAYqyrfyJVpm8py/rBz7Sgj9Ouc2t6gfekUnsTxWm0q8SS3TPnVeCpUMws2tiVGvz8ReSG3pxlbBRLsSpjDZOLLnbDVdZ4pE1g=
Received: by 10.100.11.7 with SMTP id 7mr1475199ank.56.1209474537700;
	Tue, 29 Apr 2008 06:08:57 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Tue, 29 Apr 2008 06:08:57 -0700 (PDT)
Message-ID: <c384c5ea0804290608s1be8bb21mc9aa72e49b883f72@mail.gmail.com>
Date: Tue, 29 Apr 2008 15:08:57 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1209471859.5642.16.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
	<19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
	<c384c5ea0804290507t66765c59w2fbc82366bec675d@mail.gmail.com>
	<1209471859.5642.16.camel@dax.rpnet.com>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 13:09:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

On Tue, Apr 29, 2008 at 2:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2008-04-29 at 14:07 +0200, Leon Woestenberg wrote:
>  > On Tue, Apr 29, 2008 at 9:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
>  > However, I suspect it should DEPEND on ncurses-native now as well.
>  >
>  > You know, I'll fire off a Poky Linux build on a system without
>  > ncurses-dev on the host to verify my thesis,
>
>  This was a recent fix to Poky. I removed all the -dev packages from our
>  build machine and my desktop and can confirm it worked without the -dev
>  package installed after the fix. I don't think its needed for -initial,
>
Uhm, *what* worked exactly?

I just did a "bitbake uclibc-initial" SVN with POKYLIBC=uclibc and it fails.

>  just for the main version but I could be wrong. Be sure to use "bitbake
>  uclibc-initial" when you test.
>
I just checked; uclibc-initial_0.9.29.bb needs a DEPEND on ncurses-native.

That fixes it. I committed this to OE yesterday.

Regards,
-- 
Leon


