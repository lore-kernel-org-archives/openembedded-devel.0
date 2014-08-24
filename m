Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 17D3670E6E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 01:03:00 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id mc6so11514004lab.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Aug 2014 18:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0+qPnC5kIFCGfg5J0A33BSZn/6guAXvfyIYILWVWuqA=;
	b=qY9PnyHxEgJNSDTXezhFJXLfd3XrE62L2YsvXs1STdAf1V/KuP+hPF1Il7xhDAPPqM
	xOZpFKH5W86dpa2ko2/2DqpBGMehlZ0t2eAoZ/+XTYBo7qExKINB+SIiVd/t+5vATwA/
	N/EEcr0gPKVL1WZOqiB+COVamOzWTIM/JY/njmdaDhh/XjgfahYxFEizWMlrqZDO3Wjq
	qfpCGM25uWn4YhZeraXepOndj13uq01oxCWO6jGHHJXxNKJs0ncg1lEL7dNcuqCOJKMS
	bDhYMhmRvD3Xk2P9S7qQwN7MbS+OZVk+JTjIbwO1t/G9cth82agK2I0hJnnUK2EnWyda
	RUSg==
MIME-Version: 1.0
X-Received: by 10.152.161.225 with SMTP id xv1mr6487846lab.59.1408842181090;
	Sat, 23 Aug 2014 18:03:01 -0700 (PDT)
Received: by 10.25.209.81 with HTTP; Sat, 23 Aug 2014 18:03:01 -0700 (PDT)
In-Reply-To: <1408795335-10619-1-git-send-email-Martin.Jansa@gmail.com>
References: <1408795335-10619-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 23 Aug 2014 18:03:01 -0700
Message-ID: <CANx9H-Ar4bYGkmWQaJZpnkRS8idBOXxtOTrEBfN1-o4jdLDSUw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] python-cython: Fix missing deps for native
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
X-List-Received-Date: Sun, 24 Aug 2014 01:03:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 23, 2014 at 5:02 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * ERROR: Nothing RPROVIDES 'python-netserver-native' (but
> virtual:native:/OE/build/shr-core/meta-openembedded/meta-python/recipes-devtools/python/
> python-cython_0.20.2.bb RDEPENDS on or otherwise requires it)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
Acked-by: Tim Orling <TicoTimo@gmail.com>

> ---
>  meta-python/recipes-devtools/python/python-cython_0.20.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> index 8578a14..3966e0b 100644
> --- a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> +++ b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> @@ -21,3 +21,4 @@ RDEPENDS_${PN} += "\
>      python-subprocess \
>      python-shell \
>  "
> +RDEPENDS_${PN}_class-native = ""
> --
> 2.0.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

