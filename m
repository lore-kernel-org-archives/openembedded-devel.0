Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1JnAty-00089B-GQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Apr 2008 13:06:38 +0200
Received: from andromeda (e180169073.adsl.alicedsl.de [85.180.169.73])
	by drlauer-research.com (Postfix) with ESMTP id C990D584390
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2008 13:17:08 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Apr 2008 12:07:39 +0100
User-Agent: KMail/1.9.9
References: <20080417175150.GJ31895@buddha.tw.openmoko.com>
	<fu8a9b$ces$1@ger.gmane.org>
	<1208474686.4993.182.camel@dax.rpnet.com>
In-Reply-To: <1208474686.4993.182.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200804191307.39153.mickey@vanille-media.de>
Subject: Re: RDEPENDS_${PN}-dev = ${PN} badness
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
X-List-Received-Date: Sat, 19 Apr 2008 11:06:38 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 18 April 2008 01:24:46 Richard Purdie wrote:
> On Thu, 2008-04-17 at 22:00 +0200, Koen Kooi wrote:
> > John Lee wrote:
> > > Take gtk-doc-dev for example:
> > >
> > > The gtk-doc package is empty, so it will not be created.  However, if
> > > you install gtk-doc-dev, it RDEPENDS on gtk-doc, which cannot be
> > > found.  The install will fail.
> > >
> > > I think we should use
> > >
> > > RRECOMMENDS_${PN}-dev = "${PN} (= ${DEBPV})"
> > >
> > > instead.
> >
> > ALLOW_EMPTY_${PN} = "1" would be a better idea, and in line without
> > other depchain workarounds.
>
> If ${PN} is empty and its existence makes no sense I think its
> acceptable to do:
>
> RDEPENDS_${PN}-dev = ""
> RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${DEBPV})"
>
> in the recipe itself. linux-libc-headers.inc does this for example since
> ${PN} makes no sense there.
>
> There really aren't that many packages like this although there may be
> some that have been dealt with in Poky but not in OE.

How much noise would a poky/OE diff contain? I guess more of us should try to 
merge things from Poky.

:M:



