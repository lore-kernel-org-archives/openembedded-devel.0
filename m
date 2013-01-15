Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TuuYd-0000X2-3R
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jan 2013 01:39:24 +0100
Received: by mail-ie0-f180.google.com with SMTP id c10so6101772ieb.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 16:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gNC425r/oRJsBI/8j45Qk8RzwDCvZoxb7Dt3adP86+I=;
	b=lKUuKBo2sln8GeGFuP7csg2Xqml9Z/IR6IXqExenU41fPqjb5Iqry2TWkBTxJYi6xk
	c/tki8uoNhUrblJoD7Jbw9s6iyiAkyUZsrlAA0cIVUDo/rVMfob+qBsxZAv7maLffP2J
	NxxhZTfWzUnxle04gQKrAIT0DWaNaq4cNBTpYm1z6lQey9ITqR4EHOYxNA3dDb5Ipsfq
	tsyPUF5XgimOn8R8Tr2v3rFlnK5UUM/HeUyJXTJdeIqCGEYmD3qjkXkEEL8JjEbMU4IV
	OD+eCuvnywDz0z9Xl0pcqPyfCe8Y9kPptBXbgTrd2a5uNb/mg5B67yst+8SCxi8zfff2
	lPUQ==
MIME-Version: 1.0
Received: by 10.50.179.66 with SMTP id de2mr261629igc.59.1358209434926; Mon,
	14 Jan 2013 16:23:54 -0800 (PST)
Received: by 10.64.98.163 with HTTP; Mon, 14 Jan 2013 16:23:54 -0800 (PST)
In-Reply-To: <1358201403-22227-2-git-send-email-hmatrjp@users.sourceforge.jp>
References: <1358201403-22227-2-git-send-email-hmatrjp@users.sourceforge.jp>
Date: Tue, 15 Jan 2013 01:23:54 +0100
Message-ID: <CAAQYJAuoSYreWC6oanAkwW-4Mqv5LsKL+kHr3NhFrKf4t2o7qg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] symbolic link to resource.h is also necessary to build with linux kernel 3.2.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 00:39:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 14, 2013 at 11:10 PM, Takeshi Hamasaki
<hmatrjp@users.sourceforge.jp> wrote:
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
> index ae43753..8e096d9 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
> @@ -1,4 +1,4 @@
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  export INST = "${D}"
>
> @@ -11,6 +11,7 @@ do_compile_prepend() {
>          ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/errno.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/errno.h
>          ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/ioctl.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/ioctl.h
>          ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/poll.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/poll.h
> +        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/resource.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/resource.h
>      fi
>
>  }
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Hi,

you are using an outdated recipe, the issue is already fixed.
Please update your meta-initramfs layer and you'll get klibc_2.0.2.

Regards

Andrea


