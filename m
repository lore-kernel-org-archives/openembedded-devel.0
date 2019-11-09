Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id 290177F33B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Nov 2019 21:03:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r16so8940938edq.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Nov 2019 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DTj8e7NB1wFZXVbMA1OBxMIxDDVsKWNC8pYBwU9Ia3E=;
	b=KQ0L/UO3UeJ34qej9L/mhSCVkS1hkyb6YWE3xG+XDl767Wlu8eSKQxi2x1FyQqB+Gl
	nNUB0myhnJHH1+PW6DNcTucK7fViPBhBqOWHP36u7C1mTJ39lTl6EHXDl6nBZ9vmXOLh
	LzCwcXS3x2VbTaxe8I6aGdO6mDhgBNla0d1F3iuGuLvva3kegA+2WJso9SdTKSyqjv1m
	G1AwxveZ+5eBZ9yQHole3acZOCpTnYYRKNPu1qGP+X9+tg6W6rfVlxUbtzt9B8g2bGhi
	JmqfMA7i1RO2r8XKeydzlqoFVvvGL+2G15jLzrT5AQMqkCXL2KrzfID7ipdkpYfSQ6Wx
	gzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DTj8e7NB1wFZXVbMA1OBxMIxDDVsKWNC8pYBwU9Ia3E=;
	b=p9e1LTCOR30CCOKvTv5zd4fG39Pi0BgVlA40e2CHs3UT67J+zOp12emCdM6lzKFKQm
	I1uXWzUZWF7iLIqO0DZyyN29Y/8/cuYllYrlUqE9OGeE2EqfX6MdbA7tq7MBBG3SfSym
	kgFDyxFwV4dSqkjgen0hwcdX3ggOklJPm6uOpJXikDSxuulPenLnQ4qhaXWLN8aGjCtt
	Z7hhFG6rDgk9Jz0oelveOcAi4MyoTSWdzluSod8F8W/3OWHYWPEhB14trGm480bpMjYC
	Etx+8bqF7CEJ0zUmYeABQjZoqtDXlA37ryQDL3iMypkm340T10+hGSgRwJim6kbNOglM
	RPRA==
X-Gm-Message-State: APjAAAXLHEaKP5VUeJLBmJoi0pgaAL2nTUcbtmny9GgGS+ga88uZkKZg
	v7zfuBL3vGxpUKfyVv7cCyG66FHXct2UNT0zgr5ZUUeL
X-Google-Smtp-Source: APXvYqwAktBYwJ4EA6TociekV+Qidv+zg4Wc087HqTcwBsUDeqtViYNOHwGGbYEhcbQ4A5Iit/KGw4FdUXSD3fX1uHU=
X-Received: by 2002:a17:906:3ca:: with SMTP id
	c10mr15141931eja.140.1573333421600; 
	Sat, 09 Nov 2019 13:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20191109195436.78248-1-raj.khem@gmail.com>
In-Reply-To: <20191109195436.78248-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 9 Nov 2019 22:03:30 +0100
Message-ID: <CA+chaQec06vqFFH0buJY6bTNzLK_jPD8-KV5xJxfpPZux_AHMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sip: Upgrade to 4.19.19
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
X-List-Received-Date: Sat, 09 Nov 2019 21:03:41 -0000
Content-Type: text/plain; charset="UTF-8"

Any idea why it built ok for me when testing 5.13 with glibc?

In the e-mail you mentioned failures with musl, is this upgrade needed only
together with musl? You also mentioned it's new failure and 5.13 is in
meta-qt5 for quite some time, the recent upgrade was just from 5.13.0 to
5.13.2, maybe it got caused by
https://github.com/meta-qt5/meta-qt5/pull/243 instead?
Still this PR builds fine here with 5.13.2, glibc, qemux86-64.

If that is the case, then we might need this upgrade in zeus branch as well
(5.13 is in meta-qt5/zeus)

Cheers,

On Sat, Nov 9, 2019 at 8:55 PM Khem Raj <raj.khem@gmail.com> wrote:

> Needed for QT 5.13 based python modules
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/sip/sip.inc                        | 6 +++---
>  .../sip/{sip3_4.19.16.bb => sip3_4.19.19.bb}                | 0
>  .../recipes-devtools/sip/{sip_4.19.16.bb => sip_4.19.19.bb} | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/sip/{sip3_4.19.16.bb => sip3_4.19.19.bb}
> (100%)
>  rename meta-oe/recipes-devtools/sip/{sip_4.19.16.bb => sip_4.19.19.bb}
> (100%)
>
> diff --git a/meta-oe/recipes-devtools/sip/sip.inc
> b/meta-oe/recipes-devtools/sip/sip.inc
> index 092531b322..d8e32a7687 100644
> --- a/meta-oe/recipes-devtools/sip/sip.inc
> +++ b/meta-oe/recipes-devtools/sip/sip.inc
> @@ -5,9 +5,9 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM =
> "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
>
>  SRC_URI = "
> https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz
> \
> -          "
> -SRC_URI[md5sum] = "7e854b0da395ddc8fb5da82d0321994d"
>
> -SRC_URI[sha256sum] =
> "184c790d58e9527fc6bdac2bbf8638f3d1b41dea922cad8eb83172b4ba70c620"
> +"
> +SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
> +SRC_URI[sha256sum] =
> "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
>
>  S = "${WORKDIR}/sip-${PV}"
>
> diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
> b/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
> rename to meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
> diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.16.bb
> b/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/sip/sip_4.19.16.bb
> rename to meta-oe/recipes-devtools/sip/sip_4.19.19.bb
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

