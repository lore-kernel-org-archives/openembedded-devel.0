Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF0AC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:12:06 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.17320.1747411916626556228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 09:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GdGLL+S8;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-606477d77easo1641684eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747411916; x=1748016716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLZBjGLFM+Kz5Pie3UZ49+zypzHFvkSoR2d5jnXXWmY=;
        b=GdGLL+S89AeaZxlFkdv07Enc9hUaZ3E4D7jy2CmX161HRJFixpSwU1iHlFCkwr3PMI
         7ZOlnhXxVI4UOZJV3RzBXpuwO7XHxanGJv2sOu3TFcnS7vJ59FCvSWr/aDuydk5AHxCI
         vPmsq6QCo9ucHKKs1eu8qg+AHQvztRcqa9Zfs5vOxVTFD3dLfmHjAgF/fcnnkky/W3aY
         QaJ5ycc3oIlbSTetRysWNWlfkJ6MdKcx85Sukuk4/trKDHlKcvBgd+GWKef59YDxGKIu
         Z04vptIbdEnfkGz5q/wjnxVaqPJZyTbjr3H/5j7DyiPr9aWn3QFUVwakNgzlHS24QwqE
         bSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747411916; x=1748016716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLZBjGLFM+Kz5Pie3UZ49+zypzHFvkSoR2d5jnXXWmY=;
        b=X/dl1Rnj4qxAQAqBC4V9MxWz7KSbDp2uCBahZKyPSpGqFKWhL+r657W7cv0hZxkQPo
         2e92UoLFjVhX4wUrXe7tRcbzu+XjUAz0pLHaaQtyIXip9zdkhmAXYcs4CFwkDKoPZQhd
         PvDuv3jcjll9plL1g6oHTEdgH42JGt3kYcdI0IzBvqE14XeSDAjeD8tjmhW3D9uvL4Io
         S1PBpm1M5EGtqp7vtNJnRU70oGI2JbM4I/n7jGcJpSwK7qs3vxSR5QrsthyY8ZsMhzST
         vruh7jw8BFrOhykf5B/VH3D9gz338E4GdLo5Yw3BADdMJT9U9Is1OcwdOz2SdKiDA43B
         pJ+w==
X-Gm-Message-State: AOJu0Yyj/GCeMNIUOr/85zNQPfSMCmDmNwYO/oyAvGz2fs9UcfP1YgRT
	2SX/WjAfiw19dEUmlaakrG0ao/XPP9qriUCZksWilpXgT4soHxqJhvHZWqst1J+0uDGggSxuz7B
	TK2yHVqLF030XPmAT/YQYI0CEmhaZ7ek=
X-Gm-Gg: ASbGncvFs0QzJFZV4Y5E+vJkp4d2xC9hCl7xhsjfH/yyen0IyjSYkcGQH/EXouD9+9F
	kVIQZDJjsxxxonGqKnj6v8GP+zlohpNk2Il4e1aVc8BmIuLuULBhuCy6sMFazaxspvHzHa5xQ1i
	abZEn0+dsJzoM/qFRzxwybL/5ewi8B/46Z
X-Google-Smtp-Source: AGHT+IGjq+3d7ZMnMfNgd5co9pUdgLZbrUyP0SUtDyGrPL9NxMf6P+mive3Y1JUDUdeIUw8g1A4faURczU0q7fqLDHM=
X-Received: by 2002:a05:6820:12f:b0:609:ef1e:4960 with SMTP id
 006d021491bc7-609ef1e49f9mr2898636eaf.4.1747411915582; Fri, 16 May 2025
 09:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250516114435.1936780-1-pkj@axis.com>
In-Reply-To: <20250516114435.1936780-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2025 09:11:29 -0700
X-Gm-Features: AX0GCFumlVwCCZLx8meO37VtsnBs-KstyxbANjjVrtgEEQtmla8ELxp7ClB2wsQ
Message-ID: <CAMKF1sqwaZy-+-nOhF4GQA+KA_CtszOZgg6J8rh4h9nNEdP9gw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsoup-2.4: Add recipe
To: peter.kjellerstedt@axis.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 16:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117434

