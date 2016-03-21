Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3446E65F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 20:49:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so24911235wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UNXHnE6PvGw/+Fml7CNvGFj7BPtmJrRLMEqDrv6MkYg=;
	b=lax94bdfgyTD0NMnPRMIADH8eIWrvm7fm5HYTIgFfF7xxfzImHGVlQGnnIiqVOWFMs
	pxRlu1LkmgQLGO7Qj+lWjPM2eH1unteS/eGfQnOFnO9fqA5eaCaZphrdbmdMP5pBCzKN
	NpVRCs0djq+dYZGnsDDY2bv0v31TnGaHwZXOPzkOqJR7RMKeBJBxipE38aZOMAWvp/vM
	Z2j2neKMIJ1g351CkY1+fo5eJCqOplAqltkW8A56HlghjUEYnS4SQwcsgvbFv/JQAe0I
	zo4wjE/XO/G8pVZJGWk7dpRkh8RRJZVg+A1RkeRlZw9XXKvHk5p2VP/+5v/JCRM15kdy
	t3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UNXHnE6PvGw/+Fml7CNvGFj7BPtmJrRLMEqDrv6MkYg=;
	b=KzLZ6+VORPny+/unTtKlLd13oiosOUXFnBSAk4eKCON1g4WxmF82EXLh52FJqctjw9
	21HiHbtaGcFNbVOLJWSaWzRrcNE9U4brU8uqsI46bRLbc+Kl9Z1Kmq9B6e3dgxsIYTzz
	KvWeDlgqqH125D0erRG1l83PpUd2NmXEEn0cvcuXkKll1/HykuOW/jEjwN2BncyLDX+5
	BXC4xZ3JW47UHj4oQ+REYAKmpq86ojbLwMIWr2QvjCRp/lcfLcfjagnIbRqPHGleuBQh
	cK6BCwRfMDizp/LoRZT/1oAyyPAD85GNR8XOQuQT7SjIQXiqUbunE+pcsX5K52274vQn
	XzKQ==
X-Gm-Message-State: AD7BkJKL31Tr6/vs0cbeqZji27bq3uwjzxTe9SrQb3i8iSAunXPCNAtVBPLNy21AqPBBaQ==
X-Received: by 10.28.135.1 with SMTP id j1mr15610569wmd.20.1458593387825;
	Mon, 21 Mar 2016 13:49:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m6sm27022652wje.21.2016.03.21.13.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 13:49:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2016 21:54:04 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160321205403.GF2562@jama>
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20160321145053.GD2562@jama> <56F008EE.4060600@linux.intel.com>
	<1817823.GWXx3ahntL@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1817823.GWXx3ahntL@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] gnome-bluetooth: replace systemd dependency with udev
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
X-List-Received-Date: Mon, 21 Mar 2016 20:49:50 -0000
X-Groupsio-MsgNum: 60606
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline

--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2016 at 09:43:00AM +1300, Paul Eggleton wrote:
> On Mon, 21 Mar 2016 16:45:02 Alexander Kanavin wrote:
> > On 03/21/2016 04:50 PM, Martin Jansa wrote:
> > >>   inherit gnomebase gtk-icon-cache distro_features_check
> > >>   gobject-introspection>=20
> > >
> > > So you can remove distro_features_check inherit as well, right?
> >=20
> > Yeah, I guess. Feel free to amend.
>=20
> The reviewer is asking you to do that, although perhaps not in so many wo=
rds.=20
> Can you, please?

Normally I agree with Paul, in this case I made exception and amended it
myself when chrry-picking.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbwX2sACgkQN1Ujt2V2gBzEKwCeIkAtEqvHhjgkf+qX2E5buLYL
icsAni1fkJb3eiPJmfWLL26PenrBfUQN
=YyBA
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
