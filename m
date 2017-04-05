Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE79471E01
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 17:52:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g19so4806365wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pzch5y9CxkAFTOYHYSvZVhcWsuQLk9aRuxO/pHOXeZk=;
	b=DfA5SELiMtRmOGQqXmUOqXHGC0oiUxM7vDWvAW1bGCvh3435smcu8EoKyMGnjB75Z3
	SenclkZRFs3KFbAOc3wSrZKtwIXtmUwMTtdZ+53grgZFCHI+gUxHQkRggEOdcr4WqiPd
	z2Pnk60eLtJTddBwhXjpeU/cxQATIv2sQC4LoY+Pu6KnWj4TS/ltOl/TGEXawfj4RC/p
	snOu1yxeHe8mflKTqN3TijKQ1xjUObYntjDOOS/BJWZdtX4z1NC6WmMU2HgB1XwSF8Tk
	tBNc47JCBGMlQKvowW7B/R0KfT272eli6FSi68KpBXg5RVUPKb3AFNdL5Ju7MomKSlls
	Lv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pzch5y9CxkAFTOYHYSvZVhcWsuQLk9aRuxO/pHOXeZk=;
	b=k9oaqebUT3JgTQ2nI7JPGm7CQepf/EpmcVgBIBs/V2iONWLIsB3YAaAt9bDnBAWkhN
	N++cPdhbA3LdLVxNA1YzhRUIZty5a92xpMFqZQ67xLg6BXU3Wz3QZJMqR1MqssukdO8X
	RG8pgekJB5V0lBk205AypcibMPM9jmS5ZGTBSXapI44apJAXDrlGP+Zqwf24CyRsNfdX
	9AxvYSrkCmpeI1vvZv9TWy6w/WLkXO4QePoFd36CFK8EFdVlOj6cDCQGrP49S5ivy5JG
	yqANohazdcaAzKbknUXggPdlPIV7sYnhOwn1c7C77k3Hz4WjIlWjlkqH/ZVfeaHwO07O
	5MVA==
X-Gm-Message-State: AFeK/H3zY8aotE7ARq5gAkMBYMk9hFHRovRQ93lM3zOU9AjEx32KJVeMTq+lkuMko4lWqHdO0LYCsTOEZk3j4w==
X-Received: by 10.223.132.129 with SMTP id 1mr27566848wrg.172.1491414754611;
	Wed, 05 Apr 2017 10:52:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 10:52:04 -0700 (PDT)
In-Reply-To: <20170403183737.14791-2-Martin.Jansa@gmail.com>
References: <20170403183737.14791-1-Martin.Jansa@gmail.com>
	<20170403183737.14791-2-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 10:52:04 -0700
Message-ID: <CAMKF1soLVmxmm8QWp_8HJoRXncvkGE3hDVncnNRNBu7Q0L5czw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/5] logfsprogs: Blacklist, doesn't have proper PV, doesn't respect LDFLAGS
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
X-List-Received-Date: Wed, 05 Apr 2017 17:52:34 -0000
Content-Type: text/plain; charset=UTF-8

actually I have fixed this

https://github.com/kraj/meta-openembedded/commit/d59df07060d145aa8cd5c88986250e92f29c466c

On Mon, Apr 3, 2017 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> index 32ebec83d..7a00e0c21 100644
> --- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> @@ -24,3 +24,6 @@ do_install () {
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +# logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
> +PNBLACKLIST[logfsprogs] ?= "Doesn't have proper PV, doesn't respect LDFLAGS"
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

