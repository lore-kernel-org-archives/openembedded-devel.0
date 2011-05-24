Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QOmPV-0001H2-5z
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 09:52:13 +0200
Received: by fxm19 with SMTP id 19so5072747fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2011 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=V0smVb5Md48JmLjkADbO3a2+AH0t2c6NJM/27dBHCFY=;
	b=wpdGgbVgoGKR4dcjxuve87esoiW5pv1gUx+YZI32kmh5lkDGvY20CrddW/Gg02htz0
	H3PsmmcJol8GQaXcyS0wzTBiWbdzpHDyQ8HIowsAgmUO34MpHVQz+itcL9VM0NVaU5Tk
	qjbYDcwnhc0fdW1U21IK2G6sHg3OS4nVtVDNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kv7lLCJ1w3MShIX/ZR2BEzbgC0REHHDlhh/WqVsVozjyhcoVjjKHGSP/ljA03/cBAk
	W0DMgQo8G0WWh5f8uswOzzYcj39eicMaFFa8+zSPuhiMhtDzv3Ubc5hCwtcykloA9CrE
	221KnLyCAyGM/8x3TGz7nkBJXJoBbh/OpVPeQ=
Received: by 10.223.158.72 with SMTP id e8mr3298635fax.39.1306223352186;
	Tue, 24 May 2011 00:49:12 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm2600744fat.14.2011.05.24.00.49.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 00:49:11 -0700 (PDT)
Date: Tue, 24 May 2011 09:49:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110524074904.GA3222@jama.jama.net>
References: <E1QOdTp-0005Io-SJ@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1QOdTp-0005Io-SJ@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stanislav Brabec : bluez-hcidump: Fix declaration clash ( remove definition of ntoh64() already present in bluetooth.h).
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
X-List-Received-Date: Tue, 24 May 2011 07:52:13 -0000
X-Groupsio-MsgNum: 32263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2011 at 10:20:05PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: master
> Commit: 880742f2072a3acb10637b4de7230b55910920b8
> URL:    http://git.openembedded.org/?p=3Dopenembedded.git&a=3Dcommit;h=3D=
880742f2072a3acb10637b4de7230b55910920b8
>=20
> Author: Stanislav Brabec <utx@penguin.cz>
> Date:   Mon May 23 22:08:30 2011 +0000
>=20
> bluez-hcidump: Fix declaration clash (remove definition of ntoh64() alrea=
dy present in bluetooth.h).
> Signed-off-by: Stanislav Brabec <utx@penguin.cz>

BTW: this patch is already upstream and also in meta-openembedded

http://git.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=3D852ac4b=
589adb186191ad70a2fa3472d5b351ec4

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3bYvAACgkQN1Ujt2V2gBwkEACfQeJrACNWB7fnbvPB7g4uGxtj
R2AAn01HK61pT18PP/uFydp4olMGJEjd
=6yTc
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
