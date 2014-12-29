Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 32393725E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:11:56 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so6457840yhz.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zw/m90xDU/QcPTYpE2HtrrZ9fIQfCBxLjZaR1Zfc7rs=;
	b=QlCvCMWUPXLT/8aCUIXZA2VOQsw1Pc8vcYW0LdarmRf23YJIXxdMYDdJGPtFhbc5F8
	wsJwW7kIKFQoH0ht62jPnStyg7ZqONZqL+f6eLIx2YpCTLYOQRutS8yMbG+Ulncz3QZr
	XEp+NwOECGiGuEA9BiPkxJi1+cICtDEnLpufqR+Y8jiJrvi2R6YiPkVjmJB5PBJeqJL1
	IesvZn6HDC8alCzlk9UVtfuHlTMqImHMgTkuAyNIlhdPryamGhmztCbdl/hBTLgVlx5I
	FBNfVD4eUqTq7m7YEoiD2ViGKwPxi5FksTieMcrvRgeLA2N6SnYYmNiFqcmGfL1OeAeM
	ezIg==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr28678399yha.105.1419855116566;
	Mon, 29 Dec 2014 04:11:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 29 Dec 2014 04:11:56 -0800 (PST)
In-Reply-To: <1419785157-24929-1-git-send-email-akuster808@gmail.com>
References: <1419785157-24929-1-git-send-email-akuster808@gmail.com>
Date: Mon, 29 Dec 2014 10:11:56 -0200
X-Google-Sender-Auth: FGIjkHWFiWUj7WnskC5fN7gcTEU
Message-ID: <CAP9ODKqMaEzCwqW++2hoY33zDFMofYGw9a3kdUfVbc2SuxGdmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][dizzy][PATCH] ntp: fix several security issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Dec 2014 12:12:00 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sun, Dec 28, 2014 at 2:45 PM, Armin Kuster <akuster808@gmail.com> wrote:
> * CVE-2014-9293, CVE-2014-9294, CVE-2014-9295, and CVE-2014-9296.
>   For more details please see:
>   https://ics-cert.us-cert.gov/advisories/ICSA-14-353-01A
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../ntp/files/ntp-4.2.6p5-cve-2014-9293.patch      |  43 +++++++
>  .../ntp/files/ntp-4.2.6p5-cve-2014-9294.patch      | 128 +++++++++++++++++++++
>  .../ntp/files/ntp-4.2.6p5-cve-2014-9295.patch      | 113 ++++++++++++++++++
>  .../ntp/files/ntp-4.2.6p5-cve-2014-9296.patch      |  21 ++++
>  .../ntp/files/ntp-keygen_no_openssl.patch          | 108 +++++++++++++++++
>  meta-networking/recipes-support/ntp/ntp.inc        |  16 ++-
>  6 files changed, 426 insertions(+), 3 deletions(-)
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9293.patch
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9294.patch
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9295.patch
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9296.patch
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntp-keygen_no_openssl.patch
>
> diff --git a/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9293.patch b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9293.patch
> new file mode 100644
> index 0000000..667b705
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9293.patch
> @@ -0,0 +1,43 @@
> +CVE-2014-9293 ntp: automatic generation of weak default key in config_auth()
> +
> +Upstream-Status: Backport [Debian]
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Index: git/ntpd/ntp_config.c
> +===================================================================
> +--- git.orig/ntpd/ntp_config.c 2014-12-20 18:45:45.232872120 +0100
> ++++ git/ntpd/ntp_config.c      2014-12-20 18:45:47.672921968 +0100
> +@@ -1866,13 +1866,16 @@
> +               req_hashlen = digest_len;
> + #endif
> +       } else {
> +-              int     rankey;
> ++              unsigned char rankey[16];
> ++
> ++              if (ntp_crypto_random_buf(rankey, sizeof (rankey))) {
> ++                      msyslog(LOG_ERR, "ntp_crypto_random_buf() failed.");
> ++                      exit(1);
> ++              }
> +
> +-              rankey = ntp_random();
> +               req_keytype = NID_md5;
> +               req_hashlen = 16;
> +-              MD5auth_setkey(req_keyid, req_keytype,
> +-                  (u_char *)&rankey, sizeof(rankey));
> ++              MD5auth_setkey(req_keyid, req_keytype, rankey, sizeof(rankey));
> +               authtrust(req_keyid, 1);
> +       }
> +
> +Index: git/ntpd/ntpd.c
> +===================================================================
> +--- git.orig/ntpd/ntpd.c       2014-12-20 18:45:45.232872120 +0100
> ++++ git/ntpd/ntpd.c    2014-12-20 18:45:47.672921968 +0100
> +@@ -597,6 +597,7 @@
> +       get_systime(&now);
> +
> +       ntp_srandom((int)(now.l_i * now.l_uf));
> ++      ntp_crypto_srandom();
> +
> + #if !defined(VMS)
> + # ifndef NODETACH
> diff --git a/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9294.patch b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9294.patch
> new file mode 100644
> index 0000000..67e532b
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9294.patch
> @@ -0,0 +1,128 @@
> +CVE-2014-9294 ntp: ntp-keygen uses weak random number generator and seed when generating MD5 keys
> +
> +Upstream-Status: Backport [Debian]
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Index: ntp-4.2.6p5/include/ntp_random.h
> +===================================================================
> +--- ntp-4.2.6p5.orig/include/ntp_random.h
> ++++ ntp-4.2.6p5/include/ntp_random.h
> +@@ -1,6 +1,9 @@
> +
> + #include <ntp_types.h>
> +
> ++void ntp_crypto_srandom(void);
> ++int ntp_crypto_random_buf(void *buf, size_t nbytes);
> ++
> + long ntp_random (void);
> + void ntp_srandom (unsigned long);
> + void ntp_srandomdev (void);
> +Index: ntp-4.2.6p5/libntp/ntp_random.c
> +===================================================================
> +--- ntp-4.2.6p5.orig/libntp/ntp_random.c
> ++++ ntp-4.2.6p5/libntp/ntp_random.c
> +@@ -481,3 +481,74 @@ ntp_random( void )
> +       }
> +       return(i);
> + }
> ++
> ++/*
> ++ * Crypto-quality random number functions
> ++ *
> ++ * Author: Harlan Stenn, 2014
> ++ *
> ++ * This file is Copyright (c) 2014 by Network Time Foundation.
> ++ * BSD terms apply: see the file COPYRIGHT in the distribution root for details.
> ++ */
> ++
> ++#ifdef OPENSSL
> ++#include <openssl/err.h>
> ++#include <openssl/rand.h>
> ++
> ++int crypto_rand_init = 0;
> ++#endif
> ++
> ++/*
> ++ * ntp_crypto_srandom:
> ++ *
> ++ * Initialize the random number generator, if needed by the underlying
> ++ * crypto random number generation mechanism.
> ++ */
> ++
> ++void
> ++ntp_crypto_srandom(
> ++      void
> ++      )
> ++{
> ++#ifdef OPENSSL
> ++      if (!crypto_rand_init) {
> ++              RAND_poll();
> ++              crypto_rand_init = 1;
> ++      }
> ++#else
> ++   /* No initialization needed for arc4random() */
> ++#endif
> ++}
> ++
> ++/*
> ++ * ntp_crypto_random_buf:
> ++ *
> ++ * Returns 0 on success, -1 on error.
> ++ */
> ++int
> ++ntp_crypto_random_buf(
> ++      void *buf,
> ++      size_t nbytes
> ++      )
> ++{
> ++#ifdef OPENSSL
> ++      int rc;
> ++
> ++      rc = RAND_bytes(buf, nbytes);
> ++      if (1 != rc) {
> ++              unsigned long err;
> ++              char *err_str;
> ++
> ++              err = ERR_get_error();
> ++              err_str = ERR_error_string(err, NULL);
> ++              /* XXX: Log the error */
> ++
> ++              return -1;
> ++      }
> ++      return 0;
> ++#else
> ++   arc4random_buf(buf, nbytes);
> ++   return 0;
> ++#endif
> ++}
> ++
> +Index: ntp-4.2.6p5/util/ntp-keygen.c
> +===================================================================
> +--- ntp-4.2.6p5.orig/util/ntp-keygen.c
> ++++ ntp-4.2.6p5/util/ntp-keygen.c
> +@@ -261,6 +261,8 @@ main(
> +       ssl_check_version();
> + #endif /* OPENSSL */
> +
> ++      ntp_crypto_srandom();
> ++
> +       /*
> +        * Process options, initialize host name and timestamp.
> +        */
> +@@ -727,7 +729,14 @@ gen_md5(
> +                       int temp;
> +
> +                       while (1) {
> +-                              temp = ntp_random() & 0xff;
> ++                              int rc;
> ++
> ++                              rc = ntp_crypto_random_buf(&temp, 1);
> ++                              if (-1 == rc) {
> ++                                      fprintf(stderr, "ntp_crypto_random_buf() failed.\n");
> ++                                      exit (-1);
> ++                              }
> ++                              temp &= 0xff;
> +                               if (temp == '#')
> +                                       continue;
> +
> diff --git a/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9295.patch b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9295.patch
> new file mode 100644
> index 0000000..6143f26
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9295.patch
> @@ -0,0 +1,113 @@
> +CVE-2014-9295 ntp: Multiple buffer overflows via specially-crafted packets
> +
> +Upstream-Status: Backport [Debian]
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +2014-12-12 11:06:03+00:00, stenn@psp-fb1.ntp.org +12 -3
> +  [Sec 2667] buffer overflow in crypto_recv()
> +2014-12-12 11:13:40+00:00, stenn@psp-fb1.ntp.org +16 -1
> +  [Sec 2668] buffer overflow in ctl_putdata()
> +2014-12-12 11:19:37+00:00, stenn@psp-fb1.ntp.org +14 -0
> +  [Sec 2669] buffer overflow in configure()
> +
> +Index: git/ntpd/ntp_crypto.c
> +===================================================================
> +--- git.orig/ntpd/ntp_crypto.c 2014-12-20 18:45:44.208851199 +0100
> ++++ git/ntpd/ntp_crypto.c      2014-12-20 18:45:56.425100776 +0100
> +@@ -789,15 +789,24 @@
> +                        * errors.
> +                        */
> +                       if (vallen == (u_int)EVP_PKEY_size(host_pkey)) {
> ++                              u_int32 *cookiebuf = malloc(
> ++                                  RSA_size(host_pkey->pkey.rsa));
> ++                              if (!cookiebuf) {
> ++                                      rval = XEVNT_CKY;
> ++                                      break;
> ++                              }
> ++
> +                               if (RSA_private_decrypt(vallen,
> +                                   (u_char *)ep->pkt,
> +-                                  (u_char *)&temp32,
> ++                                  (u_char *)cookiebuf,
> +                                   host_pkey->pkey.rsa,
> +-                                  RSA_PKCS1_OAEP_PADDING) <= 0) {
> ++                                  RSA_PKCS1_OAEP_PADDING) != 4) {
> +                                       rval = XEVNT_CKY;
> ++                                      free(cookiebuf);
> +                                       break;
> +                               } else {
> +-                                      cookie = ntohl(temp32);
> ++                                      cookie = ntohl(*cookiebuf);
> ++                                      free(cookiebuf);
> +                               }
> +                       } else {
> +                               rval = XEVNT_CKY;
> +Index: git/ntpd/ntp_control.c
> +===================================================================
> +--- git.orig/ntpd/ntp_control.c        2014-12-20 18:45:44.208851199 +0100
> ++++ git/ntpd/ntp_control.c     2014-12-20 18:45:56.429100859 +0100
> +@@ -486,6 +486,10 @@
> + static        char *reqpt;
> + static        char *reqend;
> +
> ++#ifndef MIN
> ++#define MIN(a, b) (((a) <= (b)) ? (a) : (b))
> ++#endif
> ++
> + /*
> +  * init_control - initialize request data
> +  */
> +@@ -995,6 +999,7 @@
> +       )
> + {
> +       int overhead;
> ++      unsigned int currentlen;
> +
> +       overhead = 0;
> +       if (!bin) {
> +@@ -1018,12 +1023,22 @@
> +       /*
> +        * Save room for trailing junk
> +        */
> +-      if (dlen + overhead + datapt > dataend) {
> ++      while (dlen + overhead + datapt > dataend) {
> +               /*
> +                * Not enough room in this one, flush it out.
> +                */
> ++              currentlen = MIN(dlen, dataend - datapt);
> ++
> ++              memcpy(datapt, dp, currentlen);
> ++
> ++              datapt += currentlen;
> ++              dp += currentlen;
> ++              dlen -= currentlen;
> ++              datalinelen += currentlen;
> ++
> +               ctl_flushpkt(CTL_MORE);
> +       }
> ++
> +       memmove((char *)datapt, dp, (unsigned)dlen);
> +       datapt += dlen;
> +       datalinelen += dlen;
> +@@ -2492,6 +2507,20 @@
> +
> +       /* Initialize the remote config buffer */
> +       data_count = reqend - reqpt;
> ++
> ++      if (data_count > sizeof(remote_config.buffer) - 2) {
> ++              snprintf(remote_config.err_msg,
> ++                       sizeof(remote_config.err_msg),
> ++                       "runtime configuration failed: request too long");
> ++              ctl_putdata(remote_config.err_msg,
> ++                          strlen(remote_config.err_msg), 0);
> ++              ctl_flushpkt(0);
> ++              msyslog(LOG_NOTICE,
> ++                      "runtime config from %s rejected: request too long",
> ++                      stoa(&rbufp->recv_srcadr));
> ++              return;
> ++      }
> ++
> +       memcpy(remote_config.buffer, reqpt, data_count);
> +       if (data_count > 0
> +           && '\n' != remote_config.buffer[data_count - 1])
> diff --git a/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9296.patch b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9296.patch
> new file mode 100644
> index 0000000..a85f65d
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp-4.2.6p5-cve-2014-9296.patch
> @@ -0,0 +1,21 @@
> +CVE-2014-9296 ntp: receive() missing return on error
> +
> +Upstream-Status: Backport [Debian]
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +2014-12-12 11:24:22+00:00, stenn@psp-fb1.ntp.org +1 -0
> +  [Sec 2670] Missing return; from error clause
> +
> +Index: git/ntpd/ntp_proto.c
> +===================================================================
> +--- git.orig/ntpd/ntp_proto.c  2014-12-20 18:45:42.760821618 +0100
> ++++ git/ntpd/ntp_proto.c       2014-12-20 18:46:00.153176945 +0100
> +@@ -947,6 +947,7 @@
> +                               fast_xmit(rbufp, MODE_ACTIVE, 0,
> +                                   restrict_mask);
> +                               sys_restricted++;
> ++                              return;
> +                       }
> +               }
> +
> diff --git a/meta-networking/recipes-support/ntp/files/ntp-keygen_no_openssl.patch b/meta-networking/recipes-support/ntp/files/ntp-keygen_no_openssl.patch
> new file mode 100644
> index 0000000..f576e2e
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp-keygen_no_openssl.patch
> @@ -0,0 +1,108 @@
> +Fix ntp-keygen build without OpenSSL
> +
> +Patch borrowed from Gentoo, originally from upstream
> +Added --enable-libenvent to config since this version
> +does not have local libevent support but we need the
> +functions from the lib.
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Upstream-Status: Backport
> +
> +Upstream commit:
> +http://bk1.ntp.org/ntp-stable/?PAGE=patch&REV=5497b345z5MNTuNvJWuqPSje25NQTg
> +Gentoo bugzilla: https://bugs.gentoo.org/show_bug.cgi?id=533238
> +
> +Signed-off-by: Markos Chandras <hwoarang@gentoo.org>
> +
> +Index: ntp-4.2.6p5/libntp/ntp_random.c
> +===================================================================
> +--- ntp-4.2.6p5.orig/libntp/ntp_random.c
> ++++ ntp-4.2.6p5/libntp/ntp_random.c
> +@@ -498,6 +498,21 @@ ntp_random( void )
> + int crypto_rand_init = 0;
> + #endif
> +
> ++#ifndef HAVE_ARC4RANDOM_BUF
> ++static void
> ++arc4random_buf(void *buf, size_t nbytes);
> ++
> ++void
> ++evutil_secure_rng_get_bytes(void *buf, size_t nbytes);
> ++
> ++static void
> ++arc4random_buf(void *buf, size_t nbytes)
> ++{
> ++  evutil_secure_rng_get_bytes(buf, nbytes);
> ++  return;
> ++}
> ++#endif
> ++
> + /*
> +  * ntp_crypto_srandom:
> +  *
> +Index: ntp-4.2.6p5/util/Makefile.am
> +===================================================================
> +--- ntp-4.2.6p5.orig/util/Makefile.am
> ++++ ntp-4.2.6p5/util/Makefile.am
> +@@ -21,6 +21,7 @@ AM_CPPFLAGS= -I$(top_srcdir)/include -I$
> + LDADD=                ../libntp/libntp.a
> + ntp_keygen_SOURCES = ntp-keygen.c ntp-keygen-opts.c ntp-keygen-opts.h
> + ntp_keygen_LDADD= version.o $(LIBOPTS_LDADD) ../libntp/libntp.a @LCRYPTO@
> ++ntp_keygen_LDADD += $(LDADD_LIBEVENT)
> +
> + ETAGS_ARGS=   Makefile.am
> + #EXTRA_DIST=  README TAGS
> +Index: ntp-4.2.6p5/configure.ac
> +===================================================================
> +--- ntp-4.2.6p5.orig/configure.ac
> ++++ ntp-4.2.6p5/configure.ac
> +@@ -376,6 +376,8 @@ AC_CHECK_FUNC([openlog], ,
> + AC_SEARCH_LIBS([MD5Init], [md5 md])
> + AC_CHECK_FUNCS(MD5Init)
> +
> ++AC_CHECK_FUNC([arc4random_buf])
> ++
> + NTP_LINEEDITLIBS
> +
> + dnl Digital UNIX V4.0 and Solaris 7 have POSIX.1c functions in -lrt
> +@@ -5205,6 +5207,39 @@ AC_MSG_RESULT([$ntp_use_dev_clockctl])
> +
> + AC_CHECK_HEADERS([sys/capability.h sys/prctl.h])
> +
> ++AC_MSG_CHECKING([if we have libevent capabilities (libevent)])
> ++
> ++case "$ac_cv_header_event2_event-config_h" in
> ++ yes)
> ++    case "$host" in
> ++     *) ntp_have_linuxcaps=yes
> ++      ;;
> ++    esac
> ++    ;;
> ++ *)
> ++    ntp_have_linuxcaps=no
> ++    ;;
> ++esac
> ++
> ++AC_ARG_ENABLE(
> ++    [libevent],
> ++    [AS_HELP_STRING(
> ++      [--enable-libevent],
> ++      [+ Use libevent capabilities for arc4random]
> ++    )],
> ++    [ntp_have_libevent=$enableval]
> ++)
> ++
> ++AC_MSG_RESULT([$ntp_have_libevent])
> ++
> ++case "$ntp_have_libevent" in
> ++ yes)
> ++    AC_DEFINE([HAVE_LIBEVENT], [1],
> ++      [Do we have libevent capabilities?])
> ++    LIBS="$LIBS -levent"
> ++esac
> ++
> ++
> + AC_MSG_CHECKING([if we have linux capabilities (libcap)])
> +
> + case "$ac_cv_header_sys_capability_h$ac_cv_header_sys_prctl_h" in
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
> index fd29a78..ab7bd9c 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -26,13 +26,22 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>             file://sntp \
>             file://ntpd.list \
>             file://CVE-2013-5211.patch \
> +           file://ntp-4.2.6p5-cve-2014-9293.patch \
> +           file://ntp-4.2.6p5-cve-2014-9294.patch \
> +           file://ntp-4.2.6p5-cve-2014-9295.patch \
> +           file://ntp-4.2.6p5-cve-2014-9296.patch  \
> +           file://ntp-keygen_no_openssl.patch  \
>  "
>
>  inherit autotools update-rc.d useradd systemd
>
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
> -EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no --with-binsubdir=sbin"
> +EXTRA_OECONF += "--with-net-snmp-config=no \
> +                --without-ntpsnmpd \
> +                ac_cv_header_readline_history_h=no \
> +                --with-binsubdir=sbin"
> +
>  CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
>
>  USERADD_PACKAGES = "${PN}"
> @@ -42,7 +51,7 @@ USERADD_PARAM_${PN} = "--system --home-dir ${NTP_USER_HOME} \
>                         --shell /bin/false --user-group ntp"
>
>  # NB: debug is default-enabled by NTP; keep it default-enabled here.
> -PACKAGECONFIG ??= "cap debug"
> +PACKAGECONFIG ??= "event cap debug"
>  PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
>                            --with-openssl-incdir=${STAGING_INCDIR} \
>                            --with-crypto, \
> @@ -51,6 +60,7 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
>  PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
>  PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
>  PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
> +PACKAGECONFIG[event] = "--enable-libevent,--disable-libevent, libevent"
>
>  do_install_append() {
>      install -d ${D}${sysconfdir}/init.d
> @@ -94,7 +104,7 @@ PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
>
>  # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
>  # with wonky clocks (e.g. OpenSlug)
> -RDEPENDS_${PN} = "${PN}-tickadj"
> +RDEPENDS_${PN} = "${PN}-tickadj libbsd"
>  # Handle move from bin to utils package
>  RPROVIDES_${PN}-utils = "${PN}-bin"
>  RREPLACES_${PN}-utils = "${PN}-bin"
> --
> 1.9.1
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

