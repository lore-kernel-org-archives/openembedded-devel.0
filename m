Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qy1tm-0001Wf-Rw for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 15:29:10 +0200
Received: from f053042163.adsl.alicedsl.de ([78.53.42.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qy1p8-0007vU-1B for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 13:24:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:24:19 +0200
In-Reply-To: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
References: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314624260.6949.42.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: Add mycable's Fujitsu Jade Evaluation Board support
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
X-List-Received-Date: Mon, 29 Aug 2011 13:29:10 -0000
X-Groupsio-MsgNum: 33873
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Q+U+oLmqBFichZmPg6u6"

--=-Q+U+oLmqBFichZmPg6u6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Yauhen,


Am Montag, den 29.08.2011, 15:40 +0300 schrieb Yauhen Kharuzhy:
> This patch series adds machine configuration, kernel and uboot patches fo=
r mycable's Fujitsu MB68R01 'Jade' SoC
> (http://www.fujitsu.com/emea/services/microelectronics/gdc/gdcdevices/mb8=
6r01-jade.html).
> Kernel and u-boot patches were picked from XXSVideo project on SourceForg=
e.

thank you for your patches. Unfortunately you will need to resend them,
since they contain some =E2=80=9Cstyle=E2=80=9D issues.

0. Please look at our commit policy [0] on how to format the commit
summary.

1. Please add to the commit message of the machine addition what
distribution you tested your machine with and what works and what not.

2. Always start with `PR =3D "r0"` please.

3. It would be nice if you could add patch headers to the patches [1].
Like where did you get them from and what is the upstream status.

I know a lot of things in oe.dev do not adhere to that requirement but
since some time new contributions should follow them. So I am sorry to
make that demand.

4. Adding a new machine in the right way seems difficult. Checking out a
branch after for example 2/3 one would not find the required machine.
But I guess that is the only draw back and =E2=80=9Csmall=E2=80=9D patches =
are a better
benefit.

5. More information regarding supporting OE and this board is also
welcome. That means can we expect further contributions or is this a
=E2=80=9Cone time code drop=E2=80=9D? Are there plans to move to oe-core/me=
ta-oe [2]?

6. Please add `[PATCH v2]` to the subject line [3] when resending the
patches and update the state of your patches in our patch queue
Patchwork [4].


Thanks,

Paul


[0] http://openembedded.org/index.php/Commit_Policy
[1] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines
[2] http://openembedded.org/index.php/OpenEmbedded-Core
[3] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded=
#Create_and_Commit_your_patch
[4] http://openembedded.org/index.php/Patchwork

--=-Q+U+oLmqBFichZmPg6u6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5bkwMACgkQPX1aK2wOHVg/kgCghwpdG/jD+ZkPTzGicBvLUugs
8HYAnj6/xWO0hpNNvrUOLhjPn927WK91
=U3Lh
-----END PGP SIGNATURE-----

--=-Q+U+oLmqBFichZmPg6u6--
