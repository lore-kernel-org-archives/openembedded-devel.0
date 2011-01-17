Received: from mail-yi0-f41.google.com ([209.85.218.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PeuHd-0005DN-Jg
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 19:58:29 +0100
Received: by yia25 with SMTP id 25so2448182yia.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 10:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=x1a2dz4RSBHqErG0E15AtJZD9OQRJvJu7Pr/K4wElSE=;
	b=osRfWfKq1x/bsrKe90X4l68Tt9MNH7nl5IRizBllsTSJ19k8n5SG+SoCzxJTQtZ6FJ
	CdMKbjb78qS5wEM+Xu6m/+krcUmmQ+DgRJshtdXFBPT3ln0/9ix/BipcA1CnjopPVjKp
	fg//Myt6TUvfyohhIgkJQ188swtOMgpzY9so4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wLDx2RldtVFn7OdqOpitJ2zP88RuuSFUR4MjtPQM8GvTJ/n3jQ/kHM/N0njFzsoO9B
	P0UP0/XkbuGo1IoNnNm3lSlrO+wYtKaV/bNd1hagEt5oo1invRyuYSMmc1qUBfXj47AP
	0sHkEJnChqUHRk8xgPBldFW9frGdOgWanW+tY=
Received: by 10.223.72.207 with SMTP id n15mr5142980faj.49.1295290670924;
	Mon, 17 Jan 2011 10:57:50 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n26sm1796920fam.13.2011.01.17.10.57.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 10:57:50 -0800 (PST)
Date: Mon, 17 Jan 2011 19:58:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110117185830.GL21179@jama>
References: <4D347C60.6000805@gumstix.com>
MIME-Version: 1.0
In-Reply-To: <4D347C60.6000805@gumstix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: EFL_SRCREV bump breaks GPE/enlightenment
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
X-List-Received-Date: Mon, 17 Jan 2011 18:58:29 -0000
X-Groupsio-MsgNum: 28105
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Content-Disposition: inline

--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2011 at 09:29:04AM -0800, Neil MacMunn wrote:
> Changing to EFL_SRCRV 55319 causes display problems for buttons and the=
=20
> workspace manager. Mousing over the main menu causes Xinit.d to restart.
>=20
> before crash:
>=20
> # ps fax
> <snip>
>    955 ?        Ss     0:00 gpe-dm
>    958 tty3     Ss+    0:00  \_ Xorg -br -pn -dpi 100 :0 -noreset
>    959 ?        S      0:00  \_ run-parts /etc/X11/Xinit.d
>   1036 ?        S<L    0:03      \_ /usr/bin/enlightenment
> <snip>
>=20
> after:
>=20
> #ps fax
> <snip>
>    955 ?        Ss     0:00 gpe-dm
>    958 tty3     Ss+    0:01  \_ Xorg -br -pn -dpi 100 :0 -noreset
>   1100 ?        S      0:00  \_ run-parts /etc/X11/Xinit.d
>   1139 ?        S<L    0:03      \_ /usr/bin/enlightenment
> <snip>
>=20
> Reverted changes to e-base.bbclass seems to fix the problem
>=20
> # git revert 004321e0878162331908acda8bdaaa31a2aa6278
> # git revert 2c7181fda31fa0bc215b5425ef872361944f4ae5
>=20
> I'm using the omap3-desktop-image on a Gumstix Overo.

does it segfault or something? I haven't seen it with illume2 profiles,
but I'm not using gpe-dm..

Would be great if you can provide info and debug it with e devs
(#edevelop on freenode), if you bisect which efl commit caused it, they will
be able to fix it sooner.

Regards,
=20
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk00kVYACgkQN1Ujt2V2gBwF6wCfaZLyfsBJqibqPgf2t/M0+FKZ
y40An1E8vWqYXbDm8Br7aIVBmGgBDaZg
=6RMf
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--
