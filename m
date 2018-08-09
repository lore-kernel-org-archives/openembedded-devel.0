Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC77560402
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 11:04:02 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id l189-v6so3891758ywb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2018 04:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0G8s9vWcmYbuwkROW+50uFyCERpVRGveJg8gPRVQyso=;
	b=e0da7r0SE+ghTrZ5JP2H2N3f64jJr8+WYuBWnXlFDDZJX1tyDMdttmIBzHP7vmn9fm
	3vKgck/s9k+hgi85jUcF0ZGd2a4sDc6qxrQ8rso8NShM7UIQK0MwUsVQUhqeMlZoglc5
	17KzXMMLA2NuOKP5By6LvGU5j5Y3/dm1eBOKPfTByq2rbF0OdiEZy2IH07NJj54is5U/
	50+9kRRH7jJl+dwK6ER2rIp6rkbQ50j2j8fAJDZSOBQbvZgyii91VqVeHjWvfZUJVJOo
	kFW4LSLnIIf5eRYWRpRcwG9LHEU4cA66Yi/nPPjSPZ4FDQNmOLn/vSWMIH8mj984FlP3
	8ynA==
X-Gm-Message-State: AOUpUlGbq2aiPBe4ysXuyBJQl5Qip2hSvhLDPAHBa2vE1pAWptAZsODU
	rz4t/ylK6ZYsXEQMq6L6jadazdyY
X-Google-Smtp-Source: AA+uWPwa9u1lLE11LpoWsMQxRj1qpOlDHaUGjc9dYUs85RjCBTxQh2aHeQ9OjrAfHAZyB82pqKz7iw==
X-Received: by 2002:a81:4153:: with SMTP id
	f19-v6mr767001ywk.418.1533812643681; 
	Thu, 09 Aug 2018 04:04:03 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	y188-v6sm2944787ywe.2.2018.08.09.04.04.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 04:04:02 -0700 (PDT)
Message-ID: <6464289341266dc9d8b146f788f07aac3af57c2a.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org, "Maxin B. John"
	<maxin.john@intel.com>
Date: Thu, 09 Aug 2018 12:04:01 +0100
In-Reply-To: <20170930022455.137406-1-fupan.li@windriver.com>
References: <20170930022455.137406-1-fupan.li@windriver.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-8-common: Fix the issue of building failed adlc on host with gcc < 6
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
X-List-Received-Date: Thu, 09 Aug 2018 11:04:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Maxin,

You reverted this patch, do you remember what the problem was? It looks
useful, and I believe a solution similar to this one is actually needed...


Cheers,
Andre'

On Fri, 2017-09-29 at 19:24 -0700, fupan.li@windriver.com wrote:
> From: Fupan Li <fupan.li@windriver.com>
> 
> The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-
> flags.patch
> had tried to fix this issue, and it tried to filter out the
> TARGET_FLAGS/TARGET_
> CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to
> CFLAGS/CXXFLAGS,
> directly, thus that patch failed to filter it out.
> 
> To fix this issue, it's better to add those GCC version specific flags to
> BUILD_CFLAGS/
> BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly, thus that
> patch can work
> as expected.
> 
> Signed-off-by: Fupan Li <fupan.li@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 36 ++++++++++++++++++++----
> -------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
> core/openjdk/openjdk-8-common.inc
> index 83828e1..c609232 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -231,27 +231,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-
> pointer-checks"
>  # version is and only add the flags that are appropriate for that GCC
>  # version.
>  
> -def version_specific_cflags(d):
> +def version_specific_cflags(d, toolchain):
>      extraflags = None
>      version = None
>  
> -    if bb.data.inherits_class('native', d):
> -        from subprocess import Popen, PIPE
> +    from subprocess import Popen, PIPE
> +    cmd = d.expand('%s -dumpversion' % toolchain ).split()
> +    cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
> +    version = cc.communicate()[0].decode('utf-8')[0]
>  
> -        cmd = d.expand('${CC} -dumpversion').split()
> -        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
> -        version = cc.communicate()[0].decode('utf-8')[0]
> +    if version.isdigit():
> +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> +        return extraflags
> +    return ''
> +
> +python __anonymous() {
> +    if bb.data.inherits_class('native', d):
> +        toolchain = d.getVar('CC', True)
> +        extraflags = version_specific_cflags(d, toolchain)
> +        d.appendVar("CFLAGS", ' ' + extraflags) 
> +        d.appendVar("CXXFLAGS", ' ' + extraflags)
>      else:
>          # in the cross case, trust that GCCVERSION is correct. This won't
>          # work if the native toolchain is Clang, but as of this writing
> that
>          # doesn't work anyway.
>          version = d.getVar('GCCVERSION', expand=True)[0]
> -
> -    if version.isdigit():
>          extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> -        return extraflags
> -    return ''
> +        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
> +        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
> +
> +        toolchain = d.getVar('BUILD_CC', True)
> +        extraflags = version_specific_cflags(d, toolchain)
> +        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
> +        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
> +}
>  
> -CFLAGS_append = " ${@version_specific_cflags(d)}"
> -CXXFLAGS_append = " ${@version_specific_cflags(d)}"
>  CXX_append = " -std=gnu++98"
> -- 
> 2.11.0
> 

