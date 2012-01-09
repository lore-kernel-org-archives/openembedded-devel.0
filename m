Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RkJBI-0007Tb-BY
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 18:38:48 +0100
Received: by eeit10 with SMTP id t10so2054120eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 09:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k/j88Z7i0IhU4Qypf51frITeNDdatTj7WQ3kNjP8reQ=;
	b=rKHla3GYSImQjv1uJmxLs2Yx2UalbOyI7zcsKtOT8E+M4qSksyS+UEN515ZwkB6Gz7
	nsLYnQe4+78+nOaShR3GPUCfeNURqWgBL8YwSY5Ck9rVQeqLfJ2OKQCOgW0RLSBbS+Ie
	JTh0283HhlJn6sxZ7DKvs2UgTJCLNNRS2H97Q=
Received: by 10.14.11.27 with SMTP id 27mr6370094eew.126.1326130280757;
	Mon, 09 Jan 2012 09:31:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 15sm42253286eeu.1.2012.01.09.09.31.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 09:31:19 -0800 (PST)
Date: Mon, 9 Jan 2012 18:31:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120109173107.GC3936@jama.jama.net>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
	<4F0763FD.9000801@windriver.com>
	<CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
	<CAP9ODKo+uNuXx+jmN6uiFgG9nuwEuTjwc2JDpXnrygyp88j=rQ@mail.gmail.com>
	<4F0B0F7A.9020907@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4F0B0F7A.9020907@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Mon, 09 Jan 2012 17:38:48 -0000
X-Groupsio-MsgNum: 36442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline

--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2012 at 10:02:02AM -0600, Mark Hatle wrote:
> On 1/6/12 4:21 PM, Otavio Salvador wrote:
> > On Fri, Jan 6, 2012 at 19:49, Otavio Salvador<otavio@ossystems.com.br>w=
rote:
> >
> >> On Fri, Jan 6, 2012 at 19:13, Mark Hatle<mark.hatle@windriver.com>  wr=
ote:
> >>
> >>> In what way?  Most of the problems I've observed in the past have been
> >>> docbook related, but I think those have been resolved within OE-Core.
> >>>
> >>
> >> Docbook related problems; you prefer if we fix those then?
> >>
> >
> > It uses xsltproc and there's no native recipe at this moment.
> >
>=20
> Hmm, I think the best solution is to fix the docbook problems, but baring=
 that a=20
> static version of the man pages is the next best alternative.
>=20
> Advantage to fixing docbook is it will work for the next package.  :)

and for all xorg-* stuff...
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg23=
006.html

But right now I'm using patches to disable it for xorg-* too...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEUEARECAAYFAk8LJFsACgkQN1Ujt2V2gBx7JgCggbWLv+dOOjX2ZghrW8enwXHC
rR8Al2PRbsE+zJgEQLnHcSaODvAqx/k=
=l/16
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
