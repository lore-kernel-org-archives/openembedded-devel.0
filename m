Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 90057783A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:17:31 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id u133so20367530vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+rDogNbaTB4+oYmtI0xeNttbMbCdHyfQcxNzsZ27GiY=;
	b=uNYP3gVGN7O0tvwejAW/Yk4z7+Cc7oMt1Gwj5352OUTqnSXSP0PAghN/4pdUvy7a/k
	oZUzX+3ysHdhGatbLebn3gqiV9rPYWf15VJQcb0Jv5NhEwOyg+NNipfUgkmOIsO+OjMZ
	QYbWFYsuSwrb0qoDi33zQqI9LgXPgDY7oR5CXI+jicb6713zt7ZC8MzQRbPT0tM1dsXn
	fxrYoER8+F8Pd7W8jJ34wc7ltFwxKOl5rqLOw+W/GU8TGbqDZ9TFpyje9qrMVNtNMs25
	pMZ3Lv81t9N8zQh5Ma7eiYPBqgOxNHj1Rsp79u2ou0317EKa/jrpvvQwA2tEUD9UrIdH
	aziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+rDogNbaTB4+oYmtI0xeNttbMbCdHyfQcxNzsZ27GiY=;
	b=QepEZMB3lSPtUc1uDTvH7OR5N3wGmTmXqFKym1QV86c89vS4C35X3mf4EnYlYfFFs0
	P055LrXcgeofqm522ES/6neF1OmIG+f7nCbxv0HbLQ+wMfywpS1hgMsk4e5imV26iU3Z
	VjA/TZqqfPdetB+YCi7xgnOADn/AkWP1gDPcYhT5t0Q5Ils9hhCBgd3+yn5nTQR4L0he
	TbN6Bwk5EbELU2wlTm9/KYpx0+g+1Fv2DSX7wSWzjJOLA00zuY0wV2WQ45Oirx2u83hr
	Zzaeh7wXuovjVPZ4qIJ+IztniBzXmQeFNbSsnZV9y/CQ+ZRtcBxoQwsOG2IARlVlnDUZ
	jVzw==
X-Gm-Message-State: AHYfb5irKVRoHEKZxzBQm1de5vYTfi0tXF32IGfA4p5v+w7TVpfceeDn
	eRHWP4g1aFrdRB8e7sd8hQkid58mTw==
X-Received: by 10.31.56.74 with SMTP id f71mr2865826vka.21.1502961453255; Thu,
	17 Aug 2017 02:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 17 Aug 2017 02:17:32 -0700 (PDT)
In-Reply-To: <1502959724-47472-1-git-send-email-dengke.du@windriver.com>
References: <1502959724-47472-1-git-send-email-dengke.du@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Aug 2017 11:17:32 +0200
Message-ID: <CA+chaQc_JOJyRZf_LPk0w8jSMCFG93CoimNPAAv+dnpjWPPm3Q@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] c-ares: upgrade to 1.13.0
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
X-List-Received-Date: Thu, 17 Aug 2017 09:17:32 -0000
Content-Type: text/plain; charset="UTF-8"

There is better change for this from Alexey Firago in master-next

On Thu, Aug 17, 2017 at 10:48 AM, Dengke Du <dengke.du@windriver.com> wrote:

> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  .../recipes-support/c-ares/{c-ares_1.12.0.bb => c-ares_1.13.0.bb}     |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/c-ares/{c-ares_1.12.0.bb =>
> c-ares_1.13.0.bb} (75%)
>
> diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
> similarity index 75%
> rename from meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> rename to meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
> index 4e28d6a..0d9a2a4 100644
> --- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> +++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=
> f4b026880834eb01c035c5e5cb47ccac"
>  SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
>             file://0001-configure.ac-don-t-override-passed-cflags.patch \
>  "
> -SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
> -SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021
> 665118ee9bfea905d1a76f04d4e6f365fb"
> +SRC_URI[md5sum] = "d2e010b43537794d8bedfb562ae6bba2"
> +SRC_URI[sha256sum] = "03f708f1b14a26ab26c38abd511376
> 40cb444d3ec72380b21b20f1a8d2861da7"
>
>  inherit autotools pkgconfig
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

