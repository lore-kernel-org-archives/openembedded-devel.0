Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17C8A7E152
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 09:54:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c66so1926257wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2Jeb3wKmGfs0JU3yhesYPU2c7c2CygNhuTUUzLwg/MI=;
	b=UwUEG0q9D3IKUKER0TMHS7tGbJIpVJfRYLtyb73AW4REH7e2recTaun+rZK7KP7xiO
	0dkb9h1AMguDpMhKyrWb+WjRKUuyzjwdd+GvbrenDr0G3lN+54mt8j/So/RaAoulUVTm
	a5FfvI2ScAQgea1kUrTfGsiiqewjmgAydWUMW0iMSJZNKyhQRcQW76UaWUMI/4dmqX/t
	YwZosxW/c1lbNSkG3Dpfekynj/QwbVkaGvLxzD63/idcNF5++CDFaEsMs5BkA4FT3Wux
	5RCMe6K7la2S2nBr0y7pQanLLiJNddo5VVi1vK8AEeijUNWEVCkyvdnizkEt3sQsvLK7
	hEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2Jeb3wKmGfs0JU3yhesYPU2c7c2CygNhuTUUzLwg/MI=;
	b=aKhz5EPr4wU1qJMqSl6iAhTp2bsTYcJLQNTwXzcq0ZLPRcMY4QQcxrBX0Fq+jaa9Qx
	NHxqB6Llf+mEuy031iS34cREHrlh7sJRzmJmhwNlkV35nWeNtvOVOP4IezhdqcLdhQ+t
	RfkhvYKIiwaAUaNOCO8KgazQplgr0lC9tBcYxtSzqiYITJz4udLdWRQbjeuIbRZ8pvN3
	j9eIJKFX5pkgaeHuuJo7Mgiida4j6kmCI14EgAVnJIXJSPVKkKssubf4/TDj08pZGAeA
	m2daxVezFHAFnWdKLwXS7pG4LfurMyNMtTnZ0Jhq8Luv/U0JbNh3QsIIVU8erEHrcjYR
	4UjQ==
X-Gm-Message-State: APjAAAXZbPrfjSKrJ2P+oVZMXrKMHwriarFnZEUOUHr/Gbga2BQDI2tn
	5ItYzjk8ffVqKqZJ+N1DSA4=
X-Google-Smtp-Source: APXvYqytZK50LjeqUOoE2GuOsjVbyJ659QZPdi+mZq405OJLCBBFPgfBOiEEqL8BcAs8cx9iQRSHnA==
X-Received: by 2002:a1c:c5c3:: with SMTP id v186mr2716649wmf.60.1558432497484; 
	Tue, 21 May 2019 02:54:57 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	n15sm22491587wru.67.2019.05.21.02.54.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 02:54:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 21 May 2019 11:55:04 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190521095504.GA23597@jama>
References: <cover.1558410874.git.akuster808@gmail.com>
	<b1fdd51d97dca34a7221649831fc3e0d832219b5.1558410874.git.akuster808@gmail.com>
	<20190521094132.GF15108@localhost>
MIME-Version: 1.0
In-Reply-To: <20190521094132.GF15108@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 21/34] packagegroup-meta-networking: replace DISTRO_FEATURE by DISTRO_FEATURES
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
X-List-Received-Date: Tue, 21 May 2019 09:54:57 -0000
X-Groupsio-MsgNum: 77652
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 12:41:32PM +0300, Adrian Bunk wrote:
> On Mon, May 20, 2019 at 08:56:21PM -0700, Armin Kuster wrote:
> >...
> > --- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-netw=
orking.bb
> > +++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-netw=
orking.bb
> > @@ -38,8 +38,9 @@ RDEPENDS_packagegroup-meta-networking-connectivity =
=3D "\
> >      inetutils wolfssl lftp miniupnpd networkmanager \
> >      networkmanager-openvpn rdist nanomsg python-networkmanager \
> >      wireless-regdb \
> > -    ${@bb.utils.contains("DISTRO_FEATURE", "bluez5 x11", "blueman", ""=
, d)} \
> > -    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "samba", "", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez5 x11", "blueman", "=
", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
> >      "
> > =20
> >  RDEPENDS_packagegroup-meta-networking-daemons =3D "\
> > @@ -47,7 +48,7 @@ RDEPENDS_packagegroup-meta-networking-daemons =3D "\
> >      ptpd igmpproxy opensaf squid \
> >      atftp postfix iscsi-initiator-utils vsftpd cyrus-sasl \
> >      pure-ftpd vblade tftp-hpa ncftp \
> > -    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "networkd-dispat=
cher", "", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "networkd-dispa=
tcher", "", d)} \
> >      "
> > =20
> >  RDEPENDS_packagegroup-meta-networking-devtools =3D "\
> > @@ -56,7 +57,7 @@ RDEPENDS_packagegroup-meta-networking-devtools =3D "\
> > =20
> >  RDEPENDS_packagegroup-meta-networking-extended =3D "\
> >      corosync \
> > -    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "dlm", "", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dlm", "", d)} \
> >      "
> > =20
> >  RDEPENDS_packagegroup-meta-networking-filter =3D "\
> > @@ -85,7 +86,7 @@ RDEPENDS_packagegroup-meta-networking-protocols =3D "\
> >      tsocks freediameter xl2tpd babeld mdns net-snmp \
> >      quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
> >      radiusclient-ng openl2tp usrsctp \
> > -    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "dante", "", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
> >      "
> > =20
> >  RDEPENDS_packagegroup-meta-networking-support =3D "\
> > @@ -104,7 +105,7 @@ RDEPENDS_packagegroup-meta-networking-support =3D "\
> >      netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
> >      arptables macchanger nghttp2 strongswan fping \
> >      dnssec-conf libesmtp cifs-utils open-isns \
> > -    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "libldb", "", d)} \
> > +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "libldb", "", d)} \
> >      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", =
"netperf", "", d)} \
> >      ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", =
"spice", "", d)} \
> >      "
> >...
>=20
> This adds packages to packagegroups in a stable series.
>=20
> I'd say removing the broken DISTRO_FEATURE lines would be better
> than changing what gets installed to images in warrior.

You're right, but in this case I believe that packagegroup-meta-networking
is only used for some CI builds and nobody includes it in images for
some products. Fixing the DISTRO_FEATURE/DISTRO_FEATURES typo to include
all packages in CI builds would be useful for stable branch as well.

I don't count meta-networking-image added together with
packagegroup-meta-networking as image people use for some products.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXOPK9wAKCRA3VSO3ZXaA
HFSXAKCafRrgRqtYpzuyZlf35+RuNmuBOACgjqlglyQVyZNMCnhg0tDyIn0GxF4=
=jxrg
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
