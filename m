Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1E1CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:31:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2333.1762795913763632700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fyf7KzQj;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b32900c8bso963020f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762795912; x=1763400712; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/DtlE6MkoHjBQF3b+W+9AtwS2tB/JjXMvAGajT5vYI=;
        b=fyf7KzQjrHA69xmJbNkl5JBJ1JCK4FPgPnwKLvlfFC7dYjVoDqTn1rHBAbm1Nsw3El
         zC72c9SGJabF4ZnKkcL+SPyJmaKnnYLEyN2u16JjqQwhfN9Q0zPoBA8PKGymk6TzntS9
         gBUYnTB9/47BoYD4/fr6F+o2Vi5MQVWyEb0pr6PC51rF78riMB59qMCZL1qE/m5M+g6N
         n6E5yo4S80CHh729NfTy3hLpRZ0zq+qofIrPfAUcJlNRNZ+UTwDO532XIUsOarpPH9Ik
         2e5+yRu4fYTkJDOTWtSfI2fj0tE46zNGzhqL7MB1W5E5VmBcDd/zCED6fzq5xE5N/hb8
         /0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795912; x=1763400712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/DtlE6MkoHjBQF3b+W+9AtwS2tB/JjXMvAGajT5vYI=;
        b=WGVyI1QS+s6kHaOsxliJQwOMF44IJT0701G71k6AHnzQUQgXrIX6SA57amHf2W4iRJ
         0sPyIvxowM+BPPZalCGtH6cg47rmFpehcNo+VeBUcvTEkhQJuqAYdqpZRCqqcOOJmzVR
         roF+r52ZMWrJpgGKGqhmiDk+3i1wCDM91bE8X7zR4SNB99LyGGEdVyr8LAQeaZeiS3Ti
         oaXNj9dnv95KVZ5kpRJifnV6UmlDTSCbOKqn7wRRQucTjUPPtKXrqBtJxZ9gkFDSHPm9
         gYszZirim1zuyObsEvIw78wm6AICi0/tp/oG3k8ldjwslVrykty7JqaixOHVUJszNvut
         aNzA==
X-Forwarded-Encrypted: i=1; AJvYcCUtyrMs3Kqww59c4GNOtVacrYl8kL9EAEiPTFibKFumA0lJIPaxr1pp1L9hgK1AIWIHUkWRgKBs3p4OGskx7Mo8MvY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyypa159iQZgZUHeRhPC9H0MwoBQZwuxh3ZX+dSADHRnczn+IPf
	JD6TSf83lHRsttil8io8YJX7MbpeVDIq2yV/Lq54xFfBAgf9zQhIatre
X-Gm-Gg: ASbGnctjZlDIjDWBgYoYT1+hpG8DELe1SW0oPrTvLCzTh/H8y1WttNQ9gA7GR0zgAGZ
	tZ5drB629G4BN6xh4WDB/L1NQ+1Gsowy1F5lpz5EV59uSVUdw6fwt/dGlB3EdL7U5dt29NyocPT
	U74Q3GsYmEa4EfZyNoPZd6dkXw9hl6Tl4yni86eVnBHcbJOg++7Yz6kfn787IJcqADEQunEOCiN
	p0XiX+m8VOXIC1VVkEurflFzCyXp79AYjX44hvu88gedU84Z2tA7JCw+tZm6RW4d9OosaEOSBsg
	8jkk1fIRKsoMi04MYuLu4H7e4M70kKTgdS7XZGic+1FZWtw5s1QGeupTqXQjiDpVjyFUFynHvo3
	ZaGRzV8GAe2KFqEVfC9ZasWk80QRtUnW8d/Mjgf6Go94Kp6OECdTHTQruYruSnVBPZ9b7D+9Txb
	2cH3L6sF+teGPfehzN62s=
