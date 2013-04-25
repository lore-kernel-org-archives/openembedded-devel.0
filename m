Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVTFQ-0000T5-2s
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 22:58:40 +0200
Received: by mail-pd0-f169.google.com with SMTP id 10so2036200pdc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 13:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WDq7YtswJV119YKG3bqQNme17ZZiPz1tKcBDNbbhCiU=;
	b=M+wSbyiSXn1yKIhrI5Euhxx6HmLlrFLS+8OFUz8FmbZ4v3ufhlRA+29NQdWV2fMSo3
	u7wtePutxyXw/TvhwXXaNqTfSBW92SQkbAVFK0+gD8+Cm2bCWifJ3d7O70F95IamyxSV
	IbHjRCmbIHoFGlpA0mqUeZ3xnAM7BkWZpCqypokWjlPNzS5wpc8iJZHuxmCRT/jLnVo8
	qkBXapPBzR9ama+K4Pj39U7UyRD4K/Pd8V3pdl03++d0EjASo9Ev+qfpeW965yVuh8tM
	GpiPJDVbeKdZZUI6D8wFlk+mm28vkoGGB6S4SYF0pKsDicKEQId8szrHu78HWORjk5wV
	nIiA==
X-Received: by 10.66.255.41 with SMTP id an9mr26982633pad.44.1366922447642;
	Thu, 25 Apr 2013 13:40:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x2sm8590365pba.32.2013.04.25.13.40.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 13:40:46 -0700 (PDT)
Date: Thu, 25 Apr 2013 22:40:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130425204057.GI5538@jama.dyndns-home.com>
References: <91586D499ADFD74FBCFB8425266A5DE40139FD94D8FD@pluto.melinkcorp.local>
MIME-Version: 1.0
In-Reply-To: <91586D499ADFD74FBCFB8425266A5DE40139FD94D8FD@pluto.melinkcorp.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: SRC_URI for Subversion server not supporting svn:// protocol
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
X-List-Received-Date: Thu, 25 Apr 2013 20:58:50 -0000
X-Groupsio-MsgNum: 44419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u/L2/WlOHZg+YGU4"
Content-Disposition: inline

--u/L2/WlOHZg+YGU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2013 at 04:11:44PM -0400, Bryan Evenson wrote:
> I have a Subversion server that is setup for https:// access only (Apache=
 server which redirects all http to https, no svnserve active).  There is a=
n application on the repository that I would like to create a recipe for.  =
However, I'm running into issues with the SRC_URI for this application.
>=20
> If I create a SRC_URI of the form:
> SRC_URI =3D "svn://path/to/svn/repository/;module=3Dprojectname;rev=3DHEA=
D;proto=3Dhttps"

Close, but use protocol=3Dhttps.

> Then the fetch fails due to the svn checkout command being formed as:
> svn co svn://path/to/svn/repository/ projectname
>=20
> which my Subversion server rejects because it's not implementing the svn =
protocol (I know there are other checkout options in the command, but they'=
re not important to this topic).  If I then change the SRC_URI as follows:
> SRC_URI =3D "https://path/to/svn/repository/;module=3Dprojectname;rev=3DH=
EAD;proto=3Dsvn"
>=20
> Then during the fetch it attempts to use wget instead of a svn checkout. =
 This also has issues since the base wget checkout is setup to checkout a s=
ingle file and not recursively checkout a directory.  Plus, I'd like to do =
a Subversion checkout for my workflow.
>=20
> Is there a way to tell Bitbake to do a svn checkout but use an https:// U=
RL?  If not, does anyone else have any other suggestions?
>=20
> Thanks,
> Bryan
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u/L2/WlOHZg+YGU4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF5lNkACgkQN1Ujt2V2gBxhzgCgkBig4C0tgEe13VOe2xlDIjvm
maYAnjhY+kmrcpRK+T3DfUhXeV5pya5m
=M0/X
-----END PGP SIGNATURE-----

--u/L2/WlOHZg+YGU4--
