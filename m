Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Q2iUd-0004uT-UD
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 12:14:20 +0100
Received: by qwh5 with SMTP id 5so6503761qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=87fygmzBskqd7Nh8qq+6eB20W2eWMQguHwmfVByLjmY=;
	b=SwInY/YOpYkifabpRb+aspl5Vm0Vkc0VfxPNbNZkXUTP/skhcY2WaYuhkkk5KRCxNU
	8eqBfiTHUOYmAnwU00YH3rrgCK3tGtxu/ZOfRfcYThQFbpwfb0/DYjBbW9glAPQRspgp
	rM20+OkhpRDL4t+1GaX3GdZNczhQwoCX0ClA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=MS53Pi5ny/DXONkXhGIvOke5nr2ERROX2KNaTOS6txY3gA13sprtkpwLg0kLcYBW9Q
	BSdXiH97Dc8dVP/xmwpFYve9fbspqMnQeOyf5ybSVlZeUAgxsHFtJe2soDMyp25XfbFR
	1GyfdLB7vCB9qyDKkySoD5eW//6bS3emNVcYw=
Received: by 10.229.23.21 with SMTP id p21mr6616505qcb.291.1300965144166; Thu,
	24 Mar 2011 04:12:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.98.202 with HTTP; Thu, 24 Mar 2011 04:12:04 -0700 (PDT)
In-Reply-To: <1300903273.4101.36.camel@mattotaupa>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
	<1300834528.3825.3.camel@mattotaupa>
	<AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
	<1300881388.4101.23.camel@mattotaupa>
	<AANLkTikhnHdQGGh-bkAs3si4PNg5NqGCJ1c2iQOkuwL-@mail.gmail.com>
	<AANLkTi=kT3DNMuC_+6LQGE6usL=ryExHiWm_hKQdu32x@mail.gmail.com>
	<1300903273.4101.36.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Thu, 24 Mar 2011 12:12:04 +0100
Message-ID: <AANLkTim7t=h17BSSU50o=GFd1kGwgwUvKKnSB2ttrCGv@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Thu, 24 Mar 2011 11:14:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul
Thanks for your attention.
Here my machine is "palmpre2" and building for SHR unstable.
If I can help for something..
Grettings,
Sylvain

2011/3/23 Paul Menzel <paulepanter@users.sourceforge.net>

> Am Mittwoch, den 23.03.2011, 15:20 +0100 schrieb Frans Meulenbroeks:
> > 2011/3/23 Sylvain Par=E9 <sylvain.pare@gmail.com>:
> > > Hello
> > > I was going to fill a bugrepport on OE's bugzilla but as you are
> already
> > > speaking of vlc building issue..
> > > It does not build for me neither :
> http://pastebin.com/raw.php?i=3DwK4Sxbv9
>
> It build for me fine *again* with 2b952471. So please, Otavio and
> Sylvain, report you build configuration. I am using `angstrom-2010.x`
> for `MACHINE =3D "beagleboard"`.
>
> > We did discuss this on irc, and the issue seems to be that
> > libliveMedia.a is probably a host lib.
> >
> > Another issue that was noted was that OE_CONF says --enable-live555
> > (or something like that) but live555 is not in the DEPENDS.
> > A quick glance over the recipe showed that there seem to be more
> > things missing in DEPENDS (freetype, apache, png, ...)
>
> That could be and it should be fixed to not implicitly depend on
> something. But we should also figure out why it works for me and lua.h
> gets staged for me.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

