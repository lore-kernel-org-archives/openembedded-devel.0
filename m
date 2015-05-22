Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E327609B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 04:52:28 +0000 (UTC)
Received: by pdea3 with SMTP id a3so9850833pde.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 21:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Oh/HA1uorf45HozuaRnnIAkkYVvOsjrBHztKKdV+iA4=;
	b=CmoUGhfeA2AVOJmW+v6a+FVcJbTmirtcSfv1YGSe3HnKicWuHJXDnT1KYAcYn/lznX
	sl8e7sy0cMZ43+s57z8StMsJs8sKEQ9hiSsP2H853taJGZFmVziR5l6VycRrqTiFIM5P
	rKgIt2XKaY7AyaMsvhNrwk4GjTqo8S+d2d3WVnUXdJvns9IDvLqMERNfmqYzoyhgSf3p
	7iSHjx6xcMk1yQFcWi2Gp0xs8v96Rnv3Zhcs9Ee5CJQhd0BYEYcGAXs56SR28xbg83RQ
	CntC5Ye/OBkWs7+3EcVI+F0cBElFH752gcLDbjqtPVo3m/+FsLFmvT4IsBcAWDS+5fae
	NxyA==
MIME-Version: 1.0
X-Received: by 10.70.89.199 with SMTP id bq7mr11843154pdb.168.1432270350072;
	Thu, 21 May 2015 21:52:30 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Thu, 21 May 2015 21:52:30 -0700 (PDT)
In-Reply-To: <1432249924-6005-1-git-send-email-akuster808@gmail.com>
References: <1432249924-6005-1-git-send-email-akuster808@gmail.com>
Date: Fri, 22 May 2015 06:52:30 +0200
Message-ID: <CALbNGRQKS8vcU2kic2-TXQi8D-7kbzOGBxbZnyaZcujS60KWcQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce: add image
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
X-List-Received-Date: Fri, 22 May 2015 04:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 22, 2015 at 1:12 AM, Armin Kuster <akuster808@gmail.com> wrote:
> This allows for an easier method of getting a XFCE image to demo and use.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-core/images/core-image-minimal-xfce.bb      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
>
> diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> new file mode 100644
> index 0000000..1f83474
> --- /dev/null
> +++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "A XFCE minimal demo image."
> +
> +IMAGE_INSTALL = "packagegroup-core-boot \
> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> +    packagegroup-core-x11 \
> +    packagegroup-xfce-base \
> +"
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +IMAGE_LINGUAS = " "
please put '?=' here - others reusing this might want multiple language setup
> +
> +LICENSE = "MIT"
> +
> +export IMAGE_BASENAME = "core-image-minimal-xfce"
> +
> +inherit core-image
> --
> 2.3.5
>
Besides the minor comment above I am fine with this patch.

Andreas

