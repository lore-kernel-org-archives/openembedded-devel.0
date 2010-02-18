Received: from mail-px0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ni93a-0007Be-Ff
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 17:16:53 +0100
Received: by pxi5 with SMTP id 5so5423800pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 08:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=RvLyTMn4Bt9mOSwUx1WrZDadtmtbOpv/Wz0Hn7b0fV4=;
	b=xhkCzKvYed4J+ERivAC3U9WA48eD/1wJnvFpfk6LibfdaHGJ81SvurL2JXpx7Yt/Jl
	ZGahr0wjnPp2mF7qtX31llkuWuFKgtb52L+VIVQt46ynZ19UuwqqtSnhrRQUjzmabPH+
	XQoGarIHKm9tioft960d0ulC3w2irkUr5gmh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ZHv24nuIMxiXUl1f0w+YKRimSCObhkSIH4hctq61O0n3ElP5C4ZJw+CBtHYMvIJOgm
	ULLeio9whrCbqx1PoXuDqReJq+9QRxOzGdu8MfDCU43FWDwYXAI5qG6S50bic+jFCwDY
	ylXpe0ac9ManWkblr8MPLTnlWMs5jYB0t/aAQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.25.1 with SMTP id c1mr6250595wfj.17.1266509649142; Thu, 18 
	Feb 2010 08:14:09 -0800 (PST)
In-Reply-To: <201002181009.07359.marcin@juszkiewicz.com.pl>
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com> 
	<1266334604.6436.159.camel@rex>
	<201002181009.07359.marcin@juszkiewicz.com.pl>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 18 Feb 2010 09:13:49 -0700
X-Google-Sender-Auth: 456380112ec88e00
Message-ID: <b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Thu, 18 Feb 2010 16:16:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2010 at 2:09 AM, Marcin Juszkiewicz <
marcin@juszkiewicz.com.pl> wrote:

> Dnia wtorek, 16 lutego 2010 o 16:36:44 Richard Purdie napisa=C5=82(a):
>
>
> > c) Are recipes in a recipes or a packages directory?
> > d) How deep are the paths to the .bb files?
>
> BBFILES +=3D "layer-top-dir" and BitBake will traverse subdirs and collec=
t
> all
> recipes from there. Never mind are they in recipes/ packages/ stuff/ or
> other
> dir. It is working for quite long time now.
>

Yeah, exactly.  And of course, you can utilize BBMASK to exclude obsolete,
etc.


> e) What priority are assigned to the layers?

 Priorities looks easy when you look at numbers. But problem arrives when
> you
> want layer3 to have higher priority then layer2 and they are not connecte=
d.
>
> > f) Should a given layer append or prepend to BBPATH?
>
> Those two are important. I remember situation with BugLabs r1.4 overlays
> when
> I had to recreate BBPATH to get proper order of overlays.
>

With COLLECTIONS (and BBLAYERS could work similarly), all the overlay
priorities and bbpath ordering are automatically determined based on the
order of entries in the variable.  Documented as highest-to-lowest.

Note that I'm not necessarily arguing against the use of a per-layer
configuration file, as this seems like it would be quite useful, but I
question the need for the boilerplate.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

