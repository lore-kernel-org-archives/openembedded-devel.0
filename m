Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MaTzb-0004CB-DO
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 14:28:47 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 9DB9C14030; Mon, 10 Aug 2009 14:12:34 +0200 (CEST)
Date: Mon, 10 Aug 2009 14:12:34 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090810121234.GB28304@zlo.nu>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: curl 7.19.5 openssl algorithm problem [PATCH]
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
X-List-Received-Date: Mon, 10 Aug 2009 12:28:48 -0000
X-Groupsio-MsgNum: 12281
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline

--8w3uRX/HFJGApMzv
Content-Type: multipart/mixed; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline

--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom curl's CVS log: http://cool.haxx.se/cvs.cgi/curl/lib/ssluse.c#rev1.2=
29

you [curl] replaced the old SSLeay_add_ssl_algorithms() call
with OpenSSL_add_all_algorithms(), however unlike the name suggests,
the second function is not a superset of the first. When using SSL
both these functions will need to be called in order to offer complete
functionality.

This patch fixes the 7.19 breakage of secure (no -k or --insecure flags
passed) https invocations of the curl binary when connecting to a server
with certificates with a non-MD5 or SHA-1 signature algorithm, like
SHA-2. The older curl recipes are unaffected by this.

Marc

--ctP54qlpMx3WjD+/
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="curl.patch"
Content-Transfer-Encoding: quoted-printable

commit 9644286f7de51577ba8e2348d4c1ab37f9a1657c
Author: Marc Olzheim <marc@iphion.nl>
Date:   Mon Aug 10 11:14:06 2009 +0200

    Add curl-add_all_algorithms.patch to 7.19.5 recipe. Fixes curl artifact=
 id 2825989
    https://sourceforge.net/tracker/index.php?func=3Ddetail&aid=3D2825989&g=
roup_id=3D976&atid=3D100976

diff --git a/recipes/curl/curl_7.19.5.bb b/recipes/curl/curl_7.19.5.bb
index df83fe8..f6c1f89 100644
--- a/recipes/curl/curl_7.19.5.bb
+++ b/recipes/curl/curl_7.19.5.bb
@@ -1,5 +1,6 @@
 require curl-common.inc
 require curl-target.inc
=20
-SRC_URI +=3D "file://off_t_abi_fix.patch;patch=3D1;pnum=3D0"
+SRC_URI +=3D "file://off_t_abi_fix.patch;patch=3D1;pnum=3D0 \
+		file://curl-add_all_algorithms.patch;patch=3D1"
 PR =3D "r0"
diff --git a/recipes/curl/files/curl-add_all_algorithms.patch b/recipes/cur=
l/files/curl-add_all_algorithms.patch
new file mode 100644
index 0000000..99557f5
--- /dev/null
+++ b/recipes/curl/files/curl-add_all_algorithms.patch
@@ -0,0 +1,22 @@
+--- curl-7.19.5/lib/ssluse.c	2009-01-26 15:36:22.000000000 +0100
++++ curl-7.19.5/lib/ssluse.c	2009-07-23 15:44:12.000000000 +0200
+@@ -58,6 +58,7 @@
+ #ifdef USE_SSLEAY
+=20
+ #ifdef USE_OPENSSL
++#include <openssl/evp.h>
+ #include <openssl/rand.h>
+ #include <openssl/x509v3.h>
+ #else
+@@ -627,6 +628,11 @@
+   /* Lets get nice error messages */
+   SSL_load_error_strings();
+=20
++#ifdef USE_OPENSSL
++  /* Load all algorithms (including SHA2) */
++  OpenSSL_add_all_algorithms();
++#endif /* USE_OPENSSL */
++
+   /* Setup all the global SSL stuff */
+   if(!SSLeay_add_ssl_algorithms())
+     return 0;

--ctP54qlpMx3WjD+/--

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqADrIACgkQezjnobFOgrGb1QCfYBRzN7UgkDJn6F6OwJdUoOav
++MAn01i7CU+j0evcm9LoiBeYrTJKOuQ
=p0Vq
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
