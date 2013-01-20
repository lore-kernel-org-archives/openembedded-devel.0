Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwwWH-0007X3-Ka
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 16:09:19 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so6462445wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NnXjBS84V/hiaErDFLl9Ooa6ENwYLWzKvmm50Hqbq4o=;
	b=NpMlmZRv+AgKdjGUXPQO8WebZBA310Vr75kIhl3KbH5bNJpdjrxbC9HnE4eDGthwxr
	emTfX3kJAwdsXt0Ly9ChOjcuekDePZ5nihIVFYvnzU4KDsZHN0BTKxy7tF/NDOJZbQ/f
	KCI7EBxqXRpIK0bmcYhn8Q66r4THROipv0aoBu5P0Sol6KcLNi6khfeXT1d5FL9FaGTa
	4yeq9A6dfYxDy62pmSlnxRknErfqybiRn5zU70i1/S6xxc6XYO7u7gTr9aw15UdYG4Qs
	HC6ijW4RYLdnJokXfy1m6CuuJfOgs01HKNhnnaOPM4zmbCd7a5j1zyltZUj+tE/T8QJP
	6Tdg==
X-Received: by 10.180.77.35 with SMTP id p3mr11349669wiw.18.1358693626343;
	Sun, 20 Jan 2013 06:53:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s16sm16716918wii.0.2013.01.20.06.53.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 06:53:45 -0800 (PST)
Date: Sun, 20 Jan 2013 15:53:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130120145347.GH29386@jama.palm1.palmone.com>
References: <1358461961-5703-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<20130119100356.GG29386@jama.palm1.palmone.com>
	<50FA7388.7080208@linaro.org>
MIME-Version: 1.0
In-Reply-To: <50FA7388.7080208@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] php: cleanup QA warnings
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
X-List-Received-Date: Sun, 20 Jan 2013 15:09:22 -0000
X-Groupsio-MsgNum: 42759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline

--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2013 at 11:20:56AM +0100, Marcin Juszkiewicz wrote:
> W dniu 19.01.2013 11:03, Martin Jansa pisze:
> > I think this /home is still there:
> > php-5.3.19: php: Files/directories were installed but not shipped
> >   /home
> >   /home/jenkins
> >   /home/jenkins/oe
> >   /home/jenkins/oe/shr-core-branches
> >   /home/jenkins/oe/shr-core-branches/shr-core
>=20
> It is ${TMPDIR} not /home/ - if you have idea how to find out where it
> is and how to safely remove it...

Ah right. Last time I was touching php I was trying to prevent creating
this directory structure but failed, maybe something ugly like:

TMP=3D/OE/shr-core/tmp-eglibc/work/armv5te/php-5/OE/shr-core/tmp-eglibc/wor=
k;
WORKDIR=3D/OE/shr-core/tmp-eglibc/work/armv5te/php-5

while test ${TMP} !=3D ${WORKDIR}; do
  rmdir ${TMP}
  TMP=3D`dirname ${TMP}`;
done

?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD8BPsACgkQN1Ujt2V2gByBGQCeIBqkgkiiOMe0NQbX/IJ0hqCx
gA8AnRTbjy/yhXf9VmJqKAoqSkdwRhTM
=NXlP
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
