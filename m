Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E18C860FA0
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Feb 2020 20:00:56 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e21so2124525qtp.13
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Feb 2020 12:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DnzEj/justKRa4t5wQBC9FMKxKJYRAeWZ/GoexGJfAQ=;
	b=Nv+Sno7potdPq5WPWkTVHuTon966SBGVkrdRrJKxubMTaihk9FdZHvuddcF3A8nOxJ
	zcwswTS+FAhQSI9YPgsuhffYmBVGgNP1CuOxPojnZdTuPlrxVrqBxB+4uF5AnADbaJqD
	RypUgRDv2+4u88XnHwo0dXM61RPI5wfNw6u6cK0O9ZCGzs1DW6ive/uTJL3ds904a7bo
	8ocd3a8BblE5y6RLZDNxP5zRbD8Dj2dsMfJuHqqHeNF7H5Md0sIQZuRQjJiobHu5OaBY
	gztFBxECoRXdHtuwARuHhAkTrTwO/oAE58NP5EQzB++uNjMBQPof/6BeQEuxRRQBIUsN
	U+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DnzEj/justKRa4t5wQBC9FMKxKJYRAeWZ/GoexGJfAQ=;
	b=Z6JCL2N81nvfPX9Goi7WndsGQwgTV5GRbPetVcHpWI2DjnVN/ahDkplzYryKAzCLI9
	kA6sC2MdzOMtQORWJG+9Mn9BMP5vOdSmyOjJBplMIkH1XCNl2U8bPnZsX6Q/gGJRQo0I
	6mnXwj79NMUIT0PFRxtUduYJxafB450RNzhr8TbixUg2c+/OrXEe8VNeJ/2FOj1CKkKL
	EiYT0Q4Dw9r7RgJKhLi6BAeM5WtfzTEOOwk7xjSVxUDHcUG7TaoL9/rVrducXHC4yZMU
	k0iFzyG0Frymu70lz9pjpyPvMJY8wzrUF0f3cf/xHEuNag2L+Wdcz2YEdLZFhWcZaE21
	JqMw==
X-Gm-Message-State: APjAAAWYP24XqYdWW69wOeRZ72p9cnyV3bb+59ravzAB1OCRPqd7z8Ds
	Xm7viaFJu1JHVSVxpUKo8r3RBSHlEioRmIE9Oeg=
X-Google-Smtp-Source: APXvYqyJO68C/cNnrPS20DbuiS/f3mKBc9r8h+i5Eis1NMEhxqbuq5XapEdOuhfSYoJE5MA1f+P74BbZpt4P5FgbnnU=
X-Received: by 2002:ac8:145:: with SMTP id f5mr11371317qtg.194.1581364857566; 
	Mon, 10 Feb 2020 12:00:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581264950.git.akuster808@gmail.com>
	<f64c2d691ea597aa6221e3d7706a4d022e07bfea.1581264950.git.akuster808@gmail.com>
In-Reply-To: <f64c2d691ea597aa6221e3d7706a4d022e07bfea.1581264950.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 12:00:31 -0800
Message-ID: <CAMKF1sqUomRGFQP83tEwR1xnaypWYAoEvGcbsvpvg0DE9BYDZw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [zeus 01/11] libldb: upgrade 1.5.5 -> 1.5.6
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
X-List-Received-Date: Mon, 10 Feb 2020 20:00:57 -0000
Content-Type: text/plain; charset="UTF-8"

patch series looks good to me.

On Sun, Feb 9, 2020 at 8:17 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Yi Zhao <yi.zhao@windriver.com>
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 2b3fd534874aee125a6c79c70c93b1aa498fda3f)
> [Samba's update via ee5aa6911b2e93b89e67ae6167ee7d9a029b9262  required
>  libldb upgrade to 1.5.6 Yocto # 13750]
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> similarity index 95%
> rename from meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> rename to meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> index b19c964d85..99eb6f9ce8 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> @@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>                      file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>                      file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>
> -SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
> -SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
> +SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
> +SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
>
>  inherit waf-samba distro_features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

