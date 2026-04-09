Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C102F36B98
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:47:14 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145723.1775778429791399790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HMwTwqzR;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-126ea4b77adso9622480c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 16:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775778429; x=1776383229; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YB+NBRQbWXpNySOVMKywaKcb1tmY6RP+wuxE6UelP0o=;
        b=HMwTwqzR/Vmf/PiwEjZ5Ca+Vpq2rUygYln+iE1YoX8axzzUdlRcJUjlF8k7M966GaL
         vR3kdt6JhDmTD6+JM42KDj8GRG7beQzFTYQVK7wqq3zA9nvCMaFapRg4N51S6JRYkfen
         908dMyG2Xo5KwEh7fNpYUKmkW6uxE8uzmDILY+bj6XstxxnJlPN3GNWCtRhrSWKJ1eXy
         yYIb4vv8BqWtIipPvMLm5i7cyRpgJ2hCeX8Js5CkoaEKnk8q5skQxAt5Mxlltb6+AyoB
         rJUCnBdWPTRq/QKLGgKep60WBMdSPgYzUvhAc9iotBAWapmkdKazMxYxdr1FhWG2BWi6
         Z8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775778429; x=1776383229;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB+NBRQbWXpNySOVMKywaKcb1tmY6RP+wuxE6UelP0o=;
        b=MCW8mheNuQPvwNzZFpyrPVhKAf0JDETYnLCOaGNzPEOqOy0Etb9jdmq2xxai3zLZ1O
         qjdJmNG55wpdvtQ9fIQotwT+03mRB+n15zRKSFQ1WxaGpEl2husjcCYH6qj+VbTTHlML
         74FGWri0jg0rl9fzxabGYvm7i92RMHkch//tcSopC/jMzihiOXP5ZkG3bDO07iuo1a43
         HTJ6REJ9UZYV1egBkbVTIv6qfyhJyQ8aNjOOYXJgsSWj/wOHSpn2Aw3J5dcy+JkTgPEi
         1Yk4CpTE9X+IhmNHdhGk4Is4YtSvWC2WX2DBuVt8DtTeCFZfpZsyBH7LMoqByDRBa4ao
         rAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeWKY+x2aPYWW1w/XlCcGW0igTXq3ijeTqhtiXaYiX1HCN7t8aVTmVPHKqdOiBTyMhHukPGfozwv8TaoQYqWw10J4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4ld+lRRiPCjeDpZHToFqc13Ig1KqwCepSLi68e4LmxuNe1bYD
	cxh+p5YJ2cvlRZtiRrRIu9CBOV1cE2YZdKeknhC0iGlNpskNVeqWVezSuUDS+w==
X-Gm-Gg: AeBDiesES1/Rn/EYfc9GTJpOPEN3J3tfwJQOQEBM/3rGrE05ERkw4VJtBpCME1kjBTp
	9Zku6TiuDZBE+oH/bJpVOIfMghSNX75+v/E3SaEycROX/FiCx7GRPZ5D1xeOm3k43Rampi+35hd
	88flnleyo+3CABkm8zJie4124kMlpPQD3FKUCiXUFp2rtmoX+f1j4/y6gcSPL0scgPglKlEzuBT
	qFKeLjagRhe5zB8vCTgsT7nmJyR/Ze7AdA/aZW5HgrR4h0KiEiq4S0UbPc4+W4/i+0J2e9o1n1B
	QLMNX4bKH7ioQdrCRiXQWX/wv+1rpr3OndWI1mrNYzNZfZE0uepO0A+HUUQ3M1ryCiSuXY6mVDf
	FmrzKZG5W0p4lgxa/0qjBfd/CEWx7FDRStvuNcggEG1Jgw7mbTZLcr+1ZPAln8UbPwGvhUVWUS5
	Jp8zMiQukDzUedxaNCkRT0jx2oAIsW7lHLJBT/0NUV2/Rz4E9pLzQ+dgN3hAPSvk1eronpoaWYh
	vujFmSYxR+LYbhMKuKD+D3iO98PbaeqY/gofG9osA==
X-Received: by 2002:a05:7022:418e:b0:11b:82b8:40ae with SMTP id a92af1059eb24-12c34ededf2mr638570c88.18.1775778428680;
        Thu, 09 Apr 2026 16:47:08 -0700 (PDT)
Received: from [10.0.0.45] ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb162sm1302005c88.11.2026.04.09.16.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 16:47:08 -0700 (PDT)
Message-ID: <b4decd3d-0dd3-4286-a33a-7a4f66363c45@gmail.com>
Date: Thu, 9 Apr 2026 16:47:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH v3] samba: upgrade 4.19.9 -> 4.23.5
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20260320170158.3090491-1-skandigraun@gmail.com>
Content-Language: en-US-large
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20260320170158.3090491-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 23:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126208



