Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P8AQb-0007o3-7F for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 13:32:26 +0200
Received: from f053043130.adsl.alicedsl.de ([78.53.43.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P8AQ5-00026d-2A for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 11:31:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 13:31:51 +0200
Message-ID: <1287487911.4030.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] usermanual: update to new style staging
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
X-List-Received-Date: Tue, 19 Oct 2010 11:32:26 -0000
X-Groupsio-MsgNum: 25128
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1RMW9Hw9dWwlAjrV4QfI"

--=-1RMW9Hw9dWwlAjrV4QfI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 19 Oct 2010 13:18:27 +0200

Take a look at [1].

[1] http://wiki.openembedded.org/index.php/Legacy_staging

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Dear OE folks,


this patch is probably a RFC, since I am no native speaker and also do
not know much about this topic. Could you please comment on this topic.
In my opinion reference to legacy staging should be removed from the
manual since most packages have been converted already to new style
staging.


Thanks,

Paul
---
 docs/usermanual/chapters/recipes.xml       |   31 +++++++++++++++++++++---=
---
 docs/usermanual/chapters/usage.xml         |   11 +--------
 docs/usermanual/reference/dirs_staging.xml |   16 ++++++--------
 3 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapter=
s/recipes.xml
index acb0705..0c84179 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -883,14 +883,31 @@ S =3D "${WORKDIR}/widgets"</screen></para>
       libraries and headers.</para>
=20
       <para>Making the libraries, headers and binaries available for use b=
y
-      other recipes on the host is called staging and is performed by the
-      <emphasis>stage</emphasis> task in the recipe. Any recipes that cont=
ain
-      items that are required to build other packages should have a
-      <emphasis>stage</emphasis> task to make sure the items are all corre=
ctly
+      other recipes on the host is called staging and is performed automat=
ically
+      derived from task <emphasis>install</emphasis>. Any recipes that con=
tain
+      items that are required additionally to build other packages should =
have a
+      <emphasis>install_append</emphasis> task to make sure the items are =
all correctly
       placed into the staging area. The following example from clamav show=
s the
-      clamav library and header being placed into the staging area:<screen=
>do_stage () {
-        oe_libinstall -a -so libclamav ${STAGING_LIBDIR}
-        install -m 0644 libclamav/clamav.h ${STAGING_INCDIR}
+      clamav library and header being placed into the staging area:<screen=
>do_install_append() {
+        install -m 0755 -d ${D}${sysconfdir}/default/volatiles \
+                           ${D}${sysconfdir}/init.d ${D}${docdir}/clamav
+
+        # Save the installed clamd.conf in the doc dir and then install ou=
r new one
+        install -m 0755 ${D}${sysconfdir}/clamd.conf ${D}${docdir}/clamav/=
clamd.conf.example
+        install -m 0755 ${WORKDIR}/clamd.conf ${D}${sysconfdir}/clamd.conf
+
+        # Save the installed freshclam.conf in the doc dir and then instal=
l our new one
+        install -m 0755 ${D}${sysconfdir}/freshclam.conf ${D}${docdir}/cla=
mav/freshclam.conf.example
+
+        # Install our config files and init scripts
+        install -m 0755 ${WORKDIR}/freshclam.conf ${D}${sysconfdir}/freshc=
lam.conf
+        install -m 0755 ${WORKDIR}/clamav-daemon.init ${D}${sysconfdir}/in=
it.d/clamav-daemon
+        install -m 0755 ${WORKDIR}/clamav-freshclam.init ${D}${sysconfdir}=
/init.d/clamav-freshclam
+
+        # We need some /var directories
+        for i in 03_clamav-daemon 03_clamav-freshclam 03_clamav-data; do
+          install -m 0644 ${WORKDIR}/volatiles.$i ${D}${sysconfdir}/defaul=
t/volatiles/$i
+        done
 }</screen></para>
=20
       <para>The following from the p3scan recipe shows the path to the cla=
mav
diff --git a/docs/usermanual/chapters/usage.xml b/docs/usermanual/chapters/=
usage.xml
index 9703e36..698c374 100644
--- a/docs/usermanual/chapters/usage.xml
+++ b/docs/usermanual/chapters/usage.xml
@@ -228,15 +228,8 @@ tmp/rootfs/proc
 tmp/rootfs/etc =20
 tmp/rootfs/home=20
 tmp/rootfs/tmp =20
-tmp/staging    =20
-tmp/staging/man=20
-tmp/staging/x86_64-linux
-tmp/staging/pkgdata
-tmp/staging/pkgmaps
-tmp/staging/var
-tmp/staging/sh4-linux
-tmp/staging/local
-tmp/staging/etc =20
+tmp/sysroots
+tmp/pkgdata
 tmp/deploy
 tmp/deploy/addons
 tmp/deploy/ipk  =20
diff --git a/docs/usermanual/reference/dirs_staging.xml b/docs/usermanual/r=
eference/dirs_staging.xml
index 25f3685..4d0964f 100644
--- a/docs/usermanual/reference/dirs_staging.xml
+++ b/docs/usermanual/reference/dirs_staging.xml
@@ -28,19 +28,17 @@
     </listitem>
=20
     <listitem>
-      <para>In the <emphasis>stage</emphasis> task for libraries to specif=
y
-      where to install the headers and libraries.</para>
+      <para>In the <emphasis>install_append</emphasis> task for libraries =
to specify
+      where to install the headers and libraries if not done automatically=
.</para>
     </listitem>
   </orderedlist>
=20
   <para>The following example from libpcre shows the installation of the
   libraries and headers from the package into the staging area. Note the u=
se
   of the <emphasis>oe_libinstall</emphasis> helper function for installati=
on
-  of the libraries:<screen>do_stage () {
-    oe_libinstall -a -so libpcre ${STAGING_LIBDIR}
-    oe_libinstall -a -so libpcreposix ${STAGING_LIBDIR}
-    install -m 0644 pcre.h ${STAGING_INCDIR}/
-    install -m 0644 pcreposix.h ${STAGING_INCDIR}/
+  of the libraries:<screen>do_install_append () {
+    install -d ${STAGING_BINDIR}
+    install -m 0755 ${D}${bindir}/pcre-config ${STAGING_BINDIR}/
 }</screen></para>
=20
   <para>The following example from the flac recipe shows the location of t=
he
@@ -73,7 +71,7 @@
         <row>
           <entry>STAGING_DIR</entry>
=20
-          <entry>${TMPDIR}/staging</entry>
+          <entry>${TMPDIR}/sysroots</entry>
         </row>
=20
         <row>
@@ -166,4 +164,4 @@
   <para></para>
=20
   <para></para>
-</section>
\ No newline at end of file
+</section>
--=20
1.7.2.3


--=-1RMW9Hw9dWwlAjrV4QfI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky9gacACgkQPX1aK2wOHVjqpACgiRpkjJj0OEJeHjBgZtzrpgv+
MUcAnA+4SUaEjQVGOLIt07DtT2cq7CDQ
=xhEX
-----END PGP SIGNATURE-----

--=-1RMW9Hw9dWwlAjrV4QfI--
