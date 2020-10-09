Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.1554.1602269316794063780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 11:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kbUHpgSX;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id r10so7891153pgb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uWJg9SfXLCk/qGV3TShdr0/fhyuLL6CGn6nnxz8IgSQ=;
        b=kbUHpgSX4Clam8SAjmEIQrUl8xB88WH40vy38CB0CjdgN1R7lOPPSLH6kFg+a3wT8l
         jiBAhezxUztDDb88FDOZNzxal0NcSg9BVu0v1rAhG/iDy1NJulnx9P5ugIXOPtvoCurW
         KCaq/e4INu4Qj4K1wAlPgTqyS9Wf+SXuZvnpAPk+/vB6MJk6WbcAZk6MapEd7ATm17fJ
         6rgje8W0kaRjqphVWJP8E0xAdQIJ0FRQWy4ChtiwiMn2MNBWQM4rF6eLQfDv08VFnPgJ
         6ccX6OCbltAO0VZBDuXvCWu8HraoiC0NOXTsuaBM9M46WXdYlL6S2G4G9TreraTHUqJ0
         TurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uWJg9SfXLCk/qGV3TShdr0/fhyuLL6CGn6nnxz8IgSQ=;
        b=KHc8tVb01mHUzKHdYrr4Q2XRjK/vUouLUD7DzBojaK9gm+M925KAB1DLTpfCR8Ot4r
         VVM7Nei5+23IGND2fU2+FqBBazbNjHH55JXo4P0dVTRCHAoIMjYdZno0BPtyRJV+PGYN
         SHZXYFXsFgRXtl0SeWq6InYU+XzlSMae5w7UaX+9HkvBOryJWxfXFCvE1KnWZCD50F4Z
         enrQIAco9mZhpdT0V18RSGrLRphZ67Pd25XAemBs27VWyxV5EOGbBP0VS6eheY/Dodrr
         hoWM7cYXi264nxrwuHjHswmoEvX0mf9j2zK+DbaK61mCBH5R5cSRbmoYNvz5tP1GQBoL
         S73A==
X-Gm-Message-State: AOAM53227OG3OG5qNF1tMb29Ds+u5gTa1QbHdkwjr46eMlVbKefT7jc4
	olelL11z1Qvd1HVmRueqrhE=
X-Google-Smtp-Source: ABdhPJxLAJveB++5c4QFxZ6jbXaJtEVJb/vBkz0MO6NUn0Bct8+/LKfsrtyqJVv39pn4rSMttTv1Yg==
X-Received: by 2002:a62:92c8:0:b029:152:1703:2da9 with SMTP id o191-20020a6292c80000b029015217032da9mr13142588pfd.60.1602269316255;
        Fri, 09 Oct 2020 11:48:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:35fc:34e3:9834:c6b? ([2601:646:9200:4e0:35fc:34e3:9834:c6b])
        by smtp.gmail.com with ESMTPSA id n9sm11520692pgi.2.2020.10.09.11.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 11:48:35 -0700 (PDT)
Subject: Re: [oe] [PATCH] multipath-tools: replace perl with sed in libdmmp/Makefile for pseudo
To: Geoff Parker <geoffhp@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
References: <20201009183335.30362-1-geoffhp@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e7045f40-1691-bdeb-072d-3395ab99b862@gmail.com>
Date: Fri, 9 Oct 2020 11:48:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201009183335.30362-1-geoffhp@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/9/20 11:33 AM, Geoff Parker wrote:
> From: Geoff Parker <geoffrey.parker@arthrex.com>
> 
> The multipath-tools libdmmp/Makefile install target uses 'perl -i' instead
> of 'sed -i' for string substitutions. The perl method creates a temporary file
> and overwrites the original which changes the inodes and corrupts the pseudo
> db. Changes to pseduo cause a build abort rather than allow possible bad
> ownership or permissions settings on the files. 'sed -i' is compatible
> with pseudo.
> 

while I think this patch is ok, I am not sure about the reasoning, when 
perl is running under pseudo contect perl -i -pe should be generating 
all sys calls under pseudo context, so how does this gets missed. is it 
something peculiar to perl ? I ask this because perl is commonly used to 
do sed like operations so do we have this issue in all those packages too ?

> see https://wiki.yoctoproject.org/wiki/Pseudo_Abort
> 
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>   ...-replace-perl-with-sed-in-install-ta.patch | 40 +++++++++++++++++++
>   .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> 
> diff --git a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> new file mode 100644
> index 000000000..b35d67cf5
> --- /dev/null
> +++ b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> @@ -0,0 +1,40 @@
> +From 35421d03898ac1b38f97a76241e6a29086d0c9f1 Mon Sep 17 00:00:00 2001
> +From: Geoff Parker <geoffrey.parker@arthrex.com>
> +Date: Fri, 9 Oct 2020 17:48:47 +0000
> +Subject: [PATCH] libdmmp/Makefile: replace perl with sed in install target to
> + work with pseudo
> +
> +The multipath-tools libdmmp/Makefile install target uses 'perl -i' instead
> +of 'sed -i' for string substitutions. The perl method creates a temporary file
> +and overwrites the original which changes the inodes and corrupts the pseudo
> +db. Changes to pseduo cause a build abort rather than allow possible bad
> +ownership or permissions settings on the files. 'sed -i' is compatible
> +with pseudo.
> +
> +Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> +---
> + libdmmp/Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/libdmmp/Makefile b/libdmmp/Makefile
> +index 1dd3f340..8166075c 100644
> +--- a/libdmmp/Makefile
> ++++ b/libdmmp/Makefile
> +@@ -34,11 +34,11 @@ install:
> + 	$(LN) $(LIBS) $(DESTDIR)$(usrlibdir)/$(DEVLIB)
> + 	$(INSTALL_PROGRAM) -m 644 -D \
> + 		$(PKGFILE).in $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> +-	perl -i -pe 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
> ++	sed -i 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
> + 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> +-	perl -i -pe 's|__LIBDIR__|$(usrlibdir)|g' \
> ++	sed -i 's|__LIBDIR__|$(usrlibdir)|g' \
> + 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> +-	perl -i -pe 's|__INCLUDEDIR__|$(includedir)|g' \
> ++	sed -i 's|__INCLUDEDIR__|$(includedir)|g' \
> + 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> + 	@for file in docs/man/*.3.gz; do \
> + 		$(INSTALL_PROGRAM) -m 644 -D \
> +--
> +2.20.1
> +
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> index 48a348d80..331c0cd01 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> @@ -43,6 +43,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
>              file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
>              file://0030-Always-use-devmapper.patch \
>              file://0031-Always-use-devmapper-for-kpartx.patch \
> +           file://0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch \
>              file://0001-fix-bug-of-do_compile-and-do_install.patch \
>              file://0001-add-explicit-dependency-on-libraries.patch \
>              file://0001-fix-boolean-value-with-json-c-0.14.patch \
> 
> 
> 
> 
> 
