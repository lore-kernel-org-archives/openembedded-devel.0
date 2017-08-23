Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91DAB6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:43:51 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 83so531495pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 20:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M6B+bTd3M3dJUNmpxYzHxWKtNRBXIp5Y2f1IB5kKIuk=;
	b=N6CJ1GkKn+dwv4kC1jKLeE65ep7YOAiVDlob4yOjFi6jKAGkEw/khWOZjMK9r6FuzI
	DDSwVVQUlPMMR2K7jz4I+JTqVVdCHFw1cJYX6vtt9p4RWF+X1eFX/h+0cdLzPJtxuQrK
	NT5a+xWK2EXqMnHvEaeMQ1oTJLYtxKRRDotJ3tIdpffEczsyjk2fhwUeSEhYaavI1wSp
	XvsJsuiyGTFo68JlJ5Qtt9wGYXcElOZ5WrPuuh4O6zlt7wZnauyqYOi+PcnHPa1DcCd6
	MOhBGvmzXixwqHkTw8VdCXHowdzQyHtgyne70kCq7UKzgE1zpni3banrBlbPiIL7dq3r
	GIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M6B+bTd3M3dJUNmpxYzHxWKtNRBXIp5Y2f1IB5kKIuk=;
	b=ZmnKc5ibxna/2C0WHo4+S/nT/3GvVNzqcYY6EaqNRSG7sX5uqwN7xGBvJ31M8xvtu5
	SZSv9QUI0pCspFBxNPgRMTXKOdqc/ZjoZwMMobuxqSty3WviZ2yqPTzpo4sSWwtU6NA8
	Qe62iq9H54/7p4fQ0IJej2aRlpNiLlioj8d25FgMyqpO0ki7VYD01J4AgybtHSUxR5ZY
	5aFZu2UTyKl253TLlrQ9XaxWxugVdB4qOtpO6LyaUUIxrsrSjaA+9UwpyjSfgbW5l95k
	YE+VP/QhDI9SlZNdc0fNNjE925WIp6la7c9Mi+j6DAGO/Zoh0E3TsalD0qu8D5vqZOhC
	37LA==
X-Gm-Message-State: AHYfb5jSxLQ4biRy3rmYwkNAChlDOiWft/fNS7hinimEYL/Ce6bc2flA
	LtbN9ejXtVTOPJ4kBySnSSwJGhEXPQ==
X-Received: by 10.84.239.8 with SMTP id w8mr1409404plk.73.1503459833594; Tue,
	22 Aug 2017 20:43:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 22 Aug 2017 20:43:22 -0700 (PDT)
In-Reply-To: <5d143386de9338b3a770a44b0590232a53f2301f.1503457180.git.hongxu.jia@windriver.com>
References: <cover.1503457180.git.hongxu.jia@windriver.com>
	<5d143386de9338b3a770a44b0590232a53f2301f.1503457180.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 20:43:22 -0700
Message-ID: <CAMKF1spON1L-HeobLHk+GaQqcqSbXtzvPQPnaVnjfy8jyqYEQQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/3] netcf: upgrade to latest 0.2.8
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
X-List-Received-Date: Wed, 23 Aug 2017 03:43:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 8:01 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Fix compile failure while gnulib upgraded to 2017-08-20.18
> ...
> | In file included from ../../../git/gnulib/lib/printf-args.h:41:0,
> |                  from ../../../git/gnulib/lib/printf-parse.h:29,
> |                  from ../../../git/gnulib/lib/printf-parse.c:36:
> | ./wchar.h:571:6: error: #if with no expression
> |  # if
> ...
>
> Update HOMEPAGE, SRC_URI since the formers are obsolete.
>
> Update SRCREV, although version not change, but the former
> was two years ago.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb}    | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>  rename meta-networking/recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb} (88%)
>
> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> similarity index 88%
> rename from meta-networking/recipes-support/netcf/netcf_git.bb
> rename to meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> index a7a5000..902eb15 100644
> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> @@ -1,15 +1,14 @@
>  SUMMARY = "netcf"
>  DESCRIPTION = "netcf is a cross-platform network configuration library."
> -HOMEPAGE = "https://fedorahosted.org/netcf/"
> +HOMEPAGE = "https://pagure.io/netcf"
>  SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>
> -SRCREV = "9158278ad35b46ce9a49b2e887483c6d8c287994"
> -PV = "0.2.8+git${SRCPV}"

this will make version go backward

> +SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
>
> -SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
> +SRC_URI = "git://pagure.io/netcf.git;protocol=https \
>  "
>
>  DEPENDS += "augeas libnl libxslt libxml2 gnulib"
> @@ -23,6 +22,8 @@ EXTRA_OECONF_append_class-target = " --with-driver=redhat"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
>
> +EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
> +
>  do_configure_prepend() {
>      currdir=`pwd`
>      cd ${S}
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

