Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B5B776A9C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:44:36 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id qd12so4610104ieb.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pMvan5Z9W+ySYwbOw9KYiILS0m0hEIs+XFgQWO+QZHw=;
	b=dBH4IV0gLQ7xibN1FjCTu2+3CL/m+PoSOyC3900qnYlqT7POgh5IV4Z7QcxOIio5vP
	L4CQxt4mkNG5pc1isBg84DEIfa7hvXwir/hiv2cDzHINdE4z74gbdPzMgjJXssx1P2O9
	xfXPnAH4+vvK+TtmHSKdXEVdLq/kK5jyAJo5pyWvowJIXMPqpv4Dm/WgXmbD1jE2kZwJ
	/h2ESo4JnV/g5H86Z/oSOY1AIIEPwoIBEQZ/o7eavJxhKVrAI2bY1eZUyzq5afaBNlp0
	Y9ciuadE1o3R703sxMyoPEoYgJ3skb+GSSvG1GaRLPI+JKQsZ9fFEKgK2QkeGF+K/y9u
	ob5w==
X-Received: by 10.50.26.67 with SMTP id j3mr347427igg.15.1370936677384; Tue,
	11 Jun 2013 00:44:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 00:44:07 -0700 (PDT)
In-Reply-To: <1370160375-14609-1-git-send-email-net147@gmail.com>
References: <1370160375-14609-1-git-send-email-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 00:44:07 -0700
Message-ID: <CAMKF1spNfEiGVMs586vN8GAJxi=hUchNHK2fAaYHAbNC4k2q6A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] llvm-common: move cross script install to sysroot preprocess function
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 07:44:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 2, 2013 at 1:06 AM, Jonathan Liu <net147@gmail.com> wrote:
> The llvm-config script doesn't get placed in the target sysroot
> crossscripts directory otherwise.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-core/llvm/llvm-common.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
> index 612fd34..3a4232f 100644
> --- a/meta-oe/recipes-core/llvm/llvm-common.bb
> +++ b/meta-oe/recipes-core/llvm/llvm-common.bb
> @@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>
>  SRC_URI = "file://llvm-config"
>
> -do_install() {
> +ALLOW_EMPTY_${PN} = "1"
> +SYSROOT_PREPROCESS_FUNCS += "llvm_common_sysroot_preprocess"
> +SYSROOT_PREPROCESS_FUNCS_virtclass-native += ""
> +

so you want this to run for target recipe only it seems. above won't
do it. you could do something like

SYSROOT_PREPROCESS_FUNCS_append_class-target = "
llvm_common_sysroot_preprocess "

> +llvm_common_sysroot_preprocess() {
>      install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>      install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>  }
> --
> 1.8.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

