Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUyyo-0002rd-C5
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 13:34:50 +0200
Received: by wgbdr1 with SMTP id dr1so1487566wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 04:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DxZgzFw47YeTGLhEJMDEzHnJeye1x1p/it+zs3Ed5Fc=;
	b=qUhVAmtSg7rmSI7LAj0q0HoTVqPge/HSkJEada7PCl+jqb7GQoj2+uo6rQgqs3518M
	Q3Pb9GiKqzhtTJalpve3CCcD7II3t8UvHxWc8BDlAdg6M856AphJdgSq8yUlheEECtUP
	gzkll7Kje3m3m2bbIegTfsk8+MLSGyp4r9m/QlG5uCfahydQU2z9NY72OAiObIhISmkQ
	/hdu03796hkwCvdAuEJuKvPCfVUBx3zOmCBbSxXFDak7DiaGadYPiRZa9M6cwr8Dkmjs
	cL69e0etHqTAVS3nsRN9fPsIWNfOTrCN1aroUdOFZ69P6ZdJFdheofz1GbpaNiB7Vutl
	PEwg==
Received: by 10.180.104.231 with SMTP id gh7mr17360461wib.10.1337253888073;
	Thu, 17 May 2012 04:24:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k8sm14866164wia.6.2012.05.17.04.24.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 04:24:47 -0700 (PDT)
Date: Thu, 17 May 2012 13:24:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120517112446.GG3164@jama.jama.net>
References: <1337237919-17155-1-git-send-email-Martin.Jansa@gmail.com>
	<3144141.bgKGuF394S@helios>
MIME-Version: 1.0
In-Reply-To: <3144141.bgKGuF394S@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pidgin: explicitly disable nss
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
X-List-Received-Date: Thu, 17 May 2012 11:34:50 -0000
X-Groupsio-MsgNum: 38846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline

--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 12:20:12PM +0100, Paul Eggleton wrote:
> On Thursday 17 May 2012 08:58:39 Martin Jansa wrote:
> > * sometimes it leaks from meta-chromium and breaks pidgin build
>=20
> Does that mean SSL will be unavailable in pidgin after this change?

No it means that it should always detect gnutls, not nss when chromium
was built before pidgin.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+03/4ACgkQN1Ujt2V2gBwazACgjKm8FvXvO6tf0FbCoouFnyFX
Vo0AniJhoANZoeV/SmffRtV87VGH8DEb
=sk7s
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--
