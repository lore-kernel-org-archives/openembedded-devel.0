Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4V22-0007f9-6D
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 09:07:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4UvS-0003Pq-3l
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 07:00:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 07:00:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 07:00:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 May 2009 09:00:04 +0200
Message-ID: <gugfhk$hsu$1@ger.gmane.org>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
	<1242207556-15601-21-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <1242207556-15601-21-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 20/37] teleport: reorder patches for old version 0.33 (still breaks compiling)
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
X-List-Received-Date: Thu, 14 May 2009 07:07:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 11:38, koen.kooi@gmail.com wrote:
> From: Andrea Adami<andrea.adami@gmail.com>

ping

> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   recipes/teleport/files/crypt.c                     |  158 --------------------
>   recipes/teleport/files/fix-desktop.patch           |   12 --
>   recipes/teleport/files/makefile-fix.patch          |   13 --
>   recipes/teleport/files/remove-tododb.patch         |   12 --
>   recipes/teleport/teleport-0.33/crypt.c             |  158 ++++++++++++++++++++
>   recipes/teleport/teleport-0.33/fix-desktop.patch   |   12 ++
>   recipes/teleport/teleport-0.33/makefile-fix.patch  |   13 ++
>   recipes/teleport/teleport-0.33/remove-tododb.patch |   12 ++
>   recipes/teleport/teleport-0.34/makefile-fix.patch  |   13 ++
>   9 files changed, 208 insertions(+), 195 deletions(-)
>   delete mode 100644 recipes/teleport/files/crypt.c
>   delete mode 100644 recipes/teleport/files/fix-desktop.patch
>   delete mode 100644 recipes/teleport/files/makefile-fix.patch
>   delete mode 100644 recipes/teleport/files/remove-tododb.patch
>   create mode 100644 recipes/teleport/teleport-0.33/crypt.c
>   create mode 100644 recipes/teleport/teleport-0.33/fix-desktop.patch
>   create mode 100644 recipes/teleport/teleport-0.33/makefile-fix.patch
>   create mode 100644 recipes/teleport/teleport-0.33/remove-tododb.patch
>   create mode 100644 recipes/teleport/teleport-0.34/makefile-fix.patch
>
> diff --git a/recipes/teleport/files/crypt.c b/recipes/teleport/files/crypt.c
> deleted file mode 100644
> index 359c5ee..0000000
> --- a/recipes/teleport/files/crypt.c
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -/*
> - * Copyright (C) 2003 Philip Blundell<philb@gnu.org>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * as published by the Free Software Foundation; either version
> - * 2 of the License, or (at your option) any later version.
> - */
> -
> -#include<stdlib.h>
> -#include<string.h>
> -#include<glib.h>
> -#include<assert.h>
> -
> -#include "libdisplaymigration/auth.h"
> -#include "libdisplaymigration/crypt.h"
> -
> -static gcry_mpi_t
> -mpi_from_sexp (gcry_sexp_t r, char *tag)
> -{
> -  gcry_sexp_t s = gcry_sexp_find_token (r, tag, 0);
> -  return gcry_sexp_nth_mpi (s, 1, GCRYMPI_FMT_USG);
> -}
> -
> -static char *
> -hex_from_mpi (gcry_mpi_t m)
> -{
> -  char *buf;
> -  gcry_mpi_aprint (GCRYMPI_FMT_HEX, (void *)&buf, NULL, m);
> -  return buf;
> -}
> -
> -void
> -displaymigration_crypt_create_hash (char *display, char *challenge, size_t len, char *result)
> -{
> -  size_t dlen = strlen (display);
> -  gchar *buf = g_malloc (dlen + 1 + len);
> -  strcpy (buf, display);
> -  memcpy (buf + dlen + 1, challenge, len);
> -  gcry_md_hash_buffer (GCRY_MD_SHA1, result, buf, len + dlen + 1);
> -  g_free (buf);
> -}
> -
> -static int
> -do_encode_md (const unsigned char *digest, size_t digestlen, int algo,
> -              unsigned int nbits, gcry_mpi_t *r_val)
> -{
> -  int nframe = (nbits+7) / 8;
> -  unsigned char *frame;
> -  int i, n;
> -  unsigned char asn[100];
> -  size_t asnlen;
> -
> -  asnlen = sizeof(asn);
> -  if (gcry_md_algo_info (algo, GCRYCTL_GET_ASNOID, asn,&asnlen))
> -    return -1;
> -
> -  if (digestlen + asnlen + 4>  nframe )
> -    return -1;
> -
> -  /* We encode the MD in this way:
> -   *
> -   *	   0  1 PAD(n bytes)   0  ASN(asnlen bytes)  MD(len bytes)
> -   *
> -   * PAD consists of FF bytes.
> -   */
> -  frame = g_malloc (nframe);
> -  n = 0;
> -  frame[n++] = 0;
> -  frame[n++] = 1; /* block type */
> -  i = nframe - digestlen - asnlen -3 ;
> -  assert ( i>  1 );
> -  memset ( frame+n, 0xff, i ); n += i;
> -  frame[n++] = 0;
> -  memcpy ( frame+n, asn, asnlen ); n += asnlen;
> -  memcpy ( frame+n, digest, digestlen ); n += digestlen;
> -  assert ( n == nframe );
> -
> -  gcry_mpi_scan (r_val, GCRYMPI_FMT_USG, frame, nframe,&nframe);
> -  g_free (frame);
> -  return 0;
> -}
> -
> -gboolean
> -displaymigration_crypt_sign_hash (struct rsa_key *k, char *hash, gchar **result)
> -{
> -  gcry_mpi_t mpi;
> -  gcry_sexp_t data, sig, key;
> -  int rc;
> -  char *hex;
> -
> -  do_encode_md (hash, 20, GCRY_MD_SHA1, 1024,&mpi);
> -
> -  if (gcry_sexp_build (&data, NULL, "(data (value %m))", mpi))
> -    return FALSE;
> -
> -  gcry_mpi_release (mpi);
> -
> -  if (gcry_sexp_build (&key, NULL, "(private-key (rsa (n %m) (e %m) (d %m) (p %m) (q %m) (u %m)))",
> -		       k->n, k->e, k->d, k->p, k->q, k->u))
> -    {
> -      gcry_sexp_release (data);
> -      return FALSE;
> -    }
> -
> -  rc = gcry_pk_sign (&sig, data, key);
> -
> -  gcry_sexp_release (data);
> -  gcry_sexp_release (key);
> -
> -  if (rc)
> -    return FALSE;
> -
> -  mpi = mpi_from_sexp (sig, "s");
> -  hex = hex_from_mpi (mpi);
> -  *result = g_strdup (hex);
> -  gcry_free (hex);
> -  gcry_mpi_release (mpi);
> -  gcry_sexp_release (sig);
> -
> -  return TRUE;
> -}
> -
> -gboolean
> -displaymigration_crypt_check_signature (struct rsa_key *k, char *hash, char *sigbuf)
> -{
> -  gcry_mpi_t mpi, mpi2;
> -  gcry_sexp_t data, sig, key;
> -  int rc;
> -
> -  do_encode_md (hash, 20, GCRY_MD_SHA1, 1024,&mpi);
> -
> -  gcry_sexp_build (&data, NULL, "(data (value %m))", mpi);
> -
> -  gcry_mpi_release (mpi);
> -
> -  gcry_sexp_build (&key, NULL, "(public-key (rsa (n %m) (e %m)))", k->n, k->e);
> -
> -  if (gcry_mpi_scan (&mpi2, GCRYMPI_FMT_HEX, sigbuf, 0, NULL))
> -    {
> -      gcry_sexp_release (data);
> -      return FALSE;
> -    }
> -
> -  gcry_sexp_build (&sig, NULL, "(sig-val (rsa (s %m)))", mpi2);
> -
> -  rc = gcry_pk_verify (sig, data, key);
> -
> -  gcry_sexp_release (data);
> -  gcry_sexp_release (key);
> -  gcry_sexp_release (sig);
> -  gcry_mpi_release (mpi2);
> -
> -  if (rc)
> -    return FALSE;
> -
> -  return TRUE;
> -}
> diff --git a/recipes/teleport/files/fix-desktop.patch b/recipes/teleport/files/fix-desktop.patch
> deleted file mode 100644
> index c12434f..0000000
> --- a/recipes/teleport/files/fix-desktop.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> ---- teleport-0.33/teleport.desktop      2003-07-06 23:47:14.000000000 +0200
> -+++ /tmp/teleport.desktop       2005-03-04 17:34:32.193817208 +0100
> -@@ -1,7 +1,7 @@
> - [Desktop Entry]
> - Name=Teleport
> - Comment=Move applications between displays
> --Exec=monolaunch -k /usr/share/pixmaps/teleport.png teleport
> -+Exec=mb-applet-launcher -k /usr/share/pixmaps/teleport.png teleport
> - Type=PanelApp
> - Icon=teleport.png
> - Categories=Panel;Utility;GPE
> -
> diff --git a/recipes/teleport/files/makefile-fix.patch b/recipes/teleport/files/makefile-fix.patch
> deleted file mode 100644
> index 9dc232d..0000000
> --- a/recipes/teleport/files/makefile-fix.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> ---- /tmp/Makefile.old	2005-03-04 20:19:01.000000000 +0100
> -+++ teleport-0.34/Makefile	2009-05-01 22:19:16.000000000 +0200
> -@@ -37,8 +37,8 @@
> -
> - install-program: all
> - 	install -d $(DESTDIR)$(PREFIX)/bin
> --	install -s teleport $(DESTDIR)$(PREFIX)/bin/
> --	install -s tp-keygen $(DESTDIR)$(PREFIX)/bin/
> -+	install teleport $(DESTDIR)$(PREFIX)/bin/
> -+	install tp-keygen $(DESTDIR)$(PREFIX)/bin/
> - 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
> - 	install -m 644 teleport.png $(DESTDIR)$(PREFIX)/share/pixmaps
> - 	install -d $(DESTDIR)$(PREFIX)/share/applications
> diff --git a/recipes/teleport/files/remove-tododb.patch b/recipes/teleport/files/remove-tododb.patch
> deleted file mode 100644
> index 87e4f74..0000000
> --- a/recipes/teleport/files/remove-tododb.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> ---- teleport-0.33/Makefile    2004-07-20 22:01:25.000000000 +0200
> -+++ teleport-0.33/Makefile       2005-03-04 17:03:17.316841832 +0100
> -@@ -13,7 +13,7 @@
> - endif
> - PACKAGE_CPPFLAGS += $(STANDARD_CPPFLAGS)
> - PACKAGE_CFLAGS += $(STANDARD_CFLAGS) $(GPECFLAGS) `libgcrypt-config --cflags`
> --PACKAGE_LDFLAGS += $(STANDARD_LDFLAGS) $(GPELIBS) -ltododb -ldisplaymigration -lgpepimc `libgcrypt-config --libs` -lsqlite
> -+PACKAGE_LDFLAGS += $(STANDARD_LDFLAGS) $(GPELIBS) -ldisplaymigration `libgcrypt-config --libs` -lsqlite
> -
> - MEMBERS = teleport crypt displays keygen tp-keygen
> -
> -
> diff --git a/recipes/teleport/teleport-0.33/crypt.c b/recipes/teleport/teleport-0.33/crypt.c
> new file mode 100644
> index 0000000..359c5ee
> --- /dev/null
> +++ b/recipes/teleport/teleport-0.33/crypt.c
> @@ -0,0 +1,158 @@
> +/*
> + * Copyright (C) 2003 Philip Blundell<philb@gnu.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#include<stdlib.h>
> +#include<string.h>
> +#include<glib.h>
> +#include<assert.h>
> +
> +#include "libdisplaymigration/auth.h"
> +#include "libdisplaymigration/crypt.h"
> +
> +static gcry_mpi_t
> +mpi_from_sexp (gcry_sexp_t r, char *tag)
> +{
> +  gcry_sexp_t s = gcry_sexp_find_token (r, tag, 0);
> +  return gcry_sexp_nth_mpi (s, 1, GCRYMPI_FMT_USG);
> +}
> +
> +static char *
> +hex_from_mpi (gcry_mpi_t m)
> +{
> +  char *buf;
> +  gcry_mpi_aprint (GCRYMPI_FMT_HEX, (void *)&buf, NULL, m);
> +  return buf;
> +}
> +
> +void
> +displaymigration_crypt_create_hash (char *display, char *challenge, size_t len, char *result)
> +{
> +  size_t dlen = strlen (display);
> +  gchar *buf = g_malloc (dlen + 1 + len);
> +  strcpy (buf, display);
> +  memcpy (buf + dlen + 1, challenge, len);
> +  gcry_md_hash_buffer (GCRY_MD_SHA1, result, buf, len + dlen + 1);
> +  g_free (buf);
> +}
> +
> +static int
> +do_encode_md (const unsigned char *digest, size_t digestlen, int algo,
> +              unsigned int nbits, gcry_mpi_t *r_val)
> +{
> +  int nframe = (nbits+7) / 8;
> +  unsigned char *frame;
> +  int i, n;
> +  unsigned char asn[100];
> +  size_t asnlen;
> +
> +  asnlen = sizeof(asn);
> +  if (gcry_md_algo_info (algo, GCRYCTL_GET_ASNOID, asn,&asnlen))
> +    return -1;
> +
> +  if (digestlen + asnlen + 4>  nframe )
> +    return -1;
> +
> +  /* We encode the MD in this way:
> +   *
> +   *	   0  1 PAD(n bytes)   0  ASN(asnlen bytes)  MD(len bytes)
> +   *
> +   * PAD consists of FF bytes.
> +   */
> +  frame = g_malloc (nframe);
> +  n = 0;
> +  frame[n++] = 0;
> +  frame[n++] = 1; /* block type */
> +  i = nframe - digestlen - asnlen -3 ;
> +  assert ( i>  1 );
> +  memset ( frame+n, 0xff, i ); n += i;
> +  frame[n++] = 0;
> +  memcpy ( frame+n, asn, asnlen ); n += asnlen;
> +  memcpy ( frame+n, digest, digestlen ); n += digestlen;
> +  assert ( n == nframe );
> +
> +  gcry_mpi_scan (r_val, GCRYMPI_FMT_USG, frame, nframe,&nframe);
> +  g_free (frame);
> +  return 0;
> +}
> +
> +gboolean
> +displaymigration_crypt_sign_hash (struct rsa_key *k, char *hash, gchar **result)
> +{
> +  gcry_mpi_t mpi;
> +  gcry_sexp_t data, sig, key;
> +  int rc;
> +  char *hex;
> +
> +  do_encode_md (hash, 20, GCRY_MD_SHA1, 1024,&mpi);
> +
> +  if (gcry_sexp_build (&data, NULL, "(data (value %m))", mpi))
> +    return FALSE;
> +
> +  gcry_mpi_release (mpi);
> +
> +  if (gcry_sexp_build (&key, NULL, "(private-key (rsa (n %m) (e %m) (d %m) (p %m) (q %m) (u %m)))",
> +		       k->n, k->e, k->d, k->p, k->q, k->u))
> +    {
> +      gcry_sexp_release (data);
> +      return FALSE;
> +    }
> +
> +  rc = gcry_pk_sign (&sig, data, key);
> +
> +  gcry_sexp_release (data);
> +  gcry_sexp_release (key);
> +
> +  if (rc)
> +    return FALSE;
> +
> +  mpi = mpi_from_sexp (sig, "s");
> +  hex = hex_from_mpi (mpi);
> +  *result = g_strdup (hex);
> +  gcry_free (hex);
> +  gcry_mpi_release (mpi);
> +  gcry_sexp_release (sig);
> +
> +  return TRUE;
> +}
> +
> +gboolean
> +displaymigration_crypt_check_signature (struct rsa_key *k, char *hash, char *sigbuf)
> +{
> +  gcry_mpi_t mpi, mpi2;
> +  gcry_sexp_t data, sig, key;
> +  int rc;
> +
> +  do_encode_md (hash, 20, GCRY_MD_SHA1, 1024,&mpi);
> +
> +  gcry_sexp_build (&data, NULL, "(data (value %m))", mpi);
> +
> +  gcry_mpi_release (mpi);
> +
> +  gcry_sexp_build (&key, NULL, "(public-key (rsa (n %m) (e %m)))", k->n, k->e);
> +
> +  if (gcry_mpi_scan (&mpi2, GCRYMPI_FMT_HEX, sigbuf, 0, NULL))
> +    {
> +      gcry_sexp_release (data);
> +      return FALSE;
> +    }
> +
> +  gcry_sexp_build (&sig, NULL, "(sig-val (rsa (s %m)))", mpi2);
> +
> +  rc = gcry_pk_verify (sig, data, key);
> +
> +  gcry_sexp_release (data);
> +  gcry_sexp_release (key);
> +  gcry_sexp_release (sig);
> +  gcry_mpi_release (mpi2);
> +
> +  if (rc)
> +    return FALSE;
> +
> +  return TRUE;
> +}
> diff --git a/recipes/teleport/teleport-0.33/fix-desktop.patch b/recipes/teleport/teleport-0.33/fix-desktop.patch
> new file mode 100644
> index 0000000..c12434f
> --- /dev/null
> +++ b/recipes/teleport/teleport-0.33/fix-desktop.patch
> @@ -0,0 +1,12 @@
> +--- teleport-0.33/teleport.desktop      2003-07-06 23:47:14.000000000 +0200
> ++++ /tmp/teleport.desktop       2005-03-04 17:34:32.193817208 +0100
> +@@ -1,7 +1,7 @@
> + [Desktop Entry]
> + Name=Teleport
> + Comment=Move applications between displays
> +-Exec=monolaunch -k /usr/share/pixmaps/teleport.png teleport
> ++Exec=mb-applet-launcher -k /usr/share/pixmaps/teleport.png teleport
> + Type=PanelApp
> + Icon=teleport.png
> + Categories=Panel;Utility;GPE
> +
> diff --git a/recipes/teleport/teleport-0.33/makefile-fix.patch b/recipes/teleport/teleport-0.33/makefile-fix.patch
> new file mode 100644
> index 0000000..31973c4
> --- /dev/null
> +++ b/recipes/teleport/teleport-0.33/makefile-fix.patch
> @@ -0,0 +1,13 @@
> +--- /tmp/Makefile.old	2004-07-20 22:01:25.000000000 +0200
> ++++ teleport-0.33/Makefile	2009-05-02 00:16:57.000000000 +0200
> +@@ -40,8 +40,8 @@
> +
> + install-program: all
> + 	mkdir -p $(DESTDIR)$(PREFIX)/bin
> +-	install -s teleport $(DESTDIR)$(PREFIX)/bin/
> +-	install -s tp-keygen $(DESTDIR)$(PREFIX)/bin/
> ++	install teleport $(DESTDIR)$(PREFIX)/bin/
> ++	install tp-keygen $(DESTDIR)$(PREFIX)/bin/
> + 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
> + 	install -m 644 teleport.png $(DESTDIR)$(PREFIX)/share/pixmaps
> + 	install -d $(DESTDIR)$(PREFIX)/share/applications
> diff --git a/recipes/teleport/teleport-0.33/remove-tododb.patch b/recipes/teleport/teleport-0.33/remove-tododb.patch
> new file mode 100644
> index 0000000..87e4f74
> --- /dev/null
> +++ b/recipes/teleport/teleport-0.33/remove-tododb.patch
> @@ -0,0 +1,12 @@
> +--- teleport-0.33/Makefile    2004-07-20 22:01:25.000000000 +0200
> ++++ teleport-0.33/Makefile       2005-03-04 17:03:17.316841832 +0100
> +@@ -13,7 +13,7 @@
> + endif
> + PACKAGE_CPPFLAGS += $(STANDARD_CPPFLAGS)
> + PACKAGE_CFLAGS += $(STANDARD_CFLAGS) $(GPECFLAGS) `libgcrypt-config --cflags`
> +-PACKAGE_LDFLAGS += $(STANDARD_LDFLAGS) $(GPELIBS) -ltododb -ldisplaymigration -lgpepimc `libgcrypt-config --libs` -lsqlite
> ++PACKAGE_LDFLAGS += $(STANDARD_LDFLAGS) $(GPELIBS) -ldisplaymigration `libgcrypt-config --libs` -lsqlite
> +
> + MEMBERS = teleport crypt displays keygen tp-keygen
> +
> +
> diff --git a/recipes/teleport/teleport-0.34/makefile-fix.patch b/recipes/teleport/teleport-0.34/makefile-fix.patch
> new file mode 100644
> index 0000000..9dc232d
> --- /dev/null
> +++ b/recipes/teleport/teleport-0.34/makefile-fix.patch
> @@ -0,0 +1,13 @@
> +--- /tmp/Makefile.old	2005-03-04 20:19:01.000000000 +0100
> ++++ teleport-0.34/Makefile	2009-05-01 22:19:16.000000000 +0200
> +@@ -37,8 +37,8 @@
> +
> + install-program: all
> + 	install -d $(DESTDIR)$(PREFIX)/bin
> +-	install -s teleport $(DESTDIR)$(PREFIX)/bin/
> +-	install -s tp-keygen $(DESTDIR)$(PREFIX)/bin/
> ++	install teleport $(DESTDIR)$(PREFIX)/bin/
> ++	install tp-keygen $(DESTDIR)$(PREFIX)/bin/
> + 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
> + 	install -m 644 teleport.png $(DESTDIR)$(PREFIX)/share/pixmaps
> + 	install -d $(DESTDIR)$(PREFIX)/share/applications




