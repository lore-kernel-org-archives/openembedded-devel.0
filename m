Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JzD0c-0004EQ-Ur
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 May 2008 17:47:21 +0200
Received: by wa-out-1112.google.com with SMTP id j37so125256waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2008 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	bh=vPI3P3EHi4HXPY0494BUMgro8flduH8rTDSkBFBtVSY=;
	b=d3p1xcd2R402vWIFRTA7Jq5sUCf/dW36MUDlhP93UUz0gfrrgGBKfS4YvA6iUumAZGedB32TyLFUe4sfc69lDLsg2yfU+LxE2Ip2UAPTzIFh0wPitdYlyTDArFJitondyfSnVnlUPUCSsM0Oh+74b9dT6barPpfgvFCLAuVaPBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	b=TP21oEgn9KgH2TY+zbmbgCQ0MKdQPUc3k/2vcH86FX+QaJuYE19Bwu9C9HSxbJV5bdnB8OqjmoBIgk4loPpBqx9Uj53jtOCkEG1X06L9W8g4S+A+5YrI35tWft1tLzvDXfxTkRQrbW85vRlL9jNhDwLxhWzBOXgkrM7w3ETXXKE=
Received: by 10.115.106.7 with SMTP id i7mr262461wam.131.1211471072442;
	Thu, 22 May 2008 08:44:32 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.23.244])
	by mx.google.com with ESMTPS id z15sm5414965pod.13.2008.05.22.08.44.31
	(version=SSLv3 cipher=RC4-MD5); Thu, 22 May 2008 08:44:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
Date: Thu, 22 May 2008 08:44:30 -0700
Message-Id: <1211471070.8550.89.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 22 May 2008 15:47:37 -0000
X-Groupsio-MsgNum: 5229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-wCmhkDFpzrIYFUXA5cTC"

--=-wCmhkDFpzrIYFUXA5cTC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-05-22 at 16:11 +0200, Enric Balletb=C3=B2 i Serra wrote:
> Hi,
>=20
> I have the same problem, but at this moment I don't have idea about solut=
ion.
>=20
> Regards,
>  Enric Balletbo i Serra
>=20
> On Wed, May 7, 2008 at 7:33 AM, Matthijs van de Water
> matthijs.van.de.water at gmail.com wrote:
>=20
> > Hi,
> >
> > I'm trying to get an ARM EABI build based on gcc 4.3 working. I'm not
> > having much luck with that so-far.
> >
> > The build fails at glibc-internal (tried both 2.6.1 and 2.7) with an
> > internal compiler error:
> > ../iconv/skeleton.c: In function '__gconv_transform_ucs4_internal':
> > ../iconv/skeleton.c:801: internal compiler error: Segmentation fault
> >
> > Am I missing something? Any ideas?

if you can create a preprocessed file from skeleton.c and commandline
options to reproduce this ICE that will be helpful.

-Khem

--=-wCmhkDFpzrIYFUXA5cTC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBINZTeHnJKy6V6em4RArjOAJsHMxEp7T+c3mN/dKdbMY5YaJM8IQCghi2b
lI51QMhBprrUztNP8QLePho=
=1PrH
-----END PGP SIGNATURE-----

--=-wCmhkDFpzrIYFUXA5cTC--
