Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id AD5DE71BF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:39:10 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id d131-v6so9078850qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uctcmbx/BU1oIiT45kTsmS/t7mI/eKvxW7402qROSHs=;
	b=ksNgeaBV0RZ1YxnLLgMUlLYSeclaYUbZvcwx1n5ADM51pCa+szkeGnY8nlQ864qdm3
	GaLdqSwRPzVTScKD6sE5N2CPPlYUCWsf1u2JY6iE5nuAgASS6NK8fnZylEKEZ7kp9TfM
	QTLxAxoLhqW2kADrxkGhe9XrZoihgV9UXtn4Bkcxh+LyogTpG7yECd3E+CsEz5/HEqHx
	loYPXsAEr+t3Oat4NFt+602WHQk3iWFS7+NySp1hNDGjrbnoZBProYT+eWhbJFTrFOM9
	9ho8wF7t9XebP93XlW5peP7bkr1/UndPqxOttIk+0mey+TmLvNCuh6xvYyCuNYR08CIU
	0OsQ==
X-Gm-Message-State: APzg51AeK+lV0+UoNLAlVPYzmV1nttRKTWoyHkTxRLG12rEu+y8iJs1u
	TTLzbu8txzWQiNgkR+eF0zWAkp9V
X-Google-Smtp-Source: ANB0VdZUUvTdMRPBaqhqk8lSSEF4ugGapRtxToKKk2rLlSySYI1bd4PIi7IaY83gL5kMHLCvSNDp5g==
X-Received: by 2002:a37:4707:: with SMTP id
	u7-v6mr17481256qka.229.1537195151540; 
	Mon, 17 Sep 2018 07:39:11 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	z39-v6sm9506995qtg.60.2018.09.17.07.39.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 07:39:10 -0700 (PDT)
Message-ID: <a61039f1550ab18dd862f99506891423fcf28cd9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2018 15:39:09 +0100
In-Reply-To: <1536343810-87649-2-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-2-git-send-email-yevgenyp@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 1/3] ca-certificates-java: Fix sysconfdir for -native recipe
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
X-List-Received-Date: Mon, 17 Sep 2018 14:39:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
> When ca-certificates-java-native is built, sysconfdir variable will
> be set to value that includes WORKDIR.

What is your use-case for a -native version of this?

> Avoid patching source with this value - use sysconfdir_native.
> 
> Change-Id: I8ac79c3cd5016a8139d9d8c8d58bc2976d0b6fa3
> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
> ---
>  .../ca-certificates-java/ca-certificates-java_20180516.bb        | 9
> +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/ca-certificates-java/ca-certificates-
> java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-
> java_20180516.bb
> index 2db1915..7db5110 100644
> --- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
> +++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
> @@ -41,9 +41,14 @@ do_patch_append () {
>      bb.build.exec_func('do_fix_sysconfdir', d)
>  }
>  
> +# sysconfdir will include absolute native sysroot path in -native builds,
> avoid this
> +# (see 36.24 of 
> https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#faq)
> +SYSCONFDIR_VALUE_class-target = "${sysconfdir}"
> +SYSCONFDIR_VALUE_class-native = "${sysconfdir_native}"
> +
>  do_fix_sysconfdir () {
> -	sed -e 's|/etc/ssl/certs/java|${sysconfdir}/ssl/certs/java|g' \
> -	    -i
> ${S}/src/main/java/org/debian/security/UpdateCertificates.java
> +    sed -e 's|/etc/ssl/certs/java|${SYSCONFDIR_VALUE}/ssl/certs/java|g' \
> +        -i ${S}/src/main/java/org/debian/security/UpdateCertificates.java
>  }
>  

No.

It's probably best to remove the BBCLASSEXTEND statement in this recipe
instead, as it was never tested, and is unlikely to be needed.

The whole idea is to make this independent of the build machine paths. If
you want a -native version of this, you still need to make sure to point
this into the yocto sysroot. Otherwise this will try to write to the *build
machine's* /etc/ directory!

If you really want a -native version, you need to point this into the
sysroot, and update this dynamically because of sstate usage, too.


Cheers,
Andre'



