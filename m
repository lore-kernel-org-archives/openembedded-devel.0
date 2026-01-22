Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0E3D3EE6B
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 14:20:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38408.1769091628506080477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 06:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjLztThR;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso8457025e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769091627; x=1769696427; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cla0opvD8G3MIiV7xAsuKNvbeFMIiU10Xb4Gt2ng87E=;
        b=WjLztThRoivhGqzWF6hgF2CM/+cGLSuO3SsnEUUK4vdoinixr4gmor331bMCuQ341X
         4UW9pkpDjoY8Rj8eJZR42qRDGurmEgEXMjbACqOzaw9XBhYtAZ+QmuuT7xTJALqflaQn
         i7rZ3ghaQcnDmrG4J6oSgPBDI/m2seo1FK2+ZRiN9ypX1FMyLCVSm9oiP1M1Sas2ko3H
         W4yi6Gg0QolzepuJ8/RkAALnWxjoOiO8P0dI9rhY746OAUYIqBhuM3q6kdmFvaz1JQzA
         XMs+lM2soDm2qVBzpdb4SuyGTFrfTi4j8flvu2SJkfV62PfKRqewBUHZdlEHhBKfRsdU
         yZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769091627; x=1769696427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cla0opvD8G3MIiV7xAsuKNvbeFMIiU10Xb4Gt2ng87E=;
        b=XkMxMpadrqDWWi8e+RoXG0FoCJhTI7fEaNbT8EN+I/bFRiTIloN08ig8jzMbslJ7ME
         Z8EJSymgLFavTv9eRmT5pAuwxq9e8xF2yd3ywXwdTQv2ASOZvcVQYqYWPQ6MsVqCkF1O
         B72Kx0KZArhkir+qbgvi6/AVNpoV7L/AJXSGIcLZY+KVVqTrJFgEGs67fMe0lAjnFB66
         hFegHWWPZUyziz9Zzl+5iLTMyE4NU8aS6FTkAdMfO0drifWO629x2NIAuIyIdRZejzH7
         /PaIPZ4hYpHIIQs9OJHtuFPm4myoFQf3LwWn2hbOJhKaD/mGFfnFZcu+AAIjFN/toUiv
         2Irw==
X-Forwarded-Encrypted: i=1; AJvYcCUwf3e//88jNyY6JpZNUxM4QetenNa2i98MDKc/zLOKEqd1ypOht/2eB2baCW4ruIA4K7nAs9xxcKwK917Bwq1Ns7g=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0acYSshbWMeFPglN6mrqT/AnhgCZNrYSemwPb5vB4pfP+dw5Y
	xX7rP0ldPxKAwjJbsXgGyoUH8XitXIic5RtjZSeOjtdg4VEwwOdgc/lF
X-Gm-Gg: AZuq6aL1tnfBJc4ue43bO+kz36cdYayd9T7AAtXN0zdc7E9BOu3qqsUIF1jMU8bQn7d
	PghPuJhwhO8/6avhxqHoxPfEL55FLnPmAhhsU6DNpN3fcIaA3Pxiq9AJkSpUAtAI0q7zfzjZ6Dy
	Hs0o+YfPunBqQQ0B4dLFqbxaTgaPAG1Egyzvdl2PdA2zPgaQGZfbhpxjrA8MI50QMoYzb8NCxJ1
	xHwnAt6JjIunV5Q2JhahLspjRyx+UhoiH7k44bn0VvcCnJGHqbrVeffE5YBvEAhmKCbeGla3Mnv
	ro99ry4HEFgX5t6dS6zc8kbwbfx6+AzPUqv/7I/2++awvAAKJLs4YK+WuMaRI1PTINLX6eKBNbR
	5cybphkwcUeC/K2at6GCMVSW3Bye+QAiqciFFCg55BvHjgt/3nO94MM9Nbs9mXnpf9vLX4APUxW
	boGW46EpLqcw1wTs9GEsc=
X-Received: by 2002:a05:600c:b93:b0:480:1db1:b44d with SMTP id 5b1f17b1804b1-4801e34cab5mr321774855e9.27.1769091626569;
        Thu, 22 Jan 2026 06:20:26 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm46852795f8f.31.2026.01.22.06.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:20:25 -0800 (PST)
Message-ID: <4b7d1b9c-d243-4710-bdb1-e09b3df2e96e@gmail.com>
Date: Thu, 22 Jan 2026 15:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: update 128.5.2 -> 128-14-0
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20260121200056.2789828-1-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260121200056.2789828-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 14:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123738


