Return-Path: <b.hutchman@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 221BE71A19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 13:52:08 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id w194so71ybe.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=poiLGsuNIwPVBSD9YM0Rt3b9Q6xRA6Ocj78IN7uk/CY=;
	b=XfWOyMYl8h2nue3bByXNLig5zakEqjIWQ+YObJ26rMsdoELRrcC81CmaD/KlzTKbYY
	whXm+AjAeDZEZygRc8fuyhKhNsj4pJjMj95q6OThF+k14wT7KPjnAZeiQQijweh+ZTnH
	ihbXa5L5gHalntIkroOKV3IBCEurmhA+ioc3fzL1Sa1rSvJ7hCXL8fpvuYPebWbXbsTL
	Yg6NSbSjRMBYH9OXDUmtYSKIhPsCy317Q0q22LilQqjMAZ+h0atZF59cOF+DZvEpdHkz
	Qqa2pxVcg/2IJE6L1eiNNJFnbER3KE4yaXlcx4Gn/erfTWjBN2/gaZ2aqidyuSilWVcy
	mSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=poiLGsuNIwPVBSD9YM0Rt3b9Q6xRA6Ocj78IN7uk/CY=;
	b=kOqV4IgVLezpvi+aiAOf0i6vH8wfEJAXUJdQOCrEEYUDkQiZIa04R5wvo1+IKRm5v8
	9qsPFs0qB1520Iw+Fxbe8GkeIQe15tQb3ccGYAZr3hLNkwWRKX512Mnu5BZT8hzexTJ7
	1yJN4YoWFuA3HP9eyj5NeXsZ2lCzq+99uPM+WOvKiF+ldxNDNuuVYGiVovxkqcBMdzLE
	3U+thYopGZBwvMfIBrTdDdNF+tVkpLB4yzlV3FqUsB+PQcgilbk6G4mXOfb/OHggALCG
	caFvDTYuZ8PwYLuhaNchPs6m+2Q4Vf3XDULrjr7vx8gsjTDMDBy5rgfTBdgBLk4nzGKa
	tanQ==
X-Gm-Message-State: AIkVDXIm2dXVLjhQWKfvnzen2ZAY0MNXghKNxWAQ7TaEZLeXCMGciVu0rJ06xWkjfBpuwcCQehPAmBaEXVG1Ww==
X-Received: by 10.37.37.81 with SMTP id l78mr4354837ybl.53.1484142728849; Wed,
	11 Jan 2017 05:52:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.221.143 with HTTP; Wed, 11 Jan 2017 05:52:08 -0800 (PST)
In-Reply-To: <1482363538-28271-1-git-send-email-derek@asterius.io>
References: <1482363538-28271-1-git-send-email-derek@asterius.io>
From: Brian Hutchinson <b.hutchman@gmail.com>
Date: Wed, 11 Jan 2017 08:52:08 -0500
Message-ID: <CAFZh4h81OfiN9UXDM-cZyqUexaBStK16LHSg8zPu00d9t4+27w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] apache2: update to version 2.4.25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2017 13:52:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 6:38 PM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  ...2-native_2.4.23.bb => apache2-native_2.4.25.bb} |  4 ++--
>  .../apache2/apache2/cve-2016-5387.patch            | 25 ----------------------
>  .../{apache2_2.4.23.bb => apache2_2.4.25.bb}       |  5 ++---
>  3 files changed, 4 insertions(+), 30 deletions(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.23.bb => apache2-native_2.4.25.bb} (91%)
>  delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.23.bb => apache2_2.4.25.bb} (97%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> similarity index 91%
> rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> index b227f19..ca8ebaf 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> @@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>  S = "${WORKDIR}/httpd-${PV}"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
> -SRC_URI[md5sum] = "04f19c60e810c028f5240a062668a688"
> -SRC_URI[sha256sum] = "0c1694b2aad7765896faf92843452ee2555b9591ae10d4f19b245f2adfe85e58"
> +SRC_URI[md5sum] = "2826f49619112ad5813c0be5afcc7ddb"
> +SRC_URI[sha256sum] = "f87ec2df1c9fee3e6bfde3c8b855a3ddb7ca1ab20ca877bd0e2b6bf3f05c80b2"
>
>  EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
>                  --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch b/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
> deleted file mode 100644
> index dbcdfc6..0000000
> --- a/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -This patch has been copied from https://www.apache.org/security/asf-httpoxy-response.txt
> -as a mitigation of CVE-2016-5387.
> -
> -Upstream-Status: Backport - fixed in 2.4.24
> -
> -Signed-off-by: Joe Slater<jslater@windriver.com>
> -
> -
> ---- a/server/util_script.c     (revision 1752426)
> -+++ b/server/util_script.c     (working copy)
> -@@ -186,6 +186,14 @@ AP_DECLARE(void) ap_add_common_vars(request_rec *r
> -         else if (!strcasecmp(hdrs[i].key, "Content-length")) {
> -             apr_table_addn(e, "CONTENT_LENGTH", hdrs[i].val);
> -         }
> -+        /* HTTP_PROXY collides with a popular envvar used to configure
> -+         * proxies, don't let clients set/override it.  But, if you must...
> -+         */
> -+#ifndef SECURITY_HOLE_PASS_PROXY
> -+        else if (!strcasecmp(hdrs[i].key, "Proxy")) {
> -+            ;
> -+        }
> -+#endif
> -         /*
> -          * You really don't want to disable this check, since it leaves you
> -          * wide open to CGIs stealing passwords and people viewing them
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> similarity index 97%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> index b78ff51..3bd8579 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> @@ -17,15 +17,14 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>             file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
>             file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
>             file://configure-allow-to-disable-selinux-support.patch \
> -           file://cve-2016-5387.patch \
>             file://init \
>             file://apache2-volatile.conf \
>             file://apache2.service \
>            "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
> -SRC_URI[md5sum] = "04f19c60e810c028f5240a062668a688"
> -SRC_URI[sha256sum] = "0c1694b2aad7765896faf92843452ee2555b9591ae10d4f19b245f2adfe85e58"
> +SRC_URI[md5sum] = "2826f49619112ad5813c0be5afcc7ddb"
> +SRC_URI[sha256sum] = "f87ec2df1c9fee3e6bfde3c8b855a3ddb7ca1ab20ca877bd0e2b6bf3f05c80b2"
>
>  S = "${WORKDIR}/httpd-${PV}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


How long does it typically take for something like this to show up in
the Krogoth (2.1.2) and Morty (2.2) branch?

Just wondering because I did a fresh checked of both yesterday and
they didn't have this fix yet.

Regards,

Brian

