Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 079F07D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 14:08:00 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id w2so81668qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=INgj4nbBTZ5fbAyq8OOYpVQLPCYJnW5jt7Iij+fUb98=;
	b=NTgEquSDyFPmaumvFczu+PDjAwt6cJIzJG5YSW3gD0yt+bOat6iWr8qnbEQ21Hr/VH
	H3VHpPMAmUdev69JyjCFrMBD4aE0Y/CU8qP85NWymTkhHDSTubaXgsMc01Weon1Hnmln
	WTQD8BWmpZpgDaaxcXUIJy8lLFDh/dT+2aaH8pHzk2OKnNMgNQ8pB2DmNG20yhtfB5e2
	IThgL6pAzZAFQj8sejmdrd2ye2Fr3pniQ9hh7gDjrWEom8UWd1D0ttjxw9JJndyYJCkp
	VOnn+GPsZ98FHYRsw54eygrlTmAdrN89lPixYL+qVg8rIHxTsvP5y/yQy1O7I0nQuy4o
	/wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=INgj4nbBTZ5fbAyq8OOYpVQLPCYJnW5jt7Iij+fUb98=;
	b=bsfeLNMOSmFhJePRQWl5pDUS5e2tTfhOqMua7C9Pc5wKZk7ERW5fz+wrXzzaHR3KhJ
	WhUegOM2dQNnvbu93jFRpYffE2sHXFYNit73j8NDiV+GdYmHgysjn06YyVTyD3+KGY5X
	IEOVzjjoizF9Pk3Y7IoAh1EweZstCx+G9+hXANcuPQa80K0MAlbeFDMeeAO9WvEwHoUN
	urydOKQc7gEmDvmxwRXcZhJ+MtOyPj4AAERhnVDAIpQ7b5QgyDiD/h4xISmW6/L7QFqr
	QaHmQYJyp3g997kuZRW41kcHzsUxL1Ly9ZMKKEW4KgTWskG53NBqTcVUy4ghZ2gNwRnH
	9aUA==
X-Gm-Message-State: APjAAAU/t7inj6ktTx8+KbnXUbfWML+mhfuoGPi75iCPBRJBPVs6PwlG
	NQi7H/+7BgE9CPEj4j+ncJfdaGwocJB74fHMZwAmZ9/cyvg=
X-Google-Smtp-Source: APXvYqzk33rV51smZacYuZamteADcrEc0xwD30V0Y6en6RIz1K0c1I5Q46xu++rsKV8cUprWwyHvUZWfddw+uwRmKbg=
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr55995qkg.337.1568642881360; 
	Mon, 16 Sep 2019 07:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190915234144.12484-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190915234144.12484-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2019 07:07:35 -0700
Message-ID: <CAMKF1soNx8bk9+yh56cM8eAh+ik1fBeBfyq8Qt=u5ctYUkafpg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] proj: update to 6.1.1
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
X-List-Received-Date: Mon, 16 Sep 2019 14:08:01 -0000
Content-Type: text/plain; charset="UTF-8"

Fails
https://errors.yoctoproject.org/Errors/Details/270689/

On Sun, Sep 15, 2019 at 4:42 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-navigation/proj/{proj_4.9.3.bb => proj_6.1.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-navigation/proj/{proj_4.9.3.bb => proj_6.1.1.bb} (70%)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
> similarity index 70%
> rename from meta-oe/recipes-navigation/proj/proj_4.9.3.bb
> rename to meta-oe/recipes-navigation/proj/proj_6.1.1.bb
> index f45f8948d..a4281b6b2 100644
> --- a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_6.1.1.bb
> @@ -6,8 +6,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
>
>  SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
> -SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
> -SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
> +SRC_URI[md5sum] = "9a82a3174cacf319d94360a759fbcc8a"
> +SRC_URI[sha256sum] = "5cf0a2360a28b5d724c53edbb87f3f3b14fd96001265411ac4e56f369e2d503f"
>
>  inherit autotools pkgconfig lib_package
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

