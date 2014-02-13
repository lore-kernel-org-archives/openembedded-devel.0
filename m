Return-Path: <joe@deserted.net>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2CE6E8BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 01:02:25 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id u16so1308425iet.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 17:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=MwwCXURvDyyVxNUi3sP1eEcBxcIoRuCsH7L1lhQPbw0=;
	b=NsDQCM725c1RLZWIb4gP+kk5jEqTHUBf+vIxvZKnPxs438wEPoweoE76xQgJlP3Y6W
	NGFMTEleeeO5xr6Gr/GTgIGwnHQpiZamNNx/Pc1wjnVtUiNWSqBIIwFjmie4uEfmB6gt
	5ycdpMxxI6khe95kD2PHxETW3utM1/gwv4nqOR0KiE7gxD01Ly91mQ9PnJXUkPvSLLwn
	Xg/OKLpCNYOM7G3pELVHaxOLmyKWo7tHJLfPXVgyUmyuKXzGckshpE0/y3d3+mUOUsZt
	NC++e7ORf4JofNs2dz997ek8QNa3kukTzDKGAzxulR2jz+o00fcKhOeWekrPn2RaQXcb
	MxDw==
X-Gm-Message-State: ALoCoQkeNngEBC+vqMYGgeMQuOFnDgdI7rhMyahWTxLwKS93uiwfqmDcH5JHzRBrWoKAPH6x63Mh
X-Received: by 10.50.50.241 with SMTP id f17mr1078115igo.23.1392253346011;
	Wed, 12 Feb 2014 17:02:26 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id f1sm1675440igy.2.2014.02.12.17.02.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 17:02:24 -0800 (PST)
Date: Wed, 12 Feb 2014 20:02:22 -0500
From: Joe MacDonald <joe@deserted.net>
To: jackie.huang@windriver.com
Message-ID: <20140213010219.GF23405@deserted.net>
References: <1389940848-376-1-git-send-email-jackie.huang@windriver.com>
	<1500081.lxhvWhSdf3@peggleto-mobl5.ger.corp.intel.com>
	<52DDE074.7070000@windriver.com>
	<CAP9ODKpZ+f1=kg3Qo8FO0axKMr+i6VhT2mXnOhciJErK3vPCtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpZ+f1=kg3Qo8FO0axKMr+i6VhT2mXnOhciJErK3vPCtA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Thu, 13 Feb 2014 01:02:25 -0000
X-Groupsio-MsgNum: 48131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Content-Disposition: inline

--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] strongswan: update verion to 5.1.1] On 1=
4.01.22 (Wed 12:29) Otavio Salvador wrote:

> On Tue, Jan 21, 2014 at 12:50 AM, jhuang0 <jackie.huang@windriver.com> wr=
ote:
> >
> >
> > On 1/20/2014 10:56 PM, Paul Eggleton wrote:
> >>
> >> On Friday 17 January 2014 14:40:48 jackie.huang@windriver.com wrote:
> >>>
> >>> * Add rdepends on strongswan-plugins.
> >>
> >>
> >> Is this really correct? Does strongswan not work without the plugins?
> >
> >
> > Yes, without the plugins, the ipsec_starter fails to start:
> >
> > root@qemu0:~# ipsec start
> > Starting strongSwan 5.1.1 IPsec [starter]...
> > root@qemu0:~# tail /var/log/auth.log -n 4
> > 2014-01-21T02:46:57.175940+00:00 qemu0 ipsec_starter[926]: Starting
> > strongSwan 5.1.1 IPsec [starter]...
> > 2014-01-21T02:46:57.653396+00:00 qemu0 ipsec_starter[935]: charon has q=
uit:
> > initialization failed
> > 2014-01-21T02:46:57.656916+00:00 qemu0 ipsec_starter[935]: charon refus=
ed to
> > be started
> > 2014-01-21T02:46:57.661374+00:00 qemu0 ipsec_starter[935]: ipsec starter
> > stopped
>=20
> So why to split it?

ping

--=20
-Joe MacDonald.
:wq

--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL8GZsACgkQwFvcllog0XygRACfVPWzMteHDARPPaVDmmbmXP16
b4wAoJ4fJlXpjmifHRGOUpVHxYuJ2qky
=4xdv
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--