On 1/21/26 21:00, Markus Volk via lists.openembedded.org wrote:
> - add a patch to fix build with python 3.14, taken from fedora
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../mozjs/mozjs-128/D261512.1755672843.patch  | 69 +++++++++++++++++++
>  ...s-128_128.5.2.bb => mozjs-128_128.14.0.bb} | 34 ++++-----
>  2 files changed, 87 insertions(+), 16 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
>  rename meta-oe/recipes-extended/mozjs/{mozjs-128_128.5.2.bb => mozjs-128_128.14.0.bb} (69%)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
> new file mode 100644
> index 0000000000..ddc481bcec
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
> @@ -0,0 +1,69 @@
> +This patch fixes configure with python 3.14 and was taken from fedora
> +
> +Upstream-Status: Pending [https://src.fedoraproject.org/fork/churchyard/rpms/mozjs128/c/c9a3e719a87ba3313915195802ca6efcb9966fa3]

There is an official version[1] of this patch also, so it could be even
a Backport.
On a slightly tangential note, do you know if there is something that
requires this old version of mozjs? Or could this recipe be updated to
the current ESR version, if someone would take the time?

[1]:
https://github.com/mozilla-firefox/firefox/commit/d497aa4f770ca02f6083e93b94996a8fe32c2ff4

> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +
> +diff --git a/python/mozbuild/mozbuild/frontend/reader.py b/python/mozbuild/mozbuild/frontend/reader.py
> +index 5cb627b..c2dcafe 100644
> +--- a/python/mozbuild/mozbuild/frontend/reader.py
> ++++ b/python/mozbuild/mozbuild/frontend/reader.py
> +@@ -470,7 +470,7 @@ class TemplateFunction(object):
> +             return c(
> +                 ast.Subscript(
> +                     value=c(ast.Name(id=self._global_name, ctx=ast.Load())),
> +-                    slice=c(ast.Index(value=c(ast.Str(s=node.id)))),
> ++                    slice=c(ast.Index(value=c(ast.Constant(value=node.id)))),
> +                     ctx=node.ctx,
> +                 )
> +             )
> +@@ -1035,8 +1035,8 @@ class BuildReader(object):
> +                 else:
> +                     # Others
> +                     assert isinstance(target.slice, ast.Index)
> +-                    assert isinstance(target.slice.value, ast.Str)
> +-                    key = target.slice.value.s
> ++                    assert isinstance(target.slice.value, ast.Constant)
> ++                    key = target.slice.value.value
> + 
> +             return name, key
> + 
> +@@ -1044,11 +1044,11 @@ class BuildReader(object):
> +             value = node.value
> +             if isinstance(value, ast.List):
> +                 for v in value.elts:
> +-                    assert isinstance(v, ast.Str)
> +-                    yield v.s
> ++                    assert isinstance(v, ast.Constant)
> ++                    yield v.value
> +             else:
> +-                assert isinstance(value, ast.Str)
> +-                yield value.s
> ++                assert isinstance(value, ast.Constant)
> ++                yield value.value
> + 
> +         assignments = []
> + 
> +diff --git a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
> +index 1590267..151d27c 100644
> +--- a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
> ++++ b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
> +@@ -327,15 +327,13 @@ def assignment_node_to_source_filename_list(code, node):
> +     """
> +     if isinstance(node.value, ast.List) and "elts" in node.value._fields:
> +         for f in node.value.elts:
> +-            if not isinstance(f, ast.Constant) and not isinstance(f, ast.Str):
> ++            if not isinstance(f, ast.Constant):
> +                 log(
> +                     "Found non-constant source file name in list: ",
> +                     ast_get_source_segment(code, f),
> +                 )
> +                 return []
> +-        return [
> +-            f.value if isinstance(f, ast.Constant) else f.s for f in node.value.elts
> +-        ]
> ++        return [f.value for f in node.value.elts]
> +     elif isinstance(node.value, ast.ListComp):
> +         # SOURCES += [f for f in foo if blah]
> +         log("Could not find the files for " + ast_get_source_segment(code, node.value))
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
> similarity index 69%
> rename from meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> rename to meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
> index fbbe3749ba..635cad96cf 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
> @@ -3,22 +3,24 @@ HOMEPAGE = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonk
>  LICENSE = "MPL-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dc9b6ecd19a14a54a628edaaf23733bf"
>  
> -SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox-${PV}esr.source.tar.xz \
> -           file://0001-Cargo.toml-do-not-abort-on-panic.patch \
> -           file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
> -           file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
> -           file://0004-use-asm-sgidefs.h.patch \
> -           file://0005-Add-RISCV32-support.patch \
> -           file://0006-util.configure-fix-one-occasionally-reproduced-confi.patch \
> -           file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
> -           file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
> -           file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
> -           file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
> -           file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
> -           file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
> -           file://0013-Fix-build-error-with-musl.patch \
> -           "
> -SRC_URI[sha256sum] = "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef495d4997154d68358f"
> +SRC_URI = " \
> +    https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox-${PV}esr.source.tar.xz \
> +    file://0001-Cargo.toml-do-not-abort-on-panic.patch \
> +    file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
> +    file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
> +    file://0004-use-asm-sgidefs.h.patch \
> +    file://0005-Add-RISCV32-support.patch \
> +    file://0006-util.configure-fix-one-occasionally-reproduced-confi.patch \
> +    file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
> +    file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
> +    file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
> +    file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
> +    file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
> +    file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
> +    file://0013-Fix-build-error-with-musl.patch \
> +    file://D261512.1755672843.patch \
> +"
> +SRC_URI[sha256sum] = "93b9ef6229f41cb22ff109b95bbf61a78395a0fe4b870192eeca22947cb09a53"
>  
>  UPSTREAM_CHECK_URI = "https://tracker.debian.org/pkg/mozjs128"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123724): https://lists.openembedded.org/g/openembedded-devel/message/123724
> Mute This Topic: https://lists.openembedded.org/mt/117388071/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


