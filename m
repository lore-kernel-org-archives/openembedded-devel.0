Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RtDgr-0001kb-LK
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2012 08:36:23 +0100
Received: by eekd41 with SMTP id d41so871466eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 23:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3cDLfOIjS5Ethyl0n+Zm7+MFQrjm9ufxb/bWy6CR06U=;
	b=dw019/Pbo+pDIU9xTwqZcD/7gDzDTUGIwR84drmJWeMX6SrO87g4zo0Tgnoksi+5ba
	RX33J34p0mbcqCbZ3nBbQQB8895jTYtMxsFKjuBn/9n2q6v4S9FQCCOlF93auoaiIP7j
	jCZB6oE2q5ggQSeUdRaIksfhnAcXHrpEhLgjM=
Received: by 10.14.53.74 with SMTP id f50mr1961158eec.5.1328254091778;
	Thu, 02 Feb 2012 23:28:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm18700912eeb.11.2012.02.02.23.28.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 23:28:09 -0800 (PST)
Date: Fri, 3 Feb 2012 08:28:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120203072808.GB3893@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
	<20120202091726.GG3697@jama.jama.net>
	<20120202111127.0b9d886a@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120202111127.0b9d886a@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Fri, 03 Feb 2012 07:36:40 -0000
X-Groupsio-MsgNum: 36857
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2012 at 11:11:27AM +0100, Eric B=E9nard wrote:
> Hi Martin,
>=20
> Le Thu, 2 Feb 2012 10:17:26 +0100,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> > OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/usr/=
local/
> > oecore-x86_64-arm
> > OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/=
local/
> > oecore-x86_64-x86_64
> >=20
> using Angstrom I don't have the same directories here :
> [ebenard@eb-e6520 setup-scripts]$ ls
> build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-li=
nux/usr/local/
> angstrom-eglibc-x86_64-armv5te

I usually don't build SDKs, so I'm not really not familiar with
oesdk-linux-nativesdk and nativesdk-oesdk-linux differences :/

But I'll try your patch for oe-core
http://patchwork.openembedded.org/patch/17129/
with oe-core only (and distroless) and if it behaves the same I'll
report on oe-core ML.

Cheers,

>=20
> > OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/us=
r/local/ -name python2.7
> > OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/us=
r/local/ -name python2.7
> > /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore=
-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7
> > /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore=
-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7
> >=20
> strange :
> $ find build/tmp-angstrom_2010_x-eglibc/sysroots/ -name python2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/at91sam9m10g45ek/usr/include/py=
thon2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/at91sam9m10g45ek/usr/lib/python=
2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-li=
nux/usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-li=
nux/usr/include/python2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-li=
nux/usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-li=
nux/usr/lib/python2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/python2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/include/python=
2.7
> build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib/python2.7
>=20
> Eric
> --=20
> http://eukrea.com/en/news/104-2012
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8rjIgACgkQN1Ujt2V2gByHUwCfZNTQCOw1SG8LYKH41WB4GLCS
W8MAoLovs/SVs7JXhfbcYgzwiC7o2pcx
=6gN6
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
