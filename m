Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R22Yc-0006UB-8A
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 16:59:54 +0200
Received: by fxi1 with SMTP id 1so203022fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K2T9yU9iTEXUaEmCjS4RvEXnO2owvNeerZCBFbbiozw=;
	b=A24JK3R2hPrqS6LHP1Z3oBQIcuLvSKJL+hfPnNpIvD055N8lWc0qKojAawyavtYJDL
	80obiUgdU3NP/9cMtBMumZefrZ/oUCiFbxfP4gDmFTcgqUQLFcEoeXmoxZsLVd31v78v
	fnc04RnspyXxUFMHtWTr/D88/B5VeD8CYeuvw=
Received: by 10.223.97.214 with SMTP id m22mr893330fan.29.1315580089683;
	Fri, 09 Sep 2011 07:54:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s13sm2957990fad.18.2011.09.09.07.54.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 07:54:48 -0700 (PDT)
Date: Fri, 9 Sep 2011 16:54:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909145441.GN4124@jama.jama.net>
References: <4E69004E.30701@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4E69004E.30701@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bitbake -b workaround
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
X-List-Received-Date: Fri, 09 Sep 2011 14:59:54 -0000
X-Groupsio-MsgNum: 34176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zbynv6TNPa9FrOf6"
Content-Disposition: inline

--Zbynv6TNPa9FrOf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2011 at 08:50:06PM +0300, Jim Qode wrote:
> Hello,
>=20
> I updated my build environment today. Now bitbake -b fails with the
> following errors. Is there any workaround I can use to continue working
> on my project before a patch is issued?
>=20
> ERROR: Command execution failed: Traceback (most recent call last):
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/command.py",
> line 102, in runAsyncCommand
>     commandmethod(self.cmds_async, self, options)
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/command.py",
> line 190, in buildFile
>     command.cooker.buildFile(bfile, task)
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
> line 627, in buildFile
>     buildfile =3D self.matchFile(fn)
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
> line 604, in matchFile
>     matches =3D self.matchFiles(buildfile)
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
> line 586, in matchFiles
>     filelist, masked =3D self.collect_bbfiles()
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
> line 853, in collect_bbfiles
>     files.sort( key=3Dlambda fileitem: self.calc_bbfile_priority(fileitem=
) )
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
> line 853, in <lambda>
>     files.sort( key=3Dlambda fileitem: self.calc_bbfile_priority(fileitem=
) )
>   File
> "/home/jimqode/Werk/oe/setup-scripts/sources/bitbake/lib/bb/cooker.py",
> line 397, in calc_bbfile_priority
>     for _, _, regex, pri in self.status.bbfile_config_priorities:
> AttributeError: 'NoneType' object has no attribute
> 'bbfile_config_priorities'

If you're using last release 1.13.3 then you need IIRC this patch
http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3De7ade6dcd646b478d=
f79f968934a0edcb63254f7
or just use bitbake/master

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zbynv6TNPa9FrOf6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5qKLEACgkQN1Ujt2V2gBwPeACfR/E3cMA5spmx6qg29WDwkaVw
hVoAn0RAnMIs4tB+0G6/5jOM1mPg0t81
=b66B
-----END PGP SIGNATURE-----

--Zbynv6TNPa9FrOf6--
