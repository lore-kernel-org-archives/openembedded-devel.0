Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E572600EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:58:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r126so41082434wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 00:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FQE2eGmm+J0yv/x0GafjHq5zkGfaYPn9Owlorgxhe9k=;
	b=bCY3ATHc5ZRq1peU7v98Wag9+XI0/AHShIjelaUpfy7AhL+m180v9F+9O7M1f8cETp
	+4HDTOWv0yv8a3VAdso95FvzGP/qFo8pcD1JVzlggsFIfpoij8nxZHB2D/Z4nYLa7ZPe
	ZUqmzVe8nprnpyr2iwGAfmCSy6/HA8vqGDyBj/oEa9RRsJX+fHOmBLg5HwutND7PMlou
	zBrl1slI0mS2sjcKO8ZEFz0rvd70x/SubYQXv52hufe8oA8GKOiJVfpf633Grkzqu0dP
	FwLTr6K+A1fLHb6n9KydqoKyqkg/79mC6boHeCZsymY5dQuoOGyBU0hVal8WL9ZO8Hbc
	9vvA==
X-Gm-Message-State: AIkVDXKTFwlmoA9DFCdOZzawrXHTjhS+gsM7h8ZAuOBKGfqp3FcblOSjfXwn0bQd/B571g==
X-Received: by 10.28.11.135 with SMTP id 129mr20769147wml.111.1485334714636;
	Wed, 25 Jan 2017 00:58:34 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 1sm2115742wmz.2.2017.01.25.00.58.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 00:58:34 -0800 (PST)
Message-ID: <1485334713.6808.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 08:58:33 +0000
In-Reply-To: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
References: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Wed, 25 Jan 2017 08:58:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-24 at 11:19 -0800, Andre McCurdy wrote:
> When cross compiling, the word size of the compiler set via HOST_CC
> must match the word size of the target. That's achieved by appending
> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
> 
> Unfortunately the current list of over-rides (powerpc, x86 and arm)
> does not cover all cases. Add mips and mipsel to the list too (which
> is still not enough to cover all targets or corner cases such as x32,
> but better than before).
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-
> oe/recipes-devtools/luajit/luajit_2.0.4.bb
> index 964dc1d..2049846 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> @@ -24,6 +24,8 @@ BBCLASSEXTEND = "native"
>  BUILD_CC_ARCH_append_powerpc = ' -m32'
>  BUILD_CC_ARCH_append_x86 = ' -m32'
>  BUILD_CC_ARCH_append_arm = ' -m32'
> +BUILD_CC_ARCH_append_mips = ' -m32'
> +BUILD_CC_ARCH_append_mipsel = ' -m32'

I suspect this should be using:

BUILD_CC_ARCH_append_mipsarchn32 = ' -m32'
BUILD_CC_ARCH_append_mipsarcho32 = ' -m32'

to also cover mips r6?


Cheers,
Andre'




