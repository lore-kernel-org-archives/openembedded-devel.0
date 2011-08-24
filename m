Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QwFFk-0007Nm-LN
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 17:20:28 +0200
Received: by fxg11 with SMTP id 11so1113450fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=paMsr4rKBvOKbfk+wWmiKZ+NIm3WozC6ChzsOEjITII=;
	b=hpC3EFL9529OOQ5MA6zVhJwgfHGfCPL9Uc1xuMcoaQtWnsMyY+iCMXNPWyuT67VpmH
	QY9JKgA86NCxvBPul0CZtQUDAkEC24HTATgFFm7nZAq+P4v5677usgi/ssPKlMapUo0y
	XCYeV9xPf7MQKPw+bMHYeeI2x4ZNpFz9VMvTg=
Received: by 10.223.58.139 with SMTP id g11mr7426906fah.14.1314198870366;
	Wed, 24 Aug 2011 08:14:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g16sm913066faa.3.2011.08.24.08.14.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Aug 2011 08:14:29 -0700 (PDT)
Date: Wed, 24 Aug 2011 17:14:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20110824151422.GE5522@jama.jama.net>
References: <4E54DA89.2080105@dresearch-fe.de>
	<4E54EF12.2010100@dresearch-fe.de>
	<4E54F03E.3040806@juszkiewicz.com.pl>
	<4E550BDE.6010401@dresearch-fe.de>
	<20110824144529.GD5522@jama.jama.net>
	<4E55115B.6070102@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <4E55115B.6070102@dresearch-fe.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 24 Aug 2011 15:20:29 -0000
X-Groupsio-MsgNum: 33812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline

--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 04:57:31PM +0200, Steffen Sledz wrote:
> On 24.08.2011 16:45, Martin Jansa wrote:
> > On Wed, Aug 24, 2011 at 04:34:06PM +0200, Steffen Sledz wrote:
> >> On 24.08.2011 14:36, Marcin Juszkiewicz wrote:
> >>> W dniu 24.08.2011 14:31, Steffen Sledz pisze:
> >>>> BTW: What is the exact meaning/purpose/use of task-proper-tools?
> >>>=20
> >>> Replace busybox components by full versions. Was made years ago and t=
hen updated by several people. While working for BugLabs company I used it =
to create rootfs without busybox.
> >>>=20
> >>>> The list contains a lot of tools with existing alternatives (e.g. sy=
slog-ng vs. rsyslog or pump vs. dhcpcd).
> >>>=20
> >>> Then propose change which will allow to install one of them only at t=
ime?
> >>=20
> >> Sorry, but my knowledge is not sufficient to do this. I've no idea how=
 to reference u-a related tools here.
> >=20
> > Why you don't remove task-proper-tools from your images RDEPENDS and ad=
d only tools you need which aren't provided by upstart?
>=20
> task-proper-tools is not directly in our image RDEPENDS but inherited via=
 task-sdk-native (may be via others too).

then maybe it's time to propose removing it from task-sdk-native or add
switch controlling if it should be included or not.

> > or use something like DISTRO_SYSLOG ?=3D "syslog-ng" in task-proper-too=
ls
> >=20
> > and set DISTRO_SYSLOG =3D upstart for your distro if distro level granu=
larity is fine for you (all supported images are using upstart).
>=20
> We do not have an own distro (we use angstrom). It's only a custom image.
>=20
> And the initial problem is sysvinit vs. upstart which are not u-a but nee=
d to be installed exclusively. If i'm right this is done by setting IMAGE_I=
NIT_MANAGER. Can this variable used inside the task-proper-tools RDEPENDS?

No because you have one global task-proper-tools for different images
(with possible different IMAGE_INIT_MANAGER values).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5VFU4ACgkQN1Ujt2V2gBwe3QCffiVUahuBkvJMdPlOxIHMd2i3
sLwAn02wzGDg9fxSdefT8ZrnbxB7MNmp
=ZGPb
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
