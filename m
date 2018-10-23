Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC13605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 19:00:16 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e81-v6so2324784itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=9eDQKL0eK8caiEJKedP3u/zZnr60UxhLfXUOyerdWKs=;
	b=YefHdBKOJhCdaK6r45+7F+A8gbgEdx/62kH5mzFGLwY6GNygcWaowGAI6dPGFj15yT
	bt7G3whFUWIkL7j6YpZf6+kbqlBgjyb3rQ5HqzefaD/4lHFpsVfbfUVH2iT04Q+3W8Yn
	MFXn8JLFBLvDTUVN7v59Bpv+J51i2JFaEmCpcxHheiLk/ez/9xN23tbnZJy6WhGczhHi
	mESYDcO2pOi8qqrtw/xolVXVw9hHlTnqz+4ALqSu2CEhIySBzpvMdUX2GVCyOVIvldCa
	PIv7TVkbOTZbUdb+8bjb/Vhrx99fdSbpvwIwugVHvkR9oBbSxA6oU0/MneK1+bx6dFv2
	TLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=9eDQKL0eK8caiEJKedP3u/zZnr60UxhLfXUOyerdWKs=;
	b=NVca2TiC2rhCft3kR/FR+lUYYYpZ36jZX5BS5y8suZIV5yzMDbQN5ieSRt7XxYFrHd
	JOMxlpF+S8KYogytK3QmqXFenW08Z12Z5jSOP9ALD2oLwNlh/ot6qE71YOk8BosjPxh1
	bblcjSFfesYEqj3ooVsbIykU99GiQYBS/p+G5EcXAJosr+u7SI4JAhbxbMB4IPyY9M1Y
	dlhEvOIk0X2408CTzExhnL71vtxCwk/DnN0t28geptkJPpLLXiR14OF9Yg/Ja3M1P+D1
	yradBkYcIArTU8l5fuFB+gHm0medQ0NEC6ohSPhfD04n/IKEHucXNAMfyecpLQfnVXt2
	gQKA==
X-Gm-Message-State: ABuFfojOwOcHEsdCa/rglrCqhcqVQ1eDZKlkXiCwA6UYOjtxai0LXusL
	BF7H+UxJuS9Y/kWlixnkSkg=
X-Google-Smtp-Source: ACcGV62CDpC1aTcCjS6fChOSfYEVDDsj8LzTZpbU5n+8JuwVgEOjYPwAjIre+xzj0jyWvdXiiL24Mg==
X-Received: by 2002:a24:bc44:: with SMTP id
	n65-v6mr14218017ite.102.1540321217377; 
	Tue, 23 Oct 2018 12:00:17 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	u21-v6sm773591ioc.43.2018.10.23.12.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Oct 2018 12:00:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <b547d0e296f044f8f6b0c4552f593977c9eb5ca1.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Oct 2018 14:00:16 -0500
In-Reply-To: <CA+chaQdztUVMJxae0F05=Bn4PZ1Nj+6=fK5vDR2e2_9uKcb9JQ@mail.gmail.com>
References: <20181023160510.19604-1-JPEWhacker@gmail.com>
	<CA+chaQdztUVMJxae0F05=Bn4PZ1Nj+6=fK5vDR2e2_9uKcb9JQ@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][sumo][PATCH] rapidjson: Allow empty package
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
X-List-Received-Date: Tue, 23 Oct 2018 19:00:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-23 at 19:28 +0200, Martin Jansa wrote:
> Why is installing useless empty packages sane?

