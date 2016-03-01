Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 772F57326D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:24:33 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so22306958wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rezIfGocP8P+o1gT6DC7UL63DfYI7JzKBXZ1waSJ33g=;
	b=fzEBYE8huqCnR1BMwCf+1AwnpqLxRB5ahgS/md3qvtCJmhYRrpgQqJwTkBIWPGFk2j
	11hQj/CV1cL1IvOQdQoYZMZGW8txAZ0CroBBz/0p1yttriHRhV1bX/frtvGvlunLi1BH
	ma5NfI+x0t2DARMW+n9viD1ttPoyO38lhlbGKrqqxDRywX60n6uh8vubaqfws6mQHOgd
	RtgqFF56Rh/pUyytq/TUhCw8cHgc/ukiAKc5mDZhoqe0yNImnDZSUEQzyUJ3HgDPIEr7
	JS3J/iUZMSEjwA6xK1pkbca2XWETdnkU4lZ9DUHd5X4SpkEp4NShPJaopgTN3mnnzzDc
	jn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rezIfGocP8P+o1gT6DC7UL63DfYI7JzKBXZ1waSJ33g=;
	b=WfnmEcoq/n1kHIn5FLHvTuY1N3b1fEhnB24uoHPolzfBE2gr6r/bnUdHowd8rsNgiV
	SafSbQzymHScNekI2GIQcGQAotRJg65yeswy+KiOhtXUkvY4WUxo/z6pr04UL9FToPTl
	qoGCKO4/DFh80n1Nd8PpUX+cD9tTocd538tFQIvz03zJhmgJEH9RMNjdconQPYycCHKq
	W4jgKiWs0FJxk9LfeAk6rROT+wN4VjNfg2lOHnAZLCYBJYOQN0Y0Mv8Vbk4Ql00ynwK1
	ISJKUGAiG9jx5aUD+UJwr5eSCwGwMrwynQP6PX2x4iuMuyQGScF/4XiBkNdEem/Jb31I
	qItg==
X-Gm-Message-State: AD7BkJJ0GoFpsot8e4bq3OPDTu/AG5FWLFVyy5xMFIj2wEFBNl6UTcc5Awb0aFoT0Ti+iw==
X-Received: by 10.28.130.6 with SMTP id e6mr2286506wmd.71.1456820674017;
	Tue, 01 Mar 2016 00:24:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ks5sm29755470wjb.13.2016.03.01.00.24.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 00:24:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 09:26:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160301082624.GB16002@jama>
Reply-To: DUB130-W394761EF53CEE03D5EB23ADABB0@phx.gbl
References: <BLU436-SMTP13341B70B1E43FF04270322DABA0@phx.gbl>
	<CA+chaQehDvb+YrM0tMP49V2kH1ZmmSYqziPNmywwudEP7YQ=MA@mail.gmail.com>
	<DUB130-W195DB455AC6F54690CBF1BDABA0@phx.gbl>
	<CA+chaQfVubgE=fzEDX0HV1e-VYNZ5H0DBLG55bEkUyf55wSSVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfVubgE=fzEDX0HV1e-VYNZ5H0DBLG55bEkUyf55wSSVg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [OE-core] [meta-oe][PATCH] Fix gpsd build by switching to use EXTRA_CONF_PACKAGECONFIG.
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
X-List-Received-Date: Tue, 01 Mar 2016 08:24:35 -0000
X-Groupsio-MsgNum: 60275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline

--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

FW

On Tue, Mar 01, 2016 at 12:58:55AM +0100, Martin Jansa wrote:
> > I also see now someone else has already posted a different fix to this,
> although from what I've read about this error, mine is the more general
> solution.
>=20
> Your solution depends on oe-core patch which wasn't merged yet, and that
> change may be refused or the variable could be renamed.

http://patchwork.openembedded.org/patch/116719/

>=20
> So I'll merge the other change at least for now, it can be cleaned later.
>=20
> On Tue, Mar 1, 2016 at 12:13 AM, Chris Trobridge <christrobridge@hotmail.=
com
> > wrote:
>=20
> > Thanks!
> >
> > First Patch...
> >
> > I was puzzling about that.  I did read the readme but obviously not
> > thoroughly enough.  I saw a few patches to meta-oe apparently send to t=
he
> > main list but wasn't aware of the devel list.
> >
> > I also see now someone else has already posted a different fix to this,
> > although from what I've read about this error, mine is the more general
> > solution.
> >
> > Regards,
> > Chris
> >
> >
> > ------------------------------
> > Date: Mon, 29 Feb 2016 23:45:31 +0100
> > Subject: Re: [OE-core] [meta-oe][PATCH] Fix gpsd build by switching to =
use
> > EXTRA_CONF_PACKAGECONFIG.
> > From: martin.jansa@gmail.com
> > To: christrobridge@hotmail.com
> > CC: openembedded-core@lists.openembedded.org
> >
> >
> > Wrong ML, patches for meta-oe belong to openembedded-devel ML (see READ=
ME
> > file)
> >
> > On Mon, Feb 29, 2016 at 11:31 PM, Chris Trobridge <
> > christrobridge@hotmail.com> wrote:
> >
> > Was using EXTRA_OECONF, leading to:
> >
> > SCons Error: no such option: --disable-static
> >
> > Signed-off-by: Chris Trobridge <christrobridge@hotmail.com>
> > ---
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > index ff268b3..39d6470 100644
> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > @@ -45,7 +45,7 @@ EXTRA_OESCONS =3D " \
> >      strip=3D'false' \
> >      chrpath=3D'yes' \
> >      systemd=3D'${SYSTEMD_OESCONS}' \
> > -    ${EXTRA_OECONF} \
> > +    ${EXTRA_CONF_PACKAGECONFIG} \
> >  "
> >  # this cannot be used, because then chrpath is not found and only stat=
ic
> > lib is built
> >  # target=3D${HOST_SYS}
> > --
> > 2.4.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVUi8ACgkQN1Ujt2V2gBwongCfexPPIAzaOzC5ChM4tepIAg7u
3S8An1Kz721aDXbe05dglUYPgDCLhXbp
=y+SS
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
