Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4736277E99
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 20:31:19 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t201so82527242wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 13:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KuB1qn40nqPf8DJZQMNIfBRE24wj4ZVSb6HqzgZp6YE=;
	b=ZAnPD49JZlEDIDDoOr+QkSUBJimcFajMtkPgd7+/HSssje8CDFi23nHGwUOH9UGJ2s
	IwOsL+cp/D1jSev9qRykU51agoUBaBPpkSK3vKtWOPIHCP3rPZafb6iaMmmn5+bR8IVB
	WeYftFy510QA3GOGXA2d1Q+kwkCu4+zw1xGCpCBTXbjvtEGNnKVHgOzJoHo7/3O0CQhv
	L/vzujzvGBtHPZN6JQjibQc0pMOCOVWcYzKFHMDPox8LziyZcY6lSFEEnLb+a0EMdgl7
	8WJWw/d+gzwSopwBVz+7SFjMyFG8yEq4BG37kIriDdxgbs4mJ71vp3PuukvYEbscreLv
	YokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KuB1qn40nqPf8DJZQMNIfBRE24wj4ZVSb6HqzgZp6YE=;
	b=KTIr73B0hMPTA9Ol0g49S++J2arDc6/E4xI7uFXQTHEhwLNuu3Fc5R7UQBg2fmLDPw
	YJiZaMQnAeNaIPnblN48VLHaYQ/IbjOeWWOIsm87ulKxlS4oL+W+LnAyOo8k9I0NI3mU
	houLAGFWSNhqirqq9+BtQ8R3r1k40SuD0B7bXs3mTXNhW3EjG1zBeWqvT+f0ts3U83iI
	yiwYXpKGXbPQXrpA8YYAmfwUnF6wL3/HDE5vNyq7kP+MgoCHOe6jBlA1vco8BqdWUmDo
	RKhauRL0eV7ueWZi2b7YaGE7YGUqZo11NjlCGKbFeCeCDuEexIrWGl6/svbXSUGGw6ZB
	1OrQ==
X-Gm-Message-State: AIVw112rRFmYViUf8pTk8x1EB4fmeUHBDDgpgn/4Z/GTTMW6JpWNwsA8
	+I3SmcBoUM0zOp/Rm7oi+0J+UAkutg==
X-Received: by 10.80.140.253 with SMTP id r58mr1564490edr.123.1501093941645;
	Wed, 26 Jul 2017 11:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Wed, 26 Jul 2017 11:31:51 -0700 (PDT)
In-Reply-To: <CAPybu_3uuf6n73pYn8cA3GJPQC6VnWjAKODi7TMr7ondCTjG8g@mail.gmail.com>
References: <CAPybu_3uuf6n73pYn8cA3GJPQC6VnWjAKODi7TMr7ondCTjG8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2017 11:31:51 -0700
Message-ID: <CAMKF1srk4G2zOdsTFiXnoB2oq2yoa6Yn6=mNm7sg59_etThpgQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Has anyone added support for bazel
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
X-List-Received-Date: Wed, 26 Jul 2017 20:31:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 26, 2017 at 8:07 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi all
>
> I am working on adding support for TensorFlow in Openembbedded.
>
> One of the building dependencies is bazel ( https://bazel.build/ )
>
> Before I create a recipe and a class I was wondering if anyone has
> already worked on this?

It will be a good addition, I have this in my long list of things to do
but if you take a stab at it, would be great.

>
> Regards!
>
>
> Random Thought: Why dont we fix the current build systems that we
> have, instead of inventing new ones that require java?

heh, well read this strip and enjoy
https://xkcd.com/927/

>
> --
> Ricardo Ribalda
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

