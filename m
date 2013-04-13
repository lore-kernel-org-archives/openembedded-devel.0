Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR29X-0001kL-TM
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 17:14:12 +0200
Received: by mail-da0-f49.google.com with SMTP id t11so1498039daj.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 07:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a94WBRb/7c/pn4lN0i65FcV+CHV2S0ZmTd5hJihgd7Y=;
	b=bhS8Vd5/pgzPQk6/TjbQeYLQIZSIkPExE2n/+xTKVL5Ptnjzu/pMRE+zcpE1FC8JvE
	ikDkblK3gD9o136wOC8nxHILhrqFxAJaHnr536ZEJpPWl14CN+UIPOZ/4oW/jKXVSvIN
	pksV0/byJfUDLJ2N2wIpf5zVAfd5QJrMOXQ2Nmn4I/XurtL9wtV3VoSTtydysIc6i/KS
	kcfYsP+X3Wb9Uoe4X5kEoYq948t3w/KW+1+gHPRf83+KJq6NYwiULcLgU80U0R+u08t4
	mtshbtBOsyMIAv2+7f/WtlA7fd5T+il4Zc+Qk/o+tMGzS+jlFKePPS5jOYkE0eKNd+mv
	iqpg==
X-Received: by 10.68.94.194 with SMTP id de2mr20152326pbb.111.1365865001236;
	Sat, 13 Apr 2013 07:56:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id to7sm14162020pab.0.2013.04.13.07.56.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 07:56:40 -0700 (PDT)
Date: Sat, 13 Apr 2013 16:56:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130413145635.GG2477@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<1360776335-21633-2-git-send-email-raj.khem@gmail.com>
	<20130214074532.GI3300@jama>
	<CAMKF1sqA=XarFcXewAJ7MjEG=ZtoLNQ6mvTjLHMGUQRVW8ZXig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqA=XarFcXewAJ7MjEG=ZtoLNQ6mvTjLHMGUQRVW8ZXig@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 2/2] meta-systemd: Append ${PN} to SYSTEMD_SERVICE
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
X-List-Received-Date: Sat, 13 Apr 2013 15:14:12 -0000
X-Groupsio-MsgNum: 44149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7GFA+bvAY1vP//DC"
Content-Disposition: inline

--7GFA+bvAY1vP//DC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 10:39:15AM -0800, Khem Raj wrote:
> On Wed, Feb 13, 2013 at 11:45 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > I'm still getting missing RPROVIDER for openssh-sshd-systemd and bitbake
> > -e shows interesting behavior:
> >
> > # $RPROVIDES_openssh-sshd [2 operations]
> > #   append
> > #   /OE/shr-core/meta-openembedded/meta-systemd/oe-core/recipes-connect=
ivity/openssh/openssh_6.1p1.bbappend:8
> > #     "openssh-sshd-systemd"
> > #   rename from RPROVIDES_${PN}-sshd data.py:161 [expandKeys]
> > #     "sshd"
> > # computed:
> > #   "sshd"
> > RPROVIDES_openssh-sshd=3D"sshd"
> >
> > Any idea why?
>=20
> hmmm I do not get it. Did you do a clean build or incremental ?

Just for reference it was caused by this:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-April/044941.h=
tml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7GFA+bvAY1vP//DC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFpciMACgkQN1Ujt2V2gBxwtQCeOl9sdbLvo+qUFy+75iRQ1jQB
dgoAnjzUYBNSUtrA9ggndtyX35iA3mOp
=XTQM
-----END PGP SIGNATURE-----

--7GFA+bvAY1vP//DC--
