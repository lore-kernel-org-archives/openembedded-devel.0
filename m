Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA2DD71B87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 21:26:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 68so941338wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 14:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+cUFG1oYJYTk9IZprT2gPGQqz22I74noNjyCYKgyh+k=;
	b=EqCdab0uqXTfuN6rSYgV0Goye+bRMM4OUQgV4LhIekQ79Ym9N+3xruZemt2dtQ/hSQ
	e8p/i6sd477VbuVb8GntkNSM0bij3+dnL6uZ0MjiSIqsGrd8o/BVvEhzeKmiRWgCHM+e
	ZVQHwVrNsW29o12eMHHuZx8cNg1uSwDK6UKpdJxzb/buyltcOorzb7xeEeJGmNpnWeoh
	rucr2kWdg+lBULJU8oYbZJqX3AhTQvxxijBFhUoYDzzfaQQnpyWl9PWsxt5p4hFnjcXL
	xmgisQsuthNPoaCZZuusCjAHB706Bzkxmqm4+9fpkpvN3PAN8kcDcK9/OZkLO+lvtU4d
	7bmw==
X-Gm-Message-State: ABUngvfXi08Vvm+p8d0VR8gbxECOfe2y45wdeTR/PzzYgRpsa6XoGyPp7B1HbLf0c7hlfQ==
X-Received: by 10.194.23.67 with SMTP id k3mr9106486wjf.103.1478208402240;
	Thu, 03 Nov 2016 14:26:42 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id u64sm1084893wmd.6.2016.11.03.14.26.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Nov 2016 14:26:41 -0700 (PDT)
Message-ID: <1478208400.2940.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 03 Nov 2016 21:26:40 +0000
In-Reply-To: <20161103173342.13661-1-raj.khem@gmail.com>
References: <20161103173342.13661-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/2] krb5: Add -fPIC to compile flags
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
X-List-Received-Date: Thu, 03 Nov 2016 21:26:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-11-03 at 10:33 -0700, Khem Raj wrote:
> Fixes errors on x86_64 e.g.
> errors.so: relocation R_X86_64_PC32 against symbol `k5_vset_error' can not
> be used when making a shared object; recompile with -fPIC
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb b/meta-
> oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> index e2d0594..06f7f90 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> @@ -51,8 +51,8 @@ CACHED_CONFIGUREVARS +=
> "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
>                    ac_cv_printf_positional=yes
> ac_cv_file__etc_environment=yes \
>                    ac_cv_file__etc_TIMEZONE=no"
>  
> -CFLAGS_append = " -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
> -LDFLAGS_append = " -lpthread"
> +CFLAGS_append = " -fPIC -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
> +LDFLAGS_append = " -pthread"

Hm, it would be useful to add -pthread to CFLAGS as well in this case. That
flag is doing more than just adding the library to the linker command line,
see gcc -dumpspecs

Cheers,
Andre'

>  
>  FILES_${PN} += "${datadir}/gnats"
>  FILES_${PN}-doc += "${datadir}/examples"
> -- 
> 2.10.2
> 

