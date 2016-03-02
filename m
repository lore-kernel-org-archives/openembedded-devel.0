Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B129731C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 18:05:51 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so97871830wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 10:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ag1G/SfWcCisqfXcI9hpTPYvSAoHPxOHQq1w8OasQw4=;
	b=cCgxvBraFX7Kx1E1VKZxxbL8S03spQUoA6EoX39eOYKdTKVv5XbDrkTZb2CxfD9LAF
	2QEkX8hm8u7IxiJ0bZQSkjyVvaG+EUacAEUENbT3VkB98wbW2AbII3WAtBbgCQb4LomF
	iR37fjzmbk8qufbeHjdK1pIhfaam9s3az/hFOExOBqNd4bI1HSKzoDAOpIgp/O6DtCBJ
	/gOFZnZnc0FB9KDfaCfUR0yHln2OEJ6yxyCndcchRiWOxNSVNBvS2cFqP0whUYM9sPOh
	bQs2tIalsbpVZs4L1dyJfrb3Nji2wcpT80Y8vCnbhq+P/7mPh87XNOkcBqp1U5WfOwto
	jg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ag1G/SfWcCisqfXcI9hpTPYvSAoHPxOHQq1w8OasQw4=;
	b=LrcjOFNYhV4DzzsAqcgauEmWSQLPO/YpFPIKhKIK4sEByZI4ZBoGBDkGf0MsUn9Abg
	iSgKVfT5SQDxlPj7ECjyoIpLGDSvvMOYrlED2BBoH0QbAl0wbBPqOwxnzUPyXwMwOUdD
	krq79CD0ZHH1n4FFOqg1bDdspRsh6dUxR8fApXZnUYOS+RKtXpy8v6La5+dXGKeZZ1Rl
	kCSFkVbekLVkRkzxP6Ojp+cdjjlxlX6aCggZ1eQlWz0Kgdx4sBWDZKQFbAWSO7dUK9tJ
	+RtahtLkF5lGhuzpdXqW/Y+8yEIigECXZnV1GhB6eFa44Qwe+/dk1dFlDIU4NBm586fw
	4hKQ==
X-Gm-Message-State: AD7BkJLG08Q084WkKXa+JsS/TIAPvgnK0wB0oqCJTqkA3R9bpkqnm/XKmJFnVy/4GWiFGg==
X-Received: by 10.194.200.194 with SMTP id ju2mr19314426wjc.63.1456941951634; 
	Wed, 02 Mar 2016 10:05:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	js8sm37096241wjc.37.2016.03.02.10.05.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 10:05:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 19:07:49 +0100
To: Gerson Fernando Budke <nandojve@gmail.com>
Message-ID: <20160302180749.GE10529@jama>
References: <CABOv41MguBOF24ZvCpDWSxAL8jd0GVbKBC4ZoMWNObLCXDzHHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABOv41MguBOF24ZvCpDWSxAL8jd0GVbKBC4ZoMWNObLCXDzHHw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: quagga permission issue detected
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
X-List-Received-Date: Wed, 02 Mar 2016 18:05:53 -0000
X-Groupsio-MsgNum: 60300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline

--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 01:53:37PM -0300, Gerson Fernando Budke wrote:
> Hello Martin and Joe,

Hello Gerson,

I have no experience with quagga, you have higher chance to connect
with people actually using quagga on target machines if you send an
e-mail to oe-devel ML.

Did you check that the files are owned by quagga user? E.g. if you
forget to use --numeric-owner parameter when untaring the image, you
can get wrong UIDs and that could result in errors like this.

Regards,

> I have work with yocto to build quagga and everything is fine but when
> system boot up I receive the messages below:
>=20
> Starting Quagga daemons: zebravty_read_config: failed to open configurati=
on
> file /etc/quagga/zebra.conf: Permission denied
> can't open configuration file [/etc/quagga/zebra.conf]
>  bgpdvty_read_config: failed to open configuration file
> /etc/quagga/bgpd.conf: Permission denied
> can't open configuration file [/etc/quagga/bgpd.conf]
>  ripdvty_read_config: failed to open configuration file
> /etc/quagga/ripd.conf: Permission denied
> can't open configuration file [/etc/quagga/ripd.conf]
>  ripngdvty_read_config: failed to open configuration file
> /etc/quagga/ripngd.conf: Permission denied
> can't open configuration file [/etc/quagga/ripngd.conf]
>  ospfdvty_read_config: failed to open configuration file
> /etc/quagga/ospfd.conf: Permission denied
> can't open configuration file [/etc/quagga/ospfd.conf]
>  ospf6dvty_read_config: failed to open configuration file
> /etc/quagga/ospf6d.conf: Permission denied
> can't open configuration file [/etc/quagga/ospf6d.conf]
>  isisdvty_read_config: failed to open configuration file
> /etc/quagga/isisd.conf: Permission denied
> can't open configuration file [/etc/quagga/isisd.conf]
>  babeld.
> vty_read_config: failed to open configuration file /etc/quagga/babeld.con=
f:
> Permission denied
> can't open configuration file [/etc/quagga/babeld.conf]
>=20
> I detect this problem with powerpc kernel 3.12 and cortex-a9 kernel 3.4,
> both embedded system.
> This affect quagga version 0.99.23/0.99.24 and I don't compile quagga with
> any older version.
>=20
> I realize that when I put this configuration in /etc/default/quagga file
> the system work:
>=20
> zebra_options=3D" --daemon -A 127.0.0.1 -u root"
> babeld_options=3D"--daemon -A 127.0.0.1 -u root"
> bgpd_options=3D"  --daemon -A 127.0.0.1 -u root"
> ospfd_options=3D" --daemon -A 127.0.0.1 -u root"
> ospf6d_options=3D"--daemon -A ::1 -u root"
> ripd_options=3D"  --daemon -A 127.0.0.1 -u root"
> ripngd_options=3D"--daemon -A ::1 -u root"
> isisd_options=3D" --daemon -A 127.0.0.1 -u root"
>=20
> So, is this a yocto misconfiguration or quagga configuration?
>=20
> Best Regards,
> Gerson

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbXK/QACgkQN1Ujt2V2gBx+KwCgh7fymnXl8KW+BFHsH9usMhSZ
rhQAoLNRk7lI0SaZ10ZfOgd/TQw99D8a
=OUaW
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
