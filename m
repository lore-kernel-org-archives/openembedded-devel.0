Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 55F8277E66
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 18:47:41 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id w15-v6so4318156plq.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fd+vZqPieJOthjYjeUPTDkIlbHoxVilU33iZ3BYMkYE=;
	b=OPTZijzb4QbUp36TIxw5hC6WfE3QCYKcNMVkSu6Dum3bnNmlvaEzwp1QVdQZgDqutI
	VugCcqsFmV4sDh4xHActdiyoOmUlxVwTM8Fbuihh9Idft3/Zc+JCsQrgyMF1pX7hJ/+h
	QHGqNE3MaEbehRaNqjOp4ee4tdYk/E2VzXQKvJkijYKXKrU6jbvgnauNykCnwp7yUaOx
	pLxpMaweIO5vUXHt40hybLWC9VI+T7vArMES/nn8A7HonSgvvSCN+BLJJr7vfMRhOZvW
	iWscOm5AxgKtL/wpei5xBaf4vvvAARDu4inumRHQz6HgC6hdlYNQFSEAq7tEFL0IEeQ0
	O25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fd+vZqPieJOthjYjeUPTDkIlbHoxVilU33iZ3BYMkYE=;
	b=d0K82Y+4UM4DQBqkYylc0vPVTqt7kuOgWR3TWVYYK7xuIeon/aMxlQBpy/XKh6QYq0
	TVpzdG0xzjHY0zXY71N8uAAy/d/xvu2EQwFTsCwFP7XShUxDAJfKwFIUmqegIoED0Lcl
	LpWEIhO/+6d98ju8iDd+Z8e63mN4OX4N12bqJ1hz+D/WbLCcb/FJY3OCvHmOfRwjsHKX
	1VNvipAANFa0J0wvwsWhpG6/nspVzNZ4jHpuTk0TP9yYyL93n4GghJ45c0aGmKEympkZ
	F/T5VdxXDSsk32ZG4a51q7YCeC4946QBgnmJCj2knLFvzKHwfCi5g53eMq0yXcr+isnL
	y5cA==
X-Gm-Message-State: AElRT7EDBLx48T+TGETn7xj8BSY5zH/I/andZZsIVOj9ZvOf+k8SRgLH
	nJ5CKoD1sLaWEy3xt++5Xqb5MAoApMnyE7G2JV8=
X-Google-Smtp-Source: AG47ELsDjN6+hOk9ZXwKtwZREemTg0+k34qjwVYj6nJFRWL3LjIM38h/CqfykdK7qIyUCG9UPiXK1tMQgYWa95WGcpQ=
X-Received: by 2002:a17:902:9883:: with SMTP id
	s3-v6mr9041004plp.96.1521139663179; 
	Thu, 15 Mar 2018 11:47:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.162.16 with HTTP; Thu, 15 Mar 2018 11:47:12 -0700 (PDT)
In-Reply-To: <20180315174658.6477-1-mmovchan@cisco.com>
References: <20180315174658.6477-1-mmovchan@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Mar 2018 11:47:12 -0700
Message-ID: <CAMKF1spS-F+vrDkxxJnkJ5ztE80vCCY2brE1781nfGCemx7=0g@mail.gmail.com>
To: Mariia Movchan <mmovchan@cisco.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [meta-networking] [PATCH v2] ipcalc: add initial recipe for version 0.2.2
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
X-List-Received-Date: Thu, 15 Mar 2018 18:47:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 15, 2018 at 10:46 AM, Mariia Movchan <mmovchan@cisco.com> wrote:
> Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
> ---
>  .../0001-Makefile-pass-extra-linker-flags.patch    | 31 ++++++++++++++++++++++
>  .../recipes-support/ipcalc/ipcalc_0.2.2.bb         | 22 +++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
>  create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
>
> diff --git a/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
> new file mode 100644
> index 000000000..38d306475
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
> @@ -0,0 +1,31 @@
> +From fd80c0599083013a1b583feba5d7473f52b35938 Mon Sep 17 00:00:00 2001
> +From: Mariia Movchan <mmovchan@cisco.com>
> +Date: Tue, 6 Mar 2018 16:03:39 +0200
> +Subject: [PATCH] Makefile: pass extra linker flags
> +
> +Fixes
> +ERROR: QA Issue: No GNU_HASH in the elf binary
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8beff8f..047f02a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -8,7 +8,7 @@ LIBS?=
> + VERSION=0.2.2
> + CC?=gcc
> + CFLAGS?=-O2 -g -Wall
> +-LDFLAGS=$(LIBS)
> ++LDFLAGS+=$(LIBS)
> +
> + ifeq ($(USE_GEOIP),yes)
> + ifeq ($(USE_DYN_GEOIP),yes)
> +--
> +2.15.1
> +
> diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
> new file mode 100644
> index 000000000..3e278db68
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
> +HOMEPAGE = "https://github.com/nmav/ipcalc"
> +
> +SECTION = "net"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "\
> +    https://github.com/nmav/ipcalc/archive/${PV}.tar.gz;downloadfilename=ipcalc-${PV}.tar.gz \
> +    file://0001-Makefile-pass-extra-linker-flags.patch \
> +"
> +
> +SRC_URI[md5sum] = "343db932a3ad407328920b7430965faf"
> +SRC_URI[sha256sum] = "bf1b95eca219e564c85fa4233fe65342963cf3e8a303a7e10b4dd7269c864794"
> +
> +export USE_GEOIP = "no"

is there a way to turn it into a PACKAGECONFIG ?

> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/ipcalc ${D}/${bindir}
> +}
> --
> 2.15.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

