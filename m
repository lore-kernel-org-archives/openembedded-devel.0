Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXcYV-0002rV-4Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 15:28:43 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXcXE-000Hru-Kc
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:27:24 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 17:27:18 +0300
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200902121727.21796.roman@khimov.ru>
Subject: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Thu, 12 Feb 2009 14:28:43 -0000
X-Groupsio-MsgNum: 7638
Content-Type: multipart/signed; boundary="nextPart77158703.2nyYvuvtEv";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart77158703.2nyYvuvtEv
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all.

There are severe problems with icecc builds currently in OE. Cross-compiler
tarball created wrong, PATH set incorrectly, etc.

So, here is a patch that fixes some basic things, like:
1) ICECC_ENV_EXEC variable expansion. Currently you can only use absolute
   path here, something like "${TOP}/create-icecc-env.sh" won't work.
2) PATH is set wrong for cross-compiler, the problem is that ${ICECC_PATH}
   is expanded at script-producing stage, so as a result you have

   export PATH=3D/usr/bin/icecc$PATH

   in script, which is just plain wrong.
3) Cross-compiler tarball created is not working, at least with 4.3.3 GCC
   version when 'create-icecc-env.sh' script tries to find cc1 and cc1plus
   it gets nothing meaningful, like:

   $ ./tmp/cross/i686/i686-linux/bin/gcc -print-prog-name=3Dcc1
   cc1
   $ ./tmp/cross/i686/i686-linux/bin/gcc -print-prog-name=3Dcc1plus
   cc1plus

   Compare that to
   $ ./tmp/cross/i686/bin/i686-linux-gcc -print-prog-name=3Dcc1
   /path-to-oe-top/tmp/cross/i686/libexec/gcc/i686-linux/4.3.3/cc1
   $ ./tmp/cross/i686/bin/i686-linux-gcc -print-prog-name=3Dcc1plus
   /path-to-oe-top/tmp/cross/i686/libexec/gcc/i686-linux/4.3.3/cc1plus

This patch fixes this problems and one can use icecc with it, albeit there =
are
some problems left, 'icecc-create-env' is not working as create-icecc-env.sh
provider and there is a problem with parallel task execution (as in
BB_NUMBER_THREADS) if several tasks get ready to run, try to find icecc
tarball, not find that, and then every task tries to create the tarball whi=
ch
leads to all sorts of corruption in resulting tarball.

=2D-- a/classes/icecc.bbclass	2009-01-23 15:05:33.116226578 +0300
+++ b/classes/icecc.bbclass	2009-02-10 15:17:02.891420616 +0300
@@ -83,13 +83,15 @@ def create_cross_env(bb,d):
=20
     #check if user has specified a specific icecc-create-env script
     #if not use the OE provided one
=2D    cr_env_script =3D bb.data.getVar('ICECC_ENV_EXEC',  d) or  bb.data.e=
xpand('${STAGING_DIR}', d)+"/ice/icecc-create-env"
+    cr_env_script =3D bb.data.expand('${ICECC_ENV_EXEC}',  d)
+    if cr_env_script =3D=3D "${ICECC_ENV_EXEC}":
+        cr_env_script =3D bb.data.expand('${STAGING_DIR}', d)+"/ice/icecc-=
create-env"
     #call the modified create-env script
     result=3Dos.popen("%s %s %s %s %s %s" %(cr_env_script,
            "--silent",
=2D           os.path.join(ice_dir,target_sys,'bin','gcc'),
=2D           os.path.join(ice_dir,target_sys,'bin','g++'),
=2D           os.path.join(ice_dir,target_sys,'bin','as'),
+           os.path.join(ice_dir, 'bin', "%s-gcc" % target_sys),
+           os.path.join(ice_dir, 'bin', "%s-g++" % target_sys),
+           os.path.join(ice_dir, 'bin', "%s-as" % target_sys),
            os.path.join(ice_dir,"ice",cross_name) ) )
     return tar_file
=20
@@ -121,7 +123,9 @@ def create_native_env(bb,d):
=20
     #check if user has specified a specific icecc-create-env script
     #if not use the OE provided one
=2D    cr_env_script =3D bb.data.getVar('ICECC_ENV_EXEC',  d) or  bb.data.e=
xpand('${STAGING_DIR}', d)+"/ice/icecc-create-env"
+    cr_env_script =3D bb.data.expand('${ICECC_ENV_EXEC}',  d)
+    if cr_env_script =3D=3D "${ICECC_ENV_EXEC}":
+        cr_env_script =3D bb.data.expand('${STAGING_DIR}', d)+"/ice/icecc-=
create-env"
     result=3Dos.popen("%s %s %s %s %s %s" %(cr_env_script,
            "--silent",
            os.popen("%s gcc" % "which").read()[:-1],
@@ -290,9 +294,9 @@ def check_for_kernel(bb,d):    =20
=20
=20
 set_icecc_env() {
=2D    ICECC_PATH=3D${@icc_path(bb,d)}
=2D    if test x${ICECC_PATH} !=3D x; then
=2D	export PATH=3D${ICECC_PATH}$PATH
+    ICE_PATH=3D${@icc_path(bb,d)}
+    if test x${ICE_PATH} !=3D x; then
+	export PATH=3D${ICE_PATH}$PATH
 	export CCACHE_PATH=3D$PATH
         #check if we are building a kernel and select gcc-cross-kernel
         if [ "${@check_for_kernel(bb,d)}" =3D "yes" ]; then


=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart77158703.2nyYvuvtEv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmUMcYACgkQXJ70z+XgVcOMQQCfWAKd/9QvrHGNTjL+afAusRs2
iYAAoJF91zVMbUPbQe/9EYFIz/0R5UPS
=pwN6
-----END PGP SIGNATURE-----

--nextPart77158703.2nyYvuvtEv--
