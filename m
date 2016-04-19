Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id CF1426B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 19:46:09 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id x201so19904583oif.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=OAtc/sZ/iIs7RTqiK+HesukccCcTtCXAKM9ffw/ZTso=;
	b=TgTqVc/SU+5III8k3jGp+c2qJkL0DZjfDfWahkNJ4BFRGqtC4+fZQgNPrvgp5N6eNc
	XxMJtmSxIB10V/UYxxzNjdLQGU8sqzgS1amPu3XjoVOZYV49bsq6xJEVb+Y9VBwVidKv
	Eo7e0wDsBNAE2i6s/YTHILuyi52NIvm0D5HdLF7jgxQEEh2U1fekLVaOsAo97mesyoIz
	hcubRbsRe+CHBfbib+jxuiQLEnZgUvlFjG3b23vkxMJkUU9QJ6mcFakYN7RpSRpR/y4H
	tY0u7I4otXdd2cNcxr1Pkf4xvyTIRnAGCzmRbz2fT9hJ1S1Ev5iictpJxiq+693szu6i
	rFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=OAtc/sZ/iIs7RTqiK+HesukccCcTtCXAKM9ffw/ZTso=;
	b=lIbEgLLWRg2RNguIGmeIgqBInV9NqPCmf7n6/kYz7QbRz8YYToxoFSMjiZShjBjF+/
	CefkM4kjo8lAAvYW25bjHB2g5FuCC32X1RH694mNazU37MWSVweOBCQbnxd5U5QJROvm
	JSFV7+WEI23U+ob9BqtG8LbBrp8qRWRlucUEMqMe8gK72eKV1VIwDJ3gKaGFrRQJJnbX
	buO2tL5AvM1OdRyAro17EPTQ9aSOg7htuzbDEsLcjEVip2trroaKv+C0KECu7/hZrJBy
	+VyVNsCdtuw/igaFmgldXZbS3ccZN3fKWKswk5nWbXblSn7N60hfoLn6o+ZgbdZ99QVY
	R4iQ==
X-Gm-Message-State: AOPr4FVExRvtzdf6tPlkkCVNCVmCQNiOku8a6dwz0UQz3zI5E0II1VCR+J/DizD+DpRAHbrQWJ1Vv+ia9aKizQ==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr2033018oib.96.1461095169607; Tue,
	19 Apr 2016 12:46:09 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 19 Apr 2016 12:46:09 -0700 (PDT)
In-Reply-To: <1461080418-9229-2-git-send-email-eu@felipetonello.com>
References: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
	<1461080418-9229-2-git-send-email-eu@felipetonello.com>
Date: Tue, 19 Apr 2016 15:46:09 -0400
Message-ID: <CADkTA4Pi3dG1G4DZ+rNEfwVnMJZxDNBfXtXv_fMKprkgBmRquQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 19:46:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2016 at 11:40 AM, Felipe F. Tonello <eu@felipetonello.com>
wrote:

> Initial version of recipe. The main package could be split into two to
> separate the compiler. This also applies to protobuf recipe.
>
>
More precisely, this is the initial version outside of meta-virtualization
which enea added
in 2012 :) It was added as a dependency for criu (hence why it was put in
meta-virt).

If we move it to meta-oe, we at least owe that other implementation a
reference in the commit.

Did you check the version we have there for deltas ? There are differences
in the recipe, and
it would be good to know if you've looked and determined they aren't
necessary.

Cheers,

Bruce


> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 26
> ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> new file mode 100644
> index 000000000000..88cdb0bccd8e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
> +DESCRIPTION = "This is protobuf-c, a C implementation of the Google
> Protocol Buffers data \
> +serialization format. It includes libprotobuf-c, a pure C library that \
> +implements protobuf encoding and decoding, and protoc-c, a code generator
> that \
> +converts Protocol Buffer .proto files to C descriptor code, based on the \
> +original protoc. protobuf-c formerly included an RPC implementation; that
> code \
> +has been split out into the protobuf-c-rpc project."
> +HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
> +SECTION = "console/tools"
> +LICENSE = "BSD-2-Clause"
> +
> +DEPENDS = "protobuf-native protobuf"
> +
> +PACKAGE_BEFORE_PN = "${PN}-compiler"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
> +SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz
> "
> +
> +SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
> +SRC_URI[sha256sum] =
> "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN}-compiler = "${bindir}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

