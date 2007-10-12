Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IgE7E-0000yU-I3
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2007 08:35:20 +0200
Received: (qmail invoked by alias); 12 Oct 2007 06:22:36 -0000
Received: from e178077248.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.77.248]
	by mail.gmx.net (mp017) with SMTP; 12 Oct 2007 08:22:36 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19eeDxie6teFNZbl6OhyECQMsncmCDn+UNMgZ0etX
	mQXH/ShFyjWcjk
Message-ID: <470F12A7.1050200@gmx.net>
Date: Fri, 12 Oct 2007 08:22:31 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.2.0
X-Y-GMX-Trusted: 0
Subject: patch: fix patch num in glibc 2.3.3+cvs20050221
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
X-List-Received-Date: Fri, 12 Oct 2007 06:35:20 -0000
X-Groupsio-MsgNum: 3113
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigA28AB4C09992B651860E1638"

--------------enigA28AB4C09992B651860E1638
Content-Type: multipart/mixed;
 boundary="------------030405090407010207030301"

--------------030405090407010207030301
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
while trying to build glibc_2.3.3+cvs20050221 I noticed that one of the
patches does not apply. It is simply using a wrong strip value. The
attached little patch fixes that.

Would someone apply this? I dont have commit rights.

Regards
Robert

--------------030405090407010207030301
Content-Type: text/x-patch;
 name="oe-glibc2.3.3+cvs20050221-fix.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-glibc2.3.3+cvs20050221-fix.diff"

#
# old_revision [ff780297b2beb554f6e0e5aa5c6193b3593edb78]
#
# patch "packages/glibc/glibc_2.3.3+cvs20050221.bb"
#  from [c81a4dcb60d85da204ee67a9cb24ee2248fed1a3]
#    to [919a8c98d395b0551b87a5ed37d92dce15fe0db6]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc_2.3.3+cvs20050221.bb	c81a4dcb60d85da204ee67a9cb2=
4ee2248fed1a3
+++ packages/glibc/glibc_2.3.3+cvs20050221.bb	919a8c98d395b0551b87a5ed37d=
92dce15fe0db6
@@ -22,7 +22,7 @@ SRC_URI =3D "cvs://anoncvs@sources.redhat.
 	   file://arm-longlong.patch;patch=3D1;pnum=3D0 \
 	   file://arm-machine-gmon.patch;patch=3D1;pnum=3D0 \
 	   file://trampoline.patch;patch=3D1;pnum=3D0 \
-	   file://dl-cache-libcmp.patch;patch=3D1;pnum=3D0 \
+	   file://dl-cache-libcmp.patch;patch=3D1 \
 	   \
            file://etc/ld.so.conf \
 	   file://generate-supported.mk"

--------------030405090407010207030301--

--------------enigA28AB4C09992B651860E1638
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHDxKqG9cfwmwwEtoRCDWdAKCXYZ/Z0g88J7DbL/fKGVJK3a/8YgCbBihe
6ODTZtxOSm/WWV6RDgWqFuQ=
=rkd0
-----END PGP SIGNATURE-----

--------------enigA28AB4C09992B651860E1638--
