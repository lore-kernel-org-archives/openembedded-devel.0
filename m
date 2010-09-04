Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Orjj6-0002ci-55
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 05:47:37 +0200
Received: by wye20 with SMTP id 20so2429243wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 20:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=JmBr7mxUYnjclgvAnYdqy5wj8p7TWRGRYoDWwvKWyCc=;
	b=wWv5MpUQCUXY2p2MebQyTXcFN/Ugc3hPqcuHMs8PHBmzNS3j6BueQMdw2sKUH8+bWf
	DjKmHOmgB5vDwKzF7Xm5e3dJJiHxRC0cEACKdMbcOeHmoxVYduaLFzkIW1DwyYC/c3pd
	EzPHszEMKQiu5VGgtyDozcFfY5BJzLuuwf5zs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=NCbopAkBKtEIqxlvVpJCFauYbrzv/LA/HIzsEvC2LQOfx6oxmGPFE27S0L4ZUwiTFn
	AiknLlkpkhKvKcx/9KTjHO3xJlmV/KMHFsQgWg9ATDUQ24mbtnG1W8yun04PWxe/a62O
	J/nAzjeUTUuTlUQp8vKnBdhr1P52jtmw4PRcg=
Received: by 10.216.233.234 with SMTP id p84mr1444200weq.38.1283572019230;
	Fri, 03 Sep 2010 20:46:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Fri, 3 Sep 2010 20:46:39 -0700 (PDT)
In-Reply-To: <20100812223234.GA7917@merkur.sol.de>
References: <AANLkTim_ukfazSeQbS5H_f=ouSzf1QUbJL3PvLivP9+O@mail.gmail.com>
	<20100812223234.GA7917@merkur.sol.de>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 3 Sep 2010 20:46:39 -0700
X-Google-Sender-Auth: 5QG5QJW9VvALNuZJa881VpWg2Xc
Message-ID: <AANLkTi=B4WQ+LWOHFS1tWFfb32S+x4Ebm46EdP4VG+ea@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: autotools issues (MKINSTALLDIRS, -s_
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
X-List-Received-Date: Sat, 04 Sep 2010 03:47:37 -0000
Content-Type: text/plain; charset=UTF-8

I noticed a long time ago that a certain error from the autoreconf is a sign
that your po/ makefiles are from old gettext, and will end up seeing the
mkinstalldirs failure.  See http://patchwork.openembedded.org/patch/1004/.
Haven't had a chance to do any further investigation on it since then,
however.

On Thu, Aug 12, 2010 at 3:32 PM, Jens Seidel <jensseidel@users.sf.net>wrote:

> On Sun, Aug 08, 2010 at 05:53:42PM +0200, Frans Meulenbroeks wrote:
> > I'm not too good in autotools. While makeing the git recipe for urjtag
> > I bumped into the following two issues:
> >
> > First of all it seems autoreconf needs the -s flag. This tells to use
> > symlinks. Guess things are done out of order or so.
> > I've fixed this by adding EXTRA_AUTORECONF = "-s" to my recipes. That
> > makes configure happy, but it does not really feel as a good solution.
>
> Don't know about this.
>
> > The second issue is that install fails.
> > Apparently MKINSTALLDIRS does not have the proper value (it should be
> > tools/mkinstalldirs, but it is an empty string).
> > I've tried some things, peeked at some other patches for MKINSTALLDIRS
> > but didn't really get to a satisfactory solution
>
> > Any wizard here who can give me some guidance?
>
> I noticed in the past also trouble with MKINSTALLDIRS and I think older
> gettext versions are buggy and affect this. I workaround it with
>
> AM_GNU_GETTEXT([external])
> # version 0.11 doesn't support make distcheck, see
> # http://lists.debian.org/debian-i18n/2009/09/msg00176.html
> # versions 0.12-0.14.6 require a mkinstalldirs hack for make distcheck
> # (at least for automake version 1.11)
> MKINSTALLDIRS=\$\(top_srcdir\)/autotools/mkinstalldirs
> AC_SUBST(MKINSTALLDIRS)
> AM_GNU_GETTEXT_VERSION(0.12)
>
> in my configure.ac. Try increasing the version of the required gettext
> version
> in the last line to verify that you have the same problem.
>
> If you don't use gettext than I cannot help you ...
>
> Jens
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

