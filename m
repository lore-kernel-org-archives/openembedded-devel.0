Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD3F71A62
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:00:59 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id 184so93177vkn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2017 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hLWqvbqJK2iclB1/m1PuHNmlA6WDHt7GmD+JxgzG5Bk=;
	b=SysiVi326Gthyzl4mku2WtLDA0Tc3eTRkoyy/zXRteM2j1Ygs7sZRm8Bzr4le8XaXJ
	JjyFruCmzEE5MHXppdkMnPzCHt+x2HaE3efqN2tYBB42+jrJpuPVq/Tw2dWZfWHUfj7a
	ZALGOiZCmu5rP9IXFfZWdLl5qdIVKEEoNINUG+OA4FY7hSTTUemxONO3TZ3yZSzGw58S
	A6+mxtVf9ViVdumR2TZ/3H0svjDWG+rGngr61J8c4QnT1G6yn12jELzdZrIxqo2mrGGp
	MTz/gVxIRM5TapBIb5a7ILpmMvq91LX13drW5EJP2G4WgDotRnplknbyMBdM8mX/0DjW
	isjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hLWqvbqJK2iclB1/m1PuHNmlA6WDHt7GmD+JxgzG5Bk=;
	b=Ex4vgEoQ+uLCOZ5OaySftXgWIPE5urCy+qA6AY9DSjGKIzhjygXqtxgl7CaA4Bno+p
	s1esLfjSyo8+1sxMZAG6hBfBy3hiEF+TfOakj7gwEM7DAt8hWIVXRAXrH9gJ+jVAzRQh
	HZoEROV+sGRCttgJ6337snYpj+fKWSrPNSo9WxWRCFGDVBYKLWsNTUlRza0y29eBAMY4
	OzqLzIUfglvp+BkRLIyYQP+WclTfpUXAAegzhnuPaTBiFB7yWw2sCoiYv1x1KhPpb5Bk
	LjzeHjJw1ynCJm6Mf8UE646+y3ZgHgiH10T6Ph3n2Uf58B7CCsZIZKATbzDJDug7w1gn
	xmDw==
X-Gm-Message-State: AHPjjUhrf7ZiOjNDQliqJCHcqZsgxgpzub/lh5ISoThszhQYS/7Ro38R
	l33BYd/bDAf18HDmPtvMorT6sIQTvg==
X-Google-Smtp-Source: ADKCNb5FapIqe2cfvcoEI7o8WoT+rMC+yxK7UZ51TcUeVzzqnaryFZ9fzzAyG9r/TE3l7GtGp5j8XcInU1pXXLtBLCk=
X-Received: by 10.31.157.71 with SMTP id g68mr235635vke.130.1504530060883;
	Mon, 04 Sep 2017 06:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 4 Sep 2017 06:01:00 -0700 (PDT)
In-Reply-To: <20170904070251.23140-1-jackie.huang@windriver.com>
References: <20170904070251.23140-1-jackie.huang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 4 Sep 2017 15:01:00 +0200
Message-ID: <CA+chaQcc+4quniUUxJps769vggyDn4o6PG+f1SrY-dku9wYPaQ@mail.gmail.com>
To: JackieHuang <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf-c: set downloadfilename
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
X-List-Received-Date: Mon, 04 Sep 2017 13:01:00 -0000
Content-Type: text/plain; charset="UTF-8"

Change it to use git fetcher as github archives can be regenerated from
time to time with different checksums.

On Mon, Sep 4, 2017 at 9:02 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> Set downloadfilename to avoid the file name without
> package name like v{PV}.tar.gz.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> index 40fb96cf4..696e84ed5 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> @@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "protobuf-compiler"
>  RDEPENDS_${PN}-dev += "${PN}-compiler"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
> -SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz
> "
> +SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.
> tar.gz;downloadfilename=${BP}.tar.gz"
>
>  SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
>  SRC_URI[sha256sum] = "2d708fb3c024b9e6e86df141faff80
> 2194f5db90a4b79e6d4aa6bd61dd983dd6"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

