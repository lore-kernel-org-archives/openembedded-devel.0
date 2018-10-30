Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D36C79C6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 12:10:24 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i191-v6so13334544iti.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7SshNG2jsumLymEX0NVV0tF7mYKNFiZOyNw/RIJNoNE=;
	b=nPhuKJd7c5OA0NPYNFdaOoVH9w3TmCXwWFJonPWMyZEM6tjJ6kGDyjVCQfALDLyfvj
	+jTQD8jgMFH1mWdPd4i6pIioewQFL/YP913j7qiJAWwiLZllRaJ65spVSXreEgheBXYb
	ZkZjN0QL0p+x8cer805fU6VYcfQvQI+/yVL1c+1bHP8rGZ/4lwAdAjDZcGhG3DqlNa9i
	zX3k8Q22DjqdrSllpMQR1gNPAc8BBmgxBoqn+2mBrFP8tW+I9fYKU9OdVdNKzOy8Jt46
	4OhTKe0wevufZRJcpAHE3wHIMbTpiaag6oNfiZczyKhd05f3EqZUWzMbEe3s8wHDJWXd
	kWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7SshNG2jsumLymEX0NVV0tF7mYKNFiZOyNw/RIJNoNE=;
	b=D5R3ZE1c6My1OnC2BikUi+abUp4/FhgwXN8jBZQhJ5vvJi0TYFjMH8RwkLX6cMkFoL
	1CA56eJDF0VLghf8ZQ6R4i+7dyP3V0q6E+i0UB0e46IWXhiOFxhSBide25OOQ6iaPAHE
	TLjhZc8X3Izca3nvOQRylF1ZNBdawLsPg87p1UG9wJi7vqidVHToiOyHvk5+izIiSS+C
	0PdXmWLJcix1vOo0umI1I8YkzJQxCmlwUc+tshQcdZ/xVOnplqiKfgw57Nr8bjUt3cqf
	3GInGhWzOMPa9YQlwBzlScGrOoatL1HeAbDHXJ1JjrVzBb+DAdq8WG50XHcFYJamsIqc
	8qMA==
X-Gm-Message-State: AGRZ1gJnCRnWfc199EqJRg28NrO5dDakCkL00Dn1rbhh1aikK8g3JDt2
	iYK9RLtrSAiJ5bOOZFFpO5QOgO0PNhIMRjcLMqpM8A==
X-Google-Smtp-Source: AJdET5cwMbG7QM4Kj8kOC3DxwUvuZujAsrR5V7anzwvbhrUv/y0Zr/EwWdWFibB+6waX1mnow5m9f8pAH27I9Jx+FAo=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr1027261itd.26.1540901425507; 
	Tue, 30 Oct 2018 05:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<249e8f90c9f911f125fbde534b24731e2a14bba6.1540830650.git.brendank310@gmail.com>
In-Reply-To: <249e8f90c9f911f125fbde534b24731e2a14bba6.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 12:10:14 +0000
Message-ID: <CAJTo0Lb3XYdTGYUZnom2KTNuKqxg3ZyjAffQi2xLSbKM8-bUGw@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 01/16] sassc: add recipes for libsass-native and sassc-native.
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
X-List-Received-Date: Tue, 30 Oct 2018 12:10:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> +SRC_URI = "https://github.com/sass/${BPN}/archive/${PV}.tar.gz \
> +           "
> +SRC_URI[md5sum] = "4af3f4ffd3e8cac1cb1c90ebc2dd41b2"
> +SRC_URI[sha256sum] = "5f61cbcddaf8e6ef7a725fcfa5d05297becd7843960f245197ebb655ff868770"

These tarballs are dynamically generated using git-archive so can
change over time.  As the maintainers are not uploading their own
static tarballs, you'll have to use git to fetch these.

> +S = "${WORKDIR}/${BPN}-${PV}"

This is the default.

> +inherit autotools pkgconfig native

Instead of having sassc-native and inheriting native, it's better to
have a sassc.bb and BBCLASSEXTEND=native to get native and target
recipes.  Bonus points for test-building the nativesdk variant too.

Ross