Thanks for the patch, I think before I accept this patch it would be
good to take and opportunity to minimize its use in meta-openembedded
recipes
I have sent few patches, there are some hard dependencies left to address

 xfce4-weather-plugin, librest, gstd, libgdata, dleyna-server and dleyna-se=
rver

All other usecases are either migrated to use libsoup3 or are package
configs disabled by default.

On Fri, May 16, 2025 at 4:44=E2=80=AFAM Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
>
> The libsoup-2.4 recipe has been removed from OE-Core, but there are
> still a number of recipes in meta-openembedded that depend on it.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 +++++++++
>  ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 ++++++
>  ...-Fix-possibly-uninitialized-warnings.patch |  43 ++++++
>  ...-http-and-https-aliases-support-test.patch | 145 ++++++++++++++++++
>  .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 +++++
>  .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 ++++++
>  .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |  66 ++++++++
>  8 files changed, 500 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-=
2025-32911.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-=
build-with-libxml2-2.12.0-and-clang-17.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-=
possibly-uninitialized-warnings.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remo=
ve-http-and-https-aliases-support-test.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-=
52532-1.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-=
52532-2.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-=
52532-3.patch
>  create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
>
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32=
911.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911=
.patch
> new file mode 100644
> index 0000000000..9ef0643837
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.pat=
ch
> @@ -0,0 +1,74 @@
> +From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 30 Apr 2025 14:59:55 +0800
> +Subject: [PATCH] CVE-2025-32911
> +
> +CVE: CVE-2025-32911
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merg=
e_requests/422/commits]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-message-headers.c | 13 +++++++++----
> + tests/header-parsing-test.c    | 15 +++++++++++++++
> + 2 files changed, 24 insertions(+), 4 deletions(-)
> +
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-heade=
rs.c
> +index 39ad14a..78b2455 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (So=
upMessageHeaders  *hdrs,
> +        */
> +       if (params && g_hash_table_lookup_extended (*params, "filename",
> +                                                   &orig_key, &orig_valu=
e)) {
> +-              char *filename =3D strrchr (orig_value, '/');
> +-
> +-              if (filename)
> +-                      g_hash_table_insert (*params, g_strdup (orig_key)=
, filename + 1);
> ++                if (orig_value) {
> ++                        char *filename =3D strrchr (orig_value, '/');
> ++
> ++                        if (filename)
> ++                                g_hash_table_insert (*params, g_strdup =
(orig_key), g_strdup(filename + 1));
> ++                } else {
> ++                        /* filename with no value isn't valid. */
> ++                        g_hash_table_remove (*params, "filename");
> ++                }
> +       }
> +       return TRUE;
> + }
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index 946f118..752196e 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
> + #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=3DUnknown''=
t%FF%FF%FFst.txt; filename=3D\"test.txt\""
> + #define RFC5987_TEST_HEADER_NO_TYPE  "filename=3D\"test.txt\""
> + #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=3D\"test.txt\"; foo=3D=
bar"
> ++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
> +
> + static void
> + do_content_disposition_tests (void)
> +@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
> +       g_assert_cmpstr (filename, =3D=3D, RFC5987_TEST_FALLBACK_FILENAME=
);
> +         parameter2 =3D g_hash_table_lookup (params, "foo");
> +         g_assert_cmpstr (parameter2, =3D=3D, "bar");
> ++      g_hash_table_destroy (params);
> ++
> ++       /* Empty filename */
> ++      soup_message_headers_clear (hdrs);
> ++      soup_message_headers_append (hdrs, "Content-Disposition",
> ++                                                               RFC5987_=
TEST_HEADER_EMPTY_FILENAME);
> ++      if (!soup_message_headers_get_content_disposition (hdrs,
> ++                                                                       =
                                  &disposition,
> ++                                                                       =
                                  &params)) {
> ++                      soup_test_assert (FALSE, "empty filename decoding=
 FAILED");
> ++                      return;
> ++      }
> ++      g_free (disposition);
> ++      g_assert_false (g_hash_table_contains (params, "filename"));
> +       g_hash_table_destroy (params);
> +
> +       soup_message_headers_free (hdrs);
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-w=
ith-libxml2-2.12.0-and-clang-17.patch b/meta-oe/recipes-support/libsoup/lib=
soup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
> new file mode 100644
> index 0000000000..d867e5bc17
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-lib=
xml2-2.12.0-and-clang-17.patch
> @@ -0,0 +1,44 @@
> +From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 22 Nov 2023 18:49:10 -0800
> +Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
> +
> +Fixes build errors about missing function prototypes with clang-17
> +
> +Fixes
> +| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to unde=
clared function 'xmlParseMemory'; ISO C99 and later do not support implicit=
 function declarations
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/mer=
ge_requests/385]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + libsoup/soup-xmlrpc-old.c | 1 +
> + libsoup/soup-xmlrpc.c     | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
> +index c57086b6..527e3b23 100644
> +--- a/libsoup/soup-xmlrpc-old.c
> ++++ b/libsoup/soup-xmlrpc-old.c
> +@@ -11,6 +11,7 @@
> +
> + #include <string.h>
> +
> ++#include <libxml/parser.h>
> + #include <libxml/tree.h>
> +
> + #include "soup-xmlrpc-old.h"
> +diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
> +index 42dcda9c..e991cbf0 100644
> +--- a/libsoup/soup-xmlrpc.c
> ++++ b/libsoup/soup-xmlrpc.c
> +@@ -17,6 +17,7 @@
> +
> + #include <string.h>
> + #include <errno.h>
> ++#include <libxml/parser.h>
> + #include <libxml/tree.h>
> + #include "soup-xmlrpc.h"
> + #include "soup.h"
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibl=
y-uninitialized-warnings.patch b/meta-oe/recipes-support/libsoup/libsoup-2.=
4/0001-Fix-possibly-uninitialized-warnings.patch
> new file mode 100644
> index 0000000000..fcd442c13a
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-unini=
tialized-warnings.patch
> @@ -0,0 +1,43 @@
> +From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Mon, 20 Sep 2021 15:41:31 -0500
> +Subject: [PATCH] Fix possibly uninitialized warnings
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/fb98e9a8c3062c75357b961543af091de2dd5459]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-websocket-connection.c | 2 +-
> + tests/samesite-test.c               | 3 +++
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index 65c1492..585d45c 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
> +       GByteArray *bytes;
> +       gsize frame_len;
> +       guint8 *outer;
> +-      guint8 mask_offset;
> ++      guint8 mask_offset =3D 0;
> +       GBytes *filtered_bytes;
> +       GList *l;
> +       GError *error =3D NULL;
> +diff --git a/tests/samesite-test.c b/tests/samesite-test.c
> +index 0b081b2..60c9b8e 100644
> +--- a/tests/samesite-test.c
> ++++ b/tests/samesite-test.c
> +@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSa=
meSitePolicy policy)
> +       case SOUP_SAME_SITE_POLICY_NONE:
> +               expected_count =3D 1;
> +               break;
> ++      default:
> ++              g_assert_not_reached ();
> ++              break;
> +       }
> +
> +       g_assert_cmpuint (size, =3D=3D, expected_count);
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http=
-and-https-aliases-support-test.patch b/meta-oe/recipes-support/libsoup/lib=
soup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
> new file mode 100644
> index 0000000000..0d4139ec08
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-ht=
tps-aliases-support-test.patch
> @@ -0,0 +1,145 @@
> +From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
> +From: Carlos Garcia Campos <cgarcia@igalia.com>
> +Date: Thu, 11 Feb 2021 10:47:09 +0100
> +Subject: [PATCH] Remove http and https aliases support test
> +
> +Upstream has removed the whole function of http and https aliases
> +support, this commit partially cherry pick it, only remove the test to
> +mute the warning:
> +| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_alia=
ses_test':
> +| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_clien=
t_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
> +|   180 |                 g_socket_client_set_tls_validation_flags (clie=
nt, 0);
> +|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/server-test.c | 104 --------------------------------------------
> + 1 file changed, 104 deletions(-)
> +
> +diff --git a/tests/server-test.c b/tests/server-test.c
> +index 8976103..cb7e815 100644
> +--- a/tests/server-test.c
> ++++ b/tests/server-test.c
> +@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_d=
ata)
> +       soup_uri_free (star_uri);
> + }
> +
> +-static void
> +-do_one_server_aliases_test (SoupURI    *uri,
> +-                          const char *alias,
> +-                          gboolean    succeed)
> +-{
> +-      GSocketClient *client;
> +-      GSocketConnectable *addr;
> +-      GSocketConnection *conn;
> +-      GInputStream *in;
> +-      GOutputStream *out;
> +-      GError *error =3D NULL;
> +-      GString *req;
> +-      static char buf[1024];
> +-
> +-      debug_printf (1, "  %s via %s\n", alias, uri->scheme);
> +-
> +-      /* There's no way to make libsoup's client side send an absolute
> +-       * URI (to a non-proxy server), so we have to fake this.
> +-       */
> +-
> +-      client =3D g_socket_client_new ();
> +-      if (uri->scheme =3D=3D SOUP_URI_SCHEME_HTTPS) {
> +-              g_socket_client_set_tls (client, TRUE);
> +-              g_socket_client_set_tls_validation_flags (client, 0);
> +-      }
> +-      addr =3D g_network_address_new (uri->host, uri->port);
> +-
> +-      conn =3D g_socket_client_connect (client, addr, NULL, &error);
> +-      g_object_unref (addr);
> +-      g_object_unref (client);
> +-      if (!conn) {
> +-              g_assert_no_error (error);
> +-              g_error_free (error);
> +-              return;
> +-      }
> +-
> +-      in =3D g_io_stream_get_input_stream (G_IO_STREAM (conn));
> +-      out =3D g_io_stream_get_output_stream (G_IO_STREAM (conn));
> +-
> +-      req =3D g_string_new (NULL);
> +-      g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
> +-                              alias, uri->host, uri->port);
> +-      g_string_append_printf (req, "Host: %s:%d\r\n",
> +-                              uri->host, uri->port);
> +-      g_string_append (req, "Connection: close\r\n\r\n");
> +-
> +-      if (!g_output_stream_write_all (out, req->str, req->len, NULL, NU=
LL, &error)) {
> +-              g_assert_no_error (error);
> +-              g_error_free (error);
> +-              g_object_unref (conn);
> +-              g_string_free (req, TRUE);
> +-              return;
> +-      }
> +-      g_string_free (req, TRUE);
> +-
> +-      if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, =
&error)) {
> +-              g_assert_no_error (error);
> +-              g_error_free (error);
> +-              g_object_unref (conn);
> +-              return;
> +-      }
> +-
> +-      if (succeed)
> +-              g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
> +-      else
> +-              g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
> +-
> +-      g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
> +-      g_object_unref (conn);
> +-}
> +-
> +-static void
> +-do_server_aliases_test (ServerData *sd, gconstpointer test_data)
> +-{
> +-      char *http_aliases[] =3D { "dav", NULL };
> +-      char *https_aliases[] =3D { "davs", NULL };
> +-      char *http_good[] =3D { "http", "dav", NULL };
> +-      char *http_bad[] =3D { "https", "davs", "fred", NULL };
> +-      char *https_good[] =3D { "https", "davs", NULL };
> +-      char *https_bad[] =3D { "http", "dav", "fred", NULL };
> +-      int i;
> +-
> +-      g_test_bug ("703694");
> +-
> +-      g_object_set (G_OBJECT (sd->server),
> +-                    SOUP_SERVER_HTTP_ALIASES, http_aliases,
> +-                    SOUP_SERVER_HTTPS_ALIASES, https_aliases,
> +-                    NULL);
> +-
> +-      for (i =3D 0; http_good[i]; i++)
> +-              do_one_server_aliases_test (sd->base_uri, http_good[i], T=
RUE);
> +-      for (i =3D 0; http_bad[i]; i++)
> +-              do_one_server_aliases_test (sd->base_uri, http_bad[i], FA=
LSE);
> +-
> +-      if (tls_available) {
> +-              for (i =3D 0; https_good[i]; i++)
> +-                      do_one_server_aliases_test (sd->ssl_base_uri, htt=
ps_good[i], TRUE);
> +-              for (i =3D 0; https_bad[i]; i++)
> +-                      do_one_server_aliases_test (sd->ssl_base_uri, htt=
ps_bad[i], FALSE);
> +-      }
> +-}
> +-
> + static void
> + do_dot_dot_test (ServerData *sd, gconstpointer test_data)
> + {
> +@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
> +
> +       g_test_add ("/server/OPTIONS *", ServerData, NULL,
> +                   server_setup, do_star_test, server_teardown);
> +-      g_test_add ("/server/aliases", ServerData, NULL,
> +-                  server_setup, do_server_aliases_test, server_teardown=
);
> +       g_test_add ("/server/..-in-path", ServerData, NULL,
> +                   server_setup, do_dot_dot_test, server_teardown);
> +       g_test_add ("/server/ipv6", ServerData, NULL,
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
> new file mode 100644
> index 0000000000..cb1f096110
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
> @@ -0,0 +1,37 @@
> +From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Wed, 11 Sep 2024 11:52:11 +0200
> +Subject: [PATCH 1/3] websocket: process the frame as soon as we read dat=
a
> +
> +Otherwise we can enter in a read loop because we were not
> +validating the data until the all the data was read.
> +
> +Fixes #391
> +
> +CVE: CVE-2024-52532
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f727=
24d7c6715]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-websocket-connection.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index a4095e1..65c1492 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConne=
ction *self)
> +               }
> +
> +               pv->incoming->len =3D len + count;
> +-      } while (count > 0);
> +-
> +-      process_incoming (self);
> ++              process_incoming (self);
> ++      } while (count > 0 && !pv->close_sent && !pv->io_closing);
> +
> +       if (end) {
> +               if (!pv->close_sent || !pv->close_received) {
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
> new file mode 100644
> index 0000000000..dcadafe944
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
> @@ -0,0 +1,43 @@
> +From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Wed, 2 Oct 2024 11:17:19 +0200
> +Subject: [PATCH] websocket-test: disconnect error copy after the test en=
ds
> +
> +Otherwise the server will have already sent a few more wrong
> +bytes and the client will continue getting errors to copy
> +but the error is already !=3D NULL and it will assert
> +
> +CVE: CVE-2024-52532
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/29b96fab2512666d7241e46c98cc45b60b795c0c]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index 5e40cf3..1ec9ff6 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
> +       GError *error =3D NULL;
> +       InvalidEncodeLengthTest context =3D { test, NULL };
> +       guint i;
> ++      guint error_id;
> +
> +-      g_signal_connect (test->client, "error", G_CALLBACK (on_error_cop=
y), &error);
> ++      error_id =3D g_signal_connect (test->client, "error", G_CALLBACK =
(on_error_copy), &error);
> +       g_signal_connect (test->client, "message", G_CALLBACK (on_binary_=
message), &received);
> +
> +       /* We use 127(\x7f) as payload length with 65535 extended length =
*/
> +@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
> +       WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
> +       g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE=
_PROTOCOL_ERROR);
> +       g_clear_error (&error);
> ++      g_signal_handler_disconnect (test->client, error_id);
> +       g_assert_null (received);
> +
> +         g_thread_join (thread);
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3=
.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
> new file mode 100644
> index 0000000000..ab6af72291
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
> @@ -0,0 +1,48 @@
> +From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
> +From: Simon McVittie <smcv@debian.org>
> +Date: Wed, 13 Nov 2024 14:14:23 +0000
> +Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another =
place
> +
> +This is the same change as commit 29b96fab "websocket-test: disconnect
> +error copy after the test ends", and is done for the same reason, but
> +replicating it into a different function.
> +
> +Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
> +Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
> +Signed-off-by: Simon McVittie <smcv@debian.org>
> +
> +CVE: CVE-2024-52532
> +Upstream-Status: Backport
> +[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c=
332e568e1a3f530ff]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index 2b19a7b..0699a06 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
> +       GError *error =3D NULL;
> +       InvalidEncodeLengthTest context =3D { test, NULL };
> +       guint i;
> ++      guint error_id;
> +
> +-      g_signal_connect (test->client, "error", G_CALLBACK (on_error_cop=
y), &error);
> ++      error_id =3D g_signal_connect (test->client, "error", G_CALLBACK =
(on_error_copy), &error);
> +       g_signal_connect (test->client, "message", G_CALLBACK (on_binary_=
message), &received);
> +
> +       /* We use 126(~) as payload length with 125 extended length */
> +@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
> +       WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
> +       g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE=
_PROTOCOL_ERROR);
> +       g_clear_error (&error);
> ++        g_signal_handler_disconnect (test->client, error_id);
> +       g_assert_null (received);
> +
> +       g_thread_join (thread);
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta=
-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> new file mode 100644
> index 0000000000..7e275a48f4
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -0,0 +1,66 @@
> +SUMMARY =3D "An HTTP library implementation in C"
> +DESCRIPTION =3D "libsoup is an HTTP client/server library for GNOME. It =
uses GObjects \
> +and the glib main loop, to integrate well with GNOME applications."
> +HOMEPAGE =3D "https://wiki.gnome.org/Projects/libsoup"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +SECTION =3D "x11/gnome/libs"
> +LICENSE =3D "LGPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2"
> +
> +DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
> +
> +SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> +           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch =
\
> +           file://0001-CVE-2025-32911.patch \
> +           file://0001-Fix-possibly-uninitialized-warnings.patch \
> +           file://0001-Remove-http-and-https-aliases-support-test.patch =
\
> +           file://CVE-2024-52532-1.patch \
> +           file://CVE-2024-52532-2.patch \
> +           file://CVE-2024-52532-3.patch"
> +
> +SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
> +
> +CVE_PRODUCT =3D "libsoup"
> +
> +S =3D "${WORKDIR}/libsoup-${PV}"
> +
> +inherit meson gettext pkgconfig upstream-version-is-even gobject-introsp=
ection gtk-doc
> +
> +UPSTREAM_CHECK_REGEX =3D "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli=
"
> +# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
> +PACKAGECONFIG[gnome] =3D "-Dgnome=3Dtrue,-Dgnome=3Dfalse"
> +PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
> +PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
> +PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,sys=
prof"
> +
> +# Tell libsoup where the target ntlm_auth is installed
> +do_write_config:append:class-target() {
> +    cat >${WORKDIR}/soup.cross <<EOF
> +[binaries]
> +ntlm_auth =3D '${bindir}/ntlm_auth'
> +EOF
> +}
> +EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cro=
ss"
> +
> +EXTRA_OEMESON +=3D "-Dvapi=3Ddisabled -Dtls_check=3Dfalse"
> +
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> +
> +# When built without gnome support, libsoup-2.4 will contain only one sh=
ared lib
> +# and will therefore become subject to renaming by debian.bbclass. Preve=
nt
> +# renaming in order to keep the package name consistent regardless of wh=
ether
> +# gnome support is enabled or disabled.
> +DEBIAN_NOAUTONAME:${PN} =3D "1"
> +
> +# glib-networking is needed for SSL, proxies, etc.
> +RRECOMMENDS:${PN} =3D "glib-networking"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117428): https://lists.openembedded.org/g/openembedde=
d-devel/message/117428
> Mute This Topic: https://lists.openembedded.org/mt/113143457/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

