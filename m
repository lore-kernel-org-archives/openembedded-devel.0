Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id E5EEB60603
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 15:41:53 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m13-v6so4562616qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0rMt0pBMBPnvZvd08scu2YF0xYoDUNtKO+Wj0sGDNUI=;
	b=HsvOIDy3/sUFAvOuynKIczzcpm1+O6wjidW6zevhtbWMYzy/LJT1/x2XF2+VHV66jf
	cmQ983+UADm+ZFaN0tsryzH6k8iY9iinNYCdYZ9NOIAmDpd2GeVewKy2jbqni0V8IFWq
	b071ViHvYFDaqtANTBVGo7tsEOCwGkIvq6JbG6tzWIimqMXxtTphA4uazUZEALykWeAC
	i2ECJxMGS3L7qpHhw+MZrtIxY45TL6v+UD/SL6vkoa8Dc96c9lk2JBQo4MjCkJQ72503
	WPt8NzvncWPK7MIk0gmW/4qqHUbzMNqpcK3H8/zvXDjWkgcVXZE7TXonCNjSawr+KT0h
	aJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0rMt0pBMBPnvZvd08scu2YF0xYoDUNtKO+Wj0sGDNUI=;
	b=OeZYcFsS+X2i+QbKytVn+/hazLzfWnxJpclN/cvexDbJYZEYkF+pjyyY1E5M6Cbx82
	T/NNEswBVX9+KEtbbvmjqdWfbzjbNUso7eAsiFjtLv9M5TMW77rL51AZY6xX/6qiMglN
	cZz1pot2BDvAXYMDfgsifXgDlbd8JkN3kkMy6uf/cKcMo4oFUXLmcN8YrB5vABbS+34p
	oRmBvKJR1bvdHimtxc1V2DyJqbq9ZO9n+CIdHmPvWLKdKdb5wUpVmiNiT8Ta6E6hVG6f
	KkNaC6wbsHDsRmO2VQefJVUPb+YL7Jg01lfG9x8B4VNi1dzm5PEPLK7P4VOCSsh9Ql3a
	S1LA==
X-Gm-Message-State: AOUpUlGIxBPYR3sCEJQ1zrrLws6OPZZEZXKhHJ9ILYjjotVmKTtnLBoQ
	OVUi1IRqhkweR5HnTgZe/Z5zkXtyhkQnzkAWPuc=
X-Google-Smtp-Source: AAOMgpferHFTl1YX5TbecU0vOlEAVO/ntre1Yg8tSOOKnAYBpIBJEijk2KosP/hITfqKdTSDHxGzW1cyjE4OxIqobzY=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr17441006qtf.20.1532446914658; 
	Tue, 24 Jul 2018 08:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180724150101.12609-1-brgl@bgdev.pl>
In-Reply-To: <20180724150101.12609-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 08:41:28 -0700
Message-ID: <CAMKF1sra8-e7r14QcRtkfL0ysiurQKuwJV+WS3F8+8f7WR2FSA@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libgpiod: bump version to v1.1.1
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
X-List-Received-Date: Tue, 24 Jul 2018 15:41:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 8:01 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This is a bug-fix release that fixes a couple memory leaks and bugs in
> python bindings discovered in the v1.1 release.
>

the subject of message is misleading,  we have filters and the message
can get lost, I have staged this

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../libgpiod/{libgpiod_1.1.bb => libgpiod_1.1.1.bb}           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_1.1.bb => libgpiod_1.1.1.bb} (78%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
> similarity index 78%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
> index ab0bc980d..9d3d759fe 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
> @@ -2,8 +2,8 @@ require libgpiod.inc
>
>  DEPENDS += "autoconf-archive-native"
>
> -SRC_URI[md5sum] = "80237a047a9d653a14c5d71e5ce9d641"
> -SRC_URI[sha256sum] = "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1"
> +SRC_URI[md5sum] = "e5e946cb01a35e5046a1a7a108d6a96d"
> +SRC_URI[sha256sum] = "172fa1544ecb51f37533b3e67862298d50c0a5cc84975f3c0706dc15467f0dfd"
>
>  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

