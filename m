Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8958CC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:40:31 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.11090.1749138023669805609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TvgiBMnv;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad891bb0957so183855366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 08:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749138022; x=1749742822; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkxHM7DNC+2cb4Ac82LndB2xEvglvRPHd8CyFQ73nOc=;
        b=TvgiBMnvEh+T5AYqfKoJ7o5ONyjIGiBX2PpE4K1Kbj2ZvXQMJYirCikc2DnQ3Jxehn
         lwIwpsMakDtyLBwm5n4uIOwvP82Yypc2f6clQXkR2kKyecm0a9Ih1jbE2ZLz6reStpch
         fXzI1WUOQ2NNGFJohv8ZAHegukfIBNJls5sFjjMmJE6RtWiDjU4AJQ/BlgDkFXhJpmZJ
         SjdR6BxW9ddLdtazt2yA0+yY6yg88ZDuQrUupW9cvzx338LCtPAEBNyXtNANlvVD/Us4
         H1Y9rYm0nVCCwC1C9+UklA+VhnN3DbVKG4IarMYuyFHu1bobN2qWqwfl41nztd7Y7GYM
         vPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749138022; x=1749742822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkxHM7DNC+2cb4Ac82LndB2xEvglvRPHd8CyFQ73nOc=;
        b=ARQC6DMT4TVq+9VRMjACsQReZQn5BDhgrO0SjTJSU/QTCc4314Wih95/Tv9XFk7V8p
         eC1pfSbsmnm8tZwJDmwq+EtzcKL05Zye30aanDCggPWv7KWPj0OskyO1GM5VXjUDiS01
         wwi1v+88To67B7gev3qJIgw3Cn4blmarnSoi4rKDIzPHJmI60I4UpKa3mSw2sYBPkpKe
         Tw8anT60tYnIXafvZ/Cxzc6zH9HBlMW6VezYndo5D5UJ10Qtk/8iOX8xxiw37WqXunH/
         QlAZCMCkLofuGtLgzhhfPB6DD0dh8A5HGl+bHck//LOT02MaVWRILKXBGsCiP6rIYKnh
         24bA==
X-Forwarded-Encrypted: i=1; AJvYcCVJoGrBLWsJv6+fYqYUFnZtQgTlEmlEXeu62MdzVqxXPhCV9VmHjGuPxIaELTe2/pjPomCduFsOuolGmhIlogn0rXY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTUgd6K5DvVwu1Rh3gSEyf25FKZEn3WVxxVOooE8Imp4lhvGCf
	a19mTiwxSe5ImTW6a4InRT9frwhDgVkNrvWYXitB6j3MUcvfkUm+tS7mdHtPskeq
X-Gm-Gg: ASbGncuXGe/c5sAga2cw62LbNHWgQqTU6BqIfw42qOqd7Y+1QU83NZ9Ba8o5Q7vA1Pc
	aOyA2Psv4liJcvUpCW2ajtudWnbg99Lr6Ld1wqX+ZxAe1DTdBMiZxIK8BxT/3F6KbxsfS4mM8Lx
	ryvWI2zqER7mfwewZdvVcTnMzJaaQHo+9LQY3OQeqJxEs1jHllvcm16OoQC26gvHSWXFLIyeiN+
	JfLsY/ux+/dZT6ORrEzi8IQfCypDa3ejbi6kLi1O/NbbrPZovEuaKTqvzbwoyX4M0zEVkfPn3nY
	DxTsXweZlh69KozWQnETiM4/jtdiK22ETqPtKopcYwVrfKVNQTYcKVS5JBI=
X-Google-Smtp-Source: AGHT+IHHozxhTSp8TphFdLxn3KV9y337XxGfuEgLt3CD/RVqwkmmkxCZ8Va2c8diQL48ZLwWO1W/Vg==
X-Received: by 2002:a17:907:2d28:b0:ad5:56fa:1904 with SMTP id a640c23a62f3a-addf8faa1bbmr674470266b.44.1749138021585;
        Thu, 05 Jun 2025 08:40:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb4292ae03sm923879966b.80.2025.06.05.08.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 08:40:21 -0700 (PDT)
Message-ID: <0acc3a12-1dfc-4b2b-9038-df33e2a75f59@gmail.com>
Date: Thu, 5 Jun 2025 17:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH] python3-aiohttp: fix
 CVE-2024-42367
To: Jiaying.Song.CN@windriver.com, openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com
References: <20250605091550.1472299-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250605091550.1472299-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117750



