Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id E67D178741
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:48:56 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id c193so569403ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=A5D7/PNbNWLl3U+SqItYYCjsM2WiVNVWircqXsB+PU0=;
	b=gOZeS9O9s4Kjh06nlg88MY2bkxBlD+c7DFoXD2XaU4LvfBDlkb6D8dNuM7Sm1553N5
	Zg8LtE6h5w8ACHvqhDhoPMLUQBK2ef8QmXGUVsDQQNkNEW+gxKR5mjKJNYHKFNd45QRY
	ueQm0lcH2XBPr9zfG1usrnsFVfP1ZKkMy/bNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=A5D7/PNbNWLl3U+SqItYYCjsM2WiVNVWircqXsB+PU0=;
	b=GAR2l+NLzIQXBN+uo2j28ejz2KSBjpLf1yF8Dv87hg2/vh6eILlMaCFC6DbK/ZhOnK
	6UEPzJyPTikiZlPr0heZ3Mc37aOepT+n0JFpM1MLvfouba6GzmZxwEeyYuIpSJjUx1PO
	vy+Auhb52JeyQmi+e+scgNe6HGKr16E60voSHbpWuNFGwWA7INCRebsF5eF3MCJj5+dm
	o6IEBGC0Te+n+TYnVccCgTwuoGcAXP4qovDSZVJdiiaEu4dzg7wFJtQAV0fVLwGb3YoO
	BjMl1IM3cxE1EHhjzHeZ+SNST2Y0C/ZGMm8OSjgDSBoZxtOjXIooDvj9zee8U4uYj7yd
	qUnA==
X-Gm-Message-State: APf1xPDha3XWjbQ5AilfCQpxJgGZwXswUrT6nbC1QAdCIswWQ5YpoSnq
	+lk0RDxMgQVBrLdE9SqIPVosyaucuWY=
X-Google-Smtp-Source: AH8x224iMBtwME4mAqz0mxTG8SaEq6SezxDWoVAWETrCBfCFH8cvGUuRjhRPsJ+Zya6jDWYabOcKFQ==
X-Received: by 10.13.239.3 with SMTP id y3mr2366038ywe.330.1519224537859;
	Wed, 21 Feb 2018 06:48:57 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	q5sm10943568ywb.90.2018.02.21.06.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 06:48:57 -0800 (PST)
Date: Wed, 21 Feb 2018 09:48:55 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20180221144855.GL4311@bill-the-cat>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
	<20180221135732.GI4311@bill-the-cat>
	<CAP9ODKq2CgQj_C1KnmGrN6giJa5SFLrq6jjg-mGQgJwO0QQwhQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq2CgQj_C1KnmGrN6giJa5SFLrq6jjg-mGQgJwO0QQwhQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 14:48:57 -0000
X-Groupsio-MsgNum: 70801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NqBeRcvybb6C9jMF"
Content-Disposition: inline

--NqBeRcvybb6C9jMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2018 at 11:00:27AM -0300, Otavio Salvador wrote:
> On Wed, Feb 21, 2018 at 10:57 AM, Tom Rini <trini@konsulko.com> wrote:
> > On Tue, Feb 20, 2018 at 09:10:25PM -0300, Otavio Salvador wrote:
> >> On Tue, Feb 20, 2018 at 9:07 PM, Otavio Salvador
> >> <otavio@ossystems.com.br> wrote:
> >> > On Tue, Feb 20, 2018 at 3:52 PM, Richard Purdie
> >> > <richard.purdie@linuxfoundation.org> wrote:
> >> >> I could combo-layer pieces of meta-oe into poky but I'd imagine that
> >> >> would create more problems than it would solve too and given the
> >> >> general dislike of combo-layer, I think ultimately better layer too=
ling
> >> >> would be a better answer and more acceptable to everyone.
> >> >
> >> > Poky creates more problems then it solves
> >>
> >> ... send was too soon ...
> >>
> >> Poky creates more problems then it solves.
> >>
> >>  - it causes confusion
> >>  - it avoids the urgency in adopting a setup script
> >>  - it does not use the layers as we market as being a good thing
> >>
> >> So adding more things to it, just makes it worse.
> >>
> >> The setup script is more urgent to be discussed then splitting meta-oe.
> >
> > I agree that a setup script of some sort (off the top of my head,
> > something that takes layer-names as input, checks vs a list,
> > fetches/clones, creates a wrapper around bitbake-layers to always add
> > them) should be a high priority.  I don't have a problem telling my
> > customers to clone meta-openembedded and then use the layers that are
> > needed in that specific project.  But it's painful to have a shell
> > for-loop in the docs we provide so they can setup a build.
>=20
> I think we ought to start a thread about the tooling, but let's focus
> on meta-oe split here.

Agreed.  And to be clear, I'm another vote against splitting meta-oe.

--=20
Tom

--NqBeRcvybb6C9jMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJajYbWAAoJEIf59jXTHXZS8FwQALPtJx/30CA1mRkixu6r9t3w
YOBn5vFXKWCIlLdnaeF96FZk+s6tR6x4qOneVDkXpUtLxKskyXRNVEZExpecpzhX
RjmJni7NtCROCs/rnWrOxLtf6c1OQ2OWMFG8oJcTw6JSdgEBRJnqV8GKnw6WnX4m
YHofs3s7voXy1b89uw9HK2PCKJsOdIt1JA/GHsxXXRNb88yz4JFdUF6+5lHNqaN8
dty8rATg//UiSszU3SqHlaof5Rx5lB7NjwcmQ99qfgDxqoE/yBsYqpT5tNCtDQja
5C413/e2pCj0+iSSMkvUm1D4gu1/Dw8qAEpZm24nyMHqihcrEFILGNx0l4MbPNED
Hau567mVmSYMWWlUvSOnn8II8VsYJ4uqr7zN79jLvuK0GgJ9aBn1nld4AG50oc+i
rXUXT/umWelR6toh5xQcbgTMtlfFCQFLLkreTqsOUMVD3GVpRfTsPzW7erO2umwU
IdzmCNG2Uu0uux7oa7QUPav0TIDyeFvXur1DI0uN7DS4LPFwBtiTQhHUVIZDvh6b
/2kIrArkfI65sfWzmjJgApHN4VYbFV9zeRDF+vYee2Qv+DCqfZJhbGfEHKOZmmvr
zpt7njQcATLa0YIZbh+X8vODtjMejnyYXw3tv+2pIg2UWlY72BwabtZLiUBiIkXz
lGopRVVXEoNmkQJGsUiv
=WtdZ
-----END PGP SIGNATURE-----

--NqBeRcvybb6C9jMF--
