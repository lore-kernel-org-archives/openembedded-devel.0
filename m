Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C3355770B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 02:21:25 +0000 (UTC)
Received: by ioii196 with SMTP id i196so106400842ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 19:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HDtVtnhbe5rKcW0oS9TRbn3i+QWYwzzAl11ZFuMFOo4=;
	b=gLsE2bVYDHacHWPRjFFtC93eAL0K8Q4wGWpsPpOmf+Di7we8pCCpiyC7X9quL3xqev
	+LrmGIRJTiyZyO0k5kuFJoRzCNlEPQNcsQEUzLqYi/6yJRFfooIVgTjPvPOmJPu05ZXA
	qjS4/sa37QJljXUp1bAP/sEw/SPwqoZkKqGd/cgKy/9nCUgTA0eDQpomPePDnOKxlQgw
	4qyD1wN39CEwRt3FvLcjGLEKKK/mhcYaoT+Xx/3CUeJXn1glateNZvAOpNadDCjYXCsW
	ei378Fv8qtjgsFykklk38Theht84ePZYzD5yKd2FtCbcV8Awe6In3Mq/jC07wr9yF+C5
	Fn+A==
X-Received: by 10.107.137.106 with SMTP id l103mr11207081iod.112.1443752485725;
	Thu, 01 Oct 2015 19:21:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 19:20:56 -0700 (PDT)
In-Reply-To: <1443713401-8584-3-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713401-8584-3-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 19:20:56 -0700
Message-ID: <CAMKF1sr-=rb8SEy_eXVpOipbztHyKk3nd7nmE=Lb08yud5LNpA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 3/4] libuio: Blacklist, fails to build with gcc-5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 02:21:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 8:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> index 0142ce7..93dcb39 100644
> --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> @@ -15,3 +15,6 @@ PACKAGES += "${PN}-tools"
>
>  FILES_${PN} = "${libdir}"
>  FILES_${PN}-tools = "${bindir}"
> +
> +# 0.2.1-r0/git/tools/lsuio.c:85: error: undefined reference to 'uio_mmap'
> +PNBLACKLIST[libui0] ?= "BROKEN, fails to build with gcc-5"
> --

it smells like a inline problem, this function needs to turn into static inline.

> 2.6.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

