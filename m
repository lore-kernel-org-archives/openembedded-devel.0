Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A3EF27937D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 17:29:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id i8-v6so2620421wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KNK0I3+AK9v9mUGAbLBPZ9lJDQ+TB+yyRKzBWmcRvfI=;
	b=rOXM2jHKxUQRBCklrxXe22RJe5YGMu6PReneXugQ9BnLzN8/F9BRx6iQXl8Fx6zZ9/
	BTjf6aPMKIFA7Zxzw/N6DgZz4rZtWbZtR3a6t40QKwXaX1SXkFgfRyViCqJ6j8ejgAZe
	A648/NtAgwWQpTxu2V6mtEQKd4Q3auQ3/yIWxt/r9ftC8AKPvah7rZaP4jVIGUMG1SBw
	fU9lMXbGN67O9aIY2Cys4T9ajqmugFS25KaFUUNgVu2O1ykA1oXbdpuOlkd8+2abHtM+
	XvE59kf9JSjhlt6SnBa12XxxpLojEPvS+6VAq3Cm4LdSEA57WCDjAtzIE3WDVRrD6418
	nWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KNK0I3+AK9v9mUGAbLBPZ9lJDQ+TB+yyRKzBWmcRvfI=;
	b=K4pPfRcrfZfclqNalO9wrL8+1Rolb7qqml/F6BNT6k8AYk55/rdHymcQwisotXd5aJ
	g505i5hjfij8BO89ysiVR4A2IsPQHpaQaTkhb5o6J5auemyEQtVLROisRjkqKZ6V/cqQ
	kAhON10ApE7zjaakiNNtt664J/yk+5juoG/CCPRKddVC8qx0f9QWE7iooHCEssCVk6db
	+gd8fU2FMOLDDDkx5acKIJ+4oFWrhDrvo4DSxKk9HB/gw7MWNZQNh1ZEH+zv8n02HvoD
	Fs2mU9Lc5sSWiA51fg0UsijjtimGHWDuvjq8bA3SvUJDJTantXupVCcceEX/AnXPT5o0
	LAFQ==
X-Gm-Message-State: ABuFfogosV+8n2bK96RACuCl47O6mFQaCdoDL9ai2kW1hzMi9UW+OKHS
	8HoTvAwKKP+djxSdG8dFDR6S/ZkWBPaKp6+2Tew=
X-Google-Smtp-Source: ACcGV608wWKFhRG0yp86b7TTcoBN2v7SnKAFR2DjhiwM7JJoxlz0/ZQKjWdw3ROXI+vUTsxLfKKARcov8gizv2obEno=
X-Received: by 2002:a1c:7c07:: with SMTP id
	x7-v6mr20796409wmc.32.1540315749259; 
	Tue, 23 Oct 2018 10:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20181023160510.19604-1-JPEWhacker@gmail.com>
In-Reply-To: <20181023160510.19604-1-JPEWhacker@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Oct 2018 19:28:59 +0200
Message-ID: <CA+chaQdztUVMJxae0F05=Bn4PZ1Nj+6=fK5vDR2e2_9uKcb9JQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][sumo][PATCH] rapidjson: Allow empty package
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
X-List-Received-Date: Tue, 23 Oct 2018 17:29:08 -0000
Content-Type: text/plain; charset="UTF-8"

Why is installing useless empty packages sane?

On Tue, Oct 23, 2018 at 6:05 PM Joshua Watt <jpewhacker@gmail.com> wrote:

> Causes the empty base package to be created so that RapidJSON can be
> sanely included in an SDK via IMAGE_INSTALL, RDEPENDS, and the like.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index 8ab35d224..76e01f824 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -19,6 +19,7 @@ inherit cmake
>  EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF
> -DRAPIDJSON_BUILD_EXAMPLES=OFF"
>
>  # RapidJSON is a header-only C++ library, so the main package will be
> empty.
> +ALLOW_EMPTY_${PN} = "1"
>
>  FILES_${PN}-dev += "${libdir}/cmake"
>  RDEPENDS_${PN}-dev = ""
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

