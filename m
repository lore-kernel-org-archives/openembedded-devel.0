Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 472037F0F5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 00:06:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 4so7714887pld.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 17:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=FZ11czqNrMy18o9soY6ewtvstVhjQS2+MChOPrhAxbc=;
	b=XmGnfqorD4yEzq74OLWlGZBQmrlmJg8t23mgeRpjQCOHqb72DexyBaEB3BhGvJuvrY
	ZU0ArCmwGlMOhCDREaz1InDWAls3AoucPIT7a9hiPsWIyW6HPIhjOyENDhA7B3+4qT7e
	kN6XEH2r8DhKElxpT5s27ZHKdAvqo1o6lenX4CKojiFEDQRGXmIlkMrHL4O4RoDEfA19
	AEhkfi9HRKnDYiBNN04B4WxLrf1YG8RfUCJMv1hjHJYKpSlwoErSM92NfZefr+3sSgPC
	GwM72kUxWbD/wxuTZQKkJzh1TIJdaldFh4zui28qABalyH6ltc5jrQUDNtwlmxs4qFa7
	xnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=FZ11czqNrMy18o9soY6ewtvstVhjQS2+MChOPrhAxbc=;
	b=fb+4LMJVEZ5v7kl+dugN5K7BP0ja1PE2fPzorMUytsXY0MAWPgJp+ZgzbQ0fpIIF5K
	7sG9XoqyTET5l8uP3Qdh/q6msrlYuYdQt6KLubt6toDRcCMF7ttGf6BQWzmI4mrrwpJC
	uDB9Pof0oCSeCxPjNztwDRHd7k0dZFLyJUR7qqEEB2Ki6NKs7CeUmF0TIB6ip/7PpSC4
	CKuNvxMLIawnn6cKNZjdNLoa0QothMOyPFqyGMuhCYuM8haSFRRw9FO1NzDS15BYYU84
	R7YF/wQ9njbzNcu1FYF08glNc3pIRHPQQ05Zqwirig1z2gniq0/h0e3utxC4BBD3jfVA
	VWKg==
X-Gm-Message-State: APjAAAU8HjU/luEABjniemcJtFQHq2M3cnA3yGeAtb7Z5TBH8Ahg5wpB
	fKtlJ0CzTc24Z38Z/eheETUHqwB7
X-Google-Smtp-Source: APXvYqyErpRqX7kEYGTWNiXtm8sRlXUEDvBVsfdMcCmGDkKrVwlpvagZTHJ9VpjzWR0jtl/+3WWD2w==
X-Received: by 2002:a17:902:7887:: with SMTP id
	q7mr53931107pll.129.1563494782919; 
	Thu, 18 Jul 2019 17:06:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c4ab:f842:37b:5f24?
	([2601:202:4180:c33:c4ab:f842:37b:5f24])
	by smtp.gmail.com with ESMTPSA id
	x22sm33410213pff.5.2019.07.18.17.06.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 17:06:22 -0700 (PDT)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <20190718022356.12639-1-zangrc.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <12350e5f-3fdc-c934-61d7-0ea6ee80fe85@gmail.com>
Date: Thu, 18 Jul 2019 17:06:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718022356.12639-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe] [PATCH] setxkbmap: upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Fri, 19 Jul 2019 00:06:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Zang,

On 7/17/19 7:23 PM, Zang Ruochen wrote:
> -Upgrade from setxkbmap_1.3.1.bb to setxkbmap_1.3.2.bb.

We understand this is an upgrade so i don't think the above line is
necessary as it is covered in the subject line.

I find it more helpful if=C2=A0 a comment like "this a bug fix only" or
includes new features.

Information like that helps in stable branch backport selection.

thank you for taking the time to update this package.
regards,
Armin
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../xorg-app/{setxkbmap_1.3.1.bb =3D> setxkbmap_1.3.2.bb}             =
  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.1.bb =3D> setx=
kbmap_1.3.2.bb} (78%)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb b/met=
a-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
> similarity index 78%
> rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
> rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
> index 8402753..30fbd1b 100644
> --- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.1.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.2.bb
> @@ -15,5 +15,5 @@ DEPENDS +=3D "libxkbfile"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -SRC_URI[md5sum] =3D "2c47a1b8e268df73963c4eb2316b1a89"
> -SRC_URI[sha256sum] =3D "a9ddb3963f263ba13f0ea105d8c45a531832140530217c=
c559587bb94f02d3e1"
> +SRC_URI[md5sum] =3D "93e736c98fb75856ee8227a0c49a128d"
> +SRC_URI[sha256sum] =3D "8ff27486442725e50b02d7049152f51d125ecad71b7ce5=
03cfa09d5d8ceeb9f5"



