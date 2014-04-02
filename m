Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 497876E89A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 00:41:48 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so8093865wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=scgKzJ9U5KQSjyyTQuvwnQzb+MBKhRuV2vrtzPBaP2o=;
	b=MQT9+HhkDZWS7DSHnRlxatTvtGjkPrJUiFFXFywAH1G048gAQJseRI6kBpVEe/R+8Q
	YcLIyZAQmyt8dz/WyGfaFgMzb/5C+ma4/Eya3ALMHrhX9HCe8eZOEjLzzy5VlfUY6YPU
	GaEZ5Q3uiFeIRBfLeVLj/5uevdQqxwfHD/t567/0aioHgk7osRRD4qmLe7fy1FVJ3z+C
	Ne4RK3GyzWDXbLbqY34+4MGpPOxLK8qvNmf9tkIegrSVLszFaHzuyJl0rVBIWcR6vdZU
	a0W4botYQmFcRTT4xmWdMBGjKJMvXN06T/OiCO1+6HincnU64c6I5VCw9+OnHJVTemoK
	0WwA==
X-Received: by 10.180.96.225 with SMTP id dv1mr23647926wib.37.1396399309333;
	Tue, 01 Apr 2014 17:41:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a42sm617661ees.10.2014.04.01.17.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 17:41:48 -0700 (PDT)
Date: Wed, 2 Apr 2014 02:41:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140402004143.GA2132@jama>
References: <CAOLEWZWxEZNDkg8v7oSoqjzA0mYXxW2pRMWqcraCLhYNRbA6nA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOLEWZWxEZNDkg8v7oSoqjzA0mYXxW2pRMWqcraCLhYNRbA6nA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH v2] changed gnuplot recipe license to gnuplot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Apr 2014 00:41:52 -0000
X-Groupsio-MsgNum: 49024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 05:09:02PM -0700, Stephen Arnold wrote:
> Was working with Martin on this one; the "original" patch referred to is
> Tim's gnuplot upgrade patch.  The patch being superseded is my earlier
> patch from today that included Tim's changes plus the license change.
> *And* the license file patch was just resent as a patch to meta-oe, so
> hopefully we're good on this one...

The commit message should still be improved as Paul says, it also
mentions oe-core patch which isn't true anymore.

It would be even better if you add gnuplot license file in this commit
and in the other one just add the license text for gd. That way we'll
have related changes in the same commit.

> On Tue, Apr 1, 2014 at 4:14 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
>=20
> > On 1 April 2014 23:36, Stephen Arnold <stephen.arnold42@gmail.com> wrot=
e:
> > > Also sent license file patch for oe-core.  This supercedes previous
> > gnuplot
> > > patch that incorrectly included the original gnuplot patch changes as
> > well.
> >
> > Just got a few bits of general advice on submitting patches to
> > OpenEmbedded:
> >
> > Each patch subject should be of the form "thing: change", where thing
> > is usually the recipe name. So this would be "gnuplot: Use gnuplot
> > license" or something similar.
> >
> > The "[PATCH]" tag should be "[PATCH v2]" if you're superseding a
> > previously sent but not yet merged patch. In this case, it's unclear
> > which patch your mean. Please email in reply to the patch you want to
> > cancel so that the maintainers know not to merge it.
> >
> > There's a lot of further detailed advice and guidelines at
> > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> >
> > Thanks,
> >
> > --
> > Paul Barker
> >
> > Email: paul@paulbarker.me.uk
> > http://www.paulbarker.me.uk
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM7XMcACgkQN1Ujt2V2gBx7wACgkwPvwoeV3iJwdSzyqZ4SmqXc
1hAAn1vDihLdR4sTOAXoR7+v5mKFTXNL
=DGK2
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
