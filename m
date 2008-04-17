Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JmdAH-0000C0-EV
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Apr 2008 01:05:13 +0200
Received: by yw-out-1718.google.com with SMTP id 9so188477ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2008 16:05:09 -0700 (PDT)
Received: by 10.151.157.8 with SMTP id j8mr2498795ybo.86.1208473509475;
	Thu, 17 Apr 2008 16:05:09 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.14.115])
	by mx.google.com with ESMTPS id c78sm10202160hsa.19.2008.04.17.16.05.06
	(version=SSLv3 cipher=RC4-MD5); Thu, 17 Apr 2008 16:05:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Apr 2008 16:05:04 -0700
Message-Id: <1208473504.21779.3.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: patch base-files /etc/profile
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
X-List-Received-Date: Thu, 17 Apr 2008 23:05:13 -0000
X-Groupsio-MsgNum: 4976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-tJiSLJS/vdIBX/xCrJVX"

--=-tJiSLJS/vdIBX/xCrJVX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi=20

I was seeing that on Angstrom.2008 I was not getting TSLIB_TSDEVICE
environment variable set though it should be as it was
invoking /etc/profile.d/tslib.sh in /etc/profile. However the 'ls'
command in there was not really working well.

This patch fixes the problem. Now I see TALIB_TSDEVICE variable set
everytime.

OK for .dev ?

Thanks

-Khem

#
# old_revision [cc8daafda388ec1e484dc2e68e1599944893bc76]
#
# patch "packages/base-files/base-files/profile"
#  from [c1afd65b969f708eab144ec909358f3c8f22a411]
#    to [e24b90b96edb24d3af735f32c72528e6a01d617d]
#=20
# patch "packages/base-files/base-files_3.0.14.bb"
#  from [a35cae8a2aa502d9f36ce35fcd2dddd9a86ce2c4]
#    to [3b4da947c2b76133142ee113622e6986e653f14a]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/base-files/base-files/profile
c1afd65b969f708eab144ec909358f3c8f22a411
+++ packages/base-files/base-files/profile
e24b90b96edb24d3af735f32c72528e6a01d617d
@@ -20,8 +20,10 @@ if [ -d /etc/profile.d ]; then
 fi
=20
 if [ -d /etc/profile.d ]; then
-  for i in `ls /etc/profile.d/`; do
-    . /etc/profile.d/$i
+  for i in /etc/profile.d/*.sh; do
+    if [ -r $i ]; then
+      . $i
+    fi
   done
   unset i
 fi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/base-files/base-files_3.0.14.bb
a35cae8a2aa502d9f36ce35fcd2dddd9a86ce2c4
+++ packages/base-files/base-files_3.0.14.bb
3b4da947c2b76133142ee113622e6986e653f14a
@@ -1,7 +1,7 @@ PRIORITY =3D "required"
 DESCRIPTION =3D "Miscellaneous files for the base system."
 SECTION =3D "base"
 PRIORITY =3D "required"
-PR =3D "r77"
+PR =3D "r78"
 LICENSE =3D "GPL"
=20
 SRC_URI =3D " \


--=-tJiSLJS/vdIBX/xCrJVX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIB9egHnJKy6V6em4RAsYdAJ98iKO5kBYEaOJw4jit7FGwq+MV9gCfX9W2
SJYwN7DeRcYTnKti2NYpjVA=
=z1Ds
-----END PGP SIGNATURE-----

--=-tJiSLJS/vdIBX/xCrJVX--
