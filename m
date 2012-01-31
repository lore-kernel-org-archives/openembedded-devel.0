Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RsDrg-0001hZ-Jp
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 14:35:16 +0100
Received: by eaao11 with SMTP id o11so47498eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 05:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=8Af3nJPfspJHcw3+M5+zqyu4TMVRhuI8R7qiNoQTXkc=;
	b=dumj0F62l7u5Hsw7HoctXW7CdCzfZP8Xfw7dzx2t6kt6rvkl30RPzTkE/mBActZYK+
	yd9NbYpVxkBA0cilnSV1J5ctMgwEz/W8WMIkO12WQAqmLlhrqpvsU6b5zec+vTymNQT8
	v66qDJOzFWjOTeU0IMasWXUu2f4Uxv5qR8a9s=
Received: by 10.213.22.204 with SMTP id o12mr3411426ebb.1.1328016440819;
	Tue, 31 Jan 2012 05:27:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6526684eeb.8.2012.01.31.05.27.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 05:27:20 -0800 (PST)
Date: Tue, 31 Jan 2012 14:27:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120131132717.GB3644@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: WARN: polkit pulls systemd to image if not disabled explicitly
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
X-List-Received-Date: Tue, 31 Jan 2012 13:35:16 -0000
X-Groupsio-MsgNum: 36783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Since version 104 polkit has support for systemd session tracking
commit
http://cgit.freedesktop.org/PolicyKit/commit/?id=3D2027302e803a9569a370b429=
a475dae5ef8afe34

Unless passed --disable-systemd it will autodetect libsystemd-login
with pkg-config and enable it, which results in polkit package pulling
systemd as RDEPEND.

To check your build look for
Session tracking:           ConsoleKit
or
Session tracking:           systemd
in polkit-0.104-r*/temp/log.do_configure

and as gconf depends on polkit I guess this happens for a lot of images.

You can disable it in your layer by something like this:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dfdfc=
a500137491ee3a91c457213eba9bf5fe08a6

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8n7DUACgkQN1Ujt2V2gBzWCQCfeYPGRMEHqsJYMqj/MwvHlpdY
2rYAoKKQWohhsfuIY/SL4BdsAF2L2kUU
=a5No
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
