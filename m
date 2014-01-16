Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id C28576C9B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 23:52:22 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so708982ead.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 15:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SIukazgQySCjZ7DPHvEgFIKND1Si5U/Rr18ND0OH6IA=;
	b=rY3n+4BpbHF8GFZA+Hnl7eG1rdiYaH72dhTL3Gg2wAul2lm0OA21SLJxhl9Sqrju8l
	zQ24L6ysSeiil/DjS/mGlFpiHLE8tzVk/sMiSRhu44qu0MgnnzRJbb+udZijc7pdPSnY
	QsdafJ6LuuBOl6uHf9PHg2QqEZPOtxbbyf+YRf+WkvbJID7mECmZI9HkZ+RMg2TEo6+E
	/DJvys1uzqnHjk8L6OVyZJxNEBdQidx81Eu64H+BwQn2FYVXxTWDteiajqD1fyi0OCxp
	m2IzNPjCdNpXLH+n16jY2PL8ZBZqdMK0O+5OTGIoymp1j4FR9T27iV8QoV8b4sZF6Nzl
	kaqw==
X-Received: by 10.15.49.9 with SMTP id i9mr121761eew.112.1389916343194;
	Thu, 16 Jan 2014 15:52:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 7sm22205161eee.12.2014.01.16.15.52.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 15:52:22 -0800 (PST)
Date: Fri, 17 Jan 2014 00:52:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140116235245.GK3742@jama>
References: <CAP71WjydArvSEYRdK0NRWs5tTS_KuYBjZena8nas9eE0tHbv6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjydArvSEYRdK0NRWs5tTS_KuYBjZena8nas9eE0tHbv6g@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: qt5 and virtualbox
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
X-List-Received-Date: Thu, 16 Jan 2014 23:52:24 -0000
X-Groupsio-MsgNum: 47784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHuqAdgBYNjQz/wy"
Content-Disposition: inline

--lHuqAdgBYNjQz/wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 12:34:56AM +0100, Nicolas Dechesne wrote:
> hi there,
>=20
> has anyone be able to run qt5 applications in virtualbox or qemu? if
> so, what build configuration was used: xcb? eglfs?
>=20
> When running a 'desktop' distro in VirtualBox we can enable adds-on to
> get some support for acceleration, iirc with proper X11 video drivers.
> can that be used to run Qt5 application built with OE too?
>=20
> any detail/instructions publicly available which I might have missed?

Check .bbappends in
https://github.com/webos-ports/meta-webos-ports

there is branch also for 5.2.0 and if you check webos-ports wiki you'll
even find VirtualBox appliance build to test it without building it yoursel=
f.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lHuqAdgBYNjQz/wy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLYcM0ACgkQN1Ujt2V2gByQVQCfV80hDet2DM8Oo0Jv8QkzX86i
6nUAn3A8ncAI6m2McJuhe/uS6cLMQ6IX
=nguk
-----END PGP SIGNATURE-----

--lHuqAdgBYNjQz/wy--
