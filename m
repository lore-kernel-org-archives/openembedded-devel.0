Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DDCFF4956
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 07:18:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45642.1774855107796751858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 00:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o5amg8/s;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfa33a983so549345f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774855106; x=1775459906; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YZO0pbxmPWMvhdyc9zQMAumnxQphgplv4nMDz6DEBo=;
        b=o5amg8/sHNbSAnrUYBi1PIc+PIAkOv95svsRUEn+4ywSN5APH0SW9tTYspcCh7EN3V
         6JDf+iisW0FA0Vt+5uz2jEgXSJ4JuGtXJA2vmGokY3NPBTIzh9oe8Q2XgSIuSKmDsUKI
         l7yp2/9fWvxSdt4K/BCw2caW+KLPKdRz5SwLU38t1bZ8vnW+Pk10Bw4wjDjqVN57oGMr
         Vov9vamVEly24d9XLlq8SMCskwyo4kJp/j2GZ2Q21D8unsHHIyMViG6aLTpa5FF0OWng
         +brYlNtUP+Ddxo1o0eiHuamIXS9sD2mkwPTkfgA61cYbZXqRE663v++2U06eYVd+Ek0d
         t/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774855106; x=1775459906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YZO0pbxmPWMvhdyc9zQMAumnxQphgplv4nMDz6DEBo=;
        b=kpGFb1mAiUzLnnyeT/rsCCkK7JhRS1yJHeUJgeNebOv+lVTTmMCSm/rxTbNcvtDDGJ
         F0EXFLoj4hCiG/dtQJQPXhwYBwJB39GzM4749WMxGetBg3Xxvg4hPWzUsFSHcWFhyvCo
         qtyXObzgdc5V7ZDP4rq2GMB9lBncWQQkTDewobW4H9TwgaKGqwxdtCjhckAmajwnKU5M
         cpt6KIXOcvFzQOuLAwLp99A/yvFiU3uS6T4u0FV2xwSYWA3Fdq04mEfrY7fNtpW8jly7
         oniAvI4XaLBABO4+wu1vbIaunG7I5C3abDBIz1PESdZsZ0bSMqblIZqQZYsZyHCgLKI2
         tCag==
X-Forwarded-Encrypted: i=1; AJvYcCWMSMzW+Zi3zidYRrw8QuuGGeS59bR4ybuheZPIQkaVFCc8wZRhO9ETQOZmdoa2zkCkXF6aaABjOvtylf/qjPaMzp8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4trILkhd/NZzXEavzOxMLUefxLe8K9TNzPfEif7A2DjKEbQzY
	NT5qrj10rFZDM7NZaqukjnCtG7QsZJ5CStfZya3vyC/U+0NvVGLPDdMG
X-Gm-Gg: ATEYQzyfnbJadyUXZBDbXAfAwqJiS9iKwUy09UgylSv6TUJuT0/TrDWpiOVXG7GlByA
	TuHBgZJ7ZtScxJoV0X2lrrACNDT6pjZk8DFfqG0WzJMO8pF1hvnU3DFMNIAPF4n/glP3Tqof84w
	XnPiB1FgV0NYyJQEOCskujutrP9B8iuxsiwTrEHq2WKOEKEmY8rT/qGCpUOhn23aw9JDIvsojDh
	o9o61J5OcM3EEc4dY7Txz/JTzZKrBd4VCKkW52DamtEiThfObM1oLQb+CFMPCIiea/vtAIEoib8
	rFq+tH6PSyntoCM9y3kwO+mhUoDyaREcUIf2jGkpYJIBl03r9K+xMlFKTrU0O4Z2uYQ9NPoEC5a
	LHIqp80Kq8G8aU/4FdXdcffk2lHPJdcYkb/2wQfn4k3yVw5R/DTNpJ6OEJeFkT/QJBgZNxZ86bz
	d7OeFosPUVe6lY7DvzX+IpnEPMMyq8vcJ9uqm8oRKjuw==
X-Received: by 2002:a05:6000:186a:b0:43a:378:b48b with SMTP id ffacd0b85a97d-43b9ea6244fmr18862378f8f.37.1774855105098;
        Mon, 30 Mar 2026 00:18:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21ebef9sm17835240f8f.13.2026.03.30.00.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:18:24 -0700 (PDT)
Message-ID: <5fccef59-b730-4b5e-a366-89196d5e326b@gmail.com>
Date: Mon, 30 Mar 2026 09:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 4/4] libsoup-2.4: remove deprecated recipe
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260330063145.94013-1-changqing.li@windriver.com>
 <20260330063145.94013-4-changqing.li@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260330063145.94013-4-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 07:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125834

Personally I am not against the idea of dropping this, but it looks
there are a couple of other recipes depending on it:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Alibsoup-2.4
(the list has some recipes from the meta-oe repo also, not only 3rd
party layers)


