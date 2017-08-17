Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA79E78286
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 14:02:15 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u185so10055778pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/CARgPaXHFm0IHD1qdGjcGaUxm6i2fefpvvYIPEV4uI=;
	b=PC8ArcyCVpn8TeoR4WnDISg0/GZoS4Mj4e6n/Hv5LiXG6HNZ71+Ly6G1JhwzyEutlv
	Hah8roeMK0VqwqKk05bqHEvFAHkKC7Yat+/T4VkKfXiv3X2gdY+kUltUf0OZR9WNVjGV
	pSAivUFXnc63nkcefkeUlhh8ysBcL6ILX8Ih4msg2QzoJJpO0GpIaI7QLh9qn0cTh2yT
	DCBMRXD/FBTfzydDTCagIRmSWBWvbbMAhRATcBQE2vePdDLn7YpUf3qn1a3eZkS3cpAF
	QBD0iH3mnyKV/weKNj8VmlL6e552/vgJus+tARbSTKr8ksjAv4mFbsJaX39R09eTXsbI
	IhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/CARgPaXHFm0IHD1qdGjcGaUxm6i2fefpvvYIPEV4uI=;
	b=UFjObjsTnIorvmzjajikNmZPzJbDMShH4R0QVtiWhOuZ6iw5SHOZrmFnQ1Hwmk9RcC
	PyVMEraRnpav+SUPlNPC/ek2PXueYxxGvbgXYw79gNjO7Ixa9VhYkh/IEw1N/H5JFb1y
	PXqz8eEtHzeypLwTfWovj8IoelCe8u6tgwpVzF2J95sKwDXVzb+VVgUMmIdIm27+SsPn
	Uk46hOmBMiCGUH1KNx4fsdYDIM513xYAuQpZW8Xrlx0+f0UvBxRSNRse8GW0nQuJq4bl
	qjjkGH2bxEfPxpodu3f6RkD85RKhz/34YXtbUUu/s+y4dIn9YfyuP4kkIS4n5/DrCDs0
	dlOg==
X-Gm-Message-State: AHYfb5hEIjqMj2R88Ao5VkVpDf5ys2LaMee9c4dL88RXeYno2iEWGzlc
	4YN1IK4HH0m+1ks+gLvGzsbrI6Q36w==
X-Received: by 10.99.140.77 with SMTP id q13mr1186503pgn.288.1502978536892;
	Thu, 17 Aug 2017 07:02:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Thu, 17 Aug 2017 07:01:45 -0700 (PDT)
In-Reply-To: <1502952015-23737-2-git-send-email-yi.zhao@windriver.com>
References: <1502952015-23737-1-git-send-email-yi.zhao@windriver.com>
	<1502952015-23737-2-git-send-email-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2017 07:01:45 -0700
Message-ID: <CAMKF1soqnxmDPWcr5-zOBRGo8CSO7qyYCXM3jzm66FfO4TPnhg@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] iproute2: add bbappend for supporting tipc tool
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
X-List-Received-Date: Thu, 17 Aug 2017 14:02:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 11:40 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> The tipcutils 2.2 removed the tipc-config tool and recommended to use
> the new configuration tool named "tipc" in iproute2 package for
> configuring the tipc, which utilizes the new tipc netlink kernel API.
>
> We supported tipc in iproute2 with PACKAGECONFIG in oe-core commit
> 944ef0de241de77429ab0e5cb1dd4a7f355cf3fd
>
> Add iproute2 bbappend to enable tipc for tipcutils.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>
> diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
> new file mode 100644
> index 0000000..0869f7f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
> @@ -0,0 +1,2 @@
> +# For tipcutils
> +PACKAGECONFIG_append = " tipc"

can we do it in recipe proper itself ?

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