On 3/20/26 10:01 AM, Gyorgy Sarvari wrote:
> Samba has a new build-time dependency, libquic[1]. The repository
> builds an out-of-tree  kernel module and a regular userspace library
> with the same build script, however the Makefile seems to be fairly
> hostile to cross-compilation. The Samba tarball also vendors the
> same with their own build script - for now, this venodred version is used.
> 
> There are some efforts that the kernel part is mainlined[2], once it
> happens it should be possible to easily remove this from the recipe.
> 
> pyldb was removed from RDEPENDS, as it seems that samba now builds its
> own version of it.
> 
> Patches updated, unneeded patches dropped. Some patches contained a
> considerable amount of whitespace changes - those were trimmed for
> the ease of rebasing.
> 
> Added a backported patch to avoid infinite recursion during the generation
> of the man pages.
> 
> Changelog:
> https://gitlab.com/samba-team/samba/-/blob/samba-4.23.5/WHATSNEW.txt?ref_type=tags
> (Switch to other branches to see earlier changelogs)
> 
> [1]: https://github.com/lxin/quic/
> [2]: https://github.com/lxin/net-next/commits/quic/
> 
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
> 
> v2: added use-xslt-replace-function-when-available.patch to avoid infinite
>      recursion when building documentation
> v3: added "apply=no" tag to previously mentioned patch, instead of abusing the
>      "rev" with a non-existing value
> 
> 
>   .../0001-Don-t-check-xsltproc-manpages.patch  |  19 +-
>   ...3-Add-config-option-without-valgrind.patch |  11 +-
>   ...eplace-memset_s-with-memset_explicit.patch | 117 +---------
>   ...tions-to-configure-the-use-of-libbsd.patch |  50 ++--
>   .../0004-lib-replace-Remove-memset_s.patch    | 217 +-----------------
>   ...c43315d83c19514251a11c4fba5a137f2821.patch |  70 ------
>   ...xslt-replace-function-when-available.patch |  51 ++++

This patch has been upstreamed into OE-core [1], Please adjust this 
patch to that and send a v4.

[1] 
https://git.openembedded.org/openembedded-core/commit/?id=aef83d549ed2cfabb4fad16cd6c6d54664a816cc

