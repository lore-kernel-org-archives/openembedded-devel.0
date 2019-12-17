Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 85ABF7FC7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 03:54:11 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c17so6395808qkg.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 19:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=l7WUGeU1E/hJXJ02rxR5j5mZHLasMV4JhsJOhWibJac=;
	b=DwyfMDMwrzjxnkECVQ2C7mkZFngGPGGvxbab8W7AUUKn0H6hf0yMVeunHq7E0KDRa/
	5Ni4Ouq7/NH8c73xdh9LnttLp9yYJ2Ye1TNgsRIL7YzpGc95p4sOQ94xoPGstsyq3v3P
	wdqEhXmKTVictkQvOP0OrPy717uNlTLyrCbgK8SyhuIm7eugDLnyJ9SLlAQKwKV07Qqd
	9ys0PyqwuINTw9M7s/ry6D42OaPGrhBrfiRDzstBY6/weHeKxxqRedaP6T3TVy2+zpl1
	ZDj7MO0Yvf7HdqhxbFIEJtGEj5q0ayBZHQfxhpplWBHcsbmF+1hl4gqNl0mFVgdDWCn8
	W30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=l7WUGeU1E/hJXJ02rxR5j5mZHLasMV4JhsJOhWibJac=;
	b=N3fjd9d7HFtoOJ+miWu0C+pZi3smZILWVhnP8Xuve1ffC7k0J9ysjjrqDQoL24vtA5
	r9O6BIGay8R1FcTLC2gfeX4LOp/banl57+XO/NLP7a/ono4NHAaDo7U0gDuzEFxB5jv4
	ZaE408vaylyo71C9GtoVL9+Ws9IYeWM1l0nKwet/omSDO4RP8VzMehKOkBIDVtnldjUN
	7fEZz2SM2oY4HIieVl+uRf5HYMs8aHgcgQh5wGeNnGBpJ3sfGhZEH2EFEnjgzd/ShEME
	bFGvYLT60OICYipCKckK+F4GGiMThu/Uuh7ytCq8eYRkt6k4GqEU/gRAI4morwa81gya
	Re1Q==
X-Gm-Message-State: APjAAAVhYTldU42sQR6s0Ffa0f6vf1SqX5mp9EFVSL1Aae8Hh/xzuqdR
	w150MyCJ6yikjiDF84UEd637b/DtXqqf5O6koBg85GYy
X-Google-Smtp-Source: APXvYqxkDPh0S3ykIWMqBC3HK3OQvQarUchg4hRg7v/UoVa3Ku0DzGIV7XtqYWkDCCGzDCK1E0prB+RoRoEsPIEC/mk=
X-Received: by 2002:a37:de05:: with SMTP id h5mr3093982qkj.474.1576554851840; 
	Mon, 16 Dec 2019 19:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20191217034110.3234131-1-raj.khem@gmail.com>
	<20191217034110.3234131-2-raj.khem@gmail.com>
In-Reply-To: <20191217034110.3234131-2-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Dec 2019 19:53:43 -0800
Message-ID: <CAMKF1soiKgXOE-EijX8Hf4i2XxXPCbmjYZf-GVMEC1PfJ2YVng@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] nlohmann-json: Upgrade to 3.7.3
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
X-List-Received-Date: Tue, 17 Dec 2019 03:54:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 16, 2019 at 7:41 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Rename recipe to express PV
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{nlohmann-json_git.bb => nlohmann-json_3.7.3.bb}          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_git.bb => nlohmann-json_3.7.3.bb} (89%)
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
> similarity index 89%
> rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
> rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
> index 4399edaab1..37597defed 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb
> @@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f5f7c71504da070bcf4f090205ce1080"
>
>  SRC_URI = "git://github.com/nlohmann/json.git"

Since this is a release tag, it also needed adding nobranch=1 to
SRC_URI which is what is staged in master-next

>
> -PV = "3.7.0+git${SRCPV}"
> -
> -SRCREV = "ea60d40f4a60a47d3be9560d8f7bc37c163fe47b"
> +SRCREV = "e7b3b40b5a95bc74b9a7f662830a27c49ffc01b4"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.24.1
>

