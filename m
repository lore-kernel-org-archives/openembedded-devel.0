Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPCDc-0004PO-Bh
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 15:34:45 +0200
Received: by mail-pd0-f179.google.com with SMTP id x11so3191174pdj.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sd+VoSv9xUkjulLNX0aQ6I6QdzluRc1cymp4QBHYJ9U=;
	b=vrnR1jFYeCZwrYO5198iknmWfJ6uRdT0jQpe2P55U48CshxLVLAinvBoOxac2SYckd
	vE92Y3ExuKS///SozsFmhKtz7vBH0Pk78vmDFHFNWmatEOGa2FMwrA8OBnf63jVFc7Bb
	wmH579l9JosLOzRrzU61mz1QmObVe+ziwBWtpIYQg/r51ewjE/KninwYiQTkxjz2A4o8
	Lsnn9l9TN4rGm+kcna3PwTYP43x1aa/A1trOxmJwkNfi1o26ocsY35jY7jadsS/ZKBjs
	xwFs558FoSkAEZBbSgPmBW8fe3r/HJVJ+KFq4jcC/U/okSSCerSgLVFyUzr+V80l7r3b
	FSjA==
X-Received: by 10.66.88.39 with SMTP id bd7mr37595805pab.184.1365427044661;
	Mon, 08 Apr 2013 06:17:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id lo3sm19538014pab.19.2013.04.08.06.17.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 06:17:23 -0700 (PDT)
Date: Mon, 8 Apr 2013 15:17:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130408131717.GA2470@jama>
References: <5162B803.4090400@nedap.com>
MIME-Version: 1.0
In-Reply-To: <5162B803.4090400@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: machinename with dash in it
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
X-List-Received-Date: Mon, 08 Apr 2013 13:34:46 -0000
X-Groupsio-MsgNum: 43972
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2013 at 02:28:51PM +0200, Jaap de Jong wrote:
> Hi All,
> something strange happens with my machinename with a dash in it: x-y
> If I bitbake some image it will end up that netbase is not found.
> Inspection of build/tmp-angstrom_v2012_12-eglibc/work shows 2 variants=20
> of x-y: one with a dash and one where the dash is replaced by an=20
> underscore: x-y and x_y
> In x-y only netbase is found, rest of the machinespecific packages are=20
> in x_y

MACHINE_ARCH is MACHINE with s/-/_/g (because rpm had issues with -) so it'=
s expected.

> Creating the image fails with the message that netbase is not found...
> Any ideas?

It's probably caused by
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102
do manual cleanup described there and it should work fine.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFiw10ACgkQN1Ujt2V2gByJjgCgpsVTyXZ51YcEYuewPeGj7+bZ
4T4AnjRWu46/LyOEl2hKJGip22elt5Cl
=IRXH
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
