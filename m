Return-Path: <net147@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0527360796
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:00:43 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id h190so5233766ith.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=9uprJ0bJvRsVqb4+6ucqvOXMiOEQLSqFhQB7BXOCU5c=;
	b=uEoMOyngy357L0Q39mu9COR3hjtNRqGnCSIEH0U+9o37LQiHGGy/0lE+Q6J90gCEhn
	x2xAfz7bYHpIfH42ogaBcVl6btIx24PIUedZCYFC4kZuh400aMt2/q1LDuXw3eFNHxRi
	MpCqSkG7WBj/m6y3zuf2t/g0bhazaOpweEIYurlty54DsQgV46xgOcFJbnsktV5/nxEP
	Kv1Lsy30b+Nrc1nLUdkoPd5W3tMA32fvCcK3l+V3ihQC34THBWSf5d7hwp4VjmS5mYZs
	iE3yMWvEpAvKuTtEAHONhkPVy9BY6HUrHyIG5bhLEseiKdyv0jF61+81kIK7IC8dzy5Y
	UH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=9uprJ0bJvRsVqb4+6ucqvOXMiOEQLSqFhQB7BXOCU5c=;
	b=GhIlZP4G+l/KquOxX1+d+wXvj+QscjxNnVn5WOKKHIcofz4zp21ELa3NZPJwGHKkdC
	jNhZK/RHyxdLRIy6ttyJu9M3EpDswrCKQrsl5BINYblf3hBZ+1WzxfG1ELLc1Dp+CBRv
	UerwZbxAa0c34agiFwccqHEwe/I7NpFDCaqnpfsn60MFGzjYfRs31pCfZbbeuJh++9Ez
	4c/YQ8WAuTKZvM8kwcx1J7ZJf+HqtM3Jjv0Y6gfp8zlFTpnFl0k47viwZkYWFR0mkMLY
	xZC2iKAVa9tuNdqGYDLtxMNiAqGMYoFBvxLpO1ICDkTtuftmANE9zK/5FVFK3vw61BZO
	soBA==
X-Gm-Message-State: ALyK8tL5jAw1n2KqD4v86f1DZdqtEHNRAmSjmd8ajiBBfP66KRV+UJujPwkKfHHH3QhShn6M6pdnSFzzfzI4lg==
X-Received: by 10.36.233.68 with SMTP id f65mr21921929ith.19.1465480841758;
	Thu, 09 Jun 2016 07:00:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.209.71 with HTTP; Thu, 9 Jun 2016 07:00:40 -0700 (PDT)
In-Reply-To: <20160608140019.6787-1-Martin.Jansa@gmail.com>
References: <20160608140019.6787-1-Martin.Jansa@gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Fri, 10 Jun 2016 00:00:40 +1000
Message-ID: <CANwerB1HUzfkg9Yzn-7aMcW5AvKzXz2mdnhbF8F75cra8Fa0eA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5 1/2] qtcharts: Add dependency on qtmultimedia
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
X-List-Received-Date: Thu, 09 Jun 2016 14:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On 9 June 2016 at 00:00, Martin Jansa <martin.jansa@gmail.com> wrote:
> * fixes QA:
>   qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples rdepends on qtmultimedia, but it isn't a build dependency, missing qtmultimedia in DEPENDS or PACKAGECONFIG? [build-deps]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtcharts_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
> index 5aaddc9..99d1471 100644
> --- a/recipes-qt/qt5/qtcharts_git.bb
> +++ b/recipes-qt/qt5/qtcharts_git.bb
> @@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = " \
>      file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>  "
>
> -DEPENDS += "qtbase qtdeclarative"
> +DEPENDS += "qtbase qtdeclarative qtmultimedia"
>
>  SRCREV = "8a781841812a42ed728a76c0dcdcaa6196eac44e"
> --
> 2.8.4

Looks good to me. Though qtmultimedia is only needed if the "examples"
PACKAGECONFIG is enabled in either qtbase or qtcharts. I wonder if
there is a good way to make the dependency conditional on that.

Regards,
Jonathan

