Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 68AF1605D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 22:59:25 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so84402764igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2015 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=alaAVxfDSm2jznuJN2JWg5GeNhiub1Zxazq5hTscrIQ=;
	b=BoR0ItYQHs6DtHf6sc2FdrcwFRWDyYCPDByWOlOV+0V/BpWHM0i4qyBBTfhxRHWjRi
	63Ob8aWe8Z40i2Gf8nzkBRqOM4FFGdVr5SOvylyp4Z9D2aBjfgAE+qBCDuVUYTfUCybI
	9zxY+tx+SrqALUlrheETXOteU4/+v9i2jeKhCPlzC5N5YqbtmlqVZ2pDHflI9ErZGnTz
	/ofgIERuc7YYBEppKmkkaQt+9jJunVJ/V9G68B8FensgaxN8vtCVnxngec/IzjMy1gbf
	saTxKRYNaKakvQ3kq7k3ZxrcqPOxw0prSp7rHodPGjcQj3Iivi6qe0v76RY6risBZChL
	p0CQ==
X-Received: by 10.50.30.105 with SMTP id r9mr2499891igh.11.1438729165547; Tue,
	04 Aug 2015 15:59:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Tue, 4 Aug 2015 15:58:56 -0700 (PDT)
In-Reply-To: <1438655705-55042-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438655705-55042-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2015 15:58:56 -0700
Message-ID: <CAMKF1sq8zQyen5t08NLDY2dM=RJ5hN2T7Yy8Ybkz_XQqyhU_CQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-requests: upgrade 2.5.1 -> 2.7.0
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
X-List-Received-Date: Tue, 04 Aug 2015 22:59:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 3, 2015 at 7:35 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../python/{python-requests_2.5.1.bb => python-requests_2.7.0.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-requests_2.5.1.bb => python-requests_2.7.0.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> rename to meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> index b719dca..cd0f99e 100644
> --- a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Python HTTP for Humans."
>  HOMEPAGE = "http://python-requests.org"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
>
>  PR = "r0"

dont need this.

>  SRCNAME = "requests"
>
>  SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "c270eb5551a02e8ab7a4cbb83e22af2e"
> -SRC_URI[sha256sum] = "7b7735efd3b1e2323dc9fcef060b380d05f5f18bd0f247f5e9e74a628279de66"
> +SRC_URI[md5sum] = "29b173fd5fa572ec0764d1fd7b527260"
> +SRC_URI[sha256sum] = "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

