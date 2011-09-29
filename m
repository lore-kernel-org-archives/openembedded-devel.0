Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9D10-0005cl-82
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Sep 2011 11:34:50 +0200
Received: by bke11 with SMTP id 11so463149bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2011 02:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=tnfoBJnnF0+E2agpl3BTRq6KMlR6A/2dFWMj7dECQ5w=;
	b=cGXwq3pLvGbM5nHBb04cW30FEfB6QASQZfMJcsdeF7Nn774V/sVqBK88IHTSprvT8s
	6A/zaZ8RNNN4D3VHpL7y7YSleKHg6xSrzyl9XufRM+ObKlRpt7gxAlnL2i162yA9suv/
	tJnb7LtDtp9Pk1+nEt7UhT32Wzk7pDLVZRpkQ=
Received: by 10.204.13.156 with SMTP id c28mr1080967bka.243.1317288548186;
	Thu, 29 Sep 2011 02:29:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex8sm1069688bkc.2.2011.09.29.02.29.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Sep 2011 02:29:07 -0700 (PDT)
Date: Thu, 29 Sep 2011 11:28:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110929092859.GB5030@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: gcc-4.6 patches in meta-oe need to be rebased on new oe-core revision
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
X-List-Received-Date: Thu, 29 Sep 2011 09:34:50 -0000
X-Groupsio-MsgNum: 34500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline

--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

oe-core recipe was upgraded yesterday:
http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3Ded7deec=
b9503420fbf8071445e077c32beda8dc4

and
ie Patch gcc-4.6-linaro-r106741.patch does not apply anymore

ERROR: Error executing a python function in /OE/shr-core/openembedded-core/=
meta/recipes-devtools/gcc/gcc-runtime_4.6.bb:
CmdError: Command Error: exit status: 1  Output:
Applying patch gcc-4.6-linaro-r106741.patch
patching file gcc/combine.c
Hunk #2 succeeded at 3112 (offset 26 lines).
Hunk #3 succeeded at 3129 (offset 26 lines).
Hunk #4 succeeded at 3168 (offset 26 lines).
Hunk #5 succeeded at 3198 (offset 26 lines).
Hunk #6 succeeded at 3260 (offset 26 lines).
Hunk #7 succeeded at 3268 (offset 26 lines).
Hunk #8 succeeded at 4943 (offset 29 lines).
Hunk #9 succeeded at 5010 (offset 29 lines).
Hunk #10 succeeded at 5027 (offset 29 lines).
Hunk #11 succeeded at 5073 (offset 29 lines).
Hunk #12 succeeded at 5151 (offset 29 lines).
Hunk #13 succeeded at 5210 (offset 29 lines).
Hunk #14 succeeded at 5230 (offset 29 lines).
Hunk #15 succeeded at 5290 (offset 29 lines).
Hunk #16 FAILED at 5606.
| NOTE: Applying patch 'gcc-4.6-linaro-r106720.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106720.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106723.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106729.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106733.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106733.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106737.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106737.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106738.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106738.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106739.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106739.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106740.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch)
| NOTE: Applying patch 'gcc-4.6-linaro-r106741.patch' (meta-openembedded/me=
ta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch)
| ERROR: Error executing a python function in /OE/shr-core/openembedded-cor=
e/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb:
| CmdError: Command Error: exit status: 1  Output:
| Applying patch gcc-4.6-linaro-r106741.patch
| patching file gcc/combine.c
| Hunk #2 succeeded at 3112 (offset 26 lines).
| Hunk #3 succeeded at 3129 (offset 26 lines).
| Hunk #4 succeeded at 3168 (offset 26 lines).
| Hunk #5 succeeded at 3198 (offset 26 lines).
| Hunk #6 succeeded at 3260 (offset 26 lines).
| Hunk #7 succeeded at 3268 (offset 26 lines).
| Hunk #8 succeeded at 4943 (offset 29 lines).
| Hunk #9 succeeded at 5010 (offset 29 lines).
| Hunk #10 succeeded at 5027 (offset 29 lines).
| Hunk #11 succeeded at 5073 (offset 29 lines).
| Hunk #12 succeeded at 5151 (offset 29 lines).
| Hunk #13 succeeded at 5210 (offset 29 lines).
| Hunk #14 succeeded at 5230 (offset 29 lines).
| Hunk #15 succeeded at 5290 (offset 29 lines).
| Hunk #16 FAILED at 5606.
| Hunk #17 succeeded at 5728 (offset 29 lines).
| Hunk #18 succeeded at 5783 (offset 29 lines).
| Hunk #19 succeeded at 5984 (offset 29 lines).
| Hunk #20 succeeded at 6205 (offset 29 lines).
| 1 out of 20 hunks FAILED -- rejects in file gcc/combine.c
| Patch gcc-4.6-linaro-r106741.patch does not apply (enforce with -f)

I've pinged khem on IRC yesterday.. but posting also here just for record.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6EOlsACgkQN1Ujt2V2gBw99ACfRUAbTMjwsV0+Z/RL7rjA3rwS
tw0AoK1Dc2TGbAPpIjpPjXuXDzKMX0wB
=Y4yL
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
