Received: from [64.233.178.244] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1Jgh9R-0008TA-9t
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 16:07:49 +0200
Received: by hs-out-0708.google.com with SMTP id 23so2412703hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 07:07:45 -0700 (PDT)
Received: by 10.101.71.9 with SMTP id y9mr19407473ank.64.1207058865576;
	Tue, 01 Apr 2008 07:07:45 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 7sm9390078aga.18.2008.04.01.07.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Apr 2008 07:07:43 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Apr 2008 08:07:34 -0500
User-Agent: KMail/1.9.7
References: <200803311438.09825.e.robertson.svg@gmail.com>
	<200803312307.51210.zecke@selfish.org>
In-Reply-To: <200803312307.51210.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200804010807.38670.e.robertson.svg@gmail.com>
Cc: Holger Freyther <zecke@selfish.org>
Subject: Re: stable branch checksum missmatch for quilt-0.45
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2008 14:07:49 -0000
X-Groupsio-MsgNum: 4882
Content-Type: multipart/signed; boundary="nextPart2969209.Txeg9Ratfd";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2969209.Txeg9Ratfd
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Z,
You must be the funny one.

> Resolving facts:
> 	sha256 might be equal to SHA256
>
> 	oe_sha256sum might be an OpenEmbedded (oe) program to calculate a
> 	sha256. It was not able to execute it
>
> 	It was not able to execute oe_sha256sum, the stuff printed on the console
> 	was "".
>
> 	This could explain the mismatch?
>
> Applying knowledge:
> 	You have a failure because oe_sha256sum failed to be executed.
>
> Possible next steps:
> 	- Check if you have a oe_sha256sum
> 	- Check if your home partition allows execution of binaries
> 	- Check your build logs if oe_sha256sum was attempted to be built
> 	- Check the dep graph if there is a oe_sha256sum in it (bitbake -g and
> then read the files and search for sha256)
>
> oe_sha256sum is supposed to be built before everything else, and normally
> is. So good luck and please provide more feedback (you seem to get starte=
d)

I had already checked if the oe_sha256sum executable was build and it was n=
ot.=20
I also did a grep to see where the build was initiated.
Building from the dev branch did not give me this error because it was buil=
d -=20
hence I specify the _stable_ branch:

=2E/oetmp/work/i686-linux/shasum-native-1.0-r1/oe_sha256sum
=2E/oetmp/staging/i686-linux/usr/bin/oe_sha256sum

Since it was already built by the dev branch and I use the same local file =
to=20
build the stable branch, would it / should it skip the build and use the=20
built binary? Or would it just rebuild the binary?
What is the command to a clean build?

In your last point above, what is a "dep graph"?

Thanks.









--nextPart2969209.Txeg9Ratfd
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8jOa2sS31XKVICURAqPcAJ45PEf3w1ccFMnrvdFHBGTft2+bNgCdEgH7
s/BgILns2bZxYL62LlaxK/o=
=mmg9
-----END PGP SIGNATURE-----

--nextPart2969209.Txeg9Ratfd--
