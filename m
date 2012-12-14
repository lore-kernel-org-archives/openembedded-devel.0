Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjJ6w-0001HR-1z
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 01:26:54 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1152857wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 16:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QIDw3l34ydWx/F0G6YzD48JkhbXK1a/rQWP9B3I0IrA=;
	b=c+KnARpOerjrsxbMhbCJWN6gt2SHGPkX0shAyPIyerPnT2MgSqmpaXgeY+3ecmcjRN
	F7x8/vYFSLI4T6Nd8JcJtrT7JMVZqoSPUfRo0m9dyL0y+lzdYXqCE3PB24xgK7IkrZ73
	osbhcSd0wWPD0Cui4rptfQ8dVhNpgvl0DLZqa75iYBUHtwCkOJSFp8OXEU83INR1NxbE
	drxClpeLcku9PPpZT5JZFAMPiLcFsk68kpNNvXR1MMuRMkWqgOcR8Tc3fkfxDfS33+RA
	C20c3/wU09UKiRoXuRQj8zOq22pFnsiSwOsUbxiubHX2KRgPWCor3+vGyyDSYPhCa+Ra
	93sg==
MIME-Version: 1.0
Received: by 10.194.76.99 with SMTP id j3mr792772wjw.47.1355443926609; Thu, 13
	Dec 2012 16:12:06 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Thu, 13 Dec 2012 16:12:06 -0800 (PST)
In-Reply-To: <1355437295-27710-1-git-send-email-andrei.gherzan@windriver.com>
References: <1355437295-27710-1-git-send-email-andrei.gherzan@windriver.com>
Date: Fri, 14 Dec 2012 01:12:06 +0100
Message-ID: <CA+chaQeSWd8=5iuVQa1Sy-zvKS4LBqba90oCAk8QyVmdeLVE6A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pixman: Sync with version from oe-core
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
X-List-Received-Date: Fri, 14 Dec 2012 00:26:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 13, 2012 at 11:21 PM, Andrei Gherzan
<andrei.gherzan@windriver.com> wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../xorg-lib/pixman_0.27.2.bbappend                |    1 -
>  .../xorg-lib/pixman_0.28.0.bbappend                |    1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
>
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> deleted file mode 100644
> index d9f1c29..0000000
> --- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -PRINC := "${@int(PRINC) + 1}"
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
> new file mode 100644
> index 0000000..d9f1c29
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
> @@ -0,0 +1 @@
> +PRINC := "${@int(PRINC) + 1}"
> --
> 1.7.9.5

http://patchwork.openembedded.org/patch/40949/


