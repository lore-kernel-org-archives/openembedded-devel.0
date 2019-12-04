Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A82827F7C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 17:02:53 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b5so414824qtt.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2019 09:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=US3J4Z95RsPFiYwnd+A78XxqqHZc+YzDCq6NanFjpZQ=;
	b=Jr/qKXnOS/GJ6ZPjrVQEA2jqmelRkKPidk6oiOmmkcbsezS3v29vgLVe5N6UOIlB0V
	QErOHJMF29IZxz13aFc4VLOry9Rn5qqx9xwJfXgVojuzVqyZHwOgPMQpYWhDqNfGc6PI
	JpOQn65S6n58bSPVret8kV/FJFcbHGfIupSZI47NfiNKEr6Qz5hjIJhWTgR971o3YVcv
	+SEQ/mC/J58PDyuKd00TGU6ycub67Yb2Jzp4HUjlKYQYZLdsm7hpgHXCeol9sjaheqBQ
	tnZlqfpowb0kro19fsBjOAtAr/417aTLIzJzbGLNPpGFxuMCr1fdhnKXZbZE474DwIIt
	pliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=US3J4Z95RsPFiYwnd+A78XxqqHZc+YzDCq6NanFjpZQ=;
	b=OsIpa1p8HppCkRTm/+KbadyMooCcgKJlwzlcOlJWquDs8itWU97Wl9P+F5ux6sI6L5
	TxP7Tn2MYHf8Cj0nRorJJFuyWsLtsUYi+buP4jdNz4b44ObeUuFQT2Kf302YEdRE2/z/
	u8P7FyK26+q0Uj8uyFS5El8CgB9GOelzgUEEGt8hx/rMxps4MMbsKg3o+knzof6JLk8s
	d5wxC2rlUqoCOxJ1LAj8LkBXy10kZ2Z2ym4dVfbLkUPKKwGAt7PIoR3KAp1gKQeQiNWq
	58s8IK9fBgKolmebZJkWQUSpuN0o660jN+zRyFcCe4P0px2Nbdk+UwJi8iRy5q8J5kBk
	EMkg==
X-Gm-Message-State: APjAAAU10bfeBjJ/Nf6bOSgd9EmFG9ZCCsUh0510TvLWAxgVJVad80Fd
	iMWitQ7jtqdEzdgVgTqF3NXn2UpYL1M8UwyAGJc=
X-Google-Smtp-Source: APXvYqyVcMVwYKDc0dZ0M4RwZvPGeriS3sKZhpr5FiCtFNnxJdQt3jWd7Ocp6WxmSZC6pvmC02Gez1giomelYrxYxwc=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr3686956qtm.88.1575478974067;
	Wed, 04 Dec 2019 09:02:54 -0800 (PST)
