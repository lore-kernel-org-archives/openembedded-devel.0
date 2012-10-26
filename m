Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRf3t-0006Zu-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 10:14:37 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so152733wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xD3omykEGInSChw4VHnrK03gFKbhiKf1Q+7g5TBfvYM=;
	b=ezUgMm7hDkuU75L/Cac5rnoI6Bi8uBRO4T5Kaz8olH4VGPnHs6T1ApDC21rk2vNE8/
	pA+gB38v/BS9PmAoOgXET6c/DQ8YgIw6ikyHYsHds5y38ZCul5K1WZKoNrtRKzBiSfLm
	YpZbvv5FrSboESVJLDTMMhmHes7tLibMUOhttba5CPY5saQolW/vRStjxYJhiw4raFzz
	CZ3Ry0RicMuhy1bTgfyUzd746xnLxBTBjvnVrPZ931Zpuxr83Y3KbY8lIc0USYFHfJRs
	Qm0ILy082FcFoQGNBLmwksmqFpbqqoNYk/FR7ASAm6EqePMtYzpnRcyJLgpFXMb17iih
	hUyA==
Received: by 10.180.95.97 with SMTP id dj1mr3325700wib.3.1351238467401;
	Fri, 26 Oct 2012 01:01:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m14sm13987914wie.8.2012.10.26.01.01.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 01:01:06 -0700 (PDT)
Date: Fri, 26 Oct 2012 10:01:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121026080125.GU3269@jama.jama.net>
References: <1351191528-13408-1-git-send-email-martiert@gmail.com>
	<k6dd8v$tj0$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <k6dd8v$tj0$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Fri, 26 Oct 2012 08:14:37 -0000
X-Groupsio-MsgNum: 41301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XLbFcQSK8m6qgUdZ"
Content-Disposition: inline

--XLbFcQSK8m6qgUdZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2012 at 09:14:43AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 25-10-12 20:58, Martin Ertsaas schreef:
> > Change version of ntp to match that in meta-networking. Also change
> > ntpdate to ntp-date to match the names used in meta-networking.
>=20
> While you are there, can you also disable the autoactivating for the unit?
> It's broken and I'm gettig tired of doing 'systemctl disable' on it for
> every system.

Cannot we fix it? Last time I've noticed it was using wrong binary (not
installed by ntpdate package) from .service file.

SHR root@qemux86-64 ~ $ opkg files ntpdate
Package ntpdate (4.2.6p3-r7) is installed on root and has the following
files:
/etc/network/if-up.d/ntpdate
/usr/bin/ntpdate
SHR root@qemux86-64 ~ $ grep Exec /lib/systemd/system/ntpdate.service
ExecStart=3D/usr/bin/ntpd -q -g -x

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XLbFcQSK8m6qgUdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCKQ1UACgkQN1Ujt2V2gBz7wgCgsq7NKUrX5FS1EGXjRBGUlks7
Pz4AniDjo57gk73ISxqpHqUEqETt/Nqu
=yQ+u
-----END PGP SIGNATURE-----

--XLbFcQSK8m6qgUdZ--
