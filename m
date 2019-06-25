Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3B77E659
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 18:58:20 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d23so4258820qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GSN15xH8MsljbikyBvy7mMd3dntN99sFA7eqAjAKomU=;
	b=Y8F9Df4qdaZ1EA5ZB8o7QTtHrtclnBwkcDOAbx2ydsT+UBFrnFNssguLcwln5h70xI
	t5Y5jaaAJyIYCVc7tZ1ZHKl9oetZe7YUpi1MHmq7u0yIcLg/WKQtZYRVksHIrZHxvjCc
	Jvv1I/ZNk/EdAEAVEZoe3u8/nyXoZbBzy0wcQQHRyUcXHKFE8DC02L93xiBFNboH/2nH
	NQy+AbDeYtuUZl8isiEIdhJcQRLx36KKl5HS/572t0bnqiA43vs4wA0jcJ/huAve+qll
	Cy+eyiCWWTBX9bPz1fluiPozv+UnSsCmTMyCknhLwNgvAEVrpXVbDJx2EfOIH13DrehL
	DMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GSN15xH8MsljbikyBvy7mMd3dntN99sFA7eqAjAKomU=;
	b=PWQoE/U2AM7dZIDnO+b3eyydVgJQeqUvuTN7PEZzpBBv8Bg7HTDzhceXXM8DuEDSok
	i0NqGWyagzIifp+YaS2q6Zn+Gx6KD700y0I9hXsDlE7PCjD9DjYMCxa2HWriTy+bb6B0
	GSp6KQx2jvS3uXAGr6rtoHxdejPitEanGQBymvTJYM3jC39cS/P/VE5CXUnOT29Hu+5Z
	Au4BWI4AMwLWYdzQmECtR2c//2CXmiGVATeNRn8kpvX6xO5Crb5CJnYDrUQ51XBvf+Q4
	hZEIuUh3765f3p6xQmR+Kmt8hnyf/uvYqI8XvXFeZuHSP9JOld8pB0a+9cKQuUv9rfLN
	6ilA==
X-Gm-Message-State: APjAAAUk+lRbk2CrfKB0C33AfvJcxOdisXz5cpwh+g05xF6v24q/rEhm
	1K0s1+H1+B84ujPyls9jmdgRjyn9MK710kUXiY0=
X-Google-Smtp-Source: APXvYqzD1KVZ7kt42lHiVWzWQPey8kuGIVTpvteGCzSpKOPwO//a2RI6NDmVuAR4Dxdl8jmc4rl6uueTvTsvYaCGH+A=
X-Received: by 2002:aed:3644:: with SMTP id e62mr9272729qtb.80.1561489101080; 
	Tue, 25 Jun 2019 11:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jun 2019 11:58:10 -0700
Message-ID: <CAMKF1sqp5DgFKxh3N+GyP8xmv8KFZs4vLfs2TBNd-T5NiNfwMw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 1/4] meta-multimedia: add layer depends on meta-oe
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
X-List-Received-Date: Tue, 25 Jun 2019 18:58:20 -0000
Content-Type: text/plain; charset="UTF-8"

Do we have a way to not use gitpkg dependency

On Tue, Jun 25, 2019 at 9:14 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Since tvheadend of meta-multimedia inherit gitpkgv bbclass
> which comes from meta-oe, add missing layer depends back
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-multimedia/conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/conf/layer.conf
> b/meta-multimedia/conf/layer.conf
> index e05a652..89ed163 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -29,6 +29,9 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>  # cause compatibility issues with other layers
>  LAYERVERSION_multimedia-layer = "1"
>
> -LAYERDEPENDS_multimedia-layer = "core"
> +LAYERDEPENDS_multimedia-layer = " \
> +    core \
> +    openembedded-layer \
> +"
>
>  LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
> --
> 2.7.4
>
>

