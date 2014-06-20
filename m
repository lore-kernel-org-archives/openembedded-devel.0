Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BAC98701DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 23:48:51 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x13so4244689wgg.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 16:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gjyVCAHUPkDLC/gMxUsqOOxzs+g8SlGrQy7weQRNobE=;
	b=H3nw4ZI+72nGbf0s0y6qnqyh7RVBrt6wlt984CXrAtsg/HuyGQZBqEwE3vB/GmqSUZ
	rIBnhLUdgZnBbVWeaXhsBrXBqLkmzOA8UqPbxNLocJNxmfES4db3W6IFQyMGsEjbcpha
	gKYDnyDXnCzI7IWFXcbnN79FvDFnjqqDacD0StGkEvK979Dg+wdcSSwpVjbTliWByhHR
	C+3imRsexOrb2Rc+eJP83l6v9r/Vzn/RUsRUMlyfehVito6kAHryh4kwAKQB+1NNOWho
	Ju9eoh0aWx4eSIOjkOIg49MpXXyl855h6jMyF0YLc9YlvLKqzAXCH9zVtOIDyHS6fTlV
	+lJA==
X-Received: by 10.194.189.81 with SMTP id gg17mr7757373wjc.107.1403308131828; 
	Fri, 20 Jun 2014 16:48:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gp6sm8933585wib.12.2014.06.20.16.48.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 16:48:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jun 2014 01:48:53 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140620234853.GA2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Fri, 20 Jun 2014 23:48:53 -0000
X-Groupsio-MsgNum: 50484
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1y/7ip9Z0l6NTTti"
Content-Disposition: inline

--1y/7ip9Z0l6NTTti
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=E9 wrote:
> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL make my
> build fail with:
> ERROR: qtwebkit not found in the base feeds
> LOG: http://pastebin.com/fx2Zi9vW
> Any clue what I'm doing wrong?

Check which packages (if any) were created by qtwebkit recipe, if any
then read log.do_configure for possible clues.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1y/7ip9Z0l6NTTti
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOkyGUACgkQN1Ujt2V2gByF5ACgpPIl//uV6gt9dMhq35jkJcQV
5zQAnjg9twfWjwq10qG9aHtrTtu8xv3R
=aruh
-----END PGP SIGNATURE-----

--1y/7ip9Z0l6NTTti--
