Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MbAo3-00030s-I9
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 12:11:43 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 6FBC11402F; Wed, 12 Aug 2009 11:55:18 +0200 (CEST)
Date: Wed, 12 Aug 2009 11:55:18 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090812095518.GA21131@zlo.nu>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Curl security advisory CVE-2009-2417 [PATCH]
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
X-List-Received-Date: Wed, 12 Aug 2009 10:11:43 -0000
X-Groupsio-MsgNum: 12327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline

--i9LlY+UWpKt15+FH
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm not sure what the policy is for patch files of this type, but in
this patch I decided to add them to recipes/curl/files, instead of
including the curl.haxx.se urls in the SRC_URIs. I hope that that is the
way to do it.

The patch for 7.18.1 applies on 7.18.2 fine. Apart from applying
patches, I added 7.19.6.

Marc

--sdtB3X0nJg68CQEu
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="curl.patch"
Content-Transfer-Encoding: quoted-printable

commit aab35ef35648250da1f37e8b60574b9359dff976
Author: Marc Olzheim <marc@iphion.nl>
Date:   Wed Aug 12 11:42:50 2009 +0200

    Add curl 7.19.6 and fix CVE-2009-2417 for the rest
    http://curl.haxx.se/docs/adv_20090812.html

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 60d9729..f277e29 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4390,6 +4390,10 @@ sha256=3Dfb3436280dedbc8f8141d3841a5964c4491dd6457bc=
5b7123854aed0b794be86
 md5=3D426d161661dce70c8ea9ad8f553363a3
 sha256=3D05ad84a9c8d340917370f357ad9fdce5ea595deb11f4cb70f946fa48c7b02cd0
