Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 40988727B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jan 2015 09:56:27 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id l18so719442wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jan 2015 01:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hsV98i4ZakCqCk08tS3snCM9PwQCH2JKhNLlOR/pnaI=;
	b=RY9XLQYZ4/o+cst1/hnFnVwIHPfxcD/I6VKaDXFooIxpQDLBA2xZOYf/0vG/1r53Ra
	ZXGpXQnB/mquoY+2DnQkzXkqKESH8/MLMY/8wyB9iGUojUHKKPrWeXyzMwA9Q/lwJ44n
	QOqaCvySATEFhAIHkwijGXHByP0U61sR3+ChirXkEcFwQs8fq7pITYAL7LvP9nDCg1BH
	2fGayGwBzsJFl0CujmDLpJ6t2pKOGq1CKvf90wOPt7kq8VWtAZ1RtslIbjPsDZf8rtGz
	6qVYiugu2toMC9TuxQ2nudwEFpJd9t+V77jhVJFGScApFhnpdV+qhescZl56Cof51SI8
	pflQ==
MIME-Version: 1.0
X-Received: by 10.194.62.76 with SMTP id w12mr168836605wjr.5.1420365388035;
	Sun, 04 Jan 2015 01:56:28 -0800 (PST)
Received: by 10.194.40.234 with HTTP; Sun, 4 Jan 2015 01:56:28 -0800 (PST)
In-Reply-To: <1420329190-40280-1-git-send-email-liezhi.yang@windriver.com>
References: <1420329190-40280-1-git-send-email-liezhi.yang@windriver.com>
Date: Sun, 4 Jan 2015 10:56:28 +0100
Message-ID: <CA+chaQcnDANXTwkBhPpx_Og3-KT8p-MkeFCU=FDFkwT92rDkuQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] [PATCH 1/5] dash: use BPN in SRC_URI
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
X-List-Received-Date: Sun, 04 Jan 2015 09:56:28 -0000
Content-Type: text/plain; charset=UTF-8

${BPN}-${PV}
<http://pkgs.fedoraproject.org/repo/pkgs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/$%7BBPN%7D-$%7BPV%7D.tar.gz>
->
${BP} please

On Sun, Jan 4, 2015 at 12:53 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-extended/dash/dash_0.5.8.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> index c2b5249..17fc924 100644
> --- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> +++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
>
>  inherit autotools update-alternatives
>
> -SRC_URI = "
> http://gondor.apana.org.au/~herbert/dash/files/${PN}-${PV}.tar.gz"
> +SRC_URI = "
> http://gondor.apana.org.au/~herbert/dash/files/${BPN}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "5c152209680dab3c319e8923f6c51378"
>  SRC_URI[sha256sum] =
> "c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f"
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