The development packages that get installed in the SDK are picked up
grabbing the -dev that corresponds to each ${PN} being installed.
However, you can't do that with RapidJSON as there is no ${PN} package
because it is empty and therefore culled. Adding the empty ${PN}
package seems to be a pretty low-risk way of making RapidJSON behave
like all the other packages when it comes to building into an SDK;
effectively, IMAGE_INSTALL += "rapidjson" is now sufficient to get it
in the SDK.
You could of course manually add "rapidjson-dev" to
TOOLCHAIN_HOST_TASK, but that doesn't seem to be the precedent. This
change is similar to those found in other header-only and staticdev-
only recipes like libatomic-ops, gtest, libsrtp, tclap, ceres-solver,
asio, and libinih.
> On Tue, Oct 23, 2018 at 6:05 PM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > Causes the empty base package to be created so that RapidJSON can
> > be
> > 
> > sanely included in an SDK via IMAGE_INSTALL, RDEPENDS, and the
> > like.
> > 
> > 
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > 
> > ---
> > 
> >  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 +
> > 
> >  1 file changed, 1 insertion(+)
> > 
> > 
> > 
> > diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > 
> > index 8ab35d224..76e01f824 100644
> > 
> > --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > 
> > +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > 
> > @@ -19,6 +19,7 @@ inherit cmake
> > 
> >  EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF
> > -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
> > 
> > 
> > 
> >  # RapidJSON is a header-only C++ library, so the main package will
> > be empty.
> > 
> > +ALLOW_EMPTY_${PN} = "1"
> > 
> > 
> > 
> >  FILES_${PN}-dev += "${libdir}/cmake"
> > 
> >  RDEPENDS_${PN}-dev = ""
> > 
> > -- 
> > 
> > 2.17.1
> > 
> > 
> > 
-- 
Joshua Watt <JPEWhacker@gmail.com>
From akuster808@gmail.com  Tue Oct 23 22:32:22 2018
Return-Path: <akuster808@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6025779AF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 22:32:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 32-v6so1340373pgu.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 15:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Y+NWbuJtFbCiXXwhcn0qdxfC3N8oM3y+j5gtftufbE0=;
	b=NG9hfZKUQyXSOLQl8MaA+7LdBjz1BAnnJLEtgCrzfycSignVMi5VV4d2g58bojSNYn
	gg59o7QDBIUSGl3sr7TMOlkmK/VhlHfM8UHnjtiAln5dwHP0fzCP4hpLO6+vHPlbSQAN
	/w7tR6Ll3kRweUycKfYzyLUW/BV95e68dGwYQhOeDqKZ3pqOEreBT91yjJCK79l1M3jP
	C6k0cHZn7oir5qw6Q4YfMKa0DAGdJ6NtGcTGcs6KZt0fwH/5Si6UpPa0LD2WNW+LoZfj
	OUWwsoc5FrKRK1t7FAqOYx2Fla4HWx9HMOZa2W4/ddKETTYsUAu/xLK6Ejp8kgZlmTd7
	osLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Y+NWbuJtFbCiXXwhcn0qdxfC3N8oM3y+j5gtftufbE0=;
	b=s7sbJsb0An9T3u13sryJWl1aUQJJA8DVTdyKSlcbVq0IoNSr+3hpJN8q9FCBBbYM7a
	efyBmp0b3vIj+k8bE3A2vsQP+IjCh/FYgYTnti7bEHh+typH/F5r8shQ4psf255NP1zA
	F9Fg5HBFM2rJf7SdGT6j4fM2FZBYrWaD/3v0+dyH/i6VZjZDNjAsfxqNRr9jYa4yopt0
	FsPQQ8i+LDMlDagrejSMA2a1zn40aMejaqeaMZp3DRf+VUJlOSxVI51ReFee9Ps+MrC8
	qaCsg1OBMilJX78jozKn+GiNdq/hgB2aUG6RfFrTIMzekLFb//lIuhXbbGgT5bZbI6B5
	6CEQ==
X-Gm-Message-State: AGRZ1gJ3nnq3OeOdr1SOZE8SfaG8VYeUDQ5fLmRgVoNGkxEfnXHFzZoL
	c97ix22oMQxkNap2Gw1SM/U=
X-Google-Smtp-Source: AJdET5eqNyJlIC5+x1cTJPRCpJiDbdVTfn1qCpuwgLEs5XA4iIVoVpWfRVq/bALuz/oloYbN26c2xw==
X-Received: by 2002:a63:fa4e:: with SMTP id g14-v6mr157013pgk.18.1540333943184;
	Tue, 23 Oct 2018 15:32:23 -0700 (PDT)
Received: from [10.15.240.186] ([109.144.222.79])
	by smtp.gmail.com with ESMTPSA id
	62-v6sm3078749pgc.58.2018.10.23.15.32.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Oct 2018 15:32:22 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20181023160438.19552-1-JPEWhacker@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fe28a311-767b-ca43-2308-489b1462e3b9@gmail.com>
Date: Tue, 23 Oct 2018 23:32:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181023160438.19552-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Veselin Georgiev <veselin.georgiev@garmin.com>
Subject: Re: [oe] [meta-oe][master][sumo][PATCH] rapidjson: Update to newer
 1.1.0 + git
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
X-List-Received-Date: Tue, 23 Oct 2018 22:32:22 -0000


On 10/23/18 5:04 PM, Joshua Watt wrote:
> Bring in a newer version of rapidjson which includes a fixes when
> running on ARM, specifically 748a652f04 ("Fix SIGBUS due to unaligned
> access")

Master can do what it want bug Stable has many concerns. What version
was the old hash?  How many changes between the two versions? Is this a
bug fix only update? Did you build it on all arches and with musl too?


- armin

>
> Also remove the existing patch file as the issue was resolved in the
> mainline by 4c9a28a28e ("CMake: do not pass -march=native or
> -mcpu=native when crosscompiling")
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Veselin Georgiev <veselin.georgiev@garmin.com>
> ---
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index 76e01f824..ec3df8263 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -4,11 +4,9 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
>  
> -SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
> -           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
> -"
> +SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
>  
> -SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
> +SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
>  
>  PV = "1.1.0+git${SRCPV}"
>  

