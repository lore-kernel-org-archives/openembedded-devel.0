Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QwEmf-00051p-Jm
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 16:50:25 +0200
Received: by fxg11 with SMTP id 11so1085661fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Py+iplcg5pljADgtBp9CaLRo0cYu3ouYNagQzhC5Th0=;
	b=nIvIrshpHpmifNDOTqy9NtEnb9csy68dkv7JC8EGtyd81ICPRa4cxtmIv75qh+fVFK
	jm8azuODEhjaQciE7pxoikUUlkLoHAmpWhv34d9Wua5TjJZVYYEIH52tsRPToEqhEAnm
	AGZxwYcKqYhWtWBAxlCJOKIM3PIGh2CKpv8iw=
Received: by 10.223.4.133 with SMTP id 5mr6901154far.81.1314197139147;
	Wed, 24 Aug 2011 07:45:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g16sm891291faa.3.2011.08.24.07.45.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Aug 2011 07:45:37 -0700 (PDT)
Date: Wed, 24 Aug 2011 16:45:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110824144529.GD5522@jama.jama.net>
References: <4E54DA89.2080105@dresearch-fe.de>
	<4E54EF12.2010100@dresearch-fe.de>
	<4E54F03E.3040806@juszkiewicz.com.pl>
	<4E550BDE.6010401@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <4E550BDE.6010401@dresearch-fe.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 14:50:25 -0000
X-Groupsio-MsgNum: 33810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 04:34:06PM +0200, Steffen Sledz wrote:
> On 24.08.2011 14:36, Marcin Juszkiewicz wrote:
> > W dniu 24.08.2011 14:31, Steffen Sledz pisze:
> >> BTW:
> >> What is the exact meaning/purpose/use of task-proper-tools?
> >=20
> > Replace busybox components by full versions. Was made years ago and then
> > updated by several people. While working for BugLabs company I used it
> > to create rootfs without busybox.
> >=20
> >> The list contains a lot of tools with existing alternatives (e.g. sysl=
og-ng vs. rsyslog or pump vs. dhcpcd).
> >=20
> > Then propose change which will allow to install one of them only at tim=
e?
>=20
> Sorry, but my knowledge is not sufficient to do this. I've no idea how to=
 reference u-a related tools here.

Why you don't remove task-proper-tools from your images RDEPENDS and add
only tools you need which aren't provided by upstart?

or use something like=20
DISTRO_SYSLOG ?=3D "syslog-ng"
in task-proper-tools

and set=20
DISTRO_SYSLOG =3D upstart
for your distro if distro level granularity is fine for you (all
supported images are using upstart).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5VDokACgkQN1Ujt2V2gBzczACgsM6A8Cr6XFrnfo6mHkg6wWND
jpAAn3+quIlo9xItWq+2bu+VC6Iiyc33
=PYgG
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
