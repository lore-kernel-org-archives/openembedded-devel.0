Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC577D598
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 17:02:49 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w20so3734774qka.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 10:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zYxgFMGUXMfNkqQvSdtMH2ipgacgoX8jjh9Ff3zLKww=;
	b=s1sFfcyVhGQgLuztTUyXV6J5kdTtD3cgZezOScm7aSOLYyCypiK6knxAf+EZHMavvQ
	NjHCGiJc5SQFbaUl4idoRZelNReQ3BTh3Y7k8jv57QHAbGUJgSmE7a5bhSymgV+h3Z+d
	IRB9cDmbjkGUvm51M2f+yoQ+x9vPBSTEULKNUQBd+ExXDSt3mfrWQpvONIkvdmKfqCcB
	fPnXOV/bhAW/5pMG+zL32V7Vr2rlVepNCIqcbJ4Et1FJn21jIO7hqHsgwel78ph5ZAPf
	9RKKhoTrKpLLXnl56NU06BuOKd1ALDDWPAZ+Qvf7VKokhyZJDZlR1g+C7PegLMfTWxnK
	+tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zYxgFMGUXMfNkqQvSdtMH2ipgacgoX8jjh9Ff3zLKww=;
	b=Z35L1a6muaSmwaVyJwc+W6C9hYEbfz0kB6CvTajgd7Au5m7kfk+FR36D0U2wgm+X8m
	hh39ffSThXs8u4tkgIi9QGvmxbkw9GDEVFmenNUaACXtn0oslBVcfi/3ScaBdK+o0r1u
	mxCAspV7LXXim1UWzftanwC/iyzCqw1D9uLob1uWnZkXuCb7vjLJhcC9g4XgwtQ7NqkF
	RuRKmOMBxrT2+Gm9UDBTf5+WIjhE5QDVKf4XszZ92GPyxvY2JBlzPpnawlTmqYL9t83V
	dydHMGziN50MFEdn9i37lcJFmlfdylWyrKX92HDZtCNTz9/1wMXVh/41eUFR/m3zOH1X
	wiSA==
X-Gm-Message-State: APjAAAVNcvmELKQbD5GwFMjOVdc9mg3YHs5kva59TscKoAk7LFLWHcTV
	ZrK12Nbp5qo0Bv4vNoD0viGKeAHVdd7bVvzYFIw=
X-Google-Smtp-Source: APXvYqz/20ySiMjT8VEg0SuSuqSgj//iq7IzEsxbNAqjVuocYfmITLrJ4grLgP0wqREWbK1krHbRkvwYQmZGS63dujI=
X-Received: by 2002:a37:5009:: with SMTP id e9mr420143qkb.206.1556384570001;
	Sat, 27 Apr 2019 10:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190418153432.16745-1-beniamin.sandu@gmail.com>
In-Reply-To: <20190418153432.16745-1-beniamin.sandu@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Apr 2019 10:02:24 -0700
Message-ID: <CAMKF1sozPTkxYHg67tNEok5SDgQ35EEu=WkLmaTro4CvZea_AA@mail.gmail.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Sat, 27 Apr 2019 17:02:50 -0000
Content-Type: text/plain; charset="UTF-8"

it fails to package the systemd files so please build with systemd in
DISTRO_FEATURES

see https://errors.yoctoproject.org/Errors/Details/238577/

On Thu, Apr 18, 2019 at 8:35 AM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
> ---
>  .../recipes-support/unbound/unbound_1.9.2.bb  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> new file mode 100644
> index 000000000..9e0a24187
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
> +       features including enhanced security (DNSSEC) validation, Internet Protocol \
> +       Version 6 (IPv6), and a client resolver library API as an integral part of the \
> +       architecture"
> +
> +HOMEPAGE = "https://www.unbound.net/"
> +SECTION = "net"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> +
> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
> +SRCREV="61a28c2ee5e60132f26725583b66c1cf8214bb78"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "openssl libevent libtool-native bison-native expat"
> +RDEPENDS_${PN} = "bash openssl-bin"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

