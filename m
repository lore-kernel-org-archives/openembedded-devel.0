Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 856306B79B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 20:38:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c73so5257008pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 12:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=v83M9ooTgKDzKkFaRv3vwR9AgyT9VGQ6BclMO2Pn85Q=;
	b=GMRIltoaJq67Ph1DxhAa18yr5YxUxyKnA2HFeAX08v4Ti7zEm2TYKDqMo1b3YRR+Qg
	B8mkezd0VuDzfep0BHqPud61JVrHGqjLgmSVbAAHlMhJYjgC4focqXkUuJ1hB6w3a0/U
	hNDvwSjkhJjQPkjJ5AI9Nrp/cUa5wpyCGkUx9wWC8am6UCX4eh0fqzmRg7+QTyxerEJM
	WJJ5Lo2rL7jNLcbemoPg9pZ8UqeZdweyRK40ct9FG5UDL6DTRKoAuT+sHGc+1he/ohS+
	2yXLnZjtBpEcTOG6+Gwyp5LpVJp/K/hGeI9DvW2WEmdj5yPrtmBFdMIdLM2X3PPx+9Fa
	Vt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=v83M9ooTgKDzKkFaRv3vwR9AgyT9VGQ6BclMO2Pn85Q=;
	b=TpXlLRCeMvE5W15C3fQ3TuChoxNhnnZlGx2K8MXMAA0mm3SbfRWN/rlow2zAPdZqFz
	L5UaWJp0X3cg/oHESDlhvnAWgjStvTahyMyX5Bp/UYIWY7IYTtrrTYn1O7P2zW4qqAbA
	dce3ZRJjb84Mk2ZhVMNNfZTj2OEGuMShUs1iAxiwsqeocWcMtF8sI4tHP0537A69R7/+
	/NNSBfsy9RriqvaV8DrT1ncwRILfsCe7l6YwjRuzFuwfak1xwFDN2M37pNPnRIFwTM93
	vc4DqjQtFQIt3hS7XI7eNDWHrDpboPzEbkMnbe06B6m18mrc2cPwE5sDaXpA0Cj2rCmq
	1X0g==
X-Gm-Message-State: AA+aEWaKdyUM3M5JSRSewvMIZI+9gP/drg/sJkFiYlW1KQqD4ELZCH2o
	547amWQAjD+WQDelIxaw7Ww=
X-Google-Smtp-Source: AFSGD/VEuzIRg+qoKD7xjuhO+xMDp7/CmCnFssC10Nserb0xfzp5IuzwMP+FrlKc5qeJyhES/sJdnQ==
X-Received: by 2002:a63:955a:: with SMTP id t26mr11240130pgn.449.1543783108497;
	Sun, 02 Dec 2018 12:38:28 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:8459:23c4:569c:71eb?
	([2601:202:4180:c33:8459:23c4:569c:71eb])
	by smtp.gmail.com with ESMTPSA id
	p2sm14871920pfb.28.2018.12.02.12.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 12:38:27 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20181202191346.15104-1-raj.khem@gmail.com>
	<20181202191346.15104-2-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7a1e89b5-fba4-ef15-a4e2-9111467c5c29@gmail.com>
Date: Sun, 2 Dec 2018 12:38:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181202191346.15104-2-raj.khem@gmail.com>
Cc: Niklas Johansson <niklas.johansson@prevas.dk>
Subject: Re: [meta-oe][PATCH 2/3] libzip: add libzip 0.9
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
X-List-Received-Date: Sun, 02 Dec 2018 20:38:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/2/18 11:13 AM, Khem Raj wrote:
> From: Niklas Johansson <niklas.johansson@prevas.dk>
>
> libzip is a C library for reading, creating, and modifying zip
> archives. Files can be added from data buffers, files, or
> compressed data copied directly from other zip archives.
> Changes made without closing the archive can be reverted.
>
> Version 0.9 is a little dated and the newest version is 1.5.1.
> However, there are some breaking API changes between versions,
> so this older version is needed.
>
> Signed-off-by: Niklas Johansson <niklas.johansson@prevas.dk>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/libzip/files/LICENSE | 31 +++++++++++++++++++
>  meta-oe/recipes-extended/libzip/libzip_0.9.bb | 16 ++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libzip/files/LICENSE
>  create mode 100644 meta-oe/recipes-extended/libzip/libzip_0.9.bb
>
> diff --git a/meta-oe/recipes-extended/libzip/files/LICENSE b/meta-oe/recipes-extended/libzip/files/LICENSE
> new file mode 100644
> index 0000000000..e93454e883
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libzip/files/LICENSE
> @@ -0,0 +1,31 @@
> +Copyright (C) 1999-2017 Dieter Baron and Thomas Klausner
> +
> +The authors can be contacted at <libzip@nih.at>
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions
> +are met:
> +
> +1. Redistributions of source code must retain the above copyright
> +  notice, this list of conditions and the following disclaimer.
> +
> +2. Redistributions in binary form must reproduce the above copyright
> +  notice, this list of conditions and the following disclaimer in
> +  the documentation and/or other materials provided with the
> +  distribution.
> +
> +3. The names of the authors may not be used to endorse or promote
> +  products derived from this software without specific prior
> +  written permission.
> +
> +THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND ANY EXPRESS
> +OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
> +DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
> +GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
> +IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> +OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
> +IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/meta-oe/recipes-extended/libzip/libzip_0.9.bb b/meta-oe/recipes-extended/libzip/libzip_0.9.bb
> new file mode 100644
> index 0000000000..d1d7b89bd0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libzip/libzip_0.9.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "C library for reading, creating, and modifying zip archives"
> +SECTION = "libs"
> +HOMEPAGE = "http://www.nih.at/libzip"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file:///LICENSE;md5=01f8b1b8da6403739094396e15b1e722"
> +DEPENDS = "zlib"
> +PR = "r1"
Why PR ?

- armin
> +
> +inherit autotools
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI = "http://www.nih.at/${PN}/${PN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "56b9f11c1eee5eed189a20183d7e06b0"
> +SRC_URI[sha256sum] = "23a8c3624122a3777bb4ac3be4a867fd0bed7f3aacb8f1d0b68fc459cfb035fc"


