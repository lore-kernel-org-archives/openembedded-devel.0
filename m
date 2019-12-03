Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id ED2397E98A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 20:17:30 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id t5so2120651qvs.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2019 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gmAq7luUu4W7h0bk6BqDLXjWZksaMT4yDqvSvLBMzj0=;
	b=hZ4AicbTyxn3zEC4+XlBj/dcZ9yge7OprvwzfCurhGxIjZviX/ycao0wVIeUZ3zunx
	HNAem7M8/T7/vJ78sZeyJk6IK3nQjKIh0SrlN6RW39k8aQoy8q6gceEE3UC81pzuRa7i
	+fxIkez4Vy/KKa/eYa6YGAfW+Q9RD9ITs6BjGbnIpxeSjWNLw66elzE2YIrzLHxhzmEk
	6xViBoH06NYsEVOLJcXMckgjY5KBJ3cGRwfsZPOZ+jZWMr3CbCUWzAPQ0xaSYlTW0jXK
	IMv0vCS+jeQaNJR7ictFp5Jn3tDdYyWpwVVzVMq0ZTkrKk+eKKILW63waTuWZgaXbWgn
	2cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gmAq7luUu4W7h0bk6BqDLXjWZksaMT4yDqvSvLBMzj0=;
	b=Jp7DetwGYDiK8Zm7uuQnLSqooOGJmXYne/Dl20xWoibvF2/bqCADX1X1wUaRvhNwq6
	6KsLYWPfbDslJ5SPkGGYJF24zMlY8kXNlx/sNiotJAbvZEnxpRVUVLVYQxcYfuXVGE30
	QpPZIXDyZyd99hqj2gCVSrNdfw2PTon1eWc7p6CNVk5P7ACpMSBoqFSYxx4yi/UvxBIY
	vYU+DtlO8XxqiQ38z0J+Xd+I+ZDz/A8HSRxglTwuoT76/6fAVDWnR8CTocrI7al5xL79
	PX+aXboFSVjoZhAUHemqGzrlZY/4xmvY7zLEOre72+Rz6YCsZQVlzwJS7ipigkH8eVL0
	gvUw==
X-Gm-Message-State: APjAAAU5Hx7kq+ZX2pwr6bkbtWDXP/ZHMRwQndYSKi5MvKB2s0JeZe+H
	pntCh6fNOFsFuJRb6t8O74N5Y/YtV2tAojHKwt4=
X-Google-Smtp-Source: APXvYqz32gB2AskrTyp4I10lJtpKaI4F1WJazrqm5gT0ZU05oF+Ev6yq+gC26njb/qOf4bsaVrSo3F+AurZatDCjqV8=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr7111467qvm.206.1575404251351; 
	Tue, 03 Dec 2019 12:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20191203134454.320616-1-pespin@sysmocom.de>
In-Reply-To: <20191203134454.320616-1-pespin@sysmocom.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2019 12:17:04 -0800
Message-ID: <CAMKF1sqsVesrd0PvS3N=8RPvZDdLaZV+-nBLuXifsybrebrX+g@mail.gmail.com>
To: Pau Espin Pedrol <pespin@sysmocom.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] lksctp-tools: Add RRECOMENDS kernel-module-sctp for pkg lksctp-tools
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
X-List-Received-Date: Tue, 03 Dec 2019 20:17:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 3, 2019 at 5:45 AM Pau Espin Pedrol <pespin@sysmocom.de> wrote:
>
> Previously the kernel module was only pulled in for ${PN}-utils and
> ${PN}-ptest, but not for the library itself. As a result, appsexternal
> to this recipe  using only the library fail because kernel module is
> not installed in the image.
> ---
>  .../recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb         | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
> index 70cea6c7b..25270016d 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
> @@ -12,6 +12,7 @@ SRCREV = "1b077af62d83d53c34b1bde8bad6648149d5edf9"
>
>  PV .= "+git${SRCPV}"
>  LK_REL = "1.0.18"
> +PR = "r1"

drop setting PR manually.

>
>  SRC_URI = " \
>      git://github.com/sctp/lksctp-tools.git \
> @@ -65,5 +66,6 @@ FILES_${PN}-dev += " \
>
>  FILES_${PN}-utils = "${bindir}/*"
>
> +RRECOMMENDS_${PN} += "kernel-module-sctp"
>  RRECOMMENDS_${PN}-utils += "kernel-module-sctp"
>  RRECOMMENDS_${PN}-ptest += "kernel-module-sctp"
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

