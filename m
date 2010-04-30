Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O7uf0-0000tH-TB
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 20:09:59 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O7ubN-0003xF-EK
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 22:06:15 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Apr 2010 22:06:08 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <w2tbd4a003f1004301028p5658d66eyb0083748bfaf498@mail.gmail.com>
In-Reply-To: <w2tbd4a003f1004301028p5658d66eyb0083748bfaf498@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004302206.12006.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Adding a nounpack url parameter to base.bbclass
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
X-List-Received-Date: Fri, 30 Apr 2010 18:10:00 -0000
X-Groupsio-MsgNum: 18906
Content-Type: multipart/signed; boundary="nextPart1845590.8DqXl7Gb5k";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1845590.8DqXl7Gb5k
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =CF=FF=F2=ED=E8=F6=E0 30 =E0=EF=F0=
=E5=EB=FF 2010 21:28:40 =E0=E2=F2=EE=F0 Ash Charles =ED=E0=EF=E8=F1=E0=EB:
> I added a minor change to base.bbclass to accept a 'nounpack=3D1'
> parameter to stop bitbake from unpacking a file that has a bz2, tar...
> extension; this is useful if you actually want to include such an
> archive file in a package.  I'm not familiar with the policies for
> submitting patches however I thought other people might find it useful
> so I've included it below:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 4d5d73d..387a066 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -171,21 +171,29 @@ def oe_unpack_file(file, data, url =3D None):
>         else:
>                 efile =3D file
>         cmd =3D None
> -       if file.endswith('.tar'):
> +
> +        # allow a 'nounpack=3D1' url parameter to prevent unpacking of
>  archives +        unpack =3D True
> +        (type, host, path, user, pswd, parm) =3D bb.decodeurl(url)
> +        if 'nounpack' in parm:
> +                if parm['nounpack']:
> +                        unpack =3D False
> +
> +       if unpack and file.endswith('.tar'):
>                 cmd =3D 'tar x --no-same-owner -f %s' % file
> -       elif file.endswith('.tgz') or file.endswith('.tar.gz') or
> file.endswith('.tar.Z'):
> +       elif unpack and (file.endswith('.tgz') or
> file.endswith('.tar.gz') or file.endswith('.tar.Z')):
>                 cmd =3D 'tar xz --no-same-owner -f %s' % file
> -       elif file.endswith('.tbz') or file.endswith('.tbz2') or
> file.endswith('.tar.bz2'):
> +       elif unpack and (file.endswith('.tbz') or
> file.endswith('.tbz2') or file.endswith('.tar.bz2')):
>                 cmd =3D 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
> -       elif file.endswith('.gz') or file.endswith('.Z') or
>  file.endswith('.z'): +       elif unpack and (file.endswith('.gz') or
>  file.endswith('.Z') or file.endswith('.z')):
>                 cmd =3D 'gzip -dc %s > %s' % (file, efile)
> -       elif file.endswith('.bz2'):
> +       elif unpack and file.endswith('.bz2'):
>                 cmd =3D 'bzip2 -dc %s > %s' % (file, efile)
> -       elif file.endswith('.tar.xz'):
> +       elif unpack and file.endswith('.tar.xz'):
>                 cmd =3D 'xz -dc %s | tar x --no-same-owner -f -' % file
> -       elif file.endswith('.xz'):
> +       elif unpack and file.endswith('.xz'):
>                 cmd =3D 'xz -dc %s > %s' % (file, efile)
> -       elif file.endswith('.zip') or file.endswith('.jar'):
> +       elif unpack and (file.endswith('.zip') or file.endswith('.jar')):
>                 cmd =3D 'unzip -q -o'
>                 (type, host, path, user, pswd, parm) =3D bb.decodeurl(url)
>                 if 'dos' in parm:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Wouldn't it be easier to do something like:

+        if 'nounpack' not in parm:
+            if file.endswith('.tar'):
=2E...
+            elif file.endswith('.tgz') or file.endswith('.tar.gz') or file=
=2Eendswith('.tar.Z'):
=2E...

? The diff would be a bit bigger, but the end result is cleaner IMO.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1845590.8DqXl7Gb5k
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvbHBMACgkQXJ70z+XgVcP0/QCgjyxvkDoSbMIpMbnpi+mvXkSA
1fQAnREyw9v90/pWl1x9uaONcSLJ2XPz
=ZhlI
-----END PGP SIGNATURE-----

--nextPart1845590.8DqXl7Gb5k--