=20
+[http://curl.haxx.se/download/curl-7.19.6.tar.bz2]
+md5=3D8402c1f654c51ad7287aad57c3aa79be
+sha256=3Dea88f48c8415f7d3af482e4d241277b2bdbfaffaf285e8001c88c1376cbc1021
+
 [http://downloads.sourceforge.net/curlftpfs/curlftpfs-0.9.2.tar.gz]
 md5=3Db452123f755114cd4461d56c648d9f12
 sha256=3D4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958
diff --git a/recipes/curl/curl-native_7.18.2.bb b/recipes/curl/curl-native_=
7.18.2.bb
index c95591b..00c6215 100644
--- a/recipes/curl/curl-native_7.18.2.bb
+++ b/recipes/curl/curl-native_7.18.2.bb
@@ -1,7 +1,9 @@
 require curl-common.inc
 inherit native
 DEPENDS =3D "zlib-native"
-PR =3D "r1"
+PR =3D "r2"
+
+SRC_URI +=3D "file://curl-7.18.1-CVE-2009-2417.patch;patch=3D1;pnum=3D0"
=20
 do_stage () {
 	autotools_stage_all
diff --git a/recipes/curl/curl-sdk_7.18.2.bb b/recipes/curl/curl-sdk_7.18.2=
.bb
index 35b0d88..8c667fa 100644
--- a/recipes/curl/curl-sdk_7.18.2.bb
+++ b/recipes/curl/curl-sdk_7.18.2.bb
@@ -1,7 +1,9 @@
 require curl-common.inc
 inherit sdk
 DEPENDS =3D "zlib-sdk"
-PR =3D "r1"
+PR =3D "r2"
+
+SRC_URI +=3D "file://curl-7.18.1-CVE-2009-2417.patch;patch=3D1;pnum=3D0"
=20
 do_stage () {
         install -d ${STAGING_INCDIR}/curl
diff --git a/recipes/curl/curl_7.18.2.bb b/recipes/curl/curl_7.18.2.bb
index 3de6da4..2d32f6b 100644
--- a/recipes/curl/curl_7.18.2.bb
+++ b/recipes/curl/curl_7.18.2.bb
@@ -1,4 +1,6 @@
 require curl-common.inc
 require curl-target.inc
=20
-PR =3D "r1"
+SRC_URI +=3D "file://curl-7.18.1-CVE-2009-2417.patch;patch=3D1;pnum=3D0"
+
+PR =3D "r2"
diff --git a/recipes/curl/curl_7.19.5.bb b/recipes/curl/curl_7.19.5.bb
index b5b6182..61914e1 100644
--- a/recipes/curl/curl_7.19.5.bb
+++ b/recipes/curl/curl_7.19.5.bb
@@ -2,5 +2,6 @@ require curl-common.inc
 require curl-target.inc
=20
 SRC_URI +=3D "file://off_t_abi_fix.patch;patch=3D1;pnum=3D0 \
-            file://curl-add_all_algorithms.patch;patch=3D1"
-PR =3D "r1"
+            file://curl-add_all_algorithms.patch;patch=3D1 \
+            file://curl-7.19.5-CVE-2009-2417.patch;patch=3D1;pnum=3D0"
+PR =3D "r2"
diff --git a/recipes/curl/curl_7.19.6.bb b/recipes/curl/curl_7.19.6.bb
new file mode 100644
index 0000000..df83fe8
--- /dev/null
+++ b/recipes/curl/curl_7.19.6.bb
@@ -0,0 +1,5 @@
+require curl-common.inc
+require curl-target.inc
+
+SRC_URI +=3D "file://off_t_abi_fix.patch;patch=3D1;pnum=3D0"
+PR =3D "r0"
diff --git a/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch b/recipes/c=
url/files/curl-7.18.1-CVE-2009-2417.patch
new file mode 100644
index 0000000..e7c24c0
--- /dev/null
+++ b/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch
@@ -0,0 +1,83 @@
+---
+ lib/ssluse.c |   40 +++++++++++++++++++++++++++-------------
+ 1 file changed, 27 insertions(+), 13 deletions(-)
+
+--- lib/ssluse.c.orig
++++ lib/ssluse.c
+@@ -1061,7 +1061,7 @@ static CURLcode verifyhost(struct connec
+       if(check->type =3D=3D target) {
+         /* get data and length */
+         const char *altptr =3D (char *)ASN1_STRING_data(check->d.ia5);
+-        int altlen;
++        size_t altlen =3D (size_t) ASN1_STRING_length(check->d.ia5);
+=20
+         switch(target) {
+         case GEN_DNS: /* name/pattern comparison */
+@@ -1075,14 +1075,16 @@ static CURLcode verifyhost(struct connec
+              "I checked the 0.9.6 and 0.9.8 sources before my patch and
+              it always 0-terminates an IA5String."
+           */
+-          if(cert_hostcheck(altptr, conn->host.name))
++          if((altlen =3D=3D strlen(altptr)) &&
++             /* if this isn't true, there was an embedded zero in the nam=
e
++                string and we cannot match it. */
++             cert_hostcheck(altptr, conn->host.name))
+             matched =3D TRUE;
+           break;
+=20
+         case GEN_IPADD: /* IP address comparison */
+           /* compare alternative IP address if the data chunk is the same=
 size
+              our server IP address is */
+-          altlen =3D ASN1_STRING_length(check->d.ia5);
+           if((altlen =3D=3D addrlen) && !memcmp(altptr, &addr, altlen))
+             matched =3D TRUE;
+           break;
+@@ -1122,18 +1124,27 @@ static CURLcode verifyhost(struct connec
+          string manually to avoid the problem. This code can be made
+          conditional in the future when OpenSSL has been fixed. Work-arou=
nd
+          brought by Alexis S. L. Carvalho. */
+-      if(tmp && ASN1_STRING_type(tmp) =3D=3D V_ASN1_UTF8STRING) {
+-        j =3D ASN1_STRING_length(tmp);
+-        if(j >=3D 0) {
+-          peer_CN =3D OPENSSL_malloc(j+1);
+-          if(peer_CN) {
+-            memcpy(peer_CN, ASN1_STRING_data(tmp), j);
+-            peer_CN[j] =3D '\0';
++      if(tmp) {
++        if(ASN1_STRING_type(tmp) =3D=3D V_ASN1_UTF8STRING) {
++          j =3D ASN1_STRING_length(tmp);
++          if(j >=3D 0) {
++            peer_CN =3D OPENSSL_malloc(j+1);
++            if(peer_CN) {
++              memcpy(peer_CN, ASN1_STRING_data(tmp), j);
++              peer_CN[j] =3D '\0';
++            }
+           }
+         }
++        else /* not a UTF8 name */
++          j =3D ASN1_STRING_to_UTF8(&peer_CN, tmp);
++
++        if(peer_CN && ((int)strlen((char *)peer_CN) !=3D j)) {
++          /* there was a terminating zero before the end of string, this
++             cannot match and we return failure! */
++          failf(data, "SSL: illegal cert name field");
++          res =3D CURLE_PEER_FAILED_VERIFICATION;
++        }
+       }
+-      else /* not a UTF8 name */
+-        j =3D ASN1_STRING_to_UTF8(&peer_CN, tmp);
+     }
+=20
+     if(peer_CN =3D=3D nulstr)
+@@ -1151,7 +1162,10 @@ static CURLcode verifyhost(struct connec
+     }
+ #endif /* CURL_DOES_CONVERSIONS */
+=20
+-    if(!peer_CN) {
++    if(res)
++      /* error already detected, pass through */
++      ;
++    else if(!peer_CN) {
+       failf(data,
+             "SSL: unable to obtain common name from peer certificate");
+       return CURLE_PEER_FAILED_VERIFICATION;
diff --git a/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch b/recipes/c=
url/files/curl-7.19.5-CVE-2009-2417.patch
new file mode 100644
index 0000000..f64232c
--- /dev/null
+++ b/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch
@@ -0,0 +1,80 @@
+--- lib/ssluse.c-7.19.5	2009-08-03 16:01:58.000000000 +0200
++++ lib/ssluse.c	2009-08-03 16:07:17.000000000 +0200
+@@ -1092,7 +1092,8 @@
+       if(check->type =3D=3D target) {
+         /* get data and length */
+         const char *altptr =3D (char *)ASN1_STRING_data(check->d.ia5);
+-        size_t altlen;
++        size_t altlen =3D (size_t) ASN1_STRING_length(check->d.ia5);
++
+=20
+         switch(target) {
+         case GEN_DNS: /* name/pattern comparison */
+@@ -1106,14 +1107,16 @@
+              "I checked the 0.9.6 and 0.9.8 sources before my patch and
+              it always 0-terminates an IA5String."
+           */
+-          if(cert_hostcheck(altptr, conn->host.name))
++          if((altlen =3D=3D strlen(altptr)) &&
++             /* if this isn't true, there was an embedded zero in the nam=
e
++                string and we cannot match it. */
++             cert_hostcheck(altptr, conn->host.name))
+             matched =3D TRUE;
+           break;
+=20
+         case GEN_IPADD: /* IP address comparison */
+           /* compare alternative IP address if the data chunk is the same=
 size
+              our server IP address is */
+-          altlen =3D (size_t) ASN1_STRING_length(check->d.ia5);
+           if((altlen =3D=3D addrlen) && !memcmp(altptr, &addr, altlen))
+             matched =3D TRUE;
+           break;
+@@ -1153,18 +1156,27 @@
+          string manually to avoid the problem. This code can be made
+          conditional in the future when OpenSSL has been fixed. Work-arou=
nd
+          brought by Alexis S. L. Carvalho. */
+-      if(tmp && ASN1_STRING_type(tmp) =3D=3D V_ASN1_UTF8STRING) {
+-        j =3D ASN1_STRING_length(tmp);
+-        if(j >=3D 0) {
+-          peer_CN =3D OPENSSL_malloc(j+1);
+-          if(peer_CN) {
+-            memcpy(peer_CN, ASN1_STRING_data(tmp), j);
+-            peer_CN[j] =3D '\0';
++      if(tmp) {
++        if(ASN1_STRING_type(tmp) =3D=3D V_ASN1_UTF8STRING) {
++          j =3D ASN1_STRING_length(tmp);
++          if(j >=3D 0) {
++            peer_CN =3D OPENSSL_malloc(j+1);
++            if(peer_CN) {
++              memcpy(peer_CN, ASN1_STRING_data(tmp), j);
++              peer_CN[j] =3D '\0';
++            }
+           }
+         }
++        else /* not a UTF8 name */
++          j =3D ASN1_STRING_to_UTF8(&peer_CN, tmp);
++
++        if(peer_CN && ((int)strlen((char *)peer_CN) !=3D j)) {
++          /* there was a terminating zero before the end of string, this
++             cannot match and we return failure! */
++          failf(data, "SSL: illegal cert name field");
++          res =3D CURLE_PEER_FAILED_VERIFICATION;
++        }
+       }
+-      else /* not a UTF8 name */
+-        j =3D ASN1_STRING_to_UTF8(&peer_CN, tmp);
+     }
+=20
+     if(peer_CN =3D=3D nulstr)
+@@ -1182,7 +1194,10 @@
+     }
+ #endif /* CURL_DOES_CONVERSIONS */
+=20
+-    if(!peer_CN) {
++    if(res)
++      /* error already detected, pass through */
++      ;
++    else if(!peer_CN) {
+       failf(data,
+             "SSL: unable to obtain common name from peer certificate");
+       return CURLE_PEER_FAILED_VERIFICATION;

--sdtB3X0nJg68CQEu--

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqCkYYACgkQezjnobFOgrFBLQCfcWxnXC3PYEZs2vUvQWoenaqQ
HoQAoKzOET92JCY5SPUTfSmBvo1gZHfk
=3it+
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
