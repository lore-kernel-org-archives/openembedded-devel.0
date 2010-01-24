Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ730-0005pX-Hn for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 19:18:57 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ70n-0000MW-Co for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 18:16:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 19:16:35 +0100
Message-ID: <1264356995.3663.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [server] Which Patchwork do we run?
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
X-List-Received-Date: Sun, 24 Jan 2010 18:18:57 -0000
X-Groupsio-MsgNum: 16179
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zLJF0zYJAnV07BWCkvWo"

--=-zLJF0zYJAnV07BWCkvWo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE administrators,


before I want to contact the Patchwork guys about some issues I am
seeing, what version do we run.

It does not seem to be up to date judging from the differences in
`pwclient`.=20

        $ diff -u patchwork/apps/patchwork/bin/pwclient /usr/local/bin/pwcl=
ient=20
        --- patchwork/apps/patchwork/bin/pwclient	2010-01-24 19:12:26.00000=
0000 +0100
        +++ /usr/local/bin/pwclient	2010-01-23 22:30:53.000000000 +0100
        @@ -285,14 +285,8 @@
             if not success:
                 sys.stderr.write("Patch not updated\n")
        =20
        -def patch_id_from_hash(rpc, project, hash):
        -    try:
        -        patch =3D rpc.patch_get_by_project_hash(project, hash)
        -    except xmlrpclib.Fault:
        -        # the server may not have the newer patch_get_by_project_h=
ash function,
        -        # so fall back to hash-only.
        -        patch =3D rpc.patch_get_by_hash(hash)
        -
        +def patch_id_from_hash(rpc, hash):
        +    patch =3D rpc.patch_get_by_hash(hash)
             if patch =3D=3D {}:
                 return None
        =20
        @@ -388,9 +382,9 @@
        =20
             patch_id =3D None
             if hash_str:
        -        patch_id =3D patch_id_from_hash(rpc, project_str, hash_str=
)
        +        patch_id =3D patch_id_from_hash(rpc, hash_str)
                 if patch_id is None:
        -            sys.stderr.write("No patch has the hash provided\n")
        +            sys.stderr.write("No patch has the hash provided")
                     sys.exit(1)
        =20
        =20
        @@ -414,7 +408,7 @@
        =20
                 s =3D rpc.patch_get_mbox(patch_id)
                 if len(s) > 0:
        -            print unicode(s).encode("utf-8")
        +            print s
        =20
             elif action =3D=3D 'get' or action =3D=3D 'save':
                 try:


Thanks a lot,

Paul

--=-zLJF0zYJAnV07BWCkvWo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcjoMACgkQPX1aK2wOHVjWXgCfTl2rtNvX5W8JLaY8Nh80p7qs
Rm0An3wfayMcC/1XZW9HhR4WRlTTEOBj
=TNAs
-----END PGP SIGNATURE-----

--=-zLJF0zYJAnV07BWCkvWo--