MIME-Version: 1.0
References: <1575471738-11717-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1575471738-11717-1-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 09:02:27 -0800
Message-ID: <CAMKF1srNwAbX=L8pekC1GrghYv5yrJ43E28PB0Ehhh=C=-01sg@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-jsonschema: 3.1.1 -> 3.2.0
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
X-List-Received-Date: Wed, 04 Dec 2019 17:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 4, 2019 at 12:42 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> 0001-setup.cfg-add-non-GPL-format-option.patch
> Removed since it is included in 3.2.0
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-jsonschema.inc  |  6 +-
>  .../0001-setup.cfg-add-non-GPL-format-option.patch | 96 ----------------------
>  ...nschema_3.1.1.bb => python-jsonschema_3.2.0.bb} |  0
>  ...schema_3.1.1.bb => python3-jsonschema_3.2.0.bb} |  0
>  4 files changed, 3 insertions(+), 99 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
>  rename meta-python/recipes-devtools/python/{python-jsonschema_3.1.1.bb => python-jsonschema_3.2.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-jsonschema_3.1.1.bb => python3-jsonschema_3.2.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
> index 258bead..df1d3ef 100644
> --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
> @@ -7,10 +7,10 @@ DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
>
>  FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
>
> -SRC_URI_append = " file://0001-setup.cfg-add-non-GPL-format-option.patch"
> +SRC_URI_append = ""

remove it completely, empty append is of no use.

>
> -SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
> -SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
> +SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
> +SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
>
>  PACKAGECONFIG ??= "format"
>  PACKAGECONFIG[format] = ",,,\
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch b/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
> deleted file mode 100644
> index afc38a3..0000000
> --- a/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From 8df0332475991884b8e1801d31f9c3e06d06bf9f Mon Sep 17 00:00:00 2001
> -From: Nicola Lunghi <nick83ola@gmail.com>
> -Date: Thu, 14 Nov 2019 18:58:56 +0000
> -Subject: [PATCH] setup.cfg: add non GPL format option
> -
> -This is a rewrite of the following upstream commits:
> -
> - - 10f8a3e Add format validators as separate modules
> - - af37707 non GPL format option
> -
> -removing all the non necessary bits (tox in particular)
> -
> -Original author: Nicolas Aimetti <naimetti@yahoo.com.ar>
> -
> -Upstream-status: Backported. [ to be removed for releases > 3.1.1 ]
> ----
> - jsonschema/_format.py | 33 ++++++++++++++++++++++++++++-----
> - setup.cfg             |  6 ++++++
> - 2 files changed, 34 insertions(+), 5 deletions(-)
> -
> -diff --git a/jsonschema/_format.py b/jsonschema/_format.py
> -index aa04090..c967d98 100644
> ---- a/jsonschema/_format.py
> -+++ b/jsonschema/_format.py
> -@@ -248,7 +248,26 @@ else:
> - try:
> -     import rfc3987
> - except ImportError:
> --    pass
> -+    try:
> -+        from rfc3986_validator import validate_rfc3986
> -+    except ImportError:
> -+        pass
> -+    else:
> -+        @_checks_drafts(name="uri",)
> -+        def is_uri(instance):
> -+            if not isinstance(instance, str_types):
> -+                return True
> -+            return validate_rfc3986(instance, rule="URI")
> -+
> -+        @_checks_drafts(
> -+            draft6="uri-reference",
> -+            draft7="uri-reference",
> -+            raises=ValueError,
> -+        )
> -+        def is_uri_reference(instance):
> -+            if not isinstance(instance, str_types):
> -+                return True
> -+            return validate_rfc3986(instance, rule="URI_reference")
> - else:
> -     @_checks_drafts(draft7="iri", raises=ValueError)
> -     def is_iri(instance):
> -@@ -280,15 +299,19 @@ else:
> -
> -
> - try:
> --    import strict_rfc3339
> -+    from strict_rfc3339 import validate_rfc3339
> - except ImportError:
> --    pass
> --else:
> -+    try:
> -+        from rfc3339_validator import validate_rfc3339
> -+    except ImportError:
> -+        validate_rfc3339 = None
> -+
> -+if validate_rfc3339:
> -     @_checks_drafts(name="date-time")
> -     def is_datetime(instance):
> -         if not isinstance(instance, str_types):
> -             return True
> --        return strict_rfc3339.validate_rfc3339(instance)
> -+        return validate_rfc3339(instance)
> -
> -     @_checks_drafts(draft7="time")
> -     def is_time(instance):
> -diff --git a/setup.cfg b/setup.cfg
> -index 74bc4a7..878221c 100644
> ---- a/setup.cfg
> -+++ b/setup.cfg
> -@@ -40,6 +40,12 @@ format =
> -       rfc3987
> -       strict-rfc3339
> -       webcolors
> -+format_nongpl =
> -+      idna
> -+      jsonpointer>1.13
> -+      webcolors
> -+      rfc3986-validator>0.1.0
> -+      rfc3339-validator
> -
> - [options.entry_points]
> - console_scripts =
> ---
> -2.20.1
> -
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
> diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.1.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-jsonschema_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

