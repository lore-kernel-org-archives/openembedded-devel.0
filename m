Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PiCDN-0001W1-4o
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 21:43:41 +0100
Received: by bwz10 with SMTP id 10so1712627bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 12:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jV9HbJRDZfYTW3yky5Runru33kk0vgJmlaDQ1rp8M3Q=;
	b=QmSNwcdPhCjo4lZ0Mc/5UD/UNTikyoS8OiXeSxza/k1COIBWq1XPucxpme4+IKnsm2
	urU96oVpPMt9W5PBSSRr1nu6mBjd12ZQ8VqancE4UgrtPXSIaEM58qOe7ntha0jcTn7A
	VG1JRj59IOdkC5BPovySA1gxpNVPYgWl0N6go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=efdeUcws9xAoroXSfNIX8BJvgtSg9+wGuL6jAK3gc13JNCLuU8kj5/JQZCSpWAe+rW
	mJfeI2JMA+qnfDfDBSel12Z7gam7ZLiDcIiYB0/mTk4riR2oS0AZPxhJSIDwfToyU3c1
	AXyc6JUtMBanR6XhdmFkdNTI3a732jiLieN3Y=
Received: by 10.204.60.17 with SMTP id n17mr779235bkh.190.1296072361166;
	Wed, 26 Jan 2011 12:06:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f20sm7706214bkf.16.2011.01.26.12.05.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 12:05:59 -0800 (PST)
Date: Wed, 26 Jan 2011 21:06:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110126200620.GH3616@jama>
References: <4D3FEC09.5070306@atmel.com>
	<201101261401.02414.marcin@juszkiewicz.com.pl>
	<4D405B8C.805@atmel.com>
MIME-Version: 1.0
In-Reply-To: <4D405B8C.805@atmel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Problem with calibration of AT91SAM9M10EKES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jan 2011 20:43:41 -0000
X-Groupsio-MsgNum: 28507
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline

--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2011 at 06:36:12PM +0100, Ulf Samuelsson wrote:
> 2011-01-26 14:01, Marcin Juszkiewicz skrev:
> > Dnia =C5=9Broda, 26 stycznia 2011 o 10:40:25 Ulf Samuelsson napisa=C5=
=82(a):
> >> I have some calibration problem with my private branch
> >> (ulf/linux-2.6.30-2011-01-??) when building the at91sam9m10ekes board.
> >>
> >> I am running /usr/bin/run-calibrate.sh,
> >> but regardless of how I click, during calibration,
> >> a tap afterwards always results in detection 3 mm above the tap.
> >>
> >> There is a "pointercal" file generated.
> >> It appears to me that this is ignored...
> >> I can tap 1 cm above or below during calibration,
> >> and still the detected tap is 3 mm above the actual tap.
> >
> >> Anything else to think about?
> >> I enclose  /etc/X11/xorg.conf and /etc/ts.conf.
> > You are using full X11 with evdev driver so tslib is not used at all. Y=
ou have
> > to use xinput-calibrator.
> >
> > Regards,
>=20
> Any clue to get xinput-calibrate to run at first boot?

provide=20
recipes/xinput-calibrator/pointercal-xinput
data for your device and use
recipes/xserver-common/files/89xTs_Calibrate.xinput_calibrator.patch
like SHR does

intentionaly it prefers provideded data, because users too often messed
initial calibration on first boot and then didn't know how to reset it
and rerun xinpu-calibration successfully...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1AfrwACgkQN1Ujt2V2gBxoMwCcC1HS9g01lLsDmgK9eDHgstSv
0x0AnR6sO5ZU6KGVM8ni+fAI4PbptPDU
=uu+b
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--