X-Google-Smtp-Source: AGHT+IFIZLMdSPJEpRbsIm7BOFJBAdyPOuCg3AnQGBu8DP7x3K6rH/ldcB/OsutwCg3jfoxRB6wM8A==
X-Received: by 2002:a05:6000:4024:b0:42b:3ab7:b8b8 with SMTP id ffacd0b85a97d-42b3ab7bbaamr3777327f8f.25.1762795912050;
        Mon, 10 Nov 2025 09:31:52 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b30dd4d86sm14802740f8f.26.2025.11.10.09.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:31:51 -0800 (PST)
Message-ID: <b16664e8-a523-42dc-b063-5aa2dc76c71d@gmail.com>
Date: Mon, 10 Nov 2025 18:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-python-dotenv: new recipe
 (1.2.1)
To: jan.vermaete@gmail.com, openembedded-devel@lists.openembedded.org
Cc: t.f.g.geelen@gmail.com
References: <20251110172650.358256-1-jan.vermaete@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251110172650.358256-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 17:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121468

On 11/10/25 18:26, Jan Vermaete via lists.openembedded.org wrote:
> Moving the recipe from meta-homeassistant to meta-opemembedded.
>
> + version bump 1.1.1 -> 1.2.1
> + add ptest
>   - exclude 2 tests (oe-specific)
>   - added to PTESTS_FAST_META_PYTHON
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  ...y-skip-two-test-when-running-as-root.patch | 39 +++++++++++++++++++
>  .../python/python3-python-dotenv_1.2.1.bb     | 22 +++++++++++
>  3 files changed, 62 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index f0411f269f..43518ea2c8 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -65,6 +65,7 @@ PTESTS_FAST_META_PYTHON = "\
>      python3-pydantic \
>      python3-pydantic-core \
>      python3-pylint \
> +    python3-python-dotenv \
>      python3-python-multipart \
>      python3-ptyprocess \
>      python3-py-cpuinfo \
> diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
> new file mode 100644
> index 0000000000..154ab559a4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
> @@ -0,0 +1,39 @@
> +From 68e4f05ece6b20e8a7d914d047185483373db759 Mon Sep 17 00:00:00 2001
> +From: Jan Vermaete <jan.vermaete@gmail.com>
> +Date: Mon, 10 Nov 2025 18:04:27 +0100
> +Subject: [PATCH 1/1] test_main.py: skip two test when running as root
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +The patch will only work for Linux and not for Windows.
> +And it's not common to run the tests of a Python module as root in the
> +not Yocto world.
> +
> +Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> +---
> + tests/test_main.py | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/test_main.py b/tests/test_main.py
> +index 4496111..182bc33 100644
> +--- a/tests/test_main.py
> ++++ b/tests/test_main.py
> +@@ -61,6 +61,7 @@ def test_set_key_encoding(dotenv_path):
> +     assert dotenv_path.read_text(encoding=encoding) == "a='é'\n"
> + 
> + 
> ++@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
> + def test_set_key_permission_error(dotenv_path):
> +     dotenv_path.chmod(0o000)
> + 
> +@@ -167,6 +168,7 @@ def test_unset_encoding(dotenv_path):
> +     assert dotenv_path.read_text(encoding=encoding) == ""
> + 
> + 
> ++@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
> + def test_set_key_unauthorized_file(dotenv_path):
> +     dotenv_path.chmod(0o000)
> + 
> +-- 
> +2.47.3
> +
> diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
> new file mode 100644
> index 0000000000..73af9c7906
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Read key-value pairs from a .env file and set them as environment variables"
> +HOMEPAGE = "https://github.com/theskumar/python-dotenv"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
> +RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
> +
> +SRC_URI[sha256sum] = "42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6"
> +
> +SRC_URI += "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
> +
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
> +
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?= "cli"
> +PACKAGECONFIG[cli] = ",,,python3-click"
> +
> +PYPI_PACKAGE = "python_dotenv"
> +UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
> +
> +RDEPENDS:${PN}-ptest = "\

This should be "+=" - otherwise it won't install the main package when
you build a ptest image

> +    python3-sh \
> +"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121467): https://lists.openembedded.org/g/openembedded-devel/message/121467
> Mute This Topic: https://lists.openembedded.org/mt/116223370/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


