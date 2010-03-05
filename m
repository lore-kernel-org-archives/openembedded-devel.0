Received: from mail-yx0-f194.google.com ([209.85.210.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <deathstalker@gmail.com>) id 1NnavO-0002jj-Os
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 18:03:02 +0100
Received: by yxe32 with SMTP id 32so4999347yxe.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 09:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=veu1U0RuPoL9Oviif0l1e3y1BELRIEG3A1G2dOFSIl8=;
	b=raR43eyQokaPJG7eGF/DOdLhcdOQ1d9mH08Pc0vQp9cB5r8mfxhrhrg+gh9JN5PFaV
	Gj5G6laBo63zr3Dl3ZPIKO2j60AnkDXp1C0h0gqjk4Wdot9pXzr9Y5EVavzRROIWSXha
	jMMHPCoGjuGxGjsSZlyCfyWJ9RQk5MboXCKKU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PCJ+Ef4lp46J07YWm4VwpzupQGZA9pCJ0bcdlIvS4PwLz5us9qpV9qTiJX73XzLz/r
	0V4qfB637z7nHU2GbFb6+sC3PfCKuGR/kulJZSVrIq+1pZF9AFi3o6VsbaUdE0cd3MCM
	Gk22ruG6x0h8DPYuTLendEAsRvgLT2qpWz0t4=
MIME-Version: 1.0
Received: by 10.91.49.5 with SMTP id b5mr1664786agk.82.1267808398203; Fri, 05 
	Mar 2010 08:59:58 -0800 (PST)
In-Reply-To: <E1NnZxZ-0006br-Jk@melo.openembedded.org>
References: <E1NnZxZ-0006br-Jk@melo.openembedded.org>
Date: Fri, 5 Mar 2010 10:59:57 -0600
Message-ID: <de63f7891003050859j4835ec78od6a27f818aff710a@mail.gmail.com>
From: James Lancaster <deathstalker@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.194
X-SA-Exim-Mail-From: deathstalker@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Marcin Juszkiewicz : gnutls: added 2.8.5, adapted to 	new staging
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
X-List-Received-Date: Fri, 05 Mar 2010 17:03:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm having this fail, it appears to be a problem with install-info
(ask if you want the whole log):

 install-info --info-dir=3D'/home/james/OE/angstrom-dev/work/armv5te-angstr=
om-linux-gnueabi/gnutls-2.8.5-r0/image/usr/share/info'
'/home/james/OE/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/gnutls-2.8=
.5-r0/image/usr/share/info/gnutls.info'
This is not dpkg install-info anymore, but GNU install-info
See the man page for ginstall-info for command line argument
make[4]: Leaving directory
`/home/james/OE/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/gnutls-2.8=
.5-r0/gnutls-2.8.5/doc'

James


On Fri, Mar 5, 2010 at 10:01 AM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: c7bf984e0df86fb5c935edafdcd42b736c276f26
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3Dc7bf984e0df86fb5c935edafdcd42b736c276f26
>
> Author: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> Date: =A0 Fri Mar =A05 14:44:03 2010 +0100
>
> gnutls: added 2.8.5, adapted to new staging
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>
> ---
>
> =A0recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch =A0 | =A0149 ++++++++=
++++++++++++
> =A0.../gnutls-2.8.5/gnutls-replace-siginterrupt.patch | =A0 51 +++++++
> =A0recipes/gnutls/gnutls.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 19 +--
> =A0recipes/gnutls/gnutls_1.4.5.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A09 +-
> =A0recipes/gnutls/gnutls_1.6.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A09 +-
> =A0recipes/gnutls/gnutls_2.4.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A09 +-
> =A0recipes/gnutls/gnutls_2.8.5.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 17 +++
> =A07 files changed, 249 insertions(+), 14 deletions(-)
>
> diff --git a/recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch b/recipes/g=
nutls/gnutls-2.8.5/gnutls-openssl.patch
> new file mode 100644
> index 0000000..596bd01
> --- /dev/null
> +++ b/recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch
> @@ -0,0 +1,149 @@
> +---
> + libextra/gnutls_openssl.c =A0 =A0 =A0 =A0 =A0| =A0 58 +++++++++++++++++=
++++++++++++++++++++
> + libextra/includes/gnutls/openssl.h | =A0 =A05 +++
> + 2 files changed, 63 insertions(+)
> +
> +--- gnutls-2.8.5.orig/libextra/gnutls_openssl.c
> ++++ gnutls-2.8.5/libextra/gnutls_openssl.c
> +@@ -256,16 +256,21 @@ SSL_new (SSL_CTX * ctx)
> + =A0 ssl->options =3D ctx->options;
> +
> + =A0 ssl->rfd =3D (gnutls_transport_ptr_t) - 1;
> + =A0 ssl->wfd =3D (gnutls_transport_ptr_t) - 1;
> +
> ++ =A0ssl->ssl_peek_buffer =3D NULL;
> ++ =A0ssl->ssl_peek_buffer_size =3D ssl->ssl_peek_avail =3D 0;
> ++
> + =A0 return ssl;
> + }
> +
> + void
> + SSL_free (SSL * ssl)
> + {
> ++ =A0if (ssl->ssl_peek_buffer)
> ++ =A0 =A0free(ssl->ssl_peek_buffer);
> + =A0 gnutls_certificate_free_credentials (ssl->gnutls_cred);
> + =A0 gnutls_deinit (ssl->gnutls_state);
> + =A0 free (ssl);
> + }
> +
> +@@ -285,10 +290,11 @@ SSL_get_error (SSL * ssl, int ret)
> +
> + int
> + SSL_set_fd (SSL * ssl, int fd)
> + {
> + =A0 gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINTER =
(fd));
> ++ =A0ssl->rfd =3D ssl->wfd =3D fd;
> + =A0 return 1;
> + }
> +
> + int
> + SSL_set_rfd (SSL * ssl, int fd)
> +@@ -310,10 +316,21 @@ SSL_set_wfd (SSL * ssl, int fd)
> + =A0 =A0 gnutls_transport_set_ptr2 (ssl->gnutls_state, ssl->rfd, ssl->wf=
d);
> +
> + =A0 return 1;
> + }
> +
> ++int SSL_get_rfd(SSL *ssl)
> ++{
> ++ =A0return ssl->rfd;
> ++}
> ++
> ++int SSL_get_wfd(SSL *ssl)
> ++{
> ++ =A0return ssl->wfd;
> ++}
> ++
> ++
> + void
> + SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
> + {
> + =A0 gnutls_transport_set_ptr2 (ssl->gnutls_state, rbio->fd, wbio->fd);
> + =A0 /* =A0 =A0free(BIO); ? */
> +@@ -325,10 +342,12 @@ SSL_set_connect_state (SSL * ssl)
> + }
> +
> + int
> + SSL_pending (SSL * ssl)
> + {
> ++ =A0if (ssl->ssl_peek_avail)
> ++ =A0 =A0return ssl->ssl_peek_avail;
> + =A0 return gnutls_record_check_pending (ssl->gnutls_state);
> + }
> +
> + void
> + SSL_set_verify (SSL * ssl, int verify_mode,
> +@@ -480,15 +499,54 @@ SSL_shutdown (SSL * ssl)
> +
> + =A0 /* FIXME */
> + =A0 return 1;
> + }
> +
> ++int SSL_peek(SSL *ssl, void *buf, int len)
> ++{
> ++ =A0if (len > ssl->ssl_peek_buffer_size) {
> ++ =A0 =A0ssl->ssl_peek_buffer =3D realloc (ssl->ssl_peek_buffer, len);
> ++ =A0 =A0ssl->ssl_peek_buffer_size =3D len;
> ++ =A0}
> ++
> ++ =A0if (ssl->ssl_peek_avail =3D=3D 0) {
> ++
> ++ =A0 =A0int ret;
> ++
> ++ =A0 =A0ret =3D gnutls_record_recv(ssl->gnutls_state, ssl->ssl_peek_buf=
fer, len);
> ++ =A0 =A0ssl->last_error =3D ret;
> ++
> ++ =A0 =A0if (ret > 0)
> ++ =A0 =A0 =A0ssl->ssl_peek_avail +=3D ret;
> ++ =A0}
> ++
> ++ =A0if (len > ssl->ssl_peek_avail)
> ++ =A0 =A0len =3D ssl->ssl_peek_avail;
> ++
> ++ =A0memcpy (buf, ssl->ssl_peek_buffer, len);
> ++
> ++ =A0return len;
> ++}
> ++
> + int
> + SSL_read (SSL * ssl, void *buf, int len)
> + {
> + =A0 int ret;
> +
> ++ =A0if (ssl->ssl_peek_avail) {
> ++ =A0 =A0int n =3D (ssl->ssl_peek_avail > len) ? len : ssl->ssl_peek_ava=
il;
> ++
> ++ =A0 =A0memcpy (buf, ssl->ssl_peek_buffer, n);
> ++
> ++ =A0 =A0if (ssl->ssl_peek_avail > n)
> ++ =A0 =A0 =A0memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffer + n, ss=
l->ssl_peek_avail - n);
> ++
> ++ =A0 =A0ssl->ssl_peek_avail -=3D n;
> ++
> ++ =A0 =A0return n;
> ++ =A0}
> ++
> + =A0 ret =3D gnutls_record_recv (ssl->gnutls_state, buf, len);
> + =A0 ssl->last_error =3D ret;
> +
> + =A0 if (ret < 0)
> + =A0 =A0 {
> +--- gnutls-2.8.5.orig/libextra/includes/gnutls/openssl.h
> ++++ gnutls-2.8.5/libextra/includes/gnutls/openssl.h
> +@@ -162,10 +162,15 @@ extern "C"
> + =A0 =A0 int (*verify_callback) (int, X509_STORE_CTX *);
> + =A0 =A0 int verify_mode;
> +
> + =A0 =A0 gnutls_transport_ptr_t rfd;
> + =A0 =A0 gnutls_transport_ptr_t wfd;
> ++
> ++ =A0 =A0char *ssl_peek_buffer;
> ++ =A0 =A0size_t ssl_peek_buffer_size;
> ++ =A0 =A0size_t ssl_peek_avail;
> ++
> + =A0 };
> +
> + #define rbio gnutls_state
> +
> + =A0 typedef struct {
> diff --git a/recipes/gnutls/gnutls-2.8.5/gnutls-replace-siginterrupt.patc=
h b/recipes/gnutls/gnutls-2.8.5/gnutls-replace-siginterrupt.patch
> new file mode 100644
> index 0000000..b34930f
> --- /dev/null
> +++ b/recipes/gnutls/gnutls-2.8.5/gnutls-replace-siginterrupt.patch
> @@ -0,0 +1,51 @@
> +---
> + src/tests.c | =A0 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +--- gnutls-2.8.5.orig/src/tests.c
> ++++ gnutls-2.8.5/src/tests.c
> +@@ -491,10 +491,11 @@ test_bye (gnutls_session_t session)
> + =A0 int ret;
> + =A0 char data[20];
> + =A0 int old, secs =3D 6;
> +
> + #ifndef _WIN32
> ++ =A0struct sigaction act;
> + =A0 signal (SIGALRM, got_alarm);
> + #endif
> +
> + =A0 ADD_ALL_CIPHERS (session);
> + =A0 ADD_ALL_COMP (session);
> +@@ -511,11 +512,13 @@ test_bye (gnutls_session_t session)
> + =A0 ret =3D gnutls_bye (session, GNUTLS_SHUT_WR);
> + =A0 if (ret < 0)
> + =A0 =A0 return TEST_FAILED;
> +
> + #ifndef _WIN32
> +- =A0old =3D siginterrupt (SIGALRM, 1);
> ++ =A0(void) sigaction(SIGALRM, NULL, &act);
> ++ =A0act.sa_flags &=3D ~SA_RESTART;
> ++ =A0old =3D sigaction(SIGALRM, &act, NULL);
> + =A0 alarm (secs);
> + #else
> + =A0 setsockopt ((int) gnutls_transport_get_ptr (session), SOL_SOCKET,
> + =A0 =A0 =A0 =A0 =A0 =A0 SO_RCVTIMEO, (char *) &secs, sizeof (int));
> + #endif
> +@@ -525,11 +528,16 @@ test_bye (gnutls_session_t session)
> + =A0 =A0 =A0 ret =3D gnutls_record_recv (session, data, sizeof (data));
> + =A0 =A0 }
> + =A0 while (ret > 0);
> +
> + #ifndef _WIN32
> +- =A0siginterrupt (SIGALRM, old);
> ++ =A0(void) sigaction(SIGALRM, NULL, &act);
> ++ =A0if (old)
> ++ =A0 =A0act.sa_flags &=3D ~SA_RESTART;
> ++ =A0else
> ++ =A0 =A0act.sa_flags |=3D SA_RESTART;
> ++ =A0sigaction(SIGALRM, &act, NULL);
> + #else
> + =A0 if (WSAGetLastError () =3D=3D WSAETIMEDOUT ||
> + =A0 =A0 =A0 WSAGetLastError () =3D=3D WSAECONNABORTED)
> + =A0 =A0 alrm =3D 1;
> + #endif
> diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
> index 004161a..071e925 100644
> --- a/recipes/gnutls/gnutls.inc
> +++ b/recipes/gnutls/gnutls.inc
> @@ -1,23 +1,20 @@
> =A0DESCRIPTION =3D "GNU Transport Layer Security Library"
> =A0HOMEPAGE =3D "http://www.gnu.org/software/gnutls/"
> -DEPENDS =3D "zlib libgcrypt lzo guile-native"
> +DEPENDS =3D "zlib libgcrypt lzo guile-native gettext"
> =A0LICENSE =3D "LGPL"
>
> -SRC_URI =3D "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2"
> +SRC_URI =3D "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=
=3Dgnutls"
>
> =A0inherit autotools binconfig pkgconfig
>
> -EXTRA_OECONF =3D "--with-included-opencdk --with-included-libtasn1"
> +INC_PR =3D "r7"
>
> -do_stage() {
> - =A0 =A0oe_libinstall -C lib/.libs -so -a libgnutls ${STAGING_LIBDIR}
> - =A0 =A0oe_libinstall -C libextra/.libs -so -a libgnutls-extra ${STAGING=
_LIBDIR}
> - =A0 =A0oe_libinstall -C libextra/.libs -so -a libgnutls-openssl ${STAGI=
NG_LIBDIR}
> - =A0 =A0autotools_stage_includes
> +EXTRA_OECONF =3D "--with-included-opencdk --with-included-libtasn1"
> +do_install_append() {
>
> - =A0 =A0install -d ${STAGING_DATADIR}/aclocal
> - =A0 =A0cp ${S}/lib/libgnutls.m4 ${STAGING_DATADIR}/aclocal/
> - =A0 =A0cp ${S}/libextra/libgnutls-extra.m4 ${STAGING_DATADIR}/aclocal/
> + =A0 =A0install -d ${D}${datadir}/aclocal
> + =A0 =A0install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
> + =A0 =A0install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/=
aclocal/
> =A0}
>
> =A0PACKAGES =3D+ "${PN}-openssl ${PN}-extra ${PN}-bin ${PN}-xx"
> diff --git a/recipes/gnutls/gnutls_1.4.5.bb b/recipes/gnutls/gnutls_1.4.5=
.bb
> index a5e5873..bda7994 100644
> --- a/recipes/gnutls/gnutls_1.4.5.bb
> +++ b/recipes/gnutls/gnutls_1.4.5.bb
> @@ -5,4 +5,11 @@ do_configure_prepend() {
> =A0 =A0 sed -i s,gcrypt,libgcrypt, lib/gnutls.pc.in
> =A0}
>
> -PR =3D "r3"
> +PR =3D "${INC_PR}.0"
> +
> +do_install_append() {
> +
> + =A0 =A0install -d ${D}${datadir}/aclocal
> + =A0 =A0install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
> + =A0 =A0install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/=
aclocal/
> +}
> diff --git a/recipes/gnutls/gnutls_1.6.3.bb b/recipes/gnutls/gnutls_1.6.3=
.bb
> index 7a89835..6b7c24a 100644
> --- a/recipes/gnutls/gnutls_1.6.3.bb
> +++ b/recipes/gnutls/gnutls_1.6.3.bb
> @@ -11,4 +11,11 @@ do_configure_prepend() {
> =A0 =A0 sed -i s,gcrypt,libgcrypt, lib/gnutls.pc.in
> =A0}
>
> -PR =3D "r6"
> +PR =3D "${INC_PR}.0"
> +
> +do_install_append() {
> +
> + =A0 =A0install -d ${D}${datadir}/aclocal
> + =A0 =A0install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
> + =A0 =A0install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/=
aclocal/
> +}
> diff --git a/recipes/gnutls/gnutls_2.4.2.bb b/recipes/gnutls/gnutls_2.4.2=
.bb
> index d8266c2..0748887 100644
> --- a/recipes/gnutls/gnutls_2.4.2.bb
> +++ b/recipes/gnutls/gnutls_2.4.2.bb
> @@ -8,4 +8,11 @@ SRC_URI +=3D "\
> =A0 =A0 =A0 =A0file://gnutls-replace-siginterrupt.patch;patch=3D1 \
> =A0 =A0 =A0 =A0"
>
> -PR =3D "r4"
> +PR =3D "${INC_PR}.0"
> +
> +do_install_append() {
> +
> + =A0 =A0install -d ${D}${datadir}/aclocal
> + =A0 =A0install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
> + =A0 =A0install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/=
aclocal/
> +}
> diff --git a/recipes/gnutls/gnutls_2.8.5.bb b/recipes/gnutls/gnutls_2.8.5=
.bb
> new file mode 100644
> index 0000000..ec8a118
> --- /dev/null
> +++ b/recipes/gnutls/gnutls_2.8.5.bb
> @@ -0,0 +1,17 @@
> +require gnutls.inc
> +LICENSE_${PN}-extra =3D "GPLv3"
> +
> +SRC_URI +=3D "\
> + =A0 =A0 =A0 file://gnutls-openssl.patch;patch=3D1 \
> + =A0 =A0 =A0 file://gnutls-replace-siginterrupt.patch;patch=3D1 \
> + =A0 =A0 =A0 "
> +
> +EXTRA_OECONF +=3D " --without-libgcrypt-prefix "
> +
> +do_configure_prepend() {
> +
> + =A0 =A0cd ${S} && rm -rf m4/ aclocal.m4 lib/m4/libtool.m4 lib/m4/lt*m4
> +}
> +
> +SRC_URI[gnutls.md5sum] =3D "e3b2788b79bfc82acbe717e3c54d4e92"
> +SRC_URI[gnutls.sha256sum] =3D "9249c29df71551e302e0186f4e1876dd6cc4c6cf2=
974b432c22525dde815cae8"
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


