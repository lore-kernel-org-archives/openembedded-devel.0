Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D9DF165D19
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jan 2015 09:56:00 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so25830618wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jan 2015 01:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lwYL2VuoRTG576dlF74m+zj4Kmnvse514+RWXaSL5FU=;
	b=gTKi5g3dILfFFfpxyxAIOiZk6GTzQhsb1tWNxiJo/TvcFsrzm5U3wdTxlU6NZWj9ld
	vw0Srw+S5HxMfeMbnGEG1QvM6TWxAp42GVZjX41DeqARxIZ1mG6tZ78ayZDI9jfCZnE7
	GwjnT+huazI8BkL64qZQg5Zq7IRLr7ezOO+I6OzZAkOiDropeHxE/RRJoMmmy2LnP5Pu
	f//hgjCjDfsois8M47/LbpQHGTRThn9/pRvJNnCsqd3XWulb1f1E4gxZbWOoP6zQCyv2
	yp/0RK/sKsnIKSI61fhZXUeYJZBhotidIHmXS9X9kM1wgLvs3JpQvlJ6Qpl5zC0pfyoq
	riHQ==
MIME-Version: 1.0
X-Received: by 10.194.243.1 with SMTP id wu1mr81445621wjc.69.1420365360639;
	Sun, 04 Jan 2015 01:56:00 -0800 (PST)
Received: by 10.194.40.234 with HTTP; Sun, 4 Jan 2015 01:56:00 -0800 (PST)
In-Reply-To: <1420329190-40280-5-git-send-email-liezhi.yang@windriver.com>
References: <1420329190-40280-1-git-send-email-liezhi.yang@windriver.com>
	<1420329190-40280-5-git-send-email-liezhi.yang@windriver.com>
Date: Sun, 4 Jan 2015 10:56:00 +0100
Message-ID: <CA+chaQdSm-mNH8a75hpGNxy96gt94NcXaZoXghAypOxPR5zDkw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] [PATCH 5/5] tomoyo-tools: use BPN in SRC_URI
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
X-List-Received-Date: Sun, 04 Jan 2015 09:56:03 -0000
Content-Type: text/plain; charset=UTF-8

${BPN}-${PV}
<http://pkgs.fedoraproject.org/repo/pkgs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/$%7BBPN%7D-$%7BPV%7D.tar.gz>
->
${BP} and can we use SOURCEFORGE_MIRROR again?

On Sun, Jan 4, 2015 at 12:53 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
> b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
> index bb2676b..70c039e 100644
> --- a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
> +++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
> @@ -5,11 +5,11 @@ being useful purely as a system analysis tool."
>  HOMEPAGE = "http://tomoyo.sourceforge.jp/"
>  SECTION = "System Environment/Kernel"
>
> -SRC_URI = "
> http://jaist.dl.sourceforge.jp/tomoyo/53357/${PN}-${PV}-20140601.tar.gz"
> +SRC_URI = "
> http://jaist.dl.sourceforge.jp/tomoyo/53357/${BPN}-${PV}-20140601.tar.gz"
>  SRC_URI[md5sum] = "888869b793127f00d6439a3246598b83"
>  SRC_URI[sha256sum] =
> "118ef6ba1fbf7c0b83018c3a0d4d5485dfb9b5b7f647f37ce9f63841a3133c2a"
>
> -S = "${WORKDIR}/${PN}"
> +S = "${WORKDIR}/${BPN}"
>
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://COPYING.tomoyo;md5=751419260aa954499f7abaabaa882bbe"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

