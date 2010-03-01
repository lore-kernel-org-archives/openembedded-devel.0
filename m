Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmDcp-0002JO-Gx
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:58:08 +0100
Received: by iwn14 with SMTP id 14so2718178iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fiLcusI+AChPIhVEa8GBoT+qBDsSbctWKTfpmAmMB2E=;
	b=iW6Ja4ETc9lMRry89utwiwhdW+plgvxDkhgusK8h5XIhngIDdjjUoz25urOnMKhjCB
	gJpTQdYwdNuJeLJJHyZPChamKj8sD/9V5IqS5P4x8kiwFIadDEBdq/Pr57PJcWEJkPDG
	HmAf61SET8VQNap3Mj9CmT30nEn75AxF4JN70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FKL3phK7/IQdyPCMCD51sOKTM7GmpT9bqOsSg1urWNTy0Mym5dwmlmzzMZdqv7OzBV
	H/NmBCqhF8CPheFLn9wa/Ub9thwGpxD6gvM4zwzSYC5n8DaJgLXigf/H1eYLyGOc3ohp
	Rxsvc7ytqNvpd/RNuV0LG4OguQ3/q6PU73QGw=
MIME-Version: 1.0
Received: by 10.231.153.1 with SMTP id i1mr76804ibw.35.1267480512835; Mon, 01 
	Mar 2010 13:55:12 -0800 (PST)
In-Reply-To: <1267479800.4739.271.camel@trini-m4400>
References: <E1NlqMw-0004yw-KS@melo.openembedded.org>
	<1267396888.9295.30.camel@trini-m4400> <hmfqnd$7an$1@dough.gmane.org>
	<19c1b8a91003011337m5870f0c2w7bc347f0ffe2c06e@mail.gmail.com>
	<1267479800.4739.271.camel@trini-m4400>
Date: Mon, 1 Mar 2010 13:55:12 -0800
Message-ID: <19c1b8a91003011355r5035cecbx6002fbe27b9cfdb6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graeme Gregory : firefox_3.6.bb : add new version, convert to new staging
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
X-List-Received-Date: Mon, 01 Mar 2010 21:58:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 1, 2010 at 1:43 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On Mon, 2010-03-01 at 13:37 -0800, Khem Raj wrote:
>> On Sun, Feb 28, 2010 at 11:35 PM, Koen Kooi <k.kooi@student.utwente.nl> =
wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > On 28-02-10 23:41, Tom Rini wrote:
>> >> On Sun, 2010-02-28 at 21:08 +0000, git version control wrote:
>> >>> Module: openembedded.git
>> >>> Branch: org.openembedded.dev
>> >>> Commit: 0ca0394c94028b941603b2d6f7264d3eaaed5a98
>> >>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=
=3Dcommit;h=3D0ca0394c94028b941603b2d6f7264d3eaaed5a98
>> >>>
>> >>> Author: Graeme Gregory <dp@xora.org.uk>
>> >>> Date: =A0 Sun Feb 28 21:07:28 2010 +0000
>> >>>
>> >>> firefox_3.6.bb : add new version, convert to new staging
>> >>
>> >> Do we still honestly need PARALLEL_MAKE =3D "" ?
>> >>
>> >
>> > The firefox hg version I tested in december still needed it, haven't
>> > tried 3.6.
>>
>> >From Firefox FAQ
>>
>> you have to add the -j option to .mozconfig file like this
>> mk_add_options MOZ_MAKE_FLAGS=3D-jN
>>
>>
>> Parallel building with -j4 and -j8 seems to work well.
>
> Since you've tested it, patch please? :)

yeah but it was on OE build system that I used for it so I don't
something handy for OE and my work horse machine has a dead hard disk
these days.

>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