>   .../{samba_4.19.9.bb => samba_4.23.5.bb}      |  37 ++-
>   8 files changed, 131 insertions(+), 441 deletions(-)
>   delete mode 100644 meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251a11c4fba5a137f2821.patch
>   create mode 100644 meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-function-when-available.patch
>   rename meta-networking/recipes-connectivity/samba/{samba_4.19.9.bb => samba_4.23.5.bb} (88%)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
> index a498348c20..afa1154827 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
> @@ -9,25 +9,14 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>   
>   Rebase to 4.14.4
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
> +Rebase to 4.23.5
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>   ---
> - lib/ldb/wscript    | 2 +-
>    lib/talloc/wscript | 2 +-
>    lib/tdb/wscript    | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> + 2 files changed, 2 insertions(+), 2 deletions(-)
>   
> -diff --git a/lib/ldb/wscript b/lib/ldb/wscript
> -index ed5d45f..de3c648 100644
> ---- a/lib/ldb/wscript
> -+++ b/lib/ldb/wscript
> -@@ -144,7 +144,7 @@ def configure(conf):
> -         conf.DEFINE('EXPECTED_SYSTEM_LDB_VERSION_RELEASE', int(v[2]))
> -
> -     if conf.env.standalone_ldb:
> --        conf.CHECK_XSLTPROC_MANPAGES()
> -+        #conf.CHECK_XSLTPROC_MANPAGES()
> -
> -         # we need this for the ldap backend
> -         if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', 'lber ldap', headers='lber.h ldap.h'):
>   diff --git a/lib/talloc/wscript b/lib/talloc/wscript
>   index 075f1ec..9bd9f73 100644
>   --- a/lib/talloc/wscript
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
> index 2c9d29c9fe..70e7f28cc7 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
> @@ -37,10 +37,10 @@ diff --git a/wscript b/wscript
>   index 95ddd9e..6d9577a 100644
>   --- a/wscript
>   +++ b/wscript
> -@@ -123,6 +123,13 @@ def options(opt):
> +@@ -131,6 +131,13 @@
>                      help=('Disable kernely keyring support for credential storage'),
>                      action='store_false', dest='enable_keyring')
> -
> +
>   +    opt.add_option('--with-valgrind',
>   +                   help=("Enable use of valgrind"),
>   +                   action="store_true", dest='enable_valgrind')
> @@ -48,9 +48,6 @@ index 95ddd9e..6d9577a 100644
>   +                   help=("Disable use of valgrind"),
>   +                   action="store_false", dest='enable_valgrind', default=False)
>   +
> -     gr = opt.option_group('developer options')
> -
> -     opt.load('python') # options for disabling pyc or pyo compilation
> ---
> -2.25.1
> +     opt.samba_add_onoff_option('ldap')
>   
> +     opt.option_group('developer options')
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch
> index a96cd062cd..74ea1a7ab4 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch
> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   --- a/lib/replace/replace.h
>   +++ b/lib/replace/replace.h
> -@@ -815,50 +815,50 @@ typedef unsigned long long ptrdiff_t ;
> +@@ -811,50 +811,50 @@ typedef unsigned long long ptrdiff_t ;
>    /**
>     * Zero a structure.
>     */
> @@ -74,7 +74,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    
>    /**
>     * Explicitly zero data in string. This is guaranteed to be not optimized
> -@@ -867,7 +867,7 @@ typedef unsigned long long ptrdiff_t ;
> +@@ -863,7 +863,7 @@ typedef unsigned long long ptrdiff_t ;
>    #define BURN_STR(x)	do { \
>    				if ((x) != NULL) { \
>    					size_t s = strlen(x); \
> @@ -193,116 +193,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    
>    	talloc_free(mem_ctx);
>    }
> ---- a/lib/cmdline/cmdline.c
> -+++ b/lib/cmdline/cmdline.c
> -@@ -358,7 +358,7 @@ bool samba_cmdline_burn(int argc, char *
> - 				p += ulen;
> - 			}
> -
> --			memset_s(p, strlen(p), '\0', strlen(p));
> -+			memset_explicit(p, '\0', strlen(p));
> - 			burnt = true;
> - 		}
> - 	}
> ---- a/lib/util/data_blob.c
> -+++ b/lib/util/data_blob.c
> -@@ -1,19 +1,19 @@
> --/*
> -+/*
> -    Unix SMB/CIFS implementation.
> -    Easy management of byte-length data
> -    Copyright (C) Andrew Tridgell 2001
> -    Copyright (C) Andrew Bartlett 2001
> --
> -+
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; either version 3 of the License, or
> -    (at your option) any later version.
> --
> -+
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -    GNU General Public License for more details.
> --
> -+
> -    You should have received a copy of the GNU General Public License
> -    along with this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -@@ -67,7 +67,7 @@ _PUBLIC_ DATA_BLOB data_blob_talloc_name
> - }
> -
> - /**
> -- construct a zero data blob, using supplied TALLOC_CTX.
> -+ construct a zero data blob, using supplied TALLOC_CTX.
> -  use this sparingly as it initialises data - better to initialise
> -  yourself if you want specific data in the blob
> - **/
> -@@ -95,7 +95,7 @@ clear a DATA_BLOB's contents
> - _PUBLIC_ void data_blob_clear(DATA_BLOB *d)
> - {
> - 	if (d->data) {
> --		memset_s(d->data, d->length, 0, d->length);
> -+		memset_explicit(d->data, 0, d->length);
> - 	}
> - }
> -
> -@@ -219,7 +219,7 @@ _PUBLIC_ DATA_BLOB data_blob_string_cons
> - }
> -
> - /**
> -- * Create a new data blob from const data
> -+ * Create a new data blob from const data
> -  */
> -
> - _PUBLIC_ DATA_BLOB data_blob_const(const void *p, size_t length)
> -@@ -266,7 +266,7 @@ _PUBLIC_ bool data_blob_append(TALLOC_CT
> - 	if ((const uint8_t *)p + length < (const uint8_t *)p) {
> - 		return false;
> - 	}
> --	
> -+
> - 	if (!data_blob_realloc(mem_ctx, blob, new_len)) {
> - 		return false;
> - 	}
> ---- a/lib/util/talloc_keep_secret.c
> -+++ b/lib/util/talloc_keep_secret.c
> -@@ -22,27 +22,13 @@
> -
> - static int talloc_keep_secret_destructor(void *ptr)
> - {
> --	int ret;
> - 	size_t size = talloc_get_size(ptr);
> -
> - 	if (unlikely(size == 0)) {
> - 		return 0;
> - 	}
> -
> --	ret = memset_s(ptr, size, 0, size);
> --	if (unlikely(ret != 0)) {
> --		char *msg = NULL;
> --		int ret2;
> --		ret2 = asprintf(&msg,
> --				"talloc_keep_secret_destructor: memset_s() failed: %s",
> --				strerror(ret));
> --		if (ret2 != -1) {
> --			smb_panic(msg);
> --		} else {
> --			smb_panic("talloc_keep_secret_destructor: memset_s() failed");
> --		}
> --	}
> --
> -+	memset_explicit(ptr, 0, size);
> - 	return 0;
> - }
> -
> ---- a/librpc/ndr/util.c
> -+++ b/librpc/ndr/util.c
> -@@ -32,5 +32,5 @@ _PUBLIC_ void ndr_print_sockaddr_storage
> -
> - _PUBLIC_ void ndr_zero_memory(void *ptr, size_t len)
> - {
> --	memset_s(ptr, len, 0, len);
> -+	memset_explicit(ptr, 0, len);
> - }
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> index c72bd133ee..88acfeef07 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> @@ -19,7 +19,7 @@ diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
>   index 30cb366..d167551 100644
>   --- a/buildtools/wafsamba/wscript
>   +++ b/buildtools/wafsamba/wscript
> -@@ -145,6 +145,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
> +@@ -155,6 +155,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
>                       help=("Disable use of gettext"),
>                       action="store_true", dest='disable_gettext', default=False)
>    
> @@ -37,40 +37,60 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
>   index 9dd9b48..a22ae59 100644
>   --- a/lib/replace/wscript
>   +++ b/lib/replace/wscript
> -@@ -444,20 +444,21 @@ def configure(conf):
> -
> +@@ -444,31 +444,32 @@
> +
>        strlcpy_in_bsd = False
> -
> +
>   -    # libbsd on some platforms provides strlcpy and strlcat
>   -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
>   -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
>   -                               checklibc=True):
>   -            strlcpy_in_bsd = True
> --    if not conf.CHECK_FUNCS('getpeereid'):
> --        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
> --    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
> --        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
> --    if not conf.CHECK_FUNCS('setproctitle_init'):
> --        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
> --
> --    if not conf.CHECK_FUNCS('closefrom'):
> --        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
> +-    elif conf.env.enable_fuzzing:
> +-        # Just to complicate it more, some versions of Honggfuzz have
> +-        # got strlcpy and strlcat in libc, but not in <string.h>
> +-        # (unless it is there coincidentally, on a BSD). Therefore we
> +-        # can't use CHECK_FUNCS alone to decide whether to add the
> +-        # headers to replace.h.
> +-        #
> +-        # As this is only known to happen on a fuzzing compiler, we'll
> +-        # skip the check when not in fuzzing mode.
> +-        conf.CHECK_HEADERS('bsd/string.h')
>   +    if Options.options.enable_libbsd:
>   +        # libbsd on some platforms provides strlcpy and strlcat
>   +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
>   +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
>   +                                   checklibc=True):
>   +                strlcpy_in_bsd = True
> ++        elif conf.env.enable_fuzzing:
> ++            # Just to complicate it more, some versions of Honggfuzz have
> ++            # got strlcpy and strlcat in libc, but not in <string.h>
> ++            # (unless it is there coincidentally, on a BSD). Therefore we
> ++            # can't use CHECK_FUNCS alone to decide whether to add the
> ++            # headers to replace.h.
> ++            #
> ++            # As this is only known to happen on a fuzzing compiler, we'll
> ++            # skip the check when not in fuzzing mode.
> ++            conf.CHECK_HEADERS('bsd/string.h')
> +
> +-    if not conf.CHECK_FUNCS('getpeereid'):
> +-        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
> +-    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
> +-        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
> +-    if not conf.CHECK_FUNCS('setproctitle_init'):
> +-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
>   +        if not conf.CHECK_FUNCS('getpeereid'):
>   +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
>   +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
>   +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
>   +        if not conf.CHECK_FUNCS('setproctitle_init'):
>   +            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
> -+
> +
> +-    if not conf.CHECK_FUNCS('closefrom'):
> +-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
>   +        if not conf.CHECK_FUNCS('closefrom'):
>   +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
> -
> +
>        conf.CHECK_CODE('''
>                    struct ucred cred;
>   diff --git a/lib/texpect/wscript b/lib/texpect/wscript
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch b/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch
> index 409c36da7c..6e01ae35e7 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch
> @@ -24,7 +24,7 @@ diff --git a/lib/replace/README b/lib/replace/README
>   index bb9d008..d8431e7 100644
>   --- a/lib/replace/README
>   +++ b/lib/replace/README
> -@@ -74,7 +74,6 @@ realpath
> +@@ -73,7 +73,6 @@ realpath
>    poll
>    setproctitle
>    memset_explicit
> @@ -36,219 +36,10 @@ diff --git a/lib/replace/replace.c b/lib/replace/replace.c
>   index 8615899..a419837 100644
>   --- a/lib/replace/replace.c
>   +++ b/lib/replace/replace.c
> -@@ -1,4 +1,4 @@
> --/*
> -+/*
> -    Unix SMB/CIFS implementation.
> -    replacement routines for broken systems
> -    Copyright (C) Andrew Tridgell 1992-1998
> -@@ -8,7 +8,7 @@
> -      ** NOTE! The following LGPL license applies to the replace
> -      ** library. This does NOT imply that all of Samba is released
> -      ** under the LGPL
> --
> -+
> -    This library is free software; you can redistribute it and/or
> -    modify it under the terms of the GNU Lesser General Public
> -    License as published by the Free Software Foundation; either
> -@@ -91,7 +91,7 @@ size_t rep_strlcpy(char *d, const char *s, size_t bufsize)
> - #endif
> -
> - #ifndef HAVE_STRLCAT
> --/* like strncat but does not 0 fill the buffer and always null
> -+/* like strncat but does not 0 fill the buffer and always null
> -    terminates. bufsize is the length of the buffer, which should
> -    be one more than the maximum resulting string length */
> - size_t rep_strlcat(char *d, const char *s, size_t bufsize)
> -@@ -116,7 +116,7 @@ size_t rep_strlcat(char *d, const char *s, size_t bufsize)
> -
> - #ifndef HAVE_MKTIME
> - /*******************************************************************
> --a mktime() replacement for those who don't have it - contributed by
> -+a mktime() replacement for those who don't have it - contributed by
> - C.A. Lademann <cal@zls.com>
> - Corrections by richard.kettlewell@kewill.com
> - ********************************************************************/
> -@@ -137,7 +137,7 @@ time_t rep_mktime(struct tm *t)
> -     return((time_t)-1);
> -
> -   n = t->tm_year + 1900 - 1;
> --  epoch = (t->tm_year - 70) * YEAR +
> -+  epoch = (t->tm_year - 70) * YEAR +
> -     ((n / 4 - n / 100 + n / 400) - (1969 / 4 - 1969 / 100 + 1969 / 400)) * DAY;
> -
> -   y = t->tm_year + 1900;
> -@@ -147,7 +147,7 @@ time_t rep_mktime(struct tm *t)
> -     epoch += mon [m] * DAY;
> -     if(m == 1 && y % 4 == 0 && (y % 100 != 0 || y % 400 == 0))
> -       epoch += DAY;
> --
> -+
> -     if(++m > 11) {
> -       m = 0;
> -       y++;
> -@@ -156,7 +156,7 @@ time_t rep_mktime(struct tm *t)
> -
> -   epoch += (t->tm_mday - 1) * DAY;
> -   epoch += t->tm_hour * HOUR + t->tm_min * MINUTE + t->tm_sec;
> --
> -+
> -   if((u = localtime(&epoch)) != NULL) {
> -     t->tm_sec = u->tm_sec;
> -     t->tm_min = u->tm_min;
> -@@ -176,7 +176,7 @@ time_t rep_mktime(struct tm *t)
> -
> - #ifndef HAVE_INITGROUPS
> - /****************************************************************************
> -- some systems don't have an initgroups call
> -+ some systems don't have an initgroups call
> - ****************************************************************************/
> - int rep_initgroups(char *name, gid_t id)
> - {
> -@@ -194,7 +194,7 @@ int rep_initgroups(char *name, gid_t id)
> - 	int    i,j;
> - 	struct group *g;
> - 	char   *gr;
> --	
> -+
> - 	if((grouplst = malloc(sizeof(gid_t) * max_gr)) == NULL) {
> - 		errno = ENOMEM;
> - 		return -1;
> -@@ -250,9 +250,9 @@ void *rep_memmove(void *dest,const void *src,int size)
> -
> - 	if (d < s) {
> - 		/* we can forward copy */
> --		if (s-d >= sizeof(int) &&
> --		    !(s%sizeof(int)) &&
> --		    !(d%sizeof(int)) &&
> -+		if (s-d >= sizeof(int) &&
> -+		    !(s%sizeof(int)) &&
> -+		    !(d%sizeof(int)) &&
> - 		    !(size%sizeof(int))) {
> - 			/* do it all as words */
> - 			int *idest = (int *)dest;
> -@@ -267,9 +267,9 @@ void *rep_memmove(void *dest,const void *src,int size)
> - 		}
> - 	} else {
> - 		/* must backward copy */
> --		if (d-s >= sizeof(int) &&
> --		    !(s%sizeof(int)) &&
> --		    !(d%sizeof(int)) &&
> -+		if (d-s >= sizeof(int) &&
> -+		    !(s%sizeof(int)) &&
> -+		    !(d%sizeof(int)) &&
> - 		    !(size%sizeof(int))) {
> - 			/* do it all as words */
> - 			int *idest = (int *)dest;
> -@@ -281,7 +281,7 @@ void *rep_memmove(void *dest,const void *src,int size)
> - 			char *cdest = (char *)dest;
> - 			char *csrc = (char *)src;
> - 			for (i=size-1;i>=0;i--) cdest[i] = csrc[i];
> --		}
> -+		}
> - 	}
> - 	return(dest);
> - }
> -@@ -334,16 +334,16 @@ void rep_vsyslog (int facility_priority, const char *format, va_list arglist)
> -  size_t rep_strnlen(const char *s, size_t max)
> - {
> -         size_t len;
> --
> -+
> -         for (len = 0; len < max; len++) {
> -                 if (s[len] == '\0') {
> -                         break;
> -                 }
> -         }
> --        return len;
> -+        return len;
> +@@ -965,37 +965,6 @@
>    }
>    #endif
> --
> -+
> - #ifndef HAVE_STRNDUP
> - /**
> -  Some platforms don't have strndup.
> -@@ -351,7 +351,7 @@ void rep_vsyslog (int facility_priority, const char *format, va_list arglist)
> - char *rep_strndup(const char *s, size_t n)
> - {
> - 	char *ret;
> --	
> -+
> - 	n = strnlen(s, n);
> - 	ret = malloc(n+1);
> - 	if (!ret)
> -@@ -407,7 +407,7 @@ int rep_chroot(const char *dname)
> -
> - /*****************************************************************
> -  Possibly replace mkstemp if it is broken.
> --*****************************************************************/
> -+*****************************************************************/
> -
> - #ifndef HAVE_SECURE_MKSTEMP
> - int rep_mkstemp(char *template)
> -@@ -425,7 +425,7 @@ int rep_mkstemp(char *template)
> - char *rep_mkdtemp(char *template)
> - {
> - 	char *dname;
> --	
> -+
> - 	if ((dname = mktemp(template))) {
> - 		if (mkdir(dname, 0700) >= 0) {
> - 			return dname;
> -@@ -532,7 +532,7 @@ long long int rep_strtoll(const char *str, char **endptr, int base)
> - {
> - #ifdef HAVE_STRTOQ
> - 	return strtoq(str, endptr, base);
> --#elif defined(HAVE___STRTOLL)
> -+#elif defined(HAVE___STRTOLL)
> - 	return __strtoll(str, endptr, base);
> - #elif SIZEOF_LONG == SIZEOF_LONG_LONG
> - 	return (long long int) strtol(str, endptr, base);
> -@@ -568,7 +568,7 @@ unsigned long long int rep_strtoull(const char *str, char **endptr, int base)
> - {
> - #ifdef HAVE_STRTOUQ
> - 	return strtouq(str, endptr, base);
> --#elif defined(HAVE___STRTOULL)
> -+#elif defined(HAVE___STRTOULL)
> - 	return __strtoull(str, endptr, base);
> - #elif SIZEOF_LONG == SIZEOF_LONG_LONG
> - 	return (unsigned long long int) strtoul(str, endptr, base);
> -@@ -599,7 +599,7 @@ unsigned long long int rep_strtoull(const char *str, char **endptr, int base)
> - #endif /* HAVE_STRTOULL */
> -
> - #ifndef HAVE_SETENV
> --int rep_setenv(const char *name, const char *value, int overwrite)
> -+int rep_setenv(const char *name, const char *value, int overwrite)
> - {
> - 	char *p;
> - 	size_t l1, l2;
> -@@ -644,10 +644,10 @@ int rep_unsetenv(const char *name)
> - 	for (i=0;environ[i];i++) /* noop */ ;
> -
> - 	count=i;
> --	
> -+
> - 	for (i=0;i<count;) {
> - 		if (strncmp(environ[i], name, len) == 0 && environ[i][len] == '=') {
> --			/* note: we do _not_ free the old variable here. It is unsafe to
> -+			/* note: we do _not_ free the old variable here. It is unsafe to
> - 			   do so, as the pointer may not have come from malloc */
> - 			memmove(&environ[i], &environ[i+1], (count-i)*sizeof(char *));
> - 			count--;
> -@@ -688,7 +688,7 @@ int rep_utimes(const char *filename, const struct timeval tv[2])
> - #endif
> -
> - #ifndef HAVE_DUP2
> --int rep_dup2(int oldfd, int newfd)
> -+int rep_dup2(int oldfd, int newfd)
> - {
> - 	errno = ENOSYS;
> - 	return -1;
> -@@ -965,37 +965,6 @@ void *rep_memset_explicit(void *block, int c, size_t size)
> - }
> - #endif
> -
> +
>   -#ifndef HAVE_MEMSET_S
>   -# ifndef RSIZE_MAX
>   -#  define RSIZE_MAX (SIZE_MAX >> 1)
> @@ -267,7 +58,7 @@ index 8615899..a419837 100644
>   -	}
>   -
>   -#if defined(HAVE_MEMSET_EXPLICIT)
> --	memset_explicit(dest, destsz, ch, count);
> +-	memset_explicit(dest, ch, count);
>   -#else /* HAVE_MEMSET_EXPLICIT */
>   -	memset(dest, ch, count);
>   -# if defined(HAVE_GCC_VOLATILE_MEMORY_PROTECTION)
> diff --git a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251a11c4fba5a137f2821.patch b/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251a11c4fba5a137f2821.patch
> deleted file mode 100644
> index e07e86e887..0000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251a11c4fba5a137f2821.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 9aa5c43315d83c19514251a11c4fba5a137f2821 Mon Sep 17 00:00:00 2001
> -From: Andreas Schneider <asn@samba.org>
> -Date: Tue, 21 Jan 2025 17:59:27 +0100
> -Subject: [PATCH] lib:replace: Don't use deprecated readline CPPFunction cast
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -HAVE_RL_COMPLETION_FUNC_T was unused and not checking for the right
> -function.
> -
> -libcli/smbreadline/smbreadline.c: In function ‘smb_readline’:
> -libcli/smbreadline/smbreadline.c:139:17: warning: ‘CPPFunction’ is deprecated [-Wdeprecated-declarations]
> -  139 |                 rl_attempted_completion_function = RL_COMPLETION_CAST completion_fn;
> -      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -libcli/smbreadline/smbreadline.c:139:50: error: assignment to ‘char ** (*)(const char *, int,  int)’ from incompatible pointer type ‘char ** (*)(void)’ [-Wincompatible-pointer-types]
> -  139 |                 rl_attempted_completion_function = RL_COMPLETION_CAST completion_fn;
> -      |                                                  ^
> -
> -BUG: https://bugzilla.samba.org/show_bug.cgi?id=15788
> -
> -Signed-off-by: Andreas Schneider <asn@samba.org>
> -Reviewed-by: Alexander Bokovoy <ab@samba.org>
> -
> -Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
> -Autobuild-Date(master): Tue Jan 21 19:38:37 UTC 2025 on atb-devel-224
> -
> -Upstream-Status: Backport [https://github.com/samba-team/samba/commit/9aa5c43315d83c19514251a11c4fba5a137f2821]
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - lib/replace/system/readline.h        | 4 +++-
> - libcli/smbreadline/wscript_configure | 8 +++++---
> - 2 files changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/lib/replace/system/readline.h b/lib/replace/system/readline.h
> -index 9a9af266ca6d..ac3604fc12e0 100644
> ---- a/lib/replace/system/readline.h
> -+++ b/lib/replace/system/readline.h
> -@@ -46,7 +46,9 @@
> - #endif
> -
> - #ifdef HAVE_NEW_LIBREADLINE
> --#ifdef HAVE_CPPFUNCTION
> -+#if defined(HAVE_RL_COMPLETION_FUNC_T)
> -+#  define RL_COMPLETION_CAST (rl_completion_func_t *)
> -+#elif defined(HAVE_CPPFUNCTION)
> - #  define RL_COMPLETION_CAST (CPPFunction *)
> - #elif defined(HAVE_RL_COMPLETION_T)
> - #  define RL_COMPLETION_CAST (rl_completion_t *)
> -diff --git a/libcli/smbreadline/wscript_configure b/libcli/smbreadline/wscript_configure
> -index 912ff53a150d..f5a401ebae00 100644
> ---- a/libcli/smbreadline/wscript_configure
> -+++ b/libcli/smbreadline/wscript_configure
> -@@ -51,10 +51,12 @@ conf.CHECK_CODE('''
> - #    endif
> - #  endif
> - #endif
> --int main(void) {rl_completion_t f; return 0;}
> -+int main(void) {rl_completion_func_t f; return 0;}
> - ''',
> --'HAVE_RL_COMPLETION_FUNC_T', execute=False, addmain=False,
> --msg='Checking for rl_completion_t')
> -+                'HAVE_RL_COMPLETION_FUNC_T',
> -+                execute=False,
> -+                addmain=False,
> -+                msg='Checking for rl_completion_func_t')
> -
> - conf.CHECK_CODE('''
> - #ifdef HAVE_READLINE_READLINE_H
> diff --git a/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-function-when-available.patch b/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-function-when-available.patch
> new file mode 100644
> index 0000000000..c8cd7f37a8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-function-when-available.patch
> @@ -0,0 +1,51 @@
> +From: Peter De Wachter <pdewacht@gmail.com>
> +Date: Tue, 2 Jun 2020 09:10:39 -0400
> +Subject: use EXSLT "replace" function when available
> +
> +A recursive implementation  of string.subst is problematic,
> +long strings with many matches will cause stack overflows.
> +
> +Bug-Debian: https://bugs.debian.org/750593
> +
> +OE comment:
> +This fixes samba build error:
> +xsltApplySequenceConstructor: A potential infinite template recursion was detected
> +
> +The patch changes xslt-styleshets in native sysroot. It comes from Debian,
> +but used by other distros also, for example Fedora.
> +
> +Looking at the history, it seems that the patch was upstreamed in 2018,
> +but upstream hasn't created a stable tag since 2016.
> +
> +Upstream-Status: Backport [https://github.com/docbook/xslt10-stylesheets/commit/1c41ae5ae3d4816687467712580d5f05957b3b88]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + docbook-xsl/lib/lib.xsl | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/docbook-xsl/lib/lib.xsl b/docbook-xsl/lib/lib.xsl
> +index e65776a..bc45cd8 100644
> +--- a/docbook-xsl/lib/lib.xsl
> ++++ b/docbook-xsl/lib/lib.xsl
> +@@ -10,7 +10,10 @@
> +      This module implements DTD-independent functions
> +
> +      ******************************************************************** -->
> +-<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
> ++<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
> ++                xmlns:str="http://exslt.org/strings"
> ++                exclude-result-prefixes="str"
> ++                version="1.0">
> +
> + <xsl:template name="dot.count">
> +   <!-- Returns the number of "." characters in a string -->
> +@@ -56,6 +59,9 @@
> +   <xsl:param name="replacement"/>
> +
> +   <xsl:choose>
> ++    <xsl:when test="function-available('str:replace')">
> ++      <xsl:value-of select="str:replace($string, string($target), string($replacement))"/>
> ++    </xsl:when>
> +     <xsl:when test="contains($string, $target)">
> +       <xsl:variable name="rest">
> +         <xsl:call-template name="string.subst">
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
> similarity index 88%
> rename from meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
> index 3ed1d46754..b9a4f315cb 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
> @@ -14,6 +14,10 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
>   
>   export PYTHONHASHSEED = "1"
>   
> +# If XML_CATALOG_FILES env var is not defined, waf defaults
> +# to build host folders looking for catalogs.
> +export XML_CATALOG_FILES = ""
> +
>   SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>              file://smb.conf \
>              file://volatiles.03_samba \
> @@ -24,11 +28,11 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>              file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
>              file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
>              file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
> -           file://9aa5c43315d83c19514251a11c4fba5a137f2821.patch \
>              file://0001-lib-replace-Implement-memset_explicit.patch \
>              file://0002-lib-replace-Add-test-for-memset_explicit.patch \
>              file://0003-Replace-memset_s-with-memset_explicit.patch \
>              file://0004-lib-replace-Remove-memset_s.patch \
> +           file://use-xslt-replace-function-when-available.patch;apply=no \
>              "
>   
>   SRC_URI:append:libc-musl = " \
> @@ -36,7 +40,7 @@ SRC_URI:append:libc-musl = " \
>              file://samba-4.3.9-remove-getpwent_r.patch \
>              "
>   
> -SRC_URI[sha256sum] = "71ed406444714c90bb9d36c576d807b67af15449f297e91106d42b3ca2fa5549"
> +SRC_URI[sha256sum] = "593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f"
>   
>   UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
>   
> @@ -47,7 +51,7 @@ CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonS
>   # remove default added RDEPENDS on perl
>   RDEPENDS:${PN}:remove = "perl"
>   
> -DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka"
> +DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka ngtcp2 bison-native"
>   
>   inherit features_check
>   REQUIRED_DISTRO_FEATURES = "pam"
> @@ -62,7 +66,7 @@ INITSCRIPT_NAME = "samba"
>   INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
>   
>   SYSTEMD_PACKAGES = "${PN}-base ${PN}-ad-dc winbind ctdb"
> -SYSTEMD_SERVICE:${PN}-base = "nmb.service smb.service"
> +SYSTEMD_SERVICE:${PN}-base = "nmb.service smb.service samba-bgqd.service"
>   SYSTEMD_SERVICE:${PN}-ad-dc = "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'samba.service', '', d)}"
>   SYSTEMD_SERVICE:winbind = "winbind.service"
>   SYSTEMD_SERVICE:ctdb = "ctdb.service"
> @@ -109,7 +113,7 @@ SAMBA4_MODULES = "${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MO
>   # .so files so there will not be a conflict.  This is not done consistantly, so be very careful
>   # when adding to this list.
>   #
> -SAMBA4_LIBS = "heimdal,NONE"
> +SAMBA4_LIBS = "heimdal,libquic,NONE"
>   
>   EXTRA_OECONF += "--enable-fhs \
>                    --with-piddir=/run \
> @@ -132,6 +136,24 @@ EXTRA_OECONF += "--enable-fhs \
>   
>   LDFLAGS += "-Wl,-z,relro,-z,now"
>   
> +do_configure:prepend() {
> +    # The xsltproc tool is actually a wrapper script in OE, which exports its own XML_CATALOG_FILES env var
> +    # However samba does that too. So here I'm trying to concatenate the variables.
> +    # The original looks like this in the wrapper:
> +    # export XML_CATALOG_FILES=oe-core-specific-thing
> +    # and this sed prepends the value with $XML_CATALOG_FILES, and encloses it in quotes. So the end value is
> +    # export XML_CATALOG_FILES="$XML_CATALOG FILES oe-core-specific-thing"
> +    # The first grep just checks if it was already done, so it is not prepended multiple times.
> +
> +    grep \$XML_CATALOG_FILES ${STAGING_BINDIR_NATIVE}/xsltproc || \
> +        sed -i 's,\(XML_CATALOG_FILES\)=\(.*\),\1="\$XML_CATALOG_FILES \2",' ${STAGING_BINDIR_NATIVE}/xsltproc
> +
> +    # This patch modifies xslt-stylesheets in sysroot. Version is hardcoded in the path - when it fails, that should be an
> +    # indicator that a new version is available, which contains this patch
> +    grep exslt ${STAGING_DATADIR_NATIVE}/xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl || \
> +        patch -p 3 -d ${STAGING_DATADIR_NATIVE}/xml/docbook/xsl-stylesheets-1.79.1/lib < ${UNPACKDIR}/use-xslt-replace-function-when-available.patch
> +}
> +
>   do_configure:append() {
>       cd ${S}/pidl/
>       perl Makefile.PL PREFIX=${prefix}
> @@ -213,6 +235,9 @@ do_install:append() {
>       find ${D}${libdir}/perl5/ -type f -name "perllocal.pod" -delete
>       find ${D}${libdir}/perl5/ -type f -name ".packlist" -delete
>       sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${bindir}/pidl
> +
> +    sed -i 's,${UNPACKDIR},,g' ${S}/bin/default/libcli/wsp/wsp_aqs_lexer.c
> +    sed -i 's,${UNPACKDIR},,g' ${S}/bin/default/libcli/wsp/wsp_aqs_lexer.h
>   }
>   
>   PACKAGES =+ "${PN}-python3 ${PN}-pidl \
> @@ -245,7 +270,7 @@ PACKAGESPLITFUNCS:prepend = "samba_populate_packages "
>   PACKAGES_DYNAMIC = "samba-auth-.* samba-pdb-.*"
>   
>   RDEPENDS:${PN} += "${PN}-base ${PN}-python3 ${PN}-dsdb-modules python3"
> -RDEPENDS:${PN}-python3 += "pytalloc python3-tdb pyldb"
> +RDEPENDS:${PN}-python3 += "pytalloc python3-tdb"
>   
>   FILES:${PN}-base = "${sbindir}/nmbd \
>                       ${sbindir}/smbd \
> 


