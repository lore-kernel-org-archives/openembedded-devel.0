Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 64D0E605F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2013 20:28:29 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so1047882ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2013 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H57OEbkJxZGACPKHYQ6nn0UgXKvUbH1OlFA8ZHdozic=;
	b=WgIL1EOZXTHDwB2rfJSMOQk1hTE4sCg15i90uuCeLD57J871PMsTulqIdQynHFsDdP
	JTq1gxb6k6xGCeQtOhj96itZqjU77ZMpJQACH2QZ71ed/6huIYzNmvDVUeGg4CwYdp+Y
	QQxMTcR9SAOZIrwjX7YRd6urk8vS5G/VANeJ1M22Qfd6K0rDou5D6qhHDu/xjAJMzIg8
	gIhMHKCv4w642Sq18Fzx1YVABygl/JfScKY5biGpCqdcUTNX73MOAABylEwAk7s6kZyn
	mg8lJyxl5lToeFgKjIiBJdnRu75t8ZTg+/x9CAbknjfhylYqp2raSPXcp/MJiLKHy/sP
	WNHw==
X-Received: by 10.14.45.70 with SMTP id o46mr776180eeb.19.1375907309212;
	Wed, 07 Aug 2013 13:28:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm12750887eev.3.2013.08.07.13.28.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 13:28:28 -0700 (PDT)
Date: Wed, 7 Aug 2013 22:29:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130807202913.GA3269@jama>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
	<1375652867-10498-4-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LYsObcmRkiB47Gm8YV+t-gbtMrAQpk4K5pR-F9iVyVG3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYsObcmRkiB47Gm8YV+t-gbtMrAQpk4K5pR-F9iVyVG3g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 04/15] devilspie: add dependency on startup-notification
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
X-List-Received-Date: Wed, 07 Aug 2013 20:28:31 -0000
X-Groupsio-MsgNum: 45600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2013 at 09:45:18AM +0100, Burton, Ross wrote:
> On 4 August 2013 22:47, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * Package 'libstartup-notification-1.0', required by 'libwnck-1.0', not=
 found
>=20
> Doesn't that say that libwnck should have an explicit dependency on
> startup-notification?

test-dependencies script is running again and after fixing eds it found
the same issue in cheese

| Package 'libstartup-notification-1.0', required by 'gnome-desktop-2.0', n=
ot found

so yes I'll have to check which packages autodetect
startup-notification (script should show it if I wait long enough for it
to finish 3rd pass :))

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlICrhkACgkQN1Ujt2V2gBw6OQCglEz1tr5kjJPqOmqlFo7TXd9/
SioAoJxLTck3lLSLT93ePh1WneN4H8gy
=Xlun
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
