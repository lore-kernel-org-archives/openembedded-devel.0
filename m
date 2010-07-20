Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObFh3-0008IZ-QR
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 18:29:59 +0200
Received: by bwz10 with SMTP id 10so3310405bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=cQymgzzwD8fA07XSIxGaliIkifYI94mQYyXFw61fx1c=;
	b=Mb2TG3tCC44P7dEmZlzCpgqkb5v79XWZZ24KbKmGWecfS3ruPM0bvvdnwD1r8hksZR
	v8uiDBYFAa6GI512lq7gaO6s9hpixO0JPl4j7+mDsjgk8gJZcYwNwyxjke3QHj09SI6U
	2VKAaog/O04X2EdT90legD/glqsAQ/GxT+YtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=o9ivw+RV2klshIvAL13yx72vHC29aaCOkUyGPaNKzUxY8cqoOppaq0fXeCCMX+WgX1
	4p8xdeM2plC8Gtm80IWCzQTdK5deO9lMmUjmI42bvHYoQkC0MxnojP7Il3yYSy2t4Efs
	mXoT945wLLmNFr/E+9h63+Y8qBA2rJendsij4=
MIME-Version: 1.0
Received: by 10.204.127.71 with SMTP id f7mr5319083bks.139.1279643348471; Tue, 
	20 Jul 2010 09:29:08 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 20 Jul 2010 09:29:08 -0700 (PDT)
In-Reply-To: <AANLkTilXvrxo8FC6KYsyyxwVPOrzJvp9cleEfdzVANzA@mail.gmail.com>
References: <1279290319.10837.1747.camel@rex> <4C44BAB3.8010703@mentor.com>
	<AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>
	<AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com>
	<AANLkTikAmC6Li8IdUfbfZ48Or-dEABfH4ua8JjIgA0JT@mail.gmail.com>
	<AANLkTim1m8AQ4WsVRLu_1BU3VUfOrCgpLNIclgewXhJz@mail.gmail.com>
	<4C45BE9F.7000002@mentor.com> <4C45C63E.70306@cbnco.com>
	<AANLkTilXvrxo8FC6KYsyyxwVPOrzJvp9cleEfdzVANzA@mail.gmail.com>
Date: Tue, 20 Jul 2010 18:29:08 +0200
Message-ID: <AANLkTikgXfuc1uHq38AHLGUnZgKzODoBuOe2h7oA89wG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Tue, 20 Jul 2010 16:30:08 -0000
X-List-Received-Date: Tue, 20 Jul 2010 16:30:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/20 Chris Larson <clarson@kergoth.com>

> On Tue, Jul 20, 2010 at 8:52 AM, Michael Smith <msmith@cbnco.com> wrote:
>
> > Tom Rini wrote:
> >
> >> It's also needed, in some cases, to lock down your changes via OVERRIDES
> >> that will only match what you want to work on.  For example, we're using
> a
> >> snapshot with an older python, so amend.inc in our python directory
> looks
> >> like:
> >>
> >> SRC_URI_append_pn-python-native =
> >> "file://python-2.6-r73342.patch;patch=1;pnum=0"
> >> PARALLEL_MAKE_pn-python-native = ""
> >> PR_append_pn-python-native .= ".1"
> >>
> >> So that we only change python-native and not all of the other python
> >> recipes.
> >>
> >
> > I think you could get the same effect by putting your amend.inc in a
> > python-native subdirectory under your overlay recipes/python directory.
> >
> > Maybe there's some native magic going on that would break that. (I've
> never
> > amended a -native package but I use the same trick for other recipes
> where
> > there are multiple .bb files are in the same OE directory.)
>
>
> Well, that works for -native or -cross, but there's no -target, so you have
> to use a pn- override to modify the target recipe but *not* native and
> cross.  If you put it in python/, it applies to all of them.
>

Should we have/create a -native ? Seems a logical extension.
(but don't know how to code it)

Frans.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

