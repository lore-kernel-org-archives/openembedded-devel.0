Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.4733.1586029191475976990
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 12:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cuYM8WaF;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b62so11921840qkf.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOQeGGLrNJ/oC1ephyJazrn5aLhmw45CgDWAkF669Wg=;
        b=cuYM8WaFQrNFX1R2o/G1h7kThvO0tHw+Oe/JWYBB3wrLJdCGVRA5jccoNjReQvwEXC
         YpOUf+1bj5xyC7P49zqn/aDALqBTw64vAbSGZzR0xVHhhyles4Cvn34W8izNMR4k7Ykn
         1+dZpuyaldOdXurbaBhBf3qdjahNMFl1N3KFnCwtVVC7SekEQrnDpLRY9NKmlAOrk3Nh
         zd+xJVDkHQ7k32UBFfAWsoaFUnrQjAENTMCCK+f8tHyM122j1/7fq2ew4EZKGYeFAmL/
         300XkXEaAmZsAhiQUD2E5HUzwBxHex6HQMeTBBmSZYO/7XWK5xMfpv35rL7n+eefQumP
         0xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOQeGGLrNJ/oC1ephyJazrn5aLhmw45CgDWAkF669Wg=;
        b=iC4ekfGqS54FuMHR/oax8vDmlC+NmYxbdIzNcnOOlUeRckBsl1R3WGh+DX5tRJWZvc
         +ZTn11pJ1O7v/Ridjy4FEJYSDZE9CC1x0sXgwSeO/v/lnN9J1pOFZpqICzrz5eEcyg2S
         huLe4u1JJYJHWWSEKiTnJv9/ueBPteo7E8w5nDDKk8kFOMVlDeSjXU9F7qGuvyoxlEZL
         SgKqUI2Urokg+sDtHBBu0kbVMEmnIr6BIzjCYe/R7H1ZbY2KvQ0EPTPoYUUmd8BVSYqe
         7BYan5ZVdvEro/5XU0/Q1Hp/51FqWSB0ufEK350gM8QEDbSA1gIYnZXm7MOVH4fN5O35
         Eh2w==
X-Gm-Message-State: AGi0Pub3tU3CO0wFFsM2BvedZ0migmURKPC6jgIRzv0RaW2L2vXlbtFK
	O0kOsPcsu8+v2kP5qu57oR/Ve9MsdTHszo1ehbpTZ1k2
X-Google-Smtp-Source: APiQypKF5jNoSf5aclbDoVznG2l7IWqq6UHTqLE+VoKP16zvgM7kVRz6sGUoVfR1r2Lj1ei5wYl36edIIvzw2nQWA84=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr14756239qkf.165.1586029190414;
 Sat, 04 Apr 2020 12:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200404171251.19823-1-derek@asterius.io> <20200404171251.19823-16-derek@asterius.io>
In-Reply-To: <20200404171251.19823-16-derek@asterius.io>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Apr 2020 12:39:24 -0700
Message-ID: <CAMKF1sqxAOP2vvuM3=aoX7sXHaXQ-MQcNfVDq6D4UtpS4pm0pQ@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 16/27] python-socketio: consolidate inc and bb files into a single bb file
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

there is a similar patch already on ml, so dropping this

On Sat, Apr 4, 2020 at 10:13 AM Derek Straka <derek@asterius.io> wrote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/python-socketio.inc                | 28 -------------------
>  .../python/python3-socketio_4.4.0.bb          | 26 +++++++++++++++--
>  2 files changed, 24 insertions(+), 30 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-socketio.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
> deleted file mode 100644
> index 117eb60784..0000000000
> --- a/meta-python/recipes-devtools/python/python-socketio.inc
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -SUMMARY = "Socket.IO server"
> -HOMEPAGE = "https://github.com/miguelgrinberg/python-socketio/"
> -SECTION = "devel/python"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "python-socketio"
> -
> -SRC_URI[md5sum] = "6631497753977b70d2b5ceb12af2775f"
> -SRC_URI[sha256sum] = "48cba5b827ac665dbf923a4f5ec590812aed5299a831fc43576a9af346272534"
> -
> -PACKAGECONFIG ?= ""
> -PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
> -PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-engineio \
> -    ${PYTHON_PN}-logging \
> -    ${PYTHON_PN}-math \
> -    ${PYTHON_PN}-pickle \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-threading \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-attrs \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
> index e2542cf4a5..73548e368b 100644
> --- a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
> @@ -1,5 +1,27 @@
> -inherit setuptools3
> +SUMMARY = "Socket.IO server"
> +HOMEPAGE = "https://github.com/miguelgrinberg/python-socketio/"
> +SECTION = "devel/python"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
> +
> +SRC_URI[md5sum] = "6631497753977b70d2b5ceb12af2775f"
> +SRC_URI[sha256sum] = "48cba5b827ac665dbf923a4f5ec590812aed5299a831fc43576a9af346272534"
> +
> +PYPI_PACKAGE = "python-socketio"
> +inherit pypi setuptools3
>
>  PACKAGECONFIG ?= "asyncio_client client"
> -require python-socketio.inc
> +PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
> +PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
>
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-engineio \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-pickle \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-attrs \
> +    "
> --
> 2.17.1
>
> 
