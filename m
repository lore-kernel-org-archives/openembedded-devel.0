Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id D26716C12D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jan 2019 10:06:26 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id y20so7631953qtm.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2019 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XxASwV6nuiJUkU0FOV6YbRFeYXJ0lhzPj1QBd7+QoGg=;
	b=iFkp4flr71tRgOlbbl9uU4fCgbCDjfGTgrM6XhpHPLcyQS7KNII3qMbZ9xIoKOi0iY
	V5tPSIceyQuAXFVRsxi/bLkhwBh0JUZSCnO32n6LXRkzDqeVUseedezrEdY6xVhkT1eF
	SV+3TFspmHllC0kjTQZ74ZeMCOe8jPKn4b86ccUugpeM/5FH7oae8KNLGNhCnm7iPDtv
	6e2YQpimIr09t79L8B+n6RnCQIJmRmymwzGSl6jRbOK9JvmqJBjODx54RCA5esQnARHF
	ZwobGtFQO87dlWH500RseaBeOlJHQvwtmoznSZSn8x23eBdRGO2uDzFQpDT7fHrnd7AO
	M6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XxASwV6nuiJUkU0FOV6YbRFeYXJ0lhzPj1QBd7+QoGg=;
	b=Xu0Kv79Ges/xnS/tExxiqqxhETyNMHrmrNL3Xtb8Mf1meQcqGATZFsrskZ9cY7YiZO
	QL3fyKN+2W6w6rAKPbumjAtCJ60hmpquuBrVZQi8j5eh9qv9Jczlu/QhNixNNBIPtkh7
	RF/3pdX2FupWku/DYuPKm8YvK6hhDoVjVP7fcwLbIyS6Ia77Ci6vN+0N9qVJObOuDEhD
	e0W9JKkaZXYXSzb1hKeJgpjd74hct/bRPVRporigcKkj4hL/DdMqCds2T6VKyJd39nxT
	un9NxcfQMBmP7EUoAXsI4J+EGkBb9jD8XsdxJXCctN7sv7osqONiG4aN8Vvu2KXtSFYh
	BAdw==
X-Gm-Message-State: AJcUukdrYA3dQHYUW8Fe7lHurBr1+mJza3tq1hZVHULONk++NTg92mMT
	ohv7hUwQW4+Z8xpIhE6Lev5Ak7qhR0G1M01oK6B/n/jr
X-Google-Smtp-Source: ALg8bN7dPZKVxS/t6cQkGqg/OQMeQ8xvQ72HjSqMnISsfZONqn4v083UBzPsLajr7V/c8g0sZU0+DGkLBr0bEUvlegg=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr4987432qtf.196.1547028387317; 
	Wed, 09 Jan 2019 02:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20190109061610.34471-1-yongxin.liu@windriver.com>
In-Reply-To: <20190109061610.34471-1-yongxin.liu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2019 02:06:01 -0800
Message-ID: <CAMKF1sqOE7M7boiRNyqjtNXJxECv5bZyD2SG9MXNOwet+8ZJdw@mail.gmail.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pmdk: fix install error
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
X-List-Received-Date: Wed, 09 Jan 2019 10:06:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 10:20 PM Yongxin Liu <yongxin.liu@windriver.com> wrote:
>
> .so files are not generated in usr/local/lib/ but in usr/local/lib64.
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> index 3da22a970..af2229f1c 100644
> --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> @@ -43,10 +43,10 @@ do_install() {
>         mv ${D}/usr/local/bin/daxio ${D}${bindir}/
>
>         install -d ${D}${libdir}
> -       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> +       mv ${D}/usr/local/lib64/*so* ${D}${libdir}/
>

I wonder if this should be using /usr/local/${base_libdir} here

>         install -d ${D}${libdir}/pkgconfig
> -       mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> +       mv ${D}/usr/local/lib64/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
>
>         install -d ${D}${includedir}
>         mv ${D}/usr/local/include/* ${D}${includedir}/
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

