Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D0DBF719C3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2017 00:03:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so5183076wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BXaLCoBhaJ28Gid4+yDCjDQ3ld/VXjwX27qroerdPz4=;
	b=jKiPjQo+lBtmtng62IUSYwuRCXcdKB3MhB+XxkmYhoNT2L4tB/oLSfTGYVvhaXddfR
	syhcCDCo3Coab4T1G6ahCkjryIXhumhbaIUzvLSbvHZdlwM7D6YWiA4Wo4i7Br9LR4fV
	LT+mqFechh0wgeai7LWDgaU7fOQb6IB8OoafTh6bhrQFhOeS9a9RTxAbPBDrAwbavqqv
	EoBq0Sd5aOV/FLlpQsFkH1fj8EXowLaCHr6S/KN1RMGvUAyq2hrQWPqYjjP6IvB+ELf4
	4L/KhC8WUb8y15iAmxKn6i6Z3VjR8YqBBfntKzNx+MgjCnlxN/dcWZiEn55iMtJdLAlC
	ulTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BXaLCoBhaJ28Gid4+yDCjDQ3ld/VXjwX27qroerdPz4=;
	b=h7x+YlNrJmLckWfqNySeIFqDuJ2f6FgRzIR7HzYiXbO8QxMNS8RaBlk7kjE07tFXaQ
	XWbRT8JokgdwsaTOnk6uGZpSHmxE0TJvWVy1G/p5Fc0whx268OU5rjNVE4+N8VZVWDMM
	KgZ1yJ1HqNslbTliT4JDAafMeaRW4iACxpox/qMbDUnTROVc0qN3d6lK/hpc2JqYj70H
	0GGTMJAw0hAhQ/FDOScb5ek1kyRZWCLCeg2CzcYesWRWxH4PZ7S4dxtPvMuiivhi1ky7
	DH8Fl9g5jMCMlBb5nnXsrrBClzvmRqmV3aAFGThC2XS74fpmNJTV/JDUhh3k8xevlASZ
	ngjQ==
X-Gm-Message-State: AMke39mpUUv8rX4eVPBZ58RZOgXrTPYzAusZg1l/dbWPxu4rjUbKvmDTNIfB5PUzHbxFR5+ddu3upU4Qc53tPw==
X-Received: by 10.28.6.78 with SMTP id 75mr5088019wmg.81.1487981037478; Fri,
	24 Feb 2017 16:03:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Fri, 24 Feb 2017 16:03:56 -0800 (PST)
In-Reply-To: <1487979579-7984-1-git-send-email-derek@asterius.io>
References: <1487979579-7984-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 25 Feb 2017 01:03:56 +0100
Message-ID: <CA+chaQfByGPt4qL3O0PmXdENAu4iOE9N8jbi8xMdOiYUSaYsQg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] system-config-keyboard: fix depends to work correctly with RSS
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
X-List-Received-Date: Sat, 25 Feb 2017 00:03:58 -0000
Content-Type: text/plain; charset=UTF-8

isn't gettext-native already added by gettext inherit? Strange

On Sat, Feb 25, 2017 at 12:39 AM, Derek Straka <derek@asterius.io> wrote:

> Resolves build issue exposed by RSS
>
> See http://errors.yoctoproject.org/Errors/Details/132829/
> and http://errors.yoctoproject.org/Errors/Details/132855/
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../system-config-keyboard/system-config-keyboard_1.4.0.bb          | 6
> +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-support/system-config-keyboard/system-
> config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/
> system-config-keyboard_1.4.0.bb
> index f52b594..26b4412 100644
> --- a/meta-oe/recipes-support/system-config-keyboard/system-
> config-keyboard_1.4.0.bb
> +++ b/meta-oe/recipes-support/system-config-keyboard/system-
> config-keyboard_1.4.0.bb
> @@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
>  SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b
> 5c2ece28df772f2155fd044b9bb1614284"
> -inherit python-dir
>
>  inherit python-dir gettext
> -DEPENDS = "intltool-native"
> +DEPENDS += "intltool-native gettext-native"
>
>  EXTRA_OEMAKE = " \
>      PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
> @@ -27,6 +26,3 @@ FILES_${PN} += " \
>     ${datadir}/* \
>  "
>  BBCLASSEXTEND = "native"
> -
> -PNBLACKLIST[system-config-keyboard] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132829/"
> -PNBLACKLIST[system-config-keyboard-native] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132855/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