On 6/5/25 11:15, Song, Jiaying (CN) via lists.openembedded.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> aiohttp is an asynchronous HTTP client/server framework for asyncio and
> Python. Prior to version 3.10.2, static routes which contain files with
> compressed variants (`.gz` or `.br` extension) are vulnerable to path
> traversal outside the root directory if those variants are symbolic
> links. The server protects static routes from path traversal outside the
> root directory when `follow_symlinks=False` (default). It does this by
> resolving the requested URL to an absolute path and then checking that
> path relative to the root. However, these checks are not performed when
> looking for compressed variants in the `FileResponse` class, and
> symbolic links are then automatically followed when performing the
> `Path.stat()` and `Path.open()` to send the file. Version 3.10.2
> contains a patch for the issue.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-42367
> https://github.com/aio-libs/aiohttp/security/advisories/GHSA-jwhx-xcg6-8xhj
>
> Upstream patch:
> https://github.com/aio-libs/aiohttp/commit/ce2e9758814527589b10759a20783fb03b98339f
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  .../python3-aiohttp/CVE-2024-42367.patch      | 65 +++++++++++++++++++
>  .../python/python3-aiohttp_3.8.6.bb           |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
> new file mode 100644
> index 0000000000..dadec31f3a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch
> @@ -0,0 +1,65 @@
> +From e19cb50fb529bbe75cc4f1b68eeb0a3f631ad0d0 Mon Sep 17 00:00:00 2001
> +From: "J. Nick Koston" <nick@koston.org>
> +Date: Thu, 8 Aug 2024 11:19:28 -0500
> +Subject: [PATCH] Do not follow symlinks for compressed file variants (#8652)
> +
> +CVE: CVE-2024-42367
> +
> +Upstream-Status: Backport
> +[https://github.com/aio-libs/aiohttp/commit/ce2e9758814527589b10759a20783fb03b98339f]
> +
> +Co-authored-by: Steve Repsher <steverep@users.noreply.github.com>
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + CHANGES/8652.bugfix.rst     |  1 +
> + aiohttp/web_fileresponse.py | 26 ++++++++++++++++++++++++++
> + 2 files changed, 27 insertions(+)
> + create mode 100644 CHANGES/8652.bugfix.rst
> +
> +diff --git a/CHANGES/8652.bugfix.rst b/CHANGES/8652.bugfix.rst
> +new file mode 100644
> +index 000000000..3a1003e50
> +--- /dev/null
> ++++ b/CHANGES/8652.bugfix.rst
> +@@ -0,0 +1 @@
> ++Fixed incorrectly following symlinks for compressed file variants -- by :user:`steverep`.
> +diff --git a/aiohttp/web_fileresponse.py b/aiohttp/web_fileresponse.py
> +index f41ed3fd0..35dbd41e1 100644
> +--- a/aiohttp/web_fileresponse.py
> ++++ b/aiohttp/web_fileresponse.py
> +@@ -127,6 +127,32 @@ class FileResponse(StreamResponse):
> +         self.content_length = 0
> +         return await super().prepare(request)
> + 
> ++    def _get_file_path_stat_encoding(
> ++        self, accept_encoding: str
> ++    ) -> Tuple[pathlib.Path, os.stat_result, Optional[str]]:
> ++        """Return the file path, stat result, and encoding.
> ++
> ++        If an uncompressed file is returned, the encoding is set to
> ++        :py:data:`None`.
> ++
> ++        This method should be called from a thread executor
> ++        since it calls os.stat which may block.
> ++        """
> ++        file_path = self._path
> ++        for file_extension, file_encoding in ENCODING_EXTENSIONS.items():
> ++            if file_encoding not in accept_encoding:
> ++                continue
> ++
> ++            compressed_path = file_path.with_suffix(file_path.suffix + file_extension)
> ++            with suppress(OSError):
> ++                # Do not follow symlinks and ignore any non-regular files.
> ++                st = compressed_path.lstat()
> ++                if S_ISREG(st.st_mode):
> ++                    return compressed_path, st, file_encoding
> ++
> ++        # Fallback to the uncompressed file
> ++        return file_path, file_path.stat(), None
> ++

This doesn't look... necessary?
Is Kirkstone really affected by this CVE? If it is, then the patch
should look different - _get_file_path_stat_encoding() is a brand new
function that is introduced by this patch, but not used by anything (and
since it's prefixed with an underscore, it isn't intended to be used by
external applications). If a fix is needed, it should be somewhere else
IMO...

> +     async def prepare(self, request: "BaseRequest") -> Optional[AbstractStreamWriter]:
> +         filepath = self._path
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
> index 479c2f2064..fdecf9ef4c 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
> @@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2024-23334.patch \
>              file://CVE-2024-52304.patch \
>              file://CVE-2023-49082.patch \
>              file://CVE-2024-27306.patch \
> +            file://CVE-2024-42367.patch \
>             "
>  
>  SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117748): https://lists.openembedded.org/g/openembedded-devel/message/117748
> Mute This Topic: https://lists.openembedded.org/mt/113482139/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


