Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 83F7E786BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 21:04:56 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id x24-v6so8336109ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KmM8l+DAVGBNJwtOoXRc4UesaUfgY7IiOonIoV2wU7k=;
	b=Hlco0TzU+hj+dLMW4A+vuP2tyECPB1NyK0ub5xm6hzZkPB5rA2eA3LYUGD80r9gFAo
	Oct/CX9ww86b613R7kWJbkcKcuH2oUaJfcZGabkROPdu6z9ktEiydr+glx8nb7P+CDEX
	VoVnc7QAI1xjPXyGpNZsdnI7qPdNZgepkS3ElRoADOCTKKgrWxunnrfA4JNogF2sx+BB
	H8IdNUhATGtv0MmBpV8SbMDEHJN0ufLxMLVagoptgVu2u8SbvzElQue7mQbBWu+mu4dK
	mOuDx7W+AUnKRgGwt1S4SkWy9VY/GfAK/4P8uIGqKE9uIC+kuudb8xO6dHxM/HtmyBa2
	C55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KmM8l+DAVGBNJwtOoXRc4UesaUfgY7IiOonIoV2wU7k=;
	b=aRfs+iY3aB0BDCZJ//Z2xM0kwI155E+hP97/Gbsvemw3rfhY1lPwSKbbeAMS6Iztl6
	ZpTMh4MgwgMF1JLLqQfJ0RDjQ2+CG5UKjw3myibGJFZaNgoCi21MMrPyuaLU/67D8EjO
	nycFLO6dTwM5oKtu8i1I73H0gwVjbE2EG7Zw511wH4cVH6JpXR0KE1wQa/FlAlIpuE5V
	882+wHhjGk3fFDuJgoBiq393VdQo51w3xsSR4WjoXVdN8/orSlFLM88wBWIJC+PsUAke
	mb8tzs9mQ3TlP2pBOKZYAsr5OhVtc1R2f4FCpzAlrUpZlY6uFU7R/ZiFim8WRN2ykmoK
	92Ew==
X-Gm-Message-State: APt69E3NijTronityt2uqAHFwhXGw9OUcCUI72CEsKyIpOACMUovCmao
	OgP50ggxklEXlW2+LVUMcB4MUfda6nRBrcVEy8M=
X-Google-Smtp-Source: AAOMgpeB2JfQnyRgbGM1C5h8mQ+YncWHfpGbH6xJpMROjpJt+gwS3T52PMnzPtZ2H76wT5IRD/bQBkwQSIs5V7TuSXU=
X-Received: by 2002:a9f:2187:: with SMTP id 7-v6mr7626109uac.49.1530911097157; 
	Fri, 06 Jul 2018 14:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180706071136.21496-1-andreas.kling@gmail.com>
In-Reply-To: <20180706071136.21496-1-andreas.kling@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 14:03:54 -0700
Message-ID: <CAMKF1srsrgFSR6Xdz-NW99D3EPfSoc5zVoxi9TiD9_J_b=qhmg@mail.gmail.com>
To: andreas.kling@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] wireless-regdb: update 2016.06.10.bb -> 2018.05.31.bb
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
X-List-Received-Date: Fri, 06 Jul 2018 21:04:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andreas
On Fri, Jul 6, 2018 at 12:12 AM <andreas.kling@gmail.com> wrote:
>
> From: Andy Kling <andreas.kling@peiker-cee.de>
>
> regulatory db can now be loaded by kernel as firmware file.
>
Can you check if this patch fixes your issue too

https://patchwork.openembedded.org/patch/152350/


> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> ---
>  ...ss-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} (64%)
>
> diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> similarity index 64%
> rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
> rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> index 64e9401e7..c51439f3a 100644
> --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
> +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> @@ -5,16 +5,19 @@ LICENSE = "ISC"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
>
>  SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
> -SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
> +SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
> +SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
>
>  inherit bin_package
>
>  do_install() {
>      install -d -m0755 ${D}${libdir}/crda
>      install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
> +    install -d -m0755 ${D}${base_libdir}/firmware
>      install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
>      install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
> +    install -m 0644 regulatory.db ${D}${base_libdir}/firmware/regulatory.db
> +    install -m 0644 regulatory.db.p7s ${D}${base_libdir}/firmware/regulatory.db.p7s
>  }
>
>  RSUGGESTS_${PN} = "crda"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

