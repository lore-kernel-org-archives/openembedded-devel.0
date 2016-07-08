Return-Path: <andrei@gherzan.ro>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2514660119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 10:30:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n127so5086724wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UXQ+JUiHpCIZMpmbgRIDcNYmCvo1cqj8dKh9JnZNQh8=;
	b=Z0RALPTytPdofEaR37UAvsQ1OPVdOH4/ZPAgVSi/wLDtrObHMO9aj2WFv+n18PkWgC
	cvw9QGOCMYpeRbr2S5ZTrTSXmAKT1d5ZyozUIMg8/mbOzxR6ukscZ3mBUTvJOLD7B+hd
	91PgNOvBH7dAFn7Bk1YdtDu/1xrVBKUPClSFwB55mvc/BUVyw301pI0R0Z7cnxquSgZ2
	0fZyU/o9IAIVt/6GtVXBvgZYezP7B7SZUv7jCDW18KhdFZCPlTOUszYvJ7y9bgaOqQLj
	gkx+ni0XvvEOrNp9vTxB+67Rfe8ENdVComjYqMrDoUzu3/xJhrwcnw4JYk60KccDEvxH
	IYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UXQ+JUiHpCIZMpmbgRIDcNYmCvo1cqj8dKh9JnZNQh8=;
	b=KrJ12HjBVj9qrqI12kOMZr/0D0OSg+3RvW4SydyaVP3KDEwa2CJyQO0Q0vnrY771DD
	cBuIaxRv2ulVxrStl5NlELHNyA9tpzu24qtGsZ7IlZrFdzE3Ms1Af26jkM+qvD2Z0Nbb
	BcUnqjXZxA1ReLKXO3o14t6oMUEhyunI0ca8VIRMCHNfeTFVY/Q9ScqvktmonIp1kS4b
	EpJV9BGMyB+RWeQYX7u9tWXIwYApeqlfYaWeE91D5mNTRRosgrEvDOBMJEam5MBeDub3
	gvlGaPsZnE4ioHh8ysth0V7rJ39zwgqysGIVzPcbwirpKGfONq6jgWzggj2vXJfXG8jG
	gn1Q==
X-Gm-Message-State: ALyK8tLkuA8rJF5AqXVEI4037LXq8zxcLreJpVfmqz62VHv5WN4qRi6WfipCO8AD5ApKe0baXLPBcdgzg1eCrg==
X-Received: by 10.28.234.16 with SMTP id i16mr2798605wmh.36.1467973830588;
	Fri, 08 Jul 2016 03:30:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.26.204 with HTTP; Fri, 8 Jul 2016 03:29:51 -0700 (PDT)
X-Originating-IP: [86.179.71.94]
In-Reply-To: <20160708102607.7068-1-andrei@resin.io>
References: <20160708102607.7068-1-andrei@resin.io>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 8 Jul 2016 11:29:51 +0100
Message-ID: <CAK18fxGGw5QTivskp3gTvPEi3Nf0ugWAL_XFutb-27W0jZouAA@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] netmap: blacklist
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
X-List-Received-Date: Fri, 08 Jul 2016 10:30:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 8, 2016 at 11:26 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
>

Please ignore this. Sorry for the noise.

> * it's broken for very long time
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  meta-networking/recipes-kernel/netmap/netmap_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> index a028585..667e7cc 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> @@ -32,3 +32,6 @@ do_install () {
>  FILES_${PN} += "${bindir}"
>  RDEPENDS_${PN} = "kernel-module-netmap"
>  RRECOMMENDS_${PN} = "kernel-module-netmap"
> +
> +# http://errors.yoctoproject.org/Errors/Details/69733/
> +PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules"
> --
> 2.9.0
>

