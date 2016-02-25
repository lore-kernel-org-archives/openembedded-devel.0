Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03478771F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:22:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c200so3757066wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IfqxEvBJLGBbCuVVtywsy8gqBRxG5EsfulAI2285M1I=;
	b=Y55v3bFuJvF48sFPZTB9lDeSJDXPHFZbvWxFxyit0IEbVMN3RcuCl+aO8BjluUWi6g
	ZAvPrpKfOk7Tpeb2NOna58/p57py2CwB9iwNl2P7YKn/nga7xGkvNkkPnxgClTUwdohr
	+8hIoYPdaTrburOXBtNECzyAJG2fETtCRXMueX/oDvKaNgARPHiNzvLItQovh/2/olx4
	7hfBE+9n/wlBwnOPANyVWchxTJ1sTmA3ih6ZEr3tT+QuABySySe32sFOuDZP+odvYoYo
	s8iTOQVSv8N/Zt9I8PjrRpksIrI0ecNOGbBkRFXAQ5J+8X81gXPaazRC+fYGTg1HxSbF
	mY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=IfqxEvBJLGBbCuVVtywsy8gqBRxG5EsfulAI2285M1I=;
	b=eopTIeD3icALa22vMnBxZ3Ev9Oj0r8sgQXh5JnM0Xo4810DTk+qGcuJsVVI33AM68k
	/uCLZ2Sl5FiFt42lBtPEFkA8/3LBrv6+rApZd1N/OROAtiaAWgft6vMa11ihZOduwXim
	mvdlDR+Er6fBfEAxmLgq53gQpSiweHD9fpn+E+UyA3uMOgIiuZBn/z5bTpWDxO0l1KCo
	gDpWJgorZcE+Gn2ww2x36/DkKGrKpTMgNfzkmSJo+uSfCOgy5QzMChZ1rupRChTpR2E/
	XWPFRFWXVfkDwsp5fNQz2Sy0UPp6QWQo4sHJ2ype2w3n4CsTdvMZ93xxFYdm4E88h0Og
	GH/Q==
X-Gm-Message-State: AG10YOSeVK4/SDblVD0VUcCPIRRDiCTJPr+ZlQ9oZV44cFcyIhT721l4XnqaW5TxrYt/yw==
X-Received: by 10.194.90.172 with SMTP id bx12mr45269171wjb.128.1456410127879; 
	Thu, 25 Feb 2016 06:22:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ls5sm8135498wjb.33.2016.02.25.06.22.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 06:22:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2016 15:23:20 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160225142320.GB2565@jama>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
	<20160224164704.GH2560@jama> <56CF0363.5070207@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56CF0363.5070207@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 00/34] Initial gobject introspection support for meta-openembedded
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
X-List-Received-Date: Thu, 25 Feb 2016 14:22:08 -0000
X-Groupsio-MsgNum: 60203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline

--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2016 at 03:36:35PM +0200, Alexander Kanavin wrote:
> On 02/24/2016 06:47 PM, Martin Jansa wrote:
> >
> > Many people aren't using poky and don't want to play with combo-layer or
> > format-patch/am combo to reapply the patches from poky repo to oe-core
> > repo.
> >
> > As you're definitely used to such strange environment, can you please
> > push corresponding branch for oe-core to openembedded-core-contrib repo
> > as well?
> >
> > Thanks!
>  >
> > I should start reading the cover letters :), will remove this from
> > master-next until openembedded-core-contrib branch is available.
>=20
> I think you misunderstood my intent somewhat. I don't want you to queue=
=20
> these patches anywhere, they are preliminary. Their purpose is twofold:
>=20
> 1) People interested in playing and testing that poky branch with=20
> introspection may want to use recipes or whole layers from meta-oe as=20
> well (gupnp for instance).
>=20
> 2) I'd like to demonstrate to you that meta-oe will be taken care of=20
> when introspection lands in oe-core, because historically there's been=20
> some bad blood regarding those disruptive oe-core changes :)

Thanks I appreciate it.

> However, I'm reluctant to provide the patchset for oe-contrib. The=20
> reason is that I've been maintaining the poky patchset since November;=20
> it's more or less rebasing, merge conflicts fixing and world rebuilding=
=20
> once every one or two weeks. I wouldn't want to duplicate this ongoing=20
> work for oe-contrib as well, and keep the two branches in sync, because=
=20
> I don't actually know when these patches make it to master. So if you=20
> want to try them out against pure oe-core, you have to extract and apply=
=20
> them by hand, I'm afraid. As a one-off task, it should not be complicated.

As you stated above it's not one-off task, because you're still updating
the branch. I'll just ignore both patchsets until both are ready and for
correct repositories, I'm not personally interested in introspection.

Thanks
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbPDlcACgkQN1Ujt2V2gBwG5wCfVL0fJnmTSFXiQGnpG9qhsAB5
UOkAoJBbbwyW1hWdXy/BNdnzfrZ3/TAO
=yBLa
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
