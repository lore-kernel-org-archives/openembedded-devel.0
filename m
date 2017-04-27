Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 497C477D20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:44:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z129so5063569wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X7NxdSP9LUnp9CDCGxiv8iyjW6obEUnsgNJpEBWaozg=;
	b=fIQiC26yHnx8H1C4tNnEcn7WOSIUj21ljJ7Nvk6IpgxVQdPaA+sXn9FUcCfoGcPvcU
	lDhj4y3fPhqUDYLinIRQ3VrxxvoDbzPkGiiW229PT+9jtmg6CmsAdnFWZtHlO8Y2XRxJ
	IiHKtW5NdYfIINXSE795U32FktJVQhi5wF4PBDhnf31pV4Gxdp+StNClEErZkyBWqyF9
	LF9bgJbTAwnMmBsmZem7/eAiaGVQXxxYhqlRqjqhEssCog60ftrFcrTH4IVnHdmQKLHG
	/+pTK1Glex8JLuPijrhYcFgcp7+gGC505vIJgfL5WMzQiN3BAQpmKuAT5Y8iMgknA//u
	uPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X7NxdSP9LUnp9CDCGxiv8iyjW6obEUnsgNJpEBWaozg=;
	b=FgEdT8CmuEiBRrEu9x8ngk78oWyw7SpjDSy0w3BWt7rmf43KWabrconq4CpnPqiRQH
	EiKStNQdX5fc757qbPJstXQDdOC6OsKfiG8wlQU/zmzDETSx/JmzxfAUk9QmqUsXG6WY
	jmtjtsD9o15AB8n4qKcg9RC1DWlekR0dwbXDJMI3Y/czVWlkBTuaJlCeI1aIdNSZYLxo
	hntGJkwPHdALP4wFDAEjKRZw10eDRsRJ4nZJUQed1kDjx+gtx9uuIna5ugiDSsb6kEBh
	MlFbXB8r3Yb9vEtphD0elmbxr72KPQyXU/140iKuJG+GjVZueoMjCFH2EO6feJv0Yipz
	7YPQ==
X-Gm-Message-State: AN3rC/5Bqm5cV905D7Q02COebVbXEaHupZUBGnopyL81BAb+zEzHHqUz
	8iWNDQmmjASxLkJXU/yJJb6QEEDjw8S7
X-Received: by 10.80.136.74 with SMTP id c10mr4969356edc.168.1493304289903;
	Thu, 27 Apr 2017 07:44:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 27 Apr 2017 07:44:49 -0700 (PDT)
In-Reply-To: <1493275064-7998-1-git-send-email-Qi.Chen@windriver.com>
References: <1493275064-7998-1-git-send-email-Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Apr 2017 16:44:49 +0200
Message-ID: <CA+chaQeF3pcN7N1JzvKDJG+b3v8pcyQiHn42hpTWhtZYF+eVZg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsdump: upgrade to 3.1.6 and remove from blacklist
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
X-List-Received-Date: Thu, 27 Apr 2017 14:44:49 -0000
Content-Type: text/plain; charset=UTF-8

And it still fails:
http://errors.yoctoproject.org/Errors/Details/141368/

On Thu, Apr 27, 2017 at 8:37 AM, <Qi.Chen@windriver.com> wrote:

> From: Robert Yang <liezhi.yang@windriver.com>
>
> The 3.1.4 doesn't work with xfsprogs 4.7:
> | inv_files.o: In function `inv_dirpath':
> |xfsdump-3.1.4/invutil/inv_files.c:53: undefined reference to `ASSERT'
> | inv_files.o: In function `inv_fstab':
> |xfsdump-3.1.4/invutil/inv_files.c:60: undefined reference to `ASSERT'
> | inv_files.o: In function `inv_lockfile':
> |xfsdump-3.1.4/invutil/inv_files.c:67: undefined reference to `ASSERT'
> | inv_files.o: In function `inv_basepath':
> |xfsdump-3.1.4/invutil/inv_files.c:74: undefined reference to `ASSERT'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [../include/buildrules:33: xfsinvutil] Error 1
>
> Upgrade to 3.1.6, and remove it from blacklist.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-utils/xfsdump/{xfsdump_3.1.4.bb => xfsdump_3.1.6.bb}    | 6
> ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.4.bb =>
> xfsdump_3.1.6.bb} (79%)
>
> diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
> b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
> similarity index 79%
> rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
> rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
> index d5ad0b0b2..fac9d47e8 100644
> --- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
> +++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
> @@ -13,8 +13,8 @@ DEPENDS = "xfsprogs attr"
>  SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
>      file://remove-install-as-user.patch \
>  "
> -SRC_URI[md5sum] = "a8b1761be5feb363131e7b506639ad4c"
> -SRC_URI[sha256sum] = "570eafd0721515bdd79cb0e295b701
> d49cdf81e71a0a0ff0df6d4c5cc1960943"
> +SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
> +SRC_URI[sha256sum] = "7f78c11ca527477d90e5e62b0778f3
> ad96f2b71c19173044e9aca9515fff42d0"
>
>  inherit autotools-brokensep
>
> @@ -34,5 +34,3 @@ do_install () {
>      oe_runmake install
>      oe_runmake install-dev
>  }
> -
> -PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

