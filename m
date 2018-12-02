Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id A87D36C512
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 08:06:38 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o125so5648556qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GXFFXJiOMGoI7XQLeT0YYcoSPXOAOVZq3FJofkO542w=;
	b=hcOkFuo9vTDR3bWK744yzSN2yxomadlKcWXYpTIjEO8xTwNkoKsF00M7lo8ookIJEX
	Edj92MGU3yPLRxgiskg2dJE9VJr5nd5f6zyi8CW9NQzQ09yXxfWVL183WDF4Z15kDLXK
	F3sRXBAUvpacIQgixJaPD8aKQqdh3y/eK/cqaefPHjJ7ipTCQT7Hwn5e51DOx0OAsbs/
	wCsq0G8YNMY0aWgFGb/7wKZZDU1/g6kwoIX757wiCoxHZcDQ4HwNd7xe+nY8teSLHCk4
	mQ/RcVQE6zUAHxrCuG5PuoXw7AQuf+5ALtYxarSeFLo89zhLLIaiMTLDEByZdaERNO6r
	Kggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GXFFXJiOMGoI7XQLeT0YYcoSPXOAOVZq3FJofkO542w=;
	b=OcKgXCtRT6JQ7I+5Kd4u++nsirS3+af6Njslz5brxfpTQG+b9jj/+XvZJYau/chA75
	H/pjmgTFCeVz7Fic0lvRl2UQAuM5OvXmfOuvov/rLtVGQyhfydOEnFpwrN/iReX1Oz0p
	svdSfkcJfH6ybArhehyzUnXGk/kaU//e2gLqX46aVA4jgOIjGpKtps1hnJ/pQB1f4HqX
	AZLfdmriot2o0unWRb4FquV6mk1Pap0xFkX33GvXbt7lKnE2DMBQtJoxxLojwbb3BGrc
	sdDysaXqG+/G4n+JRMlgtR+GskYPWrHNK0Dzn0rUnhuZU9Po0EkBQlD81xnayizp/onS
	juEA==
X-Gm-Message-State: AA+aEWaLCxybqe6IK45aFopLkxe6vSKjNugykS570oT4gbgzqRN7yGM7
	QUS3Kh2vmavJUVbl79Mqur+iZDSVEqAMeE9nngM=
X-Google-Smtp-Source: AFSGD/VpeQ+pqMYyVcZ2bg4XwvOPIs2LZ9ngbYLXckvWUQEHYm9OQl6nwougTE0RWq80BhBxDqNGnOXGd0r3irMyIgY=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr10873229qka.206.1543737994563;
	Sun, 02 Dec 2018 00:06:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543694144.git.psaavedra@igalia.com>
	<20587d4b524b590f8bb3c067cf680d82333e35ca.1543694144.git.psaavedra@igalia.com>
In-Reply-To: <20587d4b524b590f8bb3c067cf680d82333e35ca.1543694144.git.psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2018 00:06:08 -0800
Message-ID: <CAMKF1sqZSkJN4-_wQ8=egN83j1SnUwRdRCjjetXqQTyruLTeBQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v3 1/7] pyzy: add pyzy recipe
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
X-List-Received-Date: Sun, 02 Dec 2018 08:06:40 -0000
Content-Type: text/plain; charset="UTF-8"

fails  for arm (raspberrypi3)
http://errors.yoctoproject.org/Errors/Details/202895/
On Sat, Dec 1, 2018 at 11:59 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> The chinese pinyin and bopomofo conversion library
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  meta-oe/recipes-support/pyzy/pyzy_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pyzy/pyzy_git.bb
>
> diff --git a/meta-oe/recipes-support/pyzy/pyzy_git.bb b/meta-oe/recipes-support/pyzy/pyzy_git.bb
> new file mode 100644
> index 000000000..2a1df6187
> --- /dev/null
> +++ b/meta-oe/recipes-support/pyzy/pyzy_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "The Chinese PinYin and Bopomofo conversion library"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
> +SECTION = "inputmethods"
> +
> +SRCREV = "6d9c3cdff364e0da75e1c26222240f26370ebf73"
> +SRC_URI = "git://github.com/pyzy/pyzy.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "glib-2.0 util-linux sqlite3"
> +
> +EXTRA_OECONF += " \
> +    --disable-opencc \
> +    --disable-db-open-phrase \
> +    --disable-db-android \
> +"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

