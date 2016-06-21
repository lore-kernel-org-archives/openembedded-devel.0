Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC9D960761
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 22:18:35 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t7so4755419vkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=P4MnUq7OrVZdqgz8+EPd6AVoOdTbK8RwmoseWpifIzc=;
	b=ouO/GI9oVz0aNrxG6gPe2Btl4EiVIjLtIEKSfzlhogM3P9hvpqhdNDJyhJoqn2P8++
	0NCJYnzgzx33a8THGaQcj4GHBd9O2OkCNLnyeZlSb+tdYrbbwfJMoOKXRVpm6AQjhhPt
	1Qw7N3LhS6IcFyWL/fKxh4OSwsJYw+ZTrImOcrfRoJl+S+XQKrfor9emneWu9zqgISSp
	yRDyfPU+jpROEztY9mz6qzbk5wIhYppPEDVy+eep4xZuzzqAGey/TBzYXxbQXpkdkxNk
	41IejXs+HvJn5GxPtBCJkCT1bwXW9Xwft1n/G5iiuGcQvvNbXU+HBoltpkbpHqyCKnCK
	413g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=P4MnUq7OrVZdqgz8+EPd6AVoOdTbK8RwmoseWpifIzc=;
	b=cibNMQzZIj+RVTnpLw3IcXWPk2umMYj3BlUy8NvuN7FwVbpaLrZ4888Bq+sFPkE0mt
	je6xwtwKNAujYthZK3vXFTg++hfodW/E7VhaH5SNfwdBlMpR9dWyW8uSUHAIwQgYt8ty
	ytcWwli8ZBpDuvDtiAfJh92XDqIpLalgLJJVaQD5SRHe/XyNIjd/+LIx5AniPO535lr+
	tfP4qoaZJI04qL4+HYOa3cCC9hh7ZuaMWaJx3wp80zddJ7TkhW1Kwf9qxZcGmfVgyjta
	4kgzm5EOfqttytQmhllAXE66w2/zbpl/jsiNzxlo01uL8hQXQdgyvj3rgJV0y5AkxASp
	0g7g==
X-Gm-Message-State: ALyK8tINxk5mofE9fcDtPti/kCZHPBTMKbuAGo6WK87goox/qIJBM+UaZ3pnEcrL8nhNIDK6Ffc6IhSet4BUFQ==
X-Received: by 10.31.97.199 with SMTP id v190mr9187216vkb.20.1466547515780;
	Tue, 21 Jun 2016 15:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.35.80 with HTTP; Tue, 21 Jun 2016 15:18:35 -0700 (PDT)
In-Reply-To: <20160621210707.5816-1-danismostlikely@gmail.com>
References: <20160621210707.5816-1-danismostlikely@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 21 Jun 2016 16:18:35 -0600
Message-ID: <CACS+7ZRwuU99kuEtgrpW2NiqdQGg2NeGr5x4M5J9VWGr65LyFw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH v2] icedtea7-native: make GCC 6 happy
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
X-List-Received-Date: Tue, 21 Jun 2016 22:18:37 -0000
Content-Type: text/plain; charset=UTF-8

On 21 June 2016 at 15:07, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> GCC 6 sets the default C++ standard to C++14 and introduces dead store
> elimination by default. icedtea7 is not ready for either of these
> changes, so just set the C++ standard back to gnu++98 and disable dead
> store elimination.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>

If this gets commited, can we remove the @usask.ca address from SOB?
It's not appropriate and I shouldn't have included it here.

> ---
>  recipes-core/icedtea/icedtea7-native.inc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index d624b7a..3344acb 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -17,6 +17,13 @@ PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-nativ
>  OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
>  CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
>
> +# Disable dead store elimination and set C++ standard to C++98.
> +# There are dead stores in the JVM that would be pretty hard to
> +# remove, so disable the optimisation in the compiler.
> +CFLAGS_append = " -fno-tree-dse"
> +CXXFLAGS_append = " -fno-tree-dse"
> +CXX_append = " -std=gnu++98"
> +
>  inherit native java autotools pkgconfig
>
>  JAVA_HOME[unexport] = "1"
> @@ -153,6 +160,8 @@ do_configure_append() {
>         for F in openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/agent/src/os/linux/Makefile ;
>         do
>                 sed -i \
> +                       -e"s|HOST_GCC = gcc$|HOST_GCC = ${CC}|" \
> +                       -e"s|HOST_CPP = g++$|HOST_CPP = ${CXX}|" \
>                         -e"s|gcc\$(GCC_SUFFIX)|${CC}|" \
>                         -e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
>                         $F
> --
> 2.9.0
>