On 3/30/26 08:31, Changqing Li via lists.openembedded.org wrote:
> remove deprecated libsoup-2.4, no one depends on it now
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 ---------
>  ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 -----
>  ...-Fix-possibly-uninitialized-warnings.patch |  43 -----
>  ...-http-and-https-aliases-support-test.patch | 145 -----------------
>  .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ------------------
>  .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 -----
>  .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ----------------
>  .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 -----
>  .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 -----
>  .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ------
>  .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 -------
>  .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ----
>  .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ----
>  .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 -----
>  .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ---------
>  .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 -----
>  .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 -----
>  .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ----
>  .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 -----------
>  .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ----
>  .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ----
>  .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ----
>  .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 -----
>  .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 -------
>  .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ------
>  .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 --------------
>  .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 -----
>  .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 -----
>  .../libsoup/libsoup-2.4_2.74.3.bb             |  87 ----------
>  29 files changed, 1706 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
>  delete mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> 
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
> deleted file mode 100644
> index d75594bb4f..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Wed, 30 Apr 2025 14:59:55 +0800
> -Subject: [PATCH] CVE-2025-32911
> -
> -CVE: CVE-2025-32911 CVE-2025-32913
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-message-headers.c | 13 +++++++++----
> - tests/header-parsing-test.c    | 15 +++++++++++++++
> - 2 files changed, 24 insertions(+), 4 deletions(-)
> -
> -diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
> -index 39ad14a..78b2455 100644
> ---- a/libsoup/soup-message-headers.c
> -+++ b/libsoup/soup-message-headers.c
> -@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
> - 	 */
> - 	if (params && g_hash_table_lookup_extended (*params, "filename",
> - 						    &orig_key, &orig_value)) {
> --		char *filename = strrchr (orig_value, '/');
> --
> --		if (filename)
> --			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
> -+                if (orig_value) {
> -+                        char *filename = strrchr (orig_value, '/');
> -+
> -+                        if (filename)
> -+                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
> -+                } else {
> -+                        /* filename with no value isn't valid. */
> -+                        g_hash_table_remove (*params, "filename");
> -+                }
> - 	}
> - 	return TRUE;
> - }
> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> -index 946f118..752196e 100644
> ---- a/tests/header-parsing-test.c
> -+++ b/tests/header-parsing-test.c
> -@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
> - #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
> - #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
> - #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
> -+#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
> - 
> - static void
> - do_content_disposition_tests (void)
> -@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
> - 	g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
> -         parameter2 = g_hash_table_lookup (params, "foo");
> -         g_assert_cmpstr (parameter2, ==, "bar");
> -+	g_hash_table_destroy (params);
> -+
> -+	 /* Empty filename */
> -+	soup_message_headers_clear (hdrs);
> -+	soup_message_headers_append (hdrs, "Content-Disposition",
> -+								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
> -+	if (!soup_message_headers_get_content_disposition (hdrs,
> -+													   &disposition,
> -+													   &params)) {
> -+			soup_test_assert (FALSE, "empty filename decoding FAILED");
> -+			return;
> -+	}
> -+	g_free (disposition);
> -+	g_assert_false (g_hash_table_contains (params, "filename"));
> - 	g_hash_table_destroy (params);
> - 
> - 	soup_message_headers_free (hdrs);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
> deleted file mode 100644
> index d867e5bc17..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 22 Nov 2023 18:49:10 -0800
> -Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
> -
> -Fixes build errors about missing function prototypes with clang-17
> -
> -Fixes
> -| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/385]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libsoup/soup-xmlrpc-old.c | 1 +
> - libsoup/soup-xmlrpc.c     | 1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
> -index c57086b6..527e3b23 100644
> ---- a/libsoup/soup-xmlrpc-old.c
> -+++ b/libsoup/soup-xmlrpc-old.c
> -@@ -11,6 +11,7 @@
> - 
> - #include <string.h>
> - 
> -+#include <libxml/parser.h>
> - #include <libxml/tree.h>
> - 
> - #include "soup-xmlrpc-old.h"
> -diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
> -index 42dcda9c..e991cbf0 100644
> ---- a/libsoup/soup-xmlrpc.c
> -+++ b/libsoup/soup-xmlrpc.c
> -@@ -17,6 +17,7 @@
> - 
> - #include <string.h>
> - #include <errno.h>
> -+#include <libxml/parser.h>
> - #include <libxml/tree.h>
> - #include "soup-xmlrpc.h"
> - #include "soup.h"
> --- 
> -2.43.0
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
> deleted file mode 100644
> index fcd442c13a..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Mon, 20 Sep 2021 15:41:31 -0500
> -Subject: [PATCH] Fix possibly uninitialized warnings
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/fb98e9a8c3062c75357b961543af091de2dd5459]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-websocket-connection.c | 2 +-
> - tests/samesite-test.c               | 3 +++
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
> -index 65c1492..585d45c 100644
> ---- a/libsoup/soup-websocket-connection.c
> -+++ b/libsoup/soup-websocket-connection.c
> -@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
> - 	GByteArray *bytes;
> - 	gsize frame_len;
> - 	guint8 *outer;
> --	guint8 mask_offset;
> -+	guint8 mask_offset = 0;
> - 	GBytes *filtered_bytes;
> - 	GList *l;
> - 	GError *error = NULL;
> -diff --git a/tests/samesite-test.c b/tests/samesite-test.c
> -index 0b081b2..60c9b8e 100644
> ---- a/tests/samesite-test.c
> -+++ b/tests/samesite-test.c
> -@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSameSitePolicy policy)
> - 	case SOUP_SAME_SITE_POLICY_NONE:
> - 		expected_count = 1;
> - 		break;
> -+	default:
> -+		g_assert_not_reached ();
> -+		break;
> - 	}
> - 
> - 	g_assert_cmpuint (size, ==, expected_count);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
> deleted file mode 100644
> index 0d4139ec08..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
> +++ /dev/null
> @@ -1,145 +0,0 @@
> -From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
> -From: Carlos Garcia Campos <cgarcia@igalia.com>
> -Date: Thu, 11 Feb 2021 10:47:09 +0100
> -Subject: [PATCH] Remove http and https aliases support test
> -
> -Upstream has removed the whole function of http and https aliases
> -support, this commit partially cherry pick it, only remove the test to
> -mute the warning:
> -| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliases_test':
> -| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
> -|   180 |                 g_socket_client_set_tls_validation_flags (client, 0);
> -|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - tests/server-test.c | 104 --------------------------------------------
> - 1 file changed, 104 deletions(-)
> -
> -diff --git a/tests/server-test.c b/tests/server-test.c
> -index 8976103..cb7e815 100644
> ---- a/tests/server-test.c
> -+++ b/tests/server-test.c
> -@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_data)
> - 	soup_uri_free (star_uri);
> - }
> - 
> --static void
> --do_one_server_aliases_test (SoupURI    *uri,
> --			    const char *alias,
> --			    gboolean    succeed)
> --{
> --	GSocketClient *client;
> --	GSocketConnectable *addr;
> --	GSocketConnection *conn;
> --	GInputStream *in;
> --	GOutputStream *out;
> --	GError *error = NULL;
> --	GString *req;
> --	static char buf[1024];
> --
> --	debug_printf (1, "  %s via %s\n", alias, uri->scheme);
> --
> --	/* There's no way to make libsoup's client side send an absolute
> --	 * URI (to a non-proxy server), so we have to fake this.
> --	 */
> --
> --	client = g_socket_client_new ();
> --	if (uri->scheme == SOUP_URI_SCHEME_HTTPS) {
> --		g_socket_client_set_tls (client, TRUE);
> --		g_socket_client_set_tls_validation_flags (client, 0);
> --	}
> --	addr = g_network_address_new (uri->host, uri->port);
> --
> --	conn = g_socket_client_connect (client, addr, NULL, &error);
> --	g_object_unref (addr);
> --	g_object_unref (client);
> --	if (!conn) {
> --		g_assert_no_error (error);
> --		g_error_free (error);
> --		return;
> --	}
> --
> --	in = g_io_stream_get_input_stream (G_IO_STREAM (conn));
> --	out = g_io_stream_get_output_stream (G_IO_STREAM (conn));
> --
> --	req = g_string_new (NULL);
> --	g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
> --				alias, uri->host, uri->port);
> --	g_string_append_printf (req, "Host: %s:%d\r\n",
> --				uri->host, uri->port);
> --	g_string_append (req, "Connection: close\r\n\r\n");
> --
> --	if (!g_output_stream_write_all (out, req->str, req->len, NULL, NULL, &error)) {
> --		g_assert_no_error (error);
> --		g_error_free (error);
> --		g_object_unref (conn);
> --		g_string_free (req, TRUE);
> --		return;
> --	}
> --	g_string_free (req, TRUE);
> --
> --	if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &error)) {
> --		g_assert_no_error (error);
> --		g_error_free (error);
> --		g_object_unref (conn);
> --		return;
> --	}
> --
> --	if (succeed)
> --		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
> --	else
> --		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
> --
> --	g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
> --	g_object_unref (conn);
> --}
> --
> --static void
> --do_server_aliases_test (ServerData *sd, gconstpointer test_data)
> --{
> --	char *http_aliases[] = { "dav", NULL };
> --	char *https_aliases[] = { "davs", NULL };
> --	char *http_good[] = { "http", "dav", NULL };
> --	char *http_bad[] = { "https", "davs", "fred", NULL };
> --	char *https_good[] = { "https", "davs", NULL };
> --	char *https_bad[] = { "http", "dav", "fred", NULL };
> --	int i;
> --
> --	g_test_bug ("703694");
> --
> --	g_object_set (G_OBJECT (sd->server),
> --		      SOUP_SERVER_HTTP_ALIASES, http_aliases,
> --		      SOUP_SERVER_HTTPS_ALIASES, https_aliases,
> --		      NULL);
> --
> --	for (i = 0; http_good[i]; i++)
> --		do_one_server_aliases_test (sd->base_uri, http_good[i], TRUE);
> --	for (i = 0; http_bad[i]; i++)
> --		do_one_server_aliases_test (sd->base_uri, http_bad[i], FALSE);
> --
> --	if (tls_available) {
> --		for (i = 0; https_good[i]; i++)
> --			do_one_server_aliases_test (sd->ssl_base_uri, https_good[i], TRUE);
> --		for (i = 0; https_bad[i]; i++)
> --			do_one_server_aliases_test (sd->ssl_base_uri, https_bad[i], FALSE);
> --	}
> --}
> --
> - static void
> - do_dot_dot_test (ServerData *sd, gconstpointer test_data)
> - {
> -@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
> - 
> - 	g_test_add ("/server/OPTIONS *", ServerData, NULL,
> - 		    server_setup, do_star_test, server_teardown);
> --	g_test_add ("/server/aliases", ServerData, NULL,
> --		    server_setup, do_server_aliases_test, server_teardown);
> - 	g_test_add ("/server/..-in-path", ServerData, NULL,
> - 		    server_setup, do_dot_dot_test, server_teardown);
> - 	g_test_add ("/server/ipv6", ServerData, NULL,
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
> deleted file mode 100644
> index 04713850e1..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -From 4a2bb98e03d79146c729dca52c8d6edc635218ff Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Mon, 8 Jul 2024 12:33:15 -0500
> -Subject: [PATCH] headers: Strictly don't allow NUL bytes
> -
> -In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
> -
> -CVE: CVE-2024-52530
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402/diffs?commit_id=04df03bc092ac20607f3e150936624d4f536e68b]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-headers.c      | 15 +++------
> - tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
> - 2 files changed, 32 insertions(+), 45 deletions(-)
> -
> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> -index eec28ad..e5d3c03 100644
> ---- a/libsoup/soup-headers.c
> -+++ b/libsoup/soup-headers.c
> -@@ -50,13 +50,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
> - 	 * ignorable trailing whitespace.
> - 	 */
> - 
> -+	/* No '\0's are allowed */
> -+	if (memchr (str, '\0', len))
> -+		return FALSE;
> -+
> - 	/* Skip over the Request-Line / Status-Line */
> - 	headers_start = memchr (str, '\n', len);
> - 	if (!headers_start)
> - 		return FALSE;
> --	/* No '\0's in the Request-Line / Status-Line */
> --	if (memchr (str, '\0', headers_start - str))
> --		return FALSE;
> - 
> - 	/* We work on a copy of the headers, which we can write '\0's
> - 	 * into, so that we don't have to individually g_strndup and
> -@@ -68,14 +69,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
> - 	headers_copy[copy_len] = '\0';
> - 	value_end = headers_copy;
> - 
> --	/* There shouldn't be any '\0's in the headers already, but
> --	 * this is the web we're talking about.
> --	 */
> --	while ((p = memchr (headers_copy, '\0', copy_len))) {
> --		memmove (p, p + 1, copy_len - (p - headers_copy));
> --		copy_len--;
> --	}
> --
> - 	while (*(value_end + 1)) {
> - 		name = value_end + 1;
> - 		name_end = strchr (name, ':');
> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> -index 752196e..c1d3b33 100644
> ---- a/tests/header-parsing-test.c
> -+++ b/tests/header-parsing-test.c
> -@@ -358,24 +358,6 @@ static struct RequestTest {
> - 	  }
> - 	},
> - 
> --	{ "NUL in header name", "760832",
> --	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
> --	  SOUP_STATUS_OK,
> --	  "GET", "/", SOUP_HTTP_1_1,
> --	  { { "Host", "example.com" },
> --	    { NULL }
> --	  }
> --	},
> --
> --	{ "NUL in header value", "760832",
> --	  "GET / HTTP/1.1\r\nHost: example\x00" "com\r\n", 35,
> --	  SOUP_STATUS_OK,
> --	  "GET", "/", SOUP_HTTP_1_1,
> --	  { { "Host", "examplecom" },
> --	    { NULL }
> --	  }
> --	},
> --
> - 	/************************/
> - 	/*** INVALID REQUESTS ***/
> - 	/************************/
> -@@ -448,6 +430,21 @@ static struct RequestTest {
> - 	  SOUP_STATUS_EXPECTATION_FAILED,
> - 	  NULL, NULL, -1,
> - 	  { { NULL } }
> -+	},
> -+
> -+	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
> -+	{ "NUL in header name", NULL,
> -+	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
> -+	  SOUP_STATUS_BAD_REQUEST,
> -+	  NULL, NULL, -1,
> -+	  { { NULL } }
> -+	},
> -+
> -+	{ "NUL in header value", NULL,
> -+	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> -+	  SOUP_STATUS_BAD_REQUEST,
> -+           NULL, NULL, -1,
> -+	  { { NULL } }
> - 	}
> - };
> - static const int num_reqtests = G_N_ELEMENTS (reqtests);
> -@@ -620,22 +617,6 @@ static struct ResponseTest {
> - 	    { NULL } }
> - 	},
> - 
> --	{ "NUL in header name", "760832",
> --	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
> --	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
> --	  { { "Foo", "bar" },
> --	    { NULL }
> --	  }
> --	},
> --
> --	{ "NUL in header value", "760832",
> --	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> --	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
> --	  { { "Foo", "bar" },
> --	    { NULL }
> --	  }
> --	},
> --
> - 	/********************************/
> - 	/*** VALID CONTINUE RESPONSES ***/
> - 	/********************************/
> -@@ -768,6 +749,19 @@ static struct ResponseTest {
> - 	  { { NULL }
> - 	  }
> - 	},
> -+
> -+	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
> -+	{ "NUL in header name", NULL,
> -+	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
> -+	  -1, 0, NULL,
> -+	  { { NULL } }
> -+	},
> -+
> -+	{ "NUL in header value", "760832",
> -+	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> -+	  -1, 0, NULL,
> -+	  { { NULL } }
> -+	},
> - };
> - static const int num_resptests = G_N_ELEMENTS (resptests);
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
> deleted file mode 100644
> index 9de0310c8d..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 8331e681c85c3b1893d8d5193783f631bfc07acb Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 16 May 2025 13:42:08 +0800
> -Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
> - soup_header_parse_semi_param_list()
> -
> -CVE: CVE-2024-52531
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - tests/header-parsing-test.c | 11 +++++++++++
> - 1 file changed, 11 insertions(+)
> -
> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> -index b811115..cfcc003 100644
> ---- a/tests/header-parsing-test.c
> -+++ b/tests/header-parsing-test.c
> -@@ -836,6 +836,17 @@ static struct ParamListTest {
> - 	    { "filename", "t\xC3\xA9st.txt" },
> - 	  },
> - 	},
> -+
> -+/* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
> -+	{ TRUE,
> -+	  "invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
> -+	   {
> -+		{ "filename", "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
> -+		{ "invalid", "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
> -+		{ "foo", NULL },
> -+	   },
> -+	}
> -+
> - };
> - static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
> deleted file mode 100644
> index 740c28c016..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 16 May 2025 13:52:37 +0800
> -Subject: [PATCH] headers: Be more robust against invalid input when
> - parsing params
> -
> -If you pass invalid input to a function such as soup_header_parse_param_list_strict()
> -it can cause an overflow if it decodes the input to UTF-8.
> -
> -This should never happen with valid UTF-8 input which libsoup's client API
> -ensures, however it's server API does not currently.
> -
> -CVE: CVE-2024-52531
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-headers.c | 45 +++++++++++++++++++++---------------------
> - 1 file changed, 23 insertions(+), 22 deletions(-)
> -
> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> -index 67905b2..39e8d34 100644
> ---- a/libsoup/soup-headers.c
> -+++ b/libsoup/soup-headers.c
> -@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const char *token)
> - }
> - 
> - static void
> --decode_quoted_string (char *quoted_string)
> -+decode_quoted_string_inplace (GString *quoted_gstring)
> - {
> -+	char *quoted_string = quoted_gstring->str;
> - 	char *src, *dst;
> - 
> - 	src = quoted_string + 1;
> -@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
> - }
> - 
> - static gboolean
> --decode_rfc5987 (char *encoded_string)
> -+decode_rfc5987_inplace (GString *encoded_gstring)
> - {
> - 	char *q, *decoded;
> - 	gboolean iso_8859_1 = FALSE;
> -+	const char *encoded_string = encoded_gstring->str;
> - 
> - 	q = strchr (encoded_string, '\'');
> - 	if (!q)
> -@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
> - 		decoded = utf8;
> - 	}
> - 
> --	/* If encoded_string was UTF-8, then each 3-character %-escape
> --	 * will be converted to a single byte, and so decoded is
> --	 * shorter than encoded_string. If encoded_string was
> --	 * iso-8859-1, then each 3-character %-escape will be
> --	 * converted into at most 2 bytes in UTF-8, and so it's still
> --	 * shorter.
> --	 */
> --	strcpy (encoded_string, decoded);
> -+	g_string_assign (encoded_gstring, decoded);
> - 	g_free (decoded);
> - 	return TRUE;
> - }
> -@@ -706,15 +701,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
> - {
> - 	GHashTable *params;
> - 	GSList *list, *iter;
> --	char *item, *eq, *name_end, *value;
> --	gboolean override, duplicated;
> - 
> - 	params = g_hash_table_new_full (soup_str_case_hash, 
> - 					soup_str_case_equal,
> --					g_free, NULL);
> -+					g_free, g_free);
> - 
> - 	list = parse_list (header, delim);
> - 	for (iter = list; iter; iter = iter->next) {
> -+ 		char *item, *eq, *name_end;
> -+		gboolean override, duplicated;
> -+		GString *parsed_value = NULL;
> - 		item = iter->data;
> - 		override = FALSE;
> - 
> -@@ -729,19 +725,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
> - 
> - 			*name_end = '\0';
> - 
> --			value = (char *)skip_lws (eq + 1);
> -+			parsed_value = g_string_new ((char *)skip_lws (eq + 1));
> - 
> - 			if (name_end[-1] == '*' && name_end > item + 1) {
> - 				name_end[-1] = '\0';
> --				if (!decode_rfc5987 (value)) {
> -+				if (!decode_rfc5987_inplace (parsed_value)) {
> -+					g_string_free (parsed_value, TRUE);
> - 					g_free (item);
> - 					continue;
> - 				}
> - 				override = TRUE;
> --			} else if (*value == '"')
> --				decode_quoted_string (value);
> --		} else
> --			value = NULL;
> -+			} else if (parsed_value->str[0] == '"')
> -+				decode_quoted_string_inplace (parsed_value);
> -+			}
> - 
> - 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
> - 
> -@@ -749,11 +745,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
> - 			soup_header_free_param_list (params);
> - 			params = NULL;
> - 			g_slist_foreach (iter, (GFunc)g_free, NULL);
> -+			if (parsed_value)
> -+				g_string_free (parsed_value, TRUE);
> - 			break;
> --		} else if (override || !duplicated)
> --			g_hash_table_replace (params, item, value);
> --		else
> -+		} else if (override || !duplicated) {
> -+			g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
> -+		} else {
> -+			if (parsed_value)
> -+				g_string_free (parsed_value, TRUE);
> - 			g_free (item);
> -+		}
> - 	}
> - 
> - 	g_slist_free (list);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
> deleted file mode 100644
> index cb1f096110..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
> -From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> -Date: Wed, 11 Sep 2024 11:52:11 +0200
> -Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
> -
> -Otherwise we can enter in a read loop because we were not
> -validating the data until the all the data was read.
> -
> -Fixes #391
> -
> -CVE: CVE-2024-52532
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-websocket-connection.c | 5 ++---
> - 1 file changed, 2 insertions(+), 3 deletions(-)
> -
> -diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
> -index a4095e1..65c1492 100644
> ---- a/libsoup/soup-websocket-connection.c
> -+++ b/libsoup/soup-websocket-connection.c
> -@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
> - 		}
> - 
> - 		pv->incoming->len = len + count;
> --	} while (count > 0);
> --
> --	process_incoming (self);
> -+		process_incoming (self);
> -+	} while (count > 0 && !pv->close_sent && !pv->io_closing);
> - 
> - 	if (end) {
> - 		if (!pv->close_sent || !pv->close_received) {
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
> deleted file mode 100644
> index dcadafe944..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
> -From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> -Date: Wed, 2 Oct 2024 11:17:19 +0200
> -Subject: [PATCH] websocket-test: disconnect error copy after the test ends
> -
> -Otherwise the server will have already sent a few more wrong
> -bytes and the client will continue getting errors to copy
> -but the error is already != NULL and it will assert
> -
> -CVE: CVE-2024-52532
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - tests/websocket-test.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> -index 5e40cf3..1ec9ff6 100644
> ---- a/tests/websocket-test.c
> -+++ b/tests/websocket-test.c
> -@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
> - 	GError *error = NULL;
> - 	InvalidEncodeLengthTest context = { test, NULL };
> - 	guint i;
> -+	guint error_id;
> - 
> --	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
> -+	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
> - 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
> - 
> - 	/* We use 127(\x7f) as payload length with 65535 extended length */
> -@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
> - 	WAIT_UNTIL (error != NULL || received != NULL);
> - 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
> - 	g_clear_error (&error);
> -+	g_signal_handler_disconnect (test->client, error_id);
> - 	g_assert_null (received);
> - 
> -         g_thread_join (thread);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
> deleted file mode 100644
> index ab6af72291..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
> -From: Simon McVittie <smcv@debian.org>
> -Date: Wed, 13 Nov 2024 14:14:23 +0000
> -Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another place
> -
> -This is the same change as commit 29b96fab "websocket-test: disconnect
> -error copy after the test ends", and is done for the same reason, but
> -replicating it into a different function.
> -
> -Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
> -Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
> -Signed-off-by: Simon McVittie <smcv@debian.org>
> -
> -CVE: CVE-2024-52532
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - tests/websocket-test.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> -index 2b19a7b..0699a06 100644
> ---- a/tests/websocket-test.c
> -+++ b/tests/websocket-test.c
> -@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
> - 	GError *error = NULL;
> - 	InvalidEncodeLengthTest context = { test, NULL };
> - 	guint i;
> -+	guint error_id;
> - 
> --	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
> -+	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
> - 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
> - 
> - 	/* We use 126(~) as payload length with 125 extended length */
> -@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
> - 	WAIT_UNTIL (error != NULL || received != NULL);
> - 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
> - 	g_clear_error (&error);
> -+        g_signal_handler_disconnect (test->client, error_id);
> - 	g_assert_null (received);
> - 
> - 	g_thread_join (thread);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
> deleted file mode 100644
> index 106f907168..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 12 May 2025 14:06:41 +0800
> -Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
> -
> -CVE: CVE-2025-2784
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304;
> - https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
> -
> -Test code is not added since it uses some functions not defined in
> -version 2.74. These tests are not used now, so just ignore them.
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-content-sniffer.c |  9 +++----
> - 1 files changed, 3 insertions(+), 4 deletions(-)
> -
> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
> -index 5f2896e..9554636 100644
> ---- a/libsoup/soup-content-sniffer.c
> -+++ b/libsoup/soup-content-sniffer.c
> -@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, SoupBuffer *buffer)
> - }
> - 
> - static gboolean
> --skip_insignificant_space (const char *resource, int *pos, int resource_length)
> -+skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
> - {
> -+	if (*pos >= resource_length)
> -+		return TRUE;
> - 	while ((resource[*pos] == '\x09') ||
> - 	       (resource[*pos] == '\x20') ||
> - 	       (resource[*pos] == '\x0A') ||
> -@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
> - {
> - 	const char *resource = (const char *)buffer->data;
> - 	int resource_length = MIN (512, buffer->length);
> --	int pos = 0;
> -+	gsize pos = 0;
> - 
> - 	if (resource_length < 3)
> - 		goto text_html;
> -@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
> - 		pos = 3;
> - 
> -  look_for_tag:
> --	if (pos > resource_length)
> --		goto text_html;
> --
> - 	if (skip_insignificant_space (resource, &pos, resource_length))
> - 		goto text_html;
> -
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
> deleted file mode 100644
> index c032846ef0..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Mon, 28 Oct 2024 12:29:48 -0500
> -Subject: [PATCH] Fix using int instead of size_t for strcspn return
> -
> -CVE: CVE-2025-32050
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-headers.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> -index 9707ca0..67905b2 100644
> ---- a/libsoup/soup-headers.c
> -+++ b/libsoup/soup-headers.c
> -@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
> - 		     const char *name,
> - 		     const char *value)
> - {
> --	int len;
> -+	gsize len;
> - 
> - 	g_string_append (string, name);
> - 	g_string_append (string, "=\"");
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
> deleted file mode 100644
> index 34bc8113a4..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From f4a67a9a3033586edaee715d40d5992e02d32893 Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Sat, 16 Nov 2024 12:07:30 -0600
> -Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
> -
> -Co-Author: Ar Jun <pkillarjun@protonmail.com>
> -
> -CVE: CVE-2025-32052
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-content-sniffer.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
> -index 9554636..eac9e7b 100644
> ---- a/libsoup/soup-content-sniffer.c
> -+++ b/libsoup/soup-content-sniffer.c
> -@@ -504,7 +504,7 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
> - 			guint index_pattern = 0;
> - 			gboolean skip_row = FALSE;
> - 
> --			while ((index_stream < resource_length) &&
> -+			while ((index_stream < resource_length - 1) &&
> - 			       (index_pattern <= type_row->pattern_length)) {
> - 				/* Skip insignificant white space ("WS" in the spec) */
> - 				if (type_row->pattern[index_pattern] == ' ') {
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
> deleted file mode 100644
> index 0d829d6200..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 12 May 2025 13:58:42 +0800
> -Subject: [PATCH] Fix heap buffer overflow in
> - soup-content-sniffer.c:sniff_feed_or_html()
> -
> -CVE: CVE-2025-32053
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-content-sniffer.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
> -index 967ec61..5f2896e 100644
> ---- a/libsoup/soup-content-sniffer.c
> -+++ b/libsoup/soup-content-sniffer.c
> -@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
> - 	       (resource[*pos] == '\x0D')) {
> - 		*pos = *pos + 1;
> - 
> --		if (*pos > resource_length)
> -+		if (*pos >= resource_length)
> - 			return TRUE;
> - 	}
> - 
> -@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
> - 		do {
> - 			pos++;
> - 
> --			if (pos > resource_length)
> -+			if ((pos + 1) > resource_length)
> - 				goto text_html;
> - 		} while (resource[pos] != '>');
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
> deleted file mode 100644
> index c33ebf8056..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Wed, 12 Feb 2025 11:30:02 -0600
> -Subject: [PATCH] headers: Handle parsing only newlines
> -
> -Closes #404
> -Closes #407
> -
> -CVE: CVE-2025-32906
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-headers.c      |  4 ++--
> - tests/header-parsing-test.c | 11 +++++++++++
> - 2 files changed, 13 insertions(+), 2 deletions(-)
> -
> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> -index e5d3c03..87bb3dc 100644
> ---- a/libsoup/soup-headers.c
> -+++ b/libsoup/soup-headers.c
> -@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *str,
> - 	/* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
> - 	 * received where a Request-Line is expected."
> - 	 */
> --	while ((*str == '\r' || *str == '\n') && len > 0) {
> -+	while (len > 0 && (*str == '\r' || *str == '\n')) {
> - 		str++;
> - 		len--;
> - 	}
> -@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          *str,
> - 	 * after a response, which we then see prepended to the next
> - 	 * response on that connection.
> - 	 */
> --	while ((*str == '\r' || *str == '\n') && len > 0) {
> -+	while (len > 0 && (*str == '\r' || *str == '\n')) {
> - 		str++;
> - 		len--;
> - 	}
> -diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> -index c1d3b33..b811115 100644
> ---- a/tests/header-parsing-test.c
> -+++ b/tests/header-parsing-test.c
> -@@ -6,6 +6,10 @@ typedef struct {
> - 	const char *name, *value;
> - } Header;
> - 
> -+static char only_newlines[] = {
> -+        '\n', '\n', '\n', '\n'
> -+};
> -+
> - static struct RequestTest {
> - 	const char *description;
> - 	const char *bugref;
> -@@ -445,6 +449,13 @@ static struct RequestTest {
> - 	  SOUP_STATUS_BAD_REQUEST,
> -            NULL, NULL, -1,
> - 	  { { NULL } }
> -+	},
> -+
> -+	{ "Only newlines", NULL,
> -+	  only_newlines, sizeof (only_newlines),
> -+	  SOUP_STATUS_BAD_REQUEST,
> -+           NULL, NULL, -1,
> -+	  { { NULL } }
> - 	}
> - };
> - static const int num_reqtests = G_N_ELEMENTS (reqtests);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
> deleted file mode 100644
> index 41dd3ff3f4..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
> -From: Milan Crha <mcrha@redhat.com>
> -Date: Tue, 15 Apr 2025 12:17:39 +0200
> -Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
> -
> -It had been skipping every second range, which generated an array
> -of a lot of insane ranges, causing large memory usage by the server.
> -
> -Closes #428
> -
> -Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
> -
> -CVE: CVE-2025-32907
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836]
> -
> -Test part not applied since test codes use some functions not in this
> -version
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-message-headers.c |   1 +
> - 1 files changed, 1 insertions(+)
> -
> -diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
> -index 78b2455..00b9763 100644
> ---- a/libsoup/soup-message-headers.c
> -+++ b/libsoup/soup-message-headers.c
> -@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
> - 			if (cur->start <= prev->end) {
> - 				prev->end = MAX (prev->end, cur->end);
> - 				g_array_remove_index (array, i);
> -+				i--;
> - 			}
> - 		}
> - 	}
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
> deleted file mode 100644
> index 2f5366348d..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From e6e088e62c10ab91fa2f2ad5c122332aa7cde97c Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 12 May 2025 16:55:37 +0800
> -Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than
> - 4 bytes
> -
> -CVE: CVE-2025-32909
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-content-sniffer.c | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
> -index eac9e7b..73d2245 100644
> ---- a/libsoup/soup-content-sniffer.c
> -+++ b/libsoup/soup-content-sniffer.c
> -@@ -227,9 +227,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, SoupBuffer *buffer)
> - {
> - 	const char *resource = (const char *)buffer->data;
> - 	guint resource_length = MIN (512, buffer->length);
> --	guint32 box_size = *((guint32*)resource);
> -+	guint32 box_size;
> - 	guint i;
> - 
> -+	if (resource_length < sizeof (guint32))
> -+		return FALSE;
> -+
> -+	box_size = *((guint32*)resource);
> -+
> - #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> - 	box_size = ((box_size >> 24) |
> - 		    ((box_size << 8) & 0x00FF0000) |
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
> deleted file mode 100644
> index c1dc6860f2..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 12 May 2025 17:02:55 +0800
> -Subject: [PATCH] auth-digest: Handle missing realm/nonce in authenticate
> - header
> -
> -CVE: CVE-2025-32910
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-auth-digest.c |  3 +++
> - 1 files changed, 3 insertions(+)
> -
> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> -index e8ba990..0ab3499 100644
> ---- a/libsoup/soup-auth-digest.c
> -+++ b/libsoup/soup-auth-digest.c
> -@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
> - 	guint qop_options;
> - 	gboolean ok = TRUE;
> - 
> -+	 if (!soup_auth_get_realm (auth))
> -+		return FALSE;
> -+
> - 	g_free (priv->domain);
> - 	g_free (priv->nonce);
> - 	g_free (priv->opaque);
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
> deleted file mode 100644
> index 019a35e3be..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 16 May 2025 13:19:38 +0800
> -Subject: [PATCH] auth-digest: Handle missing nonce
> -
> -CVE: CVE-2025-32910
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++----------
> - 1 files changed, 28 insertions(+), 10 deletions(-)
> -
> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> -index 0ab3499..10a8591 100644
> ---- a/libsoup/soup-auth-digest.c
> -+++ b/libsoup/soup-auth-digest.c
> -@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
> - 	return g_string_free (out, FALSE);
> - }
> - 
> -+static gboolean
> -+validate_params (SoupAuthDigest *auth_digest)
> -+{
> -+	SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
> -+
> -+	if (priv->qop || priv->algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
> -+		if (!priv->nonce)
> -+			return FALSE;
> -+	}
> -+
> -+	return TRUE;
> -+}
> -+
> - static gboolean
> - soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
> - 			 GHashTable *auth_params)
> -@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
> - 	if (priv->algorithm == -1)
> - 		ok = FALSE;
> - 
> --	stale = g_hash_table_lookup (auth_params, "stale");
> --	if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
> --		recompute_hex_a1 (priv);
> --	else {
> --		g_free (priv->user);
> --		priv->user = NULL;
> --		g_free (priv->cnonce);
> --		priv->cnonce = NULL;
> --		memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> --		memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> --        }
> -+	if (!validate_params (auth_digest))
> -+		ok = FALSE;
> -+
> -+	if (ok) {
> -+		stale = g_hash_table_lookup (auth_params, "stale");
> -+		if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
> -+			recompute_hex_a1 (priv);
> -+		else {
> -+			g_free (priv->user);
> -+			priv->user = NULL;
> -+			g_free (priv->cnonce);
> -+			priv->cnonce = NULL;
> -+			memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> -+			memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> -+		}
> -+	}
> - 
> - 	return ok;
> - }
> -@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char        *method,
> - 	if (qop) {
> - 		char tmp[9];
> - 
> -+		g_assert (cnonce);
> -+
> - 		g_snprintf (tmp, 9, "%.8x", nc);
> - 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
> - 		g_checksum_update (checksum, (guchar *)":", 1);
> -@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
> - 	g_return_val_if_fail (uri != NULL, NULL);
> - 	url = soup_uri_to_string (uri, TRUE);
> - 
> -+	g_assert (priv->nonce);
> -+	g_assert (!priv->qop || priv->cnonce);
> -+
> - 	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
> - 					   priv->qop, priv->nonce,
> - 					   priv->cnonce, priv->nc,
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
> deleted file mode 100644
> index bdf4d64ca3..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 16 May 2025 13:21:43 +0800
> -Subject: [PATCH] auth-digest: Fix leak
> -
> -CVE: CVE-2025-32910
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-auth-digest.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> -index 10a8591..6d965d2 100644
> ---- a/libsoup/soup-auth-digest.c
> -+++ b/libsoup/soup-auth-digest.c
> -@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
> - 	g_free (priv->nonce);
> - 	g_free (priv->domain);
> - 	g_free (priv->cnonce);
> -+	g_free (priv->opaque);
> - 
> - 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> - 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
> deleted file mode 100644
> index b3ce9d8bc3..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 16 May 2025 13:25:32 +0800
> -Subject: [PATCH] auth-digest: Handle missing nonce
> -
> -CVE: CVE-2025-32912
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434
> -https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-auth-digest.c | 2 +-
> - 1 files changed, 1 insertions(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> -index 6d965d2..f1621ec 100644
> ---- a/libsoup/soup-auth-digest.c
> -+++ b/libsoup/soup-auth-digest.c
> -@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
> - 	guint qop_options;
> - 	gboolean ok = TRUE;
> - 
> --	 if (!soup_auth_get_realm (auth))
> -+	if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
> - 		return FALSE;
> - 
> - 	g_free (priv->domain);
> -
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
> deleted file mode 100644
> index 9f3bb21a25..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 12 May 2025 16:17:20 +0800
> -Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
> - libsoup through function "soup_multipart_new_from_message" in
> - soup-multipart.c leads to crash or exit of process"
> -
> -CVE: CVE-2025-32914
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
> -
> -Test code are not added since some functions not aligned with version
> -2.74.3
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-multipart.c |  2 +-
> - 1 files changed, 1 insertions(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
> -index a7e550f..dd93973 100644
> ---- a/libsoup/soup-multipart.c
> -+++ b/libsoup/soup-multipart.c
> -@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
> - 			return NULL;
> - 		}
> - 
> --		split = strstr (start, "\r\n\r\n");
> -+		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
> - 		if (!split || split > end) {
> - 			soup_multipart_free (multipart);
> - 			soup_buffer_free (flattened);
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
> deleted file mode 100644
> index 874f62e7ad..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 16 May 2025 14:16:10 +0800
> -Subject: [PATCH] auth-digest: fix crash in
> - soup_auth_digest_get_protection_space()
> -
> -We need to validate the Domain parameter in the WWW-Authenticate header.
> -
> -Unfortunately this crash only occurs when listening on default ports 80
> -and 443, so there's no good way to test for this. The test would require
> -running as root.
> -
> -Fixes #440
> -
> -CVE: CVE-2025-4476
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-auth-digest.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> -index f1621ec..a2dc560 100644
> ---- a/libsoup/soup-auth-digest.c
> -+++ b/libsoup/soup-auth-digest.c
> -@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
> - 			uri = soup_uri_new (d);
> - 			if (uri && uri->scheme == source_uri->scheme &&
> - 			    uri->port == source_uri->port &&
> --			    !strcmp (uri->host, source_uri->host))
> -+			    !g_strcmp0 (uri->host, source_uri->host))
> - 				dir = g_strdup (uri->path);
> - 			else
> - 				dir = NULL;
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
> deleted file mode 100644
> index c970661694..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Thu, 26 Dec 2024 18:31:42 -0600
> -Subject: [PATCH] soup_header_parse_quality_list: Fix leak
> -
> -When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
> -
> -CVE: CVE-2025-46420
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e]
> -
> - Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-headers.c | 11 +++++------
> - 1 file changed, 5 insertions(+), 6 deletions(-)
> -
> -diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> -index 87bb3dc..9707ca0 100644
> ---- a/libsoup/soup-headers.c
> -+++ b/libsoup/soup-headers.c
> -@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
> - 	GSList *unsorted;
> - 	QualityItem *array;
> - 	GSList *sorted, *iter;
> --	char *item, *semi;
> -+	char *semi;
> - 	const char *param, *equal, *value;
> - 	double qval;
> - 	int n;
> -@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
> - 	unsorted = soup_header_parse_list (header);
> - 	array = g_new0 (QualityItem, g_slist_length (unsorted));
> - 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
> --		item = iter->data;
> - 		qval = 1.0;
> --		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
> -+		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
> - 			param = skip_lws (semi + 1);
> - 			if (*param != 'q')
> - 				continue;
> -@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
> - 		if (qval == 0.0) {
> - 			if (unacceptable) {
> - 				*unacceptable = g_slist_prepend (*unacceptable,
> --								 item);
> -+								 g_steal_pointer (&iter->data));
> - 			}
> - 		} else {
> --			array[n].item = item;
> -+			array[n].item = g_steal_pointer (&iter->data);
> - 			array[n].qval = qval;
> - 			n++;
> - 		}
> - 	}
> --	g_slist_free (unsorted);
> -+	g_slist_free_full (unsorted, g_free);
> - 
> - 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
> - 	sorted = NULL;
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> deleted file mode 100644
> index 3318093400..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
> -From: Patrick Griffis <pgriffis@igalia.com>
> -Date: Wed, 5 Feb 2025 16:18:10 -0600
> -Subject: [PATCH] session: Strip authentication credentails on
> - cross-origin redirect
> -
> -This should match the behavior of Firefox and Safari but not of Chromium.
> -
> -CVE: CVE-2025-46421
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
> -
> -Test code not added since it included some headers not in version 2.74.3
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-session.c |  8 ++++-
> - 2 files changed, 85 insertions(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
> -index 83421ef..8d6ac61 100644
> ---- a/libsoup/soup-session.c
> -+++ b/libsoup/soup-session.c
> -@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
> - 						   SOUP_ENCODING_NONE);
> - 	}
> - 
> -+	/* Strip all credentials on cross-origin redirect. */
> -+	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
> -+		soup_message_headers_remove (msg->request_headers, "Authorization");
> -+		soup_message_set_auth (msg, NULL);
> -+	}
> -+
> - 	soup_message_set_uri (msg, new_uri);
> - 	soup_uri_free (new_uri);
> - 
> - 	soup_session_requeue_message (session, msg);
> - 	return TRUE;
> --}
> -+}
> - 
> - static void
> - redirect_handler (SoupMessage *msg, gpointer user_data)
> - 
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
> deleted file mode 100644
> index c9fbdbacc8..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -From 3844026f74a41dd9ccab955899e005995293d246 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Tue, 8 Jul 2025 14:58:30 +0800
> -Subject: [PATCH] soup-date-utils: Add value checks for date/time parsing
> -
> -Reject date/time when it does not represent a valid value.
> -
> -Closes #448
> -
> -CVE: CVE-2025-4945
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/8988379984e33dcc7d3aa58551db13e48755959f]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-date.c  | 21 +++++++++++++++------
> - tests/cookies-test.c | 10 ++++++++++
> - 2 files changed, 25 insertions(+), 6 deletions(-)
> -
> -diff --git a/libsoup/soup-date.c b/libsoup/soup-date.c
> -index 9602d1f..4c114c1 100644
> ---- a/libsoup/soup-date.c
> -+++ b/libsoup/soup-date.c
> -@@ -284,7 +284,7 @@ parse_day (SoupDate *date, const char **date_string)
> - 	while (*end == ' ' || *end == '-')
> - 		end++;
> - 	*date_string = end;
> --	return TRUE;
> -+	return date->day >= 1 && date->day <= 31;
> - }
> - 
> - static inline gboolean
> -@@ -324,7 +324,7 @@ parse_year (SoupDate *date, const char **date_string)
> - 	while (*end == ' ' || *end == '-')
> - 		end++;
> - 	*date_string = end;
> --	return TRUE;
> -+	return date->year > 0 && date->year < 9999;
> - }
> - 
> - static inline gboolean
> -@@ -348,7 +348,7 @@ parse_time (SoupDate *date, const char **date_string)
> - 	while (*p == ' ')
> - 		p++;
> - 	*date_string = p;
> --	return TRUE;
> -+	return  date->hour >= 0 && date->hour < 24 && date->minute >= 0 && date->minute < 60 && date->second >= 0 && date->second < 60;
> - }
> - 
> - static inline gboolean
> -@@ -361,8 +361,15 @@ parse_timezone (SoupDate *date, const char **date_string)
> - 		gulong val;
> - 		int sign = (**date_string == '+') ? -1 : 1;
> - 		val = strtoul (*date_string + 1, (char **)date_string, 10);
> -+		if (val > 9999)
> -+			return FALSE;
> - 		if (**date_string == ':')
> --			val = 60 * val + strtoul (*date_string + 1, (char **)date_string, 10);
> -+		{
> -+			gulong val2 = strtoul (*date_string + 1, (char **)date_string, 10);
> -+			if (val > 99 || val2 > 99)
> -+				return FALSE;
> -+			val = 60 * val + val2;
> -+		}
> - 		else
> - 			val =  60 * (val / 100) + (val % 100);
> - 		date->offset = sign * val;
> -@@ -407,7 +414,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
> - 		if (!parse_month (date, &date_string) ||
> - 		    !parse_day (date, &date_string) ||
> - 		    !parse_time (date, &date_string) ||
> --		    !parse_year (date, &date_string))
> -+		    !parse_year (date, &date_string) ||
> -+		    !g_date_valid_dmy(date->day, date->month, date->year))
> - 			return FALSE;
> - 
> - 		/* There shouldn't be a timezone, but check anyway */
> -@@ -419,7 +427,8 @@ parse_textual_date (SoupDate *date, const char *date_string)
> - 		if (!parse_day (date, &date_string) ||
> - 		    !parse_month (date, &date_string) ||
> - 		    !parse_year (date, &date_string) ||
> --		    !parse_time (date, &date_string))
> -+		    !parse_time (date, &date_string) ||
> -+		    !g_date_valid_dmy(date->day, date->month, date->year))
> - 			return FALSE;
> - 
> - 		/* This time there *should* be a timezone, but we
> -diff --git a/tests/cookies-test.c b/tests/cookies-test.c
> -index 2e2a54f..6035a86 100644
> ---- a/tests/cookies-test.c
> -+++ b/tests/cookies-test.c
> -@@ -413,6 +413,15 @@ do_remove_feature_test (void)
> - 	soup_uri_free (uri);
> - }
> - 
> -+static void
> -+do_cookies_parsing_int32_overflow (void)
> -+{
> -+	SoupCookie *cookie = soup_cookie_parse ("Age=1;expires=3Mar9    999:9:9+ 999999999-age=main=gne=", NULL);
> -+	g_assert_nonnull (cookie);
> -+	g_assert_null (soup_cookie_get_expires (cookie));
> -+	soup_cookie_free (cookie);
> -+}
> -+
> - int
> - main (int argc, char **argv)
> - {
> -@@ -434,6 +443,7 @@ main (int argc, char **argv)
> - 	g_test_add_func ("/cookies/accept-policy-subdomains", do_cookies_subdomain_policy_test);
> - 	g_test_add_func ("/cookies/parsing", do_cookies_parsing_test);
> - 	g_test_add_func ("/cookies/parsing/no-path-null-origin", do_cookies_parsing_nopath_nullorigin);
> -+	g_test_add_func ("/cookies/parsing/int32-overflow", do_cookies_parsing_int32_overflow);
> - 	g_test_add_func ("/cookies/get-cookies/empty-host", do_get_cookies_empty_host_test);
> - 	g_test_add_func ("/cookies/remove-feature", do_remove_feature_test);
> - 	g_test_add_func ("/cookies/secure-cookies", do_cookies_strict_secure_test);
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
> deleted file mode 100644
> index b15b8c763d..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
> -From: Milan Crha <mcrha@redhat.com>
> -Date: Thu, 15 May 2025 17:49:11 +0200
> -Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
> -
> -It could happen that the boundary started at a place which resulted into
> -a negative number, which in an unsigned integer is a very large value.
> -Check the body size is not a negative value before setting it.
> -
> -Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
> -
> -Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
> -
> -CVE: CVE-2025-4948
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-multipart.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
> -index dd93973..ce2fc10 100644
> ---- a/libsoup/soup-multipart.c
> -+++ b/libsoup/soup-multipart.c
> -@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
> - 		 */
> - 		part_body = soup_buffer_new_subbuffer (flattened,
> - 						       split - flattened->data,
> --						       end - 2 - split);
> -+						       end - 2 >= split ? end - 2 - split : 0);
> - 		g_ptr_array_add (multipart->bodies, part_body);
> - 
> - 		start = end;
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
> deleted file mode 100644
> index 7bc3e8da99..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From a7d0c58608ed830bedfb6b92aea11e00feb55aa9 Mon Sep 17 00:00:00 2001
> -From: Milan Crha <mcrha@redhat.com>
> -Date: Mon, 19 May 2025 17:48:27 +0200
> -Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
> - members
> -
> -The boundary could be at a place which, calculated, pointed
> -before the beginning of the array. Check the bounds, to avoid
> -read out of the array bounds.
> -
> -Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
> -
> -CVE: CVE-2025-4969
> -Upstream-Status: Backport
> -[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?commit_id=b5b4dd10d4810f0c87b4eaffe88504f06e502f33]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - libsoup/soup-multipart.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
> -index ce2fc10..a29cdf0 100644
> ---- a/libsoup/soup-multipart.c
> -+++ b/libsoup/soup-multipart.c
> -@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
> - 			continue;
> - 
> - 		/* Check that it's at start of line */
> --		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
> -+		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
> - 			continue;
> - 
> - 		/* Check for "--" or "\r\n" after boundary */
> --- 
> -2.34.1
> -
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> deleted file mode 100644
> index 68ec576d9b..0000000000
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -SUMMARY = "An HTTP library implementation in C"
> -DESCRIPTION = "libsoup is an HTTP client/server library for GNOME. It uses GObjects \
> -and the glib main loop, to integrate well with GNOME applications."
> -HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -SECTION = "x11/gnome/libs"
> -LICENSE = "LGPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> -
> -DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
> -
> -SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> -
> -SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> -           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
> -           file://0001-CVE-2025-32911.patch \
> -           file://0001-Fix-possibly-uninitialized-warnings.patch \
> -           file://0001-Remove-http-and-https-aliases-support-test.patch \
> -           file://CVE-2024-52532-1.patch \
> -           file://CVE-2024-52532-2.patch \
> -           file://CVE-2024-52532-3.patch \
> -           file://CVE-2025-32053.patch \
> -           file://CVE-2025-2784.patch \
> -           file://CVE-2024-52530.patch \
> -           file://CVE-2025-32906.patch \
> -           file://CVE-2025-32914.patch \
> -           file://CVE-2025-46420.patch \
> -           file://CVE-2025-46421.patch \
> -           file://CVE-2025-32050.patch \
> -           file://CVE-2025-32052.patch \
> -           file://CVE-2025-32909.patch \
> -           file://CVE-2025-32910-1.patch \
> -           file://CVE-2025-32910-2.patch \
> -           file://CVE-2025-32910-3.patch \
> -           file://CVE-2025-32912.patch \
> -           file://CVE-2024-52531-1.patch \
> -           file://CVE-2024-52531-2.patch \
> -           file://CVE-2025-4476.patch \
> -           file://CVE-2025-32907.patch \
> -           file://CVE-2025-4948.patch \
> -           file://CVE-2025-4969.patch \
> -           file://CVE-2025-4945.patch \
> -"
> -SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
> -
> -CVE_PRODUCT = "libsoup"
> -
> -S = "${UNPACKDIR}/libsoup-${PV}"
> -
> -inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
> -
> -UPSTREAM_CHECK_REGEX = "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
> -
> -GIR_MESON_ENABLE_FLAG = 'enabled'
> -GIR_MESON_DISABLE_FLAG = 'disabled'
> -
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[brotli] = "-Dbrotli=enabled,-Dbrotli=disabled,brotli"
> -# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
> -PACKAGECONFIG[gnome] = "-Dgnome=true,-Dgnome=false"
> -PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
> -PACKAGECONFIG[ntlm] = "-Dntlm=enabled,-Dntlm=disabled"
> -PACKAGECONFIG[sysprof] = "-Dsysprof=enabled,-Dsysprof=disabled,sysprof"
> -
> -# Tell libsoup where the target ntlm_auth is installed
> -do_write_config:append:class-target() {
> -    cat >${WORKDIR}/soup.cross <<EOF
> -[binaries]
> -ntlm_auth = '${bindir}/ntlm_auth'
> -EOF
> -}
> -EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/soup.cross"
> -
> -EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
> -
> -GTKDOC_MESON_OPTION = "gtk_doc"
> -
> -# When built without gnome support, libsoup-2.4 will contain only one shared lib
> -# and will therefore become subject to renaming by debian.bbclass. Prevent
> -# renaming in order to keep the package name consistent regardless of whether
> -# gnome support is enabled or disabled.
> -DEBIAN_NOAUTONAME:${PN} = "1"
> -
> -# glib-networking is needed for SSL, proxies, etc.
> -RRECOMMENDS:${PN} = "glib-networking"
> -
> -BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125832): https://lists.openembedded.org/g/openembedded-devel/message/125832
> Mute This Topic: https://lists.openembedded.org/mt/118574993/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


