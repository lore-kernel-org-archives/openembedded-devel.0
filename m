Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C914878F29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:18:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c13-v6so13639658wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ymil844D/YBybhzF60PXjrYkz8nkv0VzVtAZoZPdG/Y=;
	b=TQQt9PkrbKIb4lQKtscFEff0uvwp+imvrKIZNTLqC0uf4hzSBiVdshJzGMJzSIE4Fg
	FQ/+sRjk+3upVK4yQUX0BOMsCN6Se2htzXdery+G2nbeC6FC1WI/N7QjplBDcH/PWhbX
	xwS3+OrtK1rASpWD41mucuNDQGspL877E05gQvMSvadTIEzT24rzrO4QeEHXidcu7ERK
	+p//ipsTLH0j9B3ihzEGj1g9ienm7t8q3ekktMjJP6zMBB+ckXA6RqTbSpcoCSqsQaM6
	dM15/xlniTmUjoFWyK6lMKfzBtlsdfc6SYadTvp0rj0ze+/b+Ec5bemINbHMAjpPvpD/
	Kqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ymil844D/YBybhzF60PXjrYkz8nkv0VzVtAZoZPdG/Y=;
	b=iK4xDCB122+G4rf7vfCazKvoaNrOSGYTH+IRNmBJsFDYETyuvSFW8cImVSeGJZBqye
	YjET+79RBz8Atv5cDYbYx3bSdRgRwdWav7pqYqEZ0zXEGr/IWGrEuCal9WCLUlqLmO+T
	14QmP0SxUQKs1qShjNYMGuHOaxTeeOgR2Zuts/gik25bjM6B4vX3HT2aByZVML9BYcmw
	Zp9JYmlRBewiLsbulCGoO7rSi0TwpmFgUTx0ActLq2MiMjN5q0agXNAqvhgWzwqacH3/
	8Uh2MHPUAIQ4E/pmM+hVsfvb1nEg+RJ/lL0t0zxqGVN/YnkO3Wp852paJGoalibAJetg
	OA5g==
X-Gm-Message-State: AOUpUlGL22SHGnZ5Ppy2eDlUK7NF7jXKpUlVdYaVtkw4LnX6G/MaKCLy
	ADTAI/CaoyRyCSVnIYK5aSVmAb95XG/EtpsGrVM=
X-Google-Smtp-Source: AA+uWPzBUv8zogNrkkwSaaDDHLRlnHIGioiJ6TZ/sx4qCu8srwM9neJJ1/xsmT1/Cg4RLv2XSfxSeo2h1gbdZNnyY4w=
X-Received: by 2002:adf:e50f:: with SMTP id
	j15-v6mr9882807wrm.111.1534151890527; 
	Mon, 13 Aug 2018 02:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <1533285153-19673-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1533285153-19673-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Aug 2018 11:17:59 +0200
Message-ID: <CA+chaQcYCa3Qa5pmUxYoy1fARpkiVJUzuoXb-_4+e__bNGbPGQ@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Fix bug when inherit archiver.
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
X-List-Received-Date: Mon, 13 Aug 2018 09:18:10 -0000
Content-Type: text/plain; charset="UTF-8"

Please start the commit summary with "gnulib: ".

On Fri, Aug 3, 2018 at 10:33 AM Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> index b72ffa9..4a7d84a 100644
> --- a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> +++ b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> @@ -32,5 +32,6 @@ do_packagedata[noexec] = "1"
>  deltask package_write_ipk
>  deltask package_write_deb
>  deltask package_write_rpm
> +deltask do_deploy_archives
>
>  BBCLASSEXTEND = "native"
> --
> 1.9.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

