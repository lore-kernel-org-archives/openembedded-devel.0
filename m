Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 16AB3731C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:20:26 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id c73so168658726qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=9mJm82XwCAEguHhdkJImEFdhqrua3lQ17GhhXflJ5Pw=;
	b=k+HdtpUfo3ig0N6d1PXOVfvOMStKBxKLT95AVWiMJPTuVqZ4OzY1sFRBcJ0jRdVl/t
	OPB1ZsUrunrv4I6+fTOM301HM7chwcAbhT4ldO9uOD8NcCQgmNdK56snZGEV3YDad1Ni
	1iiDp1vCvk909y1EYpdR8pTC+0Zh0CthM8Y+6G0Ezhlta8Qq/rCh60pK/AGGkGK3qT90
	ius/rwLP3CjkViePdNU8xKVFpksFxiIYHsTiPrz1ffvkuB5RBPxYxzlcsTbj7tDHKAuQ
	KZXI4HcoazwNLsR+ZUp0sYdij86y9hyeDUALVe1kt3jfSyjyUmIMIHZnEO2zevg5HbGo
	ZmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=9mJm82XwCAEguHhdkJImEFdhqrua3lQ17GhhXflJ5Pw=;
	b=YhLtP8MfsKZWOIBbRoynbF9mR+rYFAwl9Bv5Y4Hs9TGVS3F3QXmn9bAJPTc6Vs512I
	UIUCG3vnVzn2XcOzLKCOT1aqhckD87Gm5Ay8l/ogWQamKCd5u72gZqvf9yowaW5v/whN
	Ff3JoJb2nvsu/tW7gOIxrBBNEkuHC8p2gnU1SYClzU83H7ZLWVtU6U2q240F8j/JL5EK
	OALeUDTKI50ED5UvLutLD+yOa0Qo8+y8aP7uLis4IFVmmPsDXirp3edV6RL6+TPTJZcF
	A19q4pLaadxMW9r7iC3pUFmU4OEOl6696U0FcXbQeLusWw7mxUA2g0KqB5gRtsCdMhII
	F5Gw==
X-Gm-Message-State: ALyK8tJhgu6KI6fiHCTctwgcI8UuLUeeTvMCRF5YydZBuCeowYcaLhEjVyn6rjS0IKYBVFWuzecjCjOcdVWn9g==
X-Received: by 10.55.26.94 with SMTP id a91mr23545086qka.26.1466439627242;
	Mon, 20 Jun 2016 09:20:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Mon, 20 Jun 2016 09:19:56 -0700 (PDT)
In-Reply-To: <20160620140243.27440-1-danismostlikely@gmail.com>
References: <20160620140243.27440-1-danismostlikely@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2016 09:19:56 -0700
Message-ID: <CAMKF1sq_y2PRkjM_j6V1D2+qvvug=5g4tGUJTe0swG-au4N=nA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] icedtea7-native: make GCC 6 happy
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
X-List-Received-Date: Mon, 20 Jun 2016 16:20:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 20, 2016 at 7:02 AM, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> GCC 6 sets the default C++ standard to C++14 and introduces dead store
> elimination by default. icedtea7 is not ready for either of these
> changes, so just set the C++ standard back to gnu++98 and disable dead
> store elimination.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index d624b7a..fa78991 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -17,6 +17,14 @@ PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-nativ
>  OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
>  CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
>
> +# CXXFLAGS doesn't make it to all calls.
> +# Set the C++ standard version for C too.
> +CFLAGS_append = " -std=gnu++98 -fno-tree-dse -Wno-error"

this is interesting. what happens to C files ? I see that C++ files
may get the right options if they are using CFLAGS in makery
which should be fixed to use CXXFLAGS IMO

> +# Disable dead store elimination and set C++ standard to C++98.
> +# There are dead stores in the JVM that would be pretty hard to
> +# remove, so disable the optimisation in the compiler.
> +CXXFLAGS_append = " -std=gnu++98 -fno-tree-dse -Wno-error"
> +
>  inherit native java autotools pkgconfig
>
>  JAVA_HOME[unexport] = "1"
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

