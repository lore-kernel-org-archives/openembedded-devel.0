Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB5A379886
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 18:19:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k38-v6so3777296qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P8ibzsO3Cdt37TnN7BO7EHbEAMiAyCPR+kL74GP73uE=;
	b=VJWfaAEfSC/VR3kuXYJxDqx0qgb/tfEN8XGKkDA6AKvua3W5FBmAOCsezfMX4G0Pkd
	gY2/ZJzK25g5kdMUU5v+6kb+rOKKCPddfjhcf7Lgyy+d1QhhOTiTddTgCMQs56Kw8gvQ
	6k1PrfwD+fyrRadak1+GgbXHCV2luJf+nWlSQgXcja2bv+zM676awSshBJDcfl//5Tca
	vrUt3dpEDdrHsPuwxKEG2FOj1pHj7fF+clTlFMCHq9ER6Eu7Bw3KxLiURzh6uE9jnZ3n
	f91CzOP/6brDzZnpXvh2ZChU3tFjopa8LFB84+ZVXNwQN6OX+4SN8YfgStc90XWd5W/Q
	07vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P8ibzsO3Cdt37TnN7BO7EHbEAMiAyCPR+kL74GP73uE=;
	b=VHKdGnrJ/jEcMzBWGF8fwy9bCUSiIkp59vKhuKcWwv6A3BOkb5/f54Ccq85m7CdL0L
	65HiwKJ/8ZP201XibN+l+HUa2ru63pXf+f4tKgUz2U4MDYtidRwO5EOjjzxVnQ5F6S8B
	GkYeQG8qtRhIOH1dYem371+a8ptx6CaIjd2A2sDN+cXRlZ4euSSmjkY895iz/6LHiYF2
	rH2ojKQMF7an+dsD7ekUDt8W1wId/2ssuvvB+PtM3Eqyic7speShBL5iCjPw6aRel4Oh
	0l77fyHcqkxffIXqsZjme2/DupEXAiiFib7bGhGyhwwTK+DWA0f5txS4ORqqdURaj4Zf
	oh+w==
X-Gm-Message-State: ABuFfohyZFjp6vl1KudToZZYvi5f2i2752T/5lssGsjgRMRHFJXZy8L9
	+GZNRyzzrMqDQRblEmXxOqHHDE55HYw8cH3JecQ=
X-Google-Smtp-Source: ACcGV60H/ysoeiCuExJH+Xt0SMrNOI7DOwyF8AB//ROp3y7nu/pdgjQbNfWVa/Wa2JEyj8lelgcyAP/WIBPeG7UcOZM=
X-Received: by 2002:ac8:435b:: with SMTP id
	a27-v6mr9099803qtn.295.1538072360324; 
	Thu, 27 Sep 2018 11:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQc_+P8FZYGiZ-DNMWCBmk3XpKSUU6WhGpOs0USzPspD7g@mail.gmail.com>
	<20180927174423.12350-1-Martin.Jansa@gmail.com>
In-Reply-To: <20180927174423.12350-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 11:18:53 -0700
Message-ID: <CAMKF1srmoXOcMALFxbDn3rUHYTZJtLQZz+Am16PL4-jJ2rxbxw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tsocks: use -lssp_nonshared also for glibc
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
X-List-Received-Date: Thu, 27 Sep 2018 18:19:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 27, 2018 at 10:44 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * the issue is reproducible also in glibc builds
> * fixes:
>   | tsocks.c:954: error: undefined reference to '__stack_chk_fail_local'
>   | tsocks.c:842: error: undefined reference to '__stack_chk_fail_local'
>   | tsocks.c:339: error: undefined reference to '__stack_chk_fail_local'
>   | tsocks.c:522: error: undefined reference to '__stack_chk_fail_local'
>   | collect2: error: ld returned 1 exit status
>   | Makefile:53: recipe for target 'libtsocks.so.1.8' failed
>   | make: *** [libtsocks.so.1.8] Error 1
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> index 72913579af..790a6cc795 100644
> --- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> +++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863
>
>  inherit autotools-brokensep
>
> -LIBS_append_libc-musl = " -lssp_nonshared"
> +LIBS = "-lssp_nonshared"
>

hmm, now I think more it is a SECURITY_LDFLAGS element. Since
this is not needed otherwise.

>  S = "${WORKDIR}/tsocks-1.8"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

