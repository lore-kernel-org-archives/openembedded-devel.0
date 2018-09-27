Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20F4578C9C;
	Thu, 27 Sep 2018 17:41:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so3507708wrx.12;
	Thu, 27 Sep 2018 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KOX5KCyP4c9v6ZYvXUyN5b80EXdmuniQZt563gf+p10=;
	b=F/33RHgoK3cS/Q2TH/NAkeA+hFUYa2a+w0asfpda3zMfG7dL0lns9sb1cZpAImZS5A
	/d3m9zu4XzWndUirts1OBFZe7rm9tT1qoqI8/tUS62ZKVJKQWE/74J+FD6vyeYf3brsz
	GAdZ1m65eYRBlRXXPMqa3JJdiNeoi6KO2wELlHicYlvBCnbiW1HAxcdMc2vm2aacgsXI
	8jyVoJx0rkevsLuhfLIMqJLO/3HSE7Ei2o572PeHogzrBLKdIPjQcfKWaUt4FOoLPTfq
	gFn3Vun4n7IXnnEj9PJZ8xE5fMLZS//xISO++V5z/splLnjM02sPLWhLRJe1PTI63kaj
	x1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KOX5KCyP4c9v6ZYvXUyN5b80EXdmuniQZt563gf+p10=;
	b=MG1igxUMHg/9BQg7oMAhNRGRObbm2hKD8PnYcdeD1ozEuY50IBnCUoG1sV1T/CK6HG
	gedclzbPkdPVioCvjVGYYrt0dSsrxtVK1S9lObelmLDgl8rHs2mn1l5sC2aFzZdxDZyN
	JLt1APUy5wYOgUxQPRv7QSVtYsKjGe/WMJpSKNqBRppZ3QEcyJ69C+sfuOf6TT0Sgy3n
	IEsE8D9Sp52Qjqs0O93F1TKFWkwVwSJCuzBkUumJkc3v8VWsbIcq2pCrQLV16zdA2cic
	ozOwIeah7YSXkLXUJZMXiOYANmePgkJBnRVm2FKeEcK6gTAbZa9W8fmqXrHuWA6dEiMM
	65XQ==
X-Gm-Message-State: ABuFfoj9hD9lyPYgzQSOqrUbLtSpUyTeC1CK+4+CtsQxtuIzA8ZR5id3
	Ft/QXEaHyuooX4KhdmZNVbP2sH5XFMg+LtA/Z0zUgc0h
X-Google-Smtp-Source: ACcGV63iQZnU4JGMLHCFd/KCsGKW139AzkIdrpn23iRi36OPtrB07tw6xZVLGyKcBjUD55ycQHeaaXvGBvIyPxIQ/ZU=
X-Received: by 2002:a5d:6ac5:: with SMTP id
	u5-v6mr1440973wrw.288.1538070113530; 
	Thu, 27 Sep 2018 10:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <153789232226.9619.13004385028475298655@git.openembedded.org>
	<20180925161843.DFECE234E18@git.openembedded.org>
In-Reply-To: <20180925161843.DFECE234E18@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Sep 2018 19:41:42 +0200
Message-ID: <CA+chaQc_+P8FZYGiZ-DNMWCBmk3XpKSUU6WhGpOs0USzPspD7g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 44/47: tsocks: Add -lssp_nonshared to LIBS explicitly on musl
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
X-List-Received-Date: Thu, 27 Sep 2018 17:41:53 -0000
Content-Type: text/plain; charset="UTF-8"

Is this really musl specific? I'm seeing the same failure with glibc
qemux86 build with security_flags included:

| tsocks.c:954: error: undefined reference to '__stack_chk_fail_local'
| tsocks.c:842: error: undefined reference to '__stack_chk_fail_local'
| tsocks.c:339: error: undefined reference to '__stack_chk_fail_local'
| tsocks.c:522: error: undefined reference to '__stack_chk_fail_local'
| collect2: error: ld returned 1 exit status
| Makefile:53: recipe for target 'libtsocks.so.1.8' failed
| make: *** [libtsocks.so.1.8] Error 1

On Tue, Sep 25, 2018 at 6:19 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 4a0e53cb229f97e9cc3dd925b8db334e07b85768
> Author: Khem Raj <raj.khem@gmail.com>
> AuthorDate: Mon Sep 24 10:57:13 2018 -0700
>
>     tsocks: Add -lssp_nonshared to LIBS explicitly on musl
>
>     tsocks uses -nostdlib while linking shared library, which is not ideal
>     but instead of chasing that and assuming there is a reason for that, we
>     add -lssp_noshared to linker command at the end so it can build when
>     security flags are enabled
>
>     Fixes
>     tsocks.c:954: undefined reference to `__stack_chk_fail_local'
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> index b2757f6..7291357 100644
> --- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> +++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> @@ -18,11 +18,13 @@ SRC_URI[sha256sum] =
> "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863
>
>  inherit autotools-brokensep
>
> +LIBS_append_libc-musl = " -lssp_nonshared"
> +
>  S = "${WORKDIR}/tsocks-1.8"
>
>  FILES_${PN} = "${libdir}/* ${bindir}/tsocks"
>  FILES_${PN}-dev = ""
>  INSANE_SKIP_${PN} = "dev-so"
>
> -EXTRA_OEMAKE = "SHCC='${CC} -fPIC ${LDFLAGS}'"
> +EXTRA_OEMAKE = "SHCC='${CC} -fPIC ${LDFLAGS}' LIBS='${LIBS}'"
>
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

