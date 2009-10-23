Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N1J0g-0007ZL-Ev
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:12:49 +0200
Received: by bwz9 with SMTP id 9so1025470bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 05:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=OdmJZSHBYPnVMnUEEdjqkVpFJxhXMw0houIRtjVc4mY=;
	b=bfjLOk7pJbd3fLzs6rZb/QzoslRfDR5ToyRlGBOu4pj7d/B+T5Jb2GjVYJMgJr56ev
	iqT2+lQmn6YXYgs7Y90NjZGglW3sCfolOgSYdZSVJL11nESJnQg0rJYJHsXBaEIZ9U+9
	q4BSPpxfUFpjg3SHRSi1GWGWIcGTqI5ux3CDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=USTYDbujSrOwGTRKhxn/guUmZjs+LivbX/ycRWRi/J1VN++QX7ea+Jmrzk3NB0k3sH
	5jez3JrCqq9DSW319qA+foIIxKGz+5eWxHJ7efJ+Kni5zCrDysbNoBbFxJjgkur/6Ouv
	pgl58tCe4TKqj5UM6sU7qF6HthanzwRI+C/EI=
MIME-Version: 1.0
Received: by 10.239.183.141 with SMTP id u13mr1002498hbg.10.1256299903721; 
	Fri, 23 Oct 2009 05:11:43 -0700 (PDT)
In-Reply-To: <1256296026.9503.26.camel@hammer.suse.cz>
References: <200910230504.57681.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org>
	<200910231133.11053.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org> <1256296026.9503.26.camel@hammer.suse.cz>
Date: Fri, 23 Oct 2009 14:11:43 +0200
Message-ID: <c384c5ea0910230511w311c5c21sd35d4b10f1ac3ad1@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 12:12:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 23, 2009 at 1:07 PM, Stanislav Brabec <utx@penguin.cz> wrote:
> But I would do even one step forward:
> In last 12 years I did not need any of system static library instances.
>
I did, I do not see disabling static libraries as a step forward.

Not that I really really NEEDED it, but it reduced the footprint,
boot/link/load time on a single process firmware application to such
an amount that static linking was desired.

> With exception of bootloader authors, almost nobody else needs static
> libraries.
>
Static linking is a valid approach for embedded use, let's not cripple it more.

I think we should build most of what we can build during the compile
and install and stage tasks, then reduce what we need in later stages.

> That is why I would like to introduce new global default:
> --disable-static (via variable, site config or so).
>
> Only packages that explicitly require or explicitly build the static
> library will have them (in -dev or -static sub-package, see above).
>
Typically libraries should stage the static, so that dependent
packages can choose to statically link against them.

I would keep the discussing on how to package statics and their
corresponding debug info.

Regards,
-- 
Leon


