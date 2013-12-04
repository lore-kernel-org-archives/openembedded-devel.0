Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 282EA6DF4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 01:35:33 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so10352024eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 17:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=85TWsPKyzb2WKBcxgnllVkitBGq4ZF0IITXjZ6u/XIc=;
	b=CGyZG1NAv5H9xEovqZ9Bs9k9V5sIJy535L0oCaxWPmP2UXqWGCiLhKyrOTM3OmZAjM
	dL6evCdnU0dB7W/OYBVXMEhQ0NrRZSDKDpr22A2tO1GCm3oGSuaF4JOYCnJAu/RK4Mdb
	0a1mw0nXfXioBQb8cFGZVEHQUTCABSW1YmODtZFMwtVyiyYYjx6fzpZEMb//BlKNqesK
	yrmfecBsyltHRwQUC0jcBMkc+8u1WnBRlPqFHtw/Z2oIdJAyPHzarVxzsecfs4KgY51/
	7NZsIZu3YlSeGjo6vaQORsyaPNxLs4JM7vGyhX1TE6VtFFHFMcySD2cmnhUDOvO8ptMQ
	k+Gg==
X-Received: by 10.15.82.136 with SMTP id a8mr5043482eez.81.1386120931734;
	Tue, 03 Dec 2013 17:35:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm65198886eef.16.2013.12.03.17.35.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 17:35:30 -0800 (PST)
Date: Wed, 4 Dec 2013 02:35:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20131204013541.GH3714@jama>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
	<20131203230542.GG3714@jama>
	<CAP9ODKq16jf4Q1p+3uQu2N5o1sf2oA_9cnBcLAUXQw=Crbm+VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq16jf4Q1p+3uQu2N5o1sf2oA_9cnBcLAUXQw=Crbm+VQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe 1/5] meta-oe: Drop pointercal-xinput from SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Wed, 04 Dec 2013 01:35:33 -0000
X-Groupsio-MsgNum: 47351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Content-Disposition: inline

--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 09:40:34PM -0200, Otavio Salvador wrote:
> On Tue, Dec 3, 2013 at 9:05 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, Dec 03, 2013 at 07:44:03PM -0200, Otavio Salvador wrote:
> >> The pointercal-xinput has been moved to OE-Core so we should handle it
> >> here.
> >
> > Is there patch for oe-core doing that?
>=20
> No but I can send one. Do you handle it or want me to do?

Please do, there was enough breakage from xinput-calibrator move to
oe-core (in xserver-common mostly) so I would like someone's else eyes
on that too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKehu0ACgkQN1Ujt2V2gBxBogCfTsz89XrjWeToVxgkjJH6DMCo
9BIAnizFCTBnN9buEYg5CzSVnrh5Emv7
=YQP6
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
