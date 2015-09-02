Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B4D9B7700B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 17:25:06 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so48465785wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NnGCNwJpYxC2vwbD6vAm03zApaH0PR7fcKq8RevgZA0=;
	b=m79TQUnsDTRlTHIcTBd4R+vn3QKS5avCpqQp1iz4sp3lWkzTvVQUR2grvXJtVmaccz
	rTetHUgWb/GnVRp8R1WR7y4Pa+HUAfTYpRbge7KLOpQ0dWBChzHYKbvTKRI6bWK1TCEo
	QOKtEkic+yYv5fJgYhMC93f/6KCOfYApJbvu9XsVPV80jVSlJsQy9z4v0pzabzGHaC1Z
	xXXTjmyozn/wZPvfaoWggDIXi/Vr6eYpt66IRcCbM1Pw4EoJy1WifFUmqCl9Q9r+La5M
	x2lRMN0s/MeVOj7nUqLp0fbP1o3MXjiRGfO8jwt3BdQm9+M1g4Anjj2C/X+cH/5kxLUu
	Pg5g==
X-Received: by 10.180.187.227 with SMTP id fv3mr5444262wic.57.1441214705117;
	Wed, 02 Sep 2015 10:25:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id f7sm4610137wij.17.2015.09.02.10.25.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 10:25:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 19:25:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150902172525.GE2470@jama>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<aa8e5f7733a5b247b397236478271575215c843c.1440502860.git.samuli.piippo@theqtcompany.com>
	<CAP9ODKoUVXp5MuOiTTiYQfkWzWjU=wf7dKVpNnBJW2KNudZZyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoUVXp5MuOiTTiYQfkWzWjU=wf7dKVpNnBJW2KNudZZyA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH v2 05/11] qt5: disable debian auto renaming
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
X-List-Received-Date: Wed, 02 Sep 2015 17:25:08 -0000
X-Groupsio-MsgNum: 57180
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline

--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 02:07:15PM -0300, Otavio Salvador wrote:
> On Tue, Aug 25, 2015 at 8:43 AM, Samuli Piippo
> <samuli.piippo@theqtcompany.com> wrote:
> > Some of the Qt modules have multiple libs, which prevents debian auto
> > renaming to work correctly. Instead of only having some modules renamed,
> > disable renaming for all Qt module packages, so that all they all are
> > named as ${PN}.

I don't think this explanation is good enough reason to disable debian
renaming and that's why I didn't take it into master-next yet.

The original idea was to let qt5 package with libraries coexist with qt4
ones, I agree that not many people are using this, but on the other hand
few people asked me to provide more granular packages for qt5, so
instead of disabling debian rename everywhere why don't we split the
packages with multiple libs or define LEAD_SONAME where one library is
significantly more important than the rest and the package should be
named after it?

Regards,

> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>=20
> I think you could rework this to use a python function to set it for
> all the packages and ease long term maintenance.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXnMQQACgkQN1Ujt2V2gBxHTACeLOCkH8P0XeHzwCzjmSe1KOnM
fscAn32S6gKyMcUEZZ1PDf+H69n51Lxn
=EfL1
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
