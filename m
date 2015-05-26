Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id DE7B16AC12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 16:42:02 +0000 (UTC)
Received: by igcau1 with SMTP id au1so57797721igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5JBwNc3ihoy/b0t6AXGFVG+9zQcJrW7wqlxhayIoZQs=;
	b=C8o6kkyBm4RM2M2CS5RfpmQTCUyN2oJHeMzMU5qaUo7Y78K7MC6MtO4869KTeMlV5H
	ipUVp7fdBzbE+g/1Qo8dbeMhv565TGRv/Zyd3DwU0sxMIGnE+XyVfJIMUUKMXMEhoH76
	m4dh4lVluXLrZ3KFsl68m6Dd4ejzsNFSMKzEQ0iJotlG08nOftf0dbGeRX0GHGhjWwtD
	UdkY8+oF2r8gk6AvW7WHKvF7Wch0hP9MWfzgBnZz88Fm/mgGyYt3QwoEOi6GXpBwuh0U
	w/6DEUKRZ4HdBholZ219rW1jOCou4GXry29UTY4Deg/TFy2IrvZYttPf/IE+UHPXcsaV
	otSA==
X-Received: by 10.107.8.40 with SMTP id 40mr37245362ioi.38.1432658523612; Tue,
	26 May 2015 09:42:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Tue, 26 May 2015 09:41:33 -0700 (PDT)
In-Reply-To: <1432644406-4468-1-git-send-email-otavio@ossystems.com.br>
References: <1432644406-4468-1-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 May 2015 09:41:33 -0700
Message-ID: <CAMKF1spSun6ai_Wj9Ef8d2dtJytxOUH-+b4bbMaTycqhFNDbxg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-clang][PATCH] clang: Remove nativesdk-binutils dependency
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
X-List-Received-Date: Tue, 26 May 2015 16:42:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 26, 2015 at 5:46 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The dependency is not necessary for building of the nativesdk package.
>

merged.

Thanks

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-devtools/clang/clang_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
> index d197908..52352f2 100644
> --- a/recipes-devtools/clang/clang_git.bb
> +++ b/recipes-devtools/clang/clang_git.bb
> @@ -74,6 +74,7 @@ EXTRA_OECMAKE_append_class-target = "\
>  EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
>
>  DEPENDS = "zlib libffi libxml2 binutils"
> +DEPENDS_remove_class-nativesdk = "nativesdk-binutils"
>
>  do_configure_prepend() {
>          # Remove RPATHs
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

