Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nndji-0006se-Iv for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 21:03:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nndgw-0006LC-AU for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 21:00:10 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 21:00:10 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 21:00:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): Connection refused
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 05 Mar 2010 20:59:58 +0100
Message-ID: <hmrnrv$4oc$1@dough.gmane.org>
References: <E1NnZxZ-0006br-Jk@melo.openembedded.org>
	<de63f7891003050859j4835ec78od6a27f818aff710a@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <de63f7891003050859j4835ec78od6a27f818aff710a@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Marcin Juszkiewicz : gnutls: added 2.8.5, adapted to new staging
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
X-List-Received-Date: Fri, 05 Mar 2010 20:03:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-03-10 17:59, James Lancaster wrote:
> I'm having this fail, it appears to be a problem with install-info
> (ask if you want the whole log):
> 
>  install-info --info-dir='/home/james/OE/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/gnutls-2.8.5-r0/image/usr/share/info'
> '/home/james/OE/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/gnutls-2.8.5-r0/image/usr/share/info/gnutls.info'
> This is not dpkg install-info anymore, but GNU install-info
> See the man page for ginstall-info for command line argument
> make[4]: Leaving directory
> `/home/james/OE/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/gnutls-2.8.5-r0/gnutls-2.8.5/doc'

I haven't seen that problem, but there are more problems with 2.8.5:

* doesn't ship the .m4 the do_install_append looks for -> build breakage
* doesn't ship a binconfig file anymore -> build breakage for dependant
recipes

I don't have the time or motivation to update all gnutls dependants, so
for angstrom I locked down the version to 2.4.2.

regards,

Koen


> 
> James
> 
> 
> On Fri, Mar 5, 2010 at 10:01 AM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: c7bf984e0df86fb5c935edafdcd42b736c276f26
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=c7bf984e0df86fb5c935edafdcd42b736c276f26
>>
>> Author: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>> Date:   Fri Mar  5 14:44:03 2010 +0100
>>
>> gnutls: added 2.8.5, adapted to new staging
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>>
>> ---
>>
>>  recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch   |  149 ++++++++++++++++++++
>>  .../gnutls-2.8.5/gnutls-replace-siginterrupt.patch |   51 +++++++
>>  recipes/gnutls/gnutls.inc                          |   19 +--
>>  recipes/gnutls/gnutls_1.4.5.bb                     |    9 +-
>>  recipes/gnutls/gnutls_1.6.3.bb                     |    9 +-
>>  recipes/gnutls/gnutls_2.4.2.bb                     |    9 +-
>>  recipes/gnutls/gnutls_2.8.5.bb                     |   17 +++
>>  7 files changed, 249 insertions(+), 14 deletions(-)
>>
>> diff --git a/recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch b/recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch
>> new file mode 100644
>> index 0000000..596bd01
>> --- /dev/null
>> +++ b/recipes/gnutls/gnutls-2.8.5/gnutls-openssl.patch
>> @@ -0,0 +1,149 @@
>> +---
>> + libextra/gnutls_openssl.c          |   58 +++++++++++++++++++++++++++++++++++++
>> + libextra/includes/gnutls/openssl.h |    5 +++
>> + 2 files changed, 63 insertions(+)
>> +
>> +--- gnutls-2.8.5.orig/libextra/gnutls_openssl.c
>> ++++ gnutls-2.8.5/libextra/gnutls_openssl.c
>> +@@ -256,16 +256,21 @@ SSL_new (SSL_CTX * ctx)
>> +   ssl->options = ctx->options;
>> +
>> +   ssl->rfd = (gnutls_transport_ptr_t) - 1;
>> +   ssl->wfd = (gnutls_transport_ptr_t) - 1;
>> +
>> ++  ssl->ssl_peek_buffer = NULL;
>> ++  ssl->ssl_peek_buffer_size = ssl->ssl_peek_avail = 0;
>> ++
>> +   return ssl;
>> + }
>> +
>> + void
>> + SSL_free (SSL * ssl)
>> + {
>> ++  if (ssl->ssl_peek_buffer)
>> ++    free(ssl->ssl_peek_buffer);
>> +   gnutls_certificate_free_credentials (ssl->gnutls_cred);
>> +   gnutls_deinit (ssl->gnutls_state);
>> +   free (ssl);
>> + }
>> +
>> +@@ -285,10 +290,11 @@ SSL_get_error (SSL * ssl, int ret)
>> +
>> + int
>> + SSL_set_fd (SSL * ssl, int fd)
>> + {
>> +   gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINTER (fd));
>> ++  ssl->rfd = ssl->wfd = fd;
>> +   return 1;
>> + }
>> +
>> + int
>> + SSL_set_rfd (SSL * ssl, int fd)
>> +@@ -310,10 +316,21 @@ SSL_set_wfd (SSL * ssl, int fd)
>> +     gnutls_transport_set_ptr2 (ssl->gnutls_state, ssl->rfd, ssl->wfd);
>> +
>> +   return 1;
>> + }
>> +
>> ++int SSL_get_rfd(SSL *ssl)
>> ++{
>> ++  return ssl->rfd;
>> ++}
>> ++
>> ++int SSL_get_wfd(SSL *ssl)
>> ++{
>> ++  return ssl->wfd;
>> ++}
>> ++
>> ++
>> + void
>> + SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
>> + {
>> +   gnutls_transport_set_ptr2 (ssl->gnutls_state, rbio->fd, wbio->fd);
>> +   /*    free(BIO); ? */
>> +@@ -325,10 +342,12 @@ SSL_set_connect_state (SSL * ssl)
>> + }
>> +
>> + int
>> + SSL_pending (SSL * ssl)
>> + {
>> ++  if (ssl->ssl_peek_avail)
>> ++    return ssl->ssl_peek_avail;
>> +   return gnutls_record_check_pending (ssl->gnutls_state);
>> + }
>> +
>> + void
>> + SSL_set_verify (SSL * ssl, int verify_mode,
>> +@@ -480,15 +499,54 @@ SSL_shutdown (SSL * ssl)
>> +
>> +   /* FIXME */
>> +   return 1;
>> + }
>> +
>> ++int SSL_peek(SSL *ssl, void *buf, int len)
>> ++{
>> ++  if (len > ssl->ssl_peek_buffer_size) {
>> ++    ssl->ssl_peek_buffer = realloc (ssl->ssl_peek_buffer, len);
>> ++    ssl->ssl_peek_buffer_size = len;
>> ++  }
>> ++
>> ++  if (ssl->ssl_peek_avail == 0) {
>> ++
>> ++    int ret;
>> ++
>> ++    ret = gnutls_record_recv(ssl->gnutls_state, ssl->ssl_peek_buffer, len);
>> ++    ssl->last_error = ret;
>> ++
>> ++    if (ret > 0)
>> ++      ssl->ssl_peek_avail += ret;
>> ++  }
>> ++
>> ++  if (len > ssl->ssl_peek_avail)
>> ++    len = ssl->ssl_peek_avail;
>> ++
>> ++  memcpy (buf, ssl->ssl_peek_buffer, len);
>> ++
>> ++  return len;
>> ++}
>> ++
>> + int
>> + SSL_read (SSL * ssl, void *buf, int len)
>> + {
>> +   int ret;
>> +
>> ++  if (ssl->ssl_peek_avail) {
>> ++    int n = (ssl->ssl_peek_avail > len) ? len : ssl->ssl_peek_avail;
>> ++
>> ++    memcpy (buf, ssl->ssl_peek_buffer, n);
>> ++
>> ++    if (ssl->ssl_peek_avail > n)
>> ++      memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffer + n, ssl->ssl_peek_avail - n);
>> ++
>> ++    ssl->ssl_peek_avail -= n;
>> ++
>> ++    return n;
>> ++  }
>> ++
>> +   ret = gnutls_record_recv (ssl->gnutls_state, buf, len);
>> +   ssl->last_error = ret;
>> +
>> +   if (ret < 0)
>> +     {
>> +--- gnutls-2.8.5.orig/libextra/includes/gnutls/openssl.h
>> ++++ gnutls-2.8.5/libextra/includes/gnutls/openssl.h
>> +@@ -162,10 +162,15 @@ extern "C"
>> +     int (*verify_callback) (int, X509_STORE_CTX *);
>> +     int verify_mode;
>> +
>> +     gnutls_transport_ptr_t rfd;
>> +     gnutls_transport_ptr_t wfd;
>> ++
>> ++    char *ssl_peek_buffer;
>> ++    size_t ssl_peek_buffer_size;
>> ++    size_t ssl_peek_avail;
>> ++
>> +   };
>> +
>> + #define rbio gnutls_state
>> +
>> +   typedef struct {
>> diff --git a/recipes/gnutls/gnutls-2.8.5/gnutls-replace-siginterrupt.patch b/recipes/gnutls/gnutls-2.8.5/gnutls-replace-siginterrupt.patch
>> new file mode 100644
>> index 0000000..b34930f
>> --- /dev/null
>> +++ b/recipes/gnutls/gnutls-2.8.5/gnutls-replace-siginterrupt.patch
>> @@ -0,0 +1,51 @@
>> +---
>> + src/tests.c |   12 ++++++++++--
>> + 1 file changed, 10 insertions(+), 2 deletions(-)
>> +
>> +--- gnutls-2.8.5.orig/src/tests.c
>> ++++ gnutls-2.8.5/src/tests.c
>> +@@ -491,10 +491,11 @@ test_bye (gnutls_session_t session)
>> +   int ret;
>> +   char data[20];
>> +   int old, secs = 6;
>> +
>> + #ifndef _WIN32
>> ++  struct sigaction act;
>> +   signal (SIGALRM, got_alarm);
>> + #endif
>> +
>> +   ADD_ALL_CIPHERS (session);
>> +   ADD_ALL_COMP (session);
>> +@@ -511,11 +512,13 @@ test_bye (gnutls_session_t session)
>> +   ret = gnutls_bye (session, GNUTLS_SHUT_WR);
>> +   if (ret < 0)
>> +     return TEST_FAILED;
>> +
>> + #ifndef _WIN32
>> +-  old = siginterrupt (SIGALRM, 1);
>> ++  (void) sigaction(SIGALRM, NULL, &act);
>> ++  act.sa_flags &= ~SA_RESTART;
>> ++  old = sigaction(SIGALRM, &act, NULL);
>> +   alarm (secs);
>> + #else
>> +   setsockopt ((int) gnutls_transport_get_ptr (session), SOL_SOCKET,
>> +             SO_RCVTIMEO, (char *) &secs, sizeof (int));
>> + #endif
>> +@@ -525,11 +528,16 @@ test_bye (gnutls_session_t session)
>> +       ret = gnutls_record_recv (session, data, sizeof (data));
>> +     }
>> +   while (ret > 0);
>> +
>> + #ifndef _WIN32
>> +-  siginterrupt (SIGALRM, old);
>> ++  (void) sigaction(SIGALRM, NULL, &act);
>> ++  if (old)
>> ++    act.sa_flags &= ~SA_RESTART;
>> ++  else
>> ++    act.sa_flags |= SA_RESTART;
>> ++  sigaction(SIGALRM, &act, NULL);
>> + #else
>> +   if (WSAGetLastError () == WSAETIMEDOUT ||
>> +       WSAGetLastError () == WSAECONNABORTED)
>> +     alrm = 1;
>> + #endif
>> diff --git a/recipes/gnutls/gnutls.inc b/recipes/gnutls/gnutls.inc
>> index 004161a..071e925 100644
>> --- a/recipes/gnutls/gnutls.inc
>> +++ b/recipes/gnutls/gnutls.inc
>> @@ -1,23 +1,20 @@
>>  DESCRIPTION = "GNU Transport Layer Security Library"
>>  HOMEPAGE = "http://www.gnu.org/software/gnutls/"
>> -DEPENDS = "zlib libgcrypt lzo guile-native"
>> +DEPENDS = "zlib libgcrypt lzo guile-native gettext"
>>  LICENSE = "LGPL"
>>
>> -SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2"
>> +SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=gnutls"
>>
>>  inherit autotools binconfig pkgconfig
>>
>> -EXTRA_OECONF = "--with-included-opencdk --with-included-libtasn1"
>> +INC_PR = "r7"
>>
>> -do_stage() {
>> -    oe_libinstall -C lib/.libs -so -a libgnutls ${STAGING_LIBDIR}
>> -    oe_libinstall -C libextra/.libs -so -a libgnutls-extra ${STAGING_LIBDIR}
>> -    oe_libinstall -C libextra/.libs -so -a libgnutls-openssl ${STAGING_LIBDIR}
>> -    autotools_stage_includes
>> +EXTRA_OECONF = "--with-included-opencdk --with-included-libtasn1"
>> +do_install_append() {
>>
>> -    install -d ${STAGING_DATADIR}/aclocal
>> -    cp ${S}/lib/libgnutls.m4 ${STAGING_DATADIR}/aclocal/
>> -    cp ${S}/libextra/libgnutls-extra.m4 ${STAGING_DATADIR}/aclocal/
>> +    install -d ${D}${datadir}/aclocal
>> +    install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
>> +    install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/aclocal/
>>  }
>>
>>  PACKAGES =+ "${PN}-openssl ${PN}-extra ${PN}-bin ${PN}-xx"
>> diff --git a/recipes/gnutls/gnutls_1.4.5.bb b/recipes/gnutls/gnutls_1.4.5.bb
>> index a5e5873..bda7994 100644
>> --- a/recipes/gnutls/gnutls_1.4.5.bb
>> +++ b/recipes/gnutls/gnutls_1.4.5.bb
>> @@ -5,4 +5,11 @@ do_configure_prepend() {
>>     sed -i s,gcrypt,libgcrypt, lib/gnutls.pc.in
>>  }
>>
>> -PR = "r3"
>> +PR = "${INC_PR}.0"
>> +
>> +do_install_append() {
>> +
>> +    install -d ${D}${datadir}/aclocal
>> +    install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
>> +    install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/aclocal/
>> +}
>> diff --git a/recipes/gnutls/gnutls_1.6.3.bb b/recipes/gnutls/gnutls_1.6.3.bb
>> index 7a89835..6b7c24a 100644
>> --- a/recipes/gnutls/gnutls_1.6.3.bb
>> +++ b/recipes/gnutls/gnutls_1.6.3.bb
>> @@ -11,4 +11,11 @@ do_configure_prepend() {
>>     sed -i s,gcrypt,libgcrypt, lib/gnutls.pc.in
>>  }
>>
>> -PR = "r6"
>> +PR = "${INC_PR}.0"
>> +
>> +do_install_append() {
>> +
>> +    install -d ${D}${datadir}/aclocal
>> +    install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
>> +    install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/aclocal/
>> +}
>> diff --git a/recipes/gnutls/gnutls_2.4.2.bb b/recipes/gnutls/gnutls_2.4.2.bb
>> index d8266c2..0748887 100644
>> --- a/recipes/gnutls/gnutls_2.4.2.bb
>> +++ b/recipes/gnutls/gnutls_2.4.2.bb
>> @@ -8,4 +8,11 @@ SRC_URI += "\
>>        file://gnutls-replace-siginterrupt.patch;patch=1 \
>>        "
>>
>> -PR = "r4"
>> +PR = "${INC_PR}.0"
>> +
>> +do_install_append() {
>> +
>> +    install -d ${D}${datadir}/aclocal
>> +    install -m 0644 ${S}/lib/libgnutls.m4 ${D}${datadir}/aclocal/
>> +    install -m 0644 ${S}/libextra/libgnutls-extra.m4 ${D}${datadir}/aclocal/
>> +}
>> diff --git a/recipes/gnutls/gnutls_2.8.5.bb b/recipes/gnutls/gnutls_2.8.5.bb
>> new file mode 100644
>> index 0000000..ec8a118
>> --- /dev/null
>> +++ b/recipes/gnutls/gnutls_2.8.5.bb
>> @@ -0,0 +1,17 @@
>> +require gnutls.inc
>> +LICENSE_${PN}-extra = "GPLv3"
>> +
>> +SRC_URI += "\
>> +       file://gnutls-openssl.patch;patch=1 \
>> +       file://gnutls-replace-siginterrupt.patch;patch=1 \
>> +       "
>> +
>> +EXTRA_OECONF += " --without-libgcrypt-prefix "
>> +
>> +do_configure_prepend() {
>> +
>> +    cd ${S} && rm -rf m4/ aclocal.m4 lib/m4/libtool.m4 lib/m4/lt*m4
>> +}
>> +
>> +SRC_URI[gnutls.md5sum] = "e3b2788b79bfc82acbe717e3c54d4e92"
>> +SRC_URI[gnutls.sha256sum] = "9249c29df71551e302e0186f4e1876dd6cc4c6cf2974b432c22525dde815cae8"
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLkWK+MkyGM64RGpERAoAbAJ9yYwVnzJnm78dZ07mwkNr15wVcUwCgm3CV
CDYtPGl/k+JagH9mQEElN/w=
=mCSn
-----END PGP SIGNATURE-----



