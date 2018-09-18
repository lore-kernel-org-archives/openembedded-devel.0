Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id B22E279579
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:03:57 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 8-v6so1242695oip.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jo/WU4i0ITmSpJr3b1uWDgDboJMg4gQGFIUq/laxquA=;
	b=mv/XP/cQCcfL/RyeH0FcK+uyeYerlWXwXkNAxpBK4myVHoZisExWcS7kaCYW8T67Ds
	ecQsVfL6hf4eM1/J5GYAaKtUxJU057gh8a/xhcLyXvOWZhkJSbXYRoytaSdSvXv5imbn
	80gBW6N297vXXANCxXSafw6xCjAuKT8cDTCbQsOVO3WtuZMthrThBwa0YNP7V4Z2ev9d
	IrprxqVwaIestQuKrEgBt9v2k5CUjwYvLilwkfPubuaDmXWpQIDlsjNl2OdwUOJmuD62
	9v50JxdlAuZ3tPtPTDLU4k0Oh8nnScd59/WN2Q9u+PxiuHxz2ELbEf2AXdrJ9YYh5RMt
	IDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jo/WU4i0ITmSpJr3b1uWDgDboJMg4gQGFIUq/laxquA=;
	b=IDqm8u7Yldms8iR/cS5JuR46pBzgQfewxAJUjgK4XpXAHdhu/yKoFd9FyTSAR01lxX
	c0F41FWCiVrVikoAiz+fDeleGrlCKskrKhnTvs7nVl3wVeBAznB7Cq2sQ0lmJ4MAlD8o
	T9Upc8SZskbMgyon9jJ73hAB2I4vnWrFkvz0VfU0/SRDX9mvdWGiyBBtf/sky4kT7OSK
	K/v/p6AO/p/bLW8lhEYrdJ9/3UVWZb9yRuO4Dj/k+UagK3N1MTSyLKLJ27c9oUh1jfWK
	mPMrX07xJh7o2GkaGwLmI8rELxrJgQ+bZ+Ze0w1s/6kL2Nkf8ouUe2FchB9nt0Q+U5L7
	mXDw==
X-Gm-Message-State: APzg51DjCsZDK8HfdUtgXuG6S8SqirJQA75S7TK1VasY/c42ur4M2f4h
	fHfo2QUbtqZWnGr7UOhfPKb63U4Re0CPTbNIBHA=
X-Google-Smtp-Source: ANB0Vdada1NDg2KuQwNbBmCYaC6ygzuCoepFLuzhhNvGEYyDSH2dRu4POM4rAh5Gz+GsQxBaMToDKO8FAZ2dAIkBW+o=
X-Received: by 2002:aca:bdc4:: with SMTP id
	n187-v6mr1056160oif.3.1537265038578; 
	Tue, 18 Sep 2018 03:03:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 03:03:58
	-0700 (PDT)
In-Reply-To: <20180918091244.3569-2-max+openembedded@blarg.de>
References: <20180918091244.3569-1-max+openembedded@blarg.de>
	<20180918091244.3569-2-max+openembedded@blarg.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Sep 2018 12:03:58 +0200
Message-ID: <CANNYZj97zK8_gWpRftaEi3XdNZpoGK5V6nrnoJBQVEb54PaAtA@mail.gmail.com>
To: Max Kellermann <max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [oe-core] libsolv: make rpm optional
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
X-List-Received-Date: Tue, 18 Sep 2018 10:03:57 -0000
Content-Type: text/plain; charset="UTF-8"

These two patches should go to openembedded-core list.

Alex

2018-09-18 11:12 GMT+02:00 Max Kellermann <max+openembedded@blarg.de>:
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  meta/recipes-extended/libsolv/libsolv_0.6.35.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
> index 0956453022..12dfc5d3a2 100644
> --- a/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
> @@ -5,7 +5,7 @@ SECTION = "devel"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
>
> -DEPENDS = "expat zlib rpm"
> +DEPENDS = "expat zlib"
>
>  SRC_URI = "git://github.com/openSUSE/libsolv.git"
>  SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
> @@ -19,7 +19,10 @@ S = "${WORKDIR}/git"
>
>  inherit cmake
>
> -EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPLEX_DEPS=ON"
> +PACKAGECONFIG ??= "rpm"
> +PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
> +
> +EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
>
>  PACKAGES =+ "${PN}-tools ${PN}ext"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

