Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgPzd-0004Dm-Jm
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 21:48:33 +0200
Received: by wx-out-0506.google.com with SMTP id h27so2030881wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 12:48:30 -0700 (PDT)
Received: by 10.100.13.5 with SMTP id 5mr16794021anm.110.1206992899992;
	Mon, 31 Mar 2008 12:48:19 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 18sm3461599agb.36.2008.03.31.12.48.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Mar 2008 12:48:19 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 14:48:03 -0500
User-Agent: KMail/1.9.7
References: <200803311438.09825.e.robertson.svg@gmail.com>
In-Reply-To: <200803311438.09825.e.robertson.svg@gmail.com>
MIME-Version: 1.0
Message-Id: <200803311448.09234.e.robertson.svg@gmail.com>
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
X-List-Received-Date: Mon, 31 Mar 2008 19:48:33 -0000
X-Groupsio-MsgNum: 4864
Content-Type: multipart/signed; boundary="nextPart27435094.6vuhTn7dBB";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart27435094.6vuhTn7dBB
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 31 March 2008 02:38:05 pm E Robertson wrote:
> building helloworld:
>
> OE Build Configuration:
> BB_VERSION     =3D "1.8.10"
> OE_REVISION    =3D "a0a3cc0088bc51023a19b1d6942f7cc643e6bb52"
> TARGET_ARCH    =3D "arm"
> TARGET_OS      =3D "linux-uclibcgnueabi"
> MACHINE        =3D "at91sam9263ek"
> DISTRO         =3D "angstrom"
> DISTRO_VERSION =3D "2008.1-test-20080331"
> TARGET_FPU     =3D "soft"
>
> ...
> NOTE: package quilt-native-0.45: started
> NOTE: package quilt-native-0.45-r1: task do_fetch: started
> sh: oe_sha256sum: command not found

Sorry, I checked the sums (should have done this in the first place) are th=
ey=20
are correct. The problem I see (remember I'm new here) is oe_sha256sum. Is=
=20
this an error or should their be a macro using the host sha256sum?


> NOTE: The SHA256 Sums do not match.
> Wanted: 'de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8'
> Got: ''
> NOTE: Task failed: Checksum
> of 'http://download.savannah.gnu.org/releases/quilt/quilt-0.45.tar.gz'
> failed NOTE: package quilt-native-0.45-r1: task do_fetch: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package quilt-native-0.45: failed
> ERROR: Build
> of
> /OpenEmbedded_Stuff/org.openembedded.stable/packages/quilt/quilt-native_0=
=2E4
>5.bb do_fetch failed
>
>
>
> according to checksums.ini:
>
> [http://download.savannah.gnu.org/releases/quilt/quilt-0.45.tar.gz]
> md5=3D5f8dd5a041ca7c700b16620228f922aa
> sha256=3Dde7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8
>
> If I edit this file and later do a stable update, would it erase my
> changes?



--nextPart27435094.6vuhTn7dBB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8T/52sS31XKVICURAviRAJ9fO/2xl6Fa9N3Zk8yuPgtMr29gPgCfU+Ag
uu6DdANsq4GA7I6laPgBRdY=
=08Qn
-----END PGP SIGNATURE-----

--nextPart27435094.6vuhTn7dBB--
