Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id C9EB87716E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 15:21:34 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so85130633ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GqrGkKdLZ8kniIzxrMacUvFWi0eq5FuYjRQvXP49VXQ=;
	b=mSFyBP1y84TBvpsQwF7SsFva1b+4fFRZuvdpS2g6FwoZzWE/A5JUUljE2t4rhLPxuI
	RwcIxkKbapgzHePd07BsTCdyjC4ObV0QcXnyLpO3m8rCYdbFgjMK+L4AIhBh2J86uulw
	SAfeO5zzFkUkqfvXnih4OQ92n/yegYbv74qbpW43msVvGpra/mvfi5JRk0zYzzwIB+0m
	nkplk1KLfD5L4SqVHvjHQM7JAwdBh7Aikh3IGeNZ3prqs1ueAkSu4YFw37EK/NVAcu6l
	V3/lUcIJPCR5BVBxDMsCXupUVdRUrP7wAOsX9wygrZqxByGsyJfsQWUuiLGPi2w8H3fj
	0SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GqrGkKdLZ8kniIzxrMacUvFWi0eq5FuYjRQvXP49VXQ=;
	b=nFUZlZRUKf2vpcKugSCnETaJl78Ng4t+DeJHfxM42XiKSve4xM7d8Kkr5hcUBpoMzB
	hGDdYzSgwnXW+7dMsRVr6g/K2CjR0tqTLDF3g/TGoPg4fspn5QG8rfmICdphDwyz+NVS
	RlLtUeyYZr6oUmpOgI84dX3KKlXBaGtozrDrIcBzefu7QVATQoTr8u2an9ju5+X3SMP9
	Wi7SCNy3CEhNnqNJgfIrhVdF1djadrmAm9bNTOxn/psl+XD782/Xg5JinHktidYZJDKz
	kAmKXv9niaYQ0Zpdq5vG6Jnf+E8L+4JM/kymTsVOeRXuHKJPWAftp9NXpOIFKU372/t5
	K3ZA==
X-Gm-Message-State: AEkoouv7oQLwyb5sISsoJtYu/PG90c9QWyL4rUu5NziTTcPjZBzAzbpZCVuRIK4DTzamfBqG0h+3Uz+GvMNqQFus
X-Received: by 10.36.19.75 with SMTP id 72mr18146914itz.83.1470669695020; Mon,
	08 Aug 2016 08:21:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 08:21:14 -0700 (PDT)
In-Reply-To: <20160808120310.22277-1-Martin.Jansa@gmail.com>
References: <20160808115112.jhhfu6wqmwbv5qzh@jama>
	<20160808120310.22277-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 16:21:14 +0100
Message-ID: <CAJTo0LbHi5+jwgKMV1-G4SvzkWKvGaEO5t8zTEfi9VSpeN2teQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "fan.xin" <fan.xin@jp.fujitsu.com>
Subject: Re: [meta-oe][PATCH] qpdf: add new recipe
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
X-List-Received-Date: Mon, 08 Aug 2016 15:21:35 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 13:03, Martin Jansa <martin.jansa@gmail.com> wrote:

> +do_configure_prepend() {
> +    sh ${S}/autogen.sh
> +}
>

https://github.com/qpdf/qpdf/blob/master/autogen.sh says that this is just

aclocal -I m4
autoheader
autoconf

So I don't see what this achieves as we're about to run this again anyway
via autoreconf.

Ross

