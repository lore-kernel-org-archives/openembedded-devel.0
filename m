Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80035605E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 08:04:14 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h8so969589iob.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Yk7nmAmTk8AiSAWi2eH6Q+fQZ9cV9P6YxGPX8TM3q6I=;
	b=ip26E29Or9h0ys7uoAfZl6ET4JALhh/yX1ZwGAsSo9z9Mm0iFXi4Rhmd1BNwSOl+mn
	UxKogssyQoF/wUNCyQ4mfyxCi1SCb6RcMhig6EJS+clkNZ+OghGgRMK5/z6IQEFUP1RF
	Wd74tuG5OYyO2szRhvxBHwBLir96rFM0L4O6o3u0bmmfOT4HhNvFneBTUwLnlHYpZTt4
	SF1kfSPbVc7TGsPRbRky1+L082vFLORW7Czokm+zL1AHmmSwKUJhUFzRvw+hJQ62X1Dl
	ehpsirnl9Z8ouEmZ43vwmf5wcL/A9EBnkQs0cQiezIXV2edWH+ckb13BKt198MOhyR27
	9COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yk7nmAmTk8AiSAWi2eH6Q+fQZ9cV9P6YxGPX8TM3q6I=;
	b=MxtNWxoLVWS6pTXFZw6CrmqRzlQCAIyk+gVWj/slICnni7Eh3xUtIot+7VEKF+rwyY
	ZYEWknAgrifAPfOdxsnwSseItzsyBCS2/yTR2dPj5+8QsTMBBaHxGYIgTjel+UmW8xpV
	OE3WAVbL49VpDFGrYDOzB3dVn1H5ZEx7nurpTy5kpwFZQOqwJwnKQD0UbBD097aH8RBV
	o9UWMPbjUXDLxo95CkuIUsAN5Ux0ciBSYxczP0C68AkX6C2OK1oMdCELApl+Pn+6MjvL
	xJ095KK8a9AwooLyzddIdQLeV/3PaXvnzJ1efusIRZ6Lc1euJm1MklEp7/YUjLCA2cbn
	DBpw==
X-Gm-Message-State: ANhLgQ3zzLT9jmgJoolqfJyOjwtPdEaQBxux74ZLgrYNBjnhRq2nrBfp
	f6As0McutHiFR/7NZQ1NKri8EkZj3WZxAYUYBforEg==
X-Google-Smtp-Source: ADFU+vvputx9tNqUEfOeFL/JtO4+Dy+Z1q8zrj8+E8s6NaNnEd4QbIZaw9D/YMQuyjgRb3zk5MaBt7s9g/DzG5x5BJY=
X-Received: by 2002:a05:6602:cf:: with SMTP id
	z15mr1794558ioe.13.1583913855418; 
	Wed, 11 Mar 2020 01:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
	<CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
In-Reply-To: <CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Mar 2020 09:04:04 +0100
Message-ID: <CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Wed, 11 Mar 2020 08:04:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 3 mar 2020 o 14:56 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a)=
:
>
> If this is not something that should be part of meta-openembedded - is
> there any way to have it hosted at https://git.yoctoproject.org/cgit/
> as an official yocto layer? I'm sorry if this is a dumb question, I
> don't know exactly what the policy is for that.
>

Hi Khem,

gentle ping on this. What is the procedure of hosting a layer at OE?

Bartosz

