Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2720E6B8BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 08:46:39 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so1959239wgg.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uVZCnHvVUdkB3KO4oMz10HCq7uvM7RFoB3GkTJ4annI=;
	b=cr8gD60ZMYCY+wYX1JqkDFpo0kq/TC2H28mnOIZJXy48a+s3W6A+iiuly77Lite+S0
	72RhPKjTuoqK7Ac0Kc53mfqcxn/xcMInQHcAOiMl3djHHMDUyvtBjxFsVOcNFL0Lvoiq
	iP+XRKIuOP3ur0pC1cJ3+Aiyom+Qj36MECE14Y7uzoPr1GDql5TUpFQTKwSNwDQSHaXV
	odmkCjI4hNVVr/0NZSlkXCtBQe4FKdld5J0TEK+5bpJ5kSq+0Vcw8X35yjBknmPdgksN
	bPFV5QFQzoP03CZjeHWRtgCelZCc/BRh363/fknQaez6gdI/im/0Bs+jENAke0nxUDyx
	TKXg==
X-Received: by 10.180.74.9 with SMTP id p9mr4409504wiv.39.1403167600201;
	Thu, 19 Jun 2014 01:46:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm31329084wiy.19.2014.06.19.01.46.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 01:46:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 10:46:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619084640.GM2117@jama>
References: <1403153175-10707-1-git-send-email-rongqing.li@windriver.com>
	<53A29291.1010700@dominion.thruhere.net>
	<53A29E1D.9080307@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53A29E1D.9080307@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH][meta-oe] dialog: use pkg-config to detect ncurses
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
X-List-Received-Date: Thu, 19 Jun 2014 08:46:42 -0000
X-Groupsio-MsgNum: 50410
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HVCoas+krw6dou6l"
Content-Disposition: inline

--HVCoas+krw6dou6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 04:23:57PM +0800, Rongqing Li wrote:
>=20
>=20
> On 06/19/2014 03:34 PM, Koen Kooi wrote:
> >> +Subject: [PATCH] use pkg-config for ncurses detection. +
> >> >+Upstream-Status: Inappropriate [configuration]
> > Why is it inappropriate?
>=20
>=20
> I think we should fix the configure.in, but this configure.in can not
> work with oe-core, the dialog bb file runs configure directly, and
> I do this fix in configure directly, so it is Inappropriate

Can you please fix dialog-static as well? It probably doesn't even work wit=
h B!=3DS.

| DEBUG: Executing shell function do_configure
| gnu-configize: 'configure.ac' or 'configure.in' is required
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/di=
alog-static/1.1-20120706-r0/temp/log.do_configure.20677)
NOTE: recipe dialog-static-1.1-20120706-r0: task do_configure: Failed

Otherwise it will be PNBLACKLISTED this weekend (together with a lot of oth=
er unmaintained recipes)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HVCoas+krw6dou6l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOio3AACgkQN1Ujt2V2gBwo4wCfUf0PTjZiuJl3o88WvjgLWI9a
qF4AoJUIYgnnUpMPutDiePoBZHVxbXTE
=mLNZ
-----END PGP SIGNATURE-----

--HVCoas+krw6dou6l--
