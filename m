Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 79D0777533
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 20:43:33 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id u48so61086077wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 12:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2uL+BrCXZrlr6shy2w380FyHIjQ64douhBkswcwKu3I=;
	b=IgZgxvSp9Nt+8XasWMb6smgXsq0dgxZr+xNEs9Ob4ShHQA85iRtrQO9l/wCxPeKzze
	UvIYV3wfjAPf73bzjcbwt11AEQGLHDFSR0tyV2vvK7e5j78jUqoOybPtEQl4U5clPoEB
	gakTINzHt8EdX3JY3xw92ngsQ7+xbzdH9npeG35zfFfWUN1maWQFFl0Z610GVugOoU+d
	3wMe4slKoGQccdZjtOcvsDElYti871plYLhn9kzTtWbSikGJ2lU0pdaJzeZqCwmG/YQ4
	A5jvZ8POkSGxNJaYOSDUT8INPKPcrWotMQvwrBKOtPmhNWzj+niAc1QfECIS+KggKVrj
	zxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2uL+BrCXZrlr6shy2w380FyHIjQ64douhBkswcwKu3I=;
	b=JIf0aNxpvqVayZGEzUBFzVJ1J0HiaAzDUddTWUuJQORbbnUZjnmL8ulaxC3Q9XoceP
	p2XGxrfrUc6JaC9Mn/3O1Qhgc04Ro8fB0y8Onp0fBT3wD+BxJSS/6BNdYEYn199IMTvb
	hbh8JpyOCj/JWCEq87DmTy2J7uafJdd3mrig4giIzxORxgA9ffMs5msV8UWVxjB5KIiD
	nImRSqqljGyEPLZszgaainLNK73n7gBNR8kiJ69pod5Ft3e6gxFUwn8PuLT/inRn996y
	+vaDN4fdn0LC/qiS1gEBV7iD/JNMLRCR9dWaQ4/01ag53uLD40PRMIVC2mxVlpxNDAHM
	HKsw==
X-Gm-Message-State: AMke39l87drMmi0A9nmda21qMuuN6Ev06c8rIUb9CckWEQnno6CUmbb9UNv316g7ZDH1xcNYlmY8608apw90Ww==
X-Received: by 10.223.136.66 with SMTP id e2mr14489111wre.14.1488487414059;
	Thu, 02 Mar 2017 12:43:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 2 Mar 2017 12:43:33 -0800 (PST)
In-Reply-To: <1488415667-57394-1-git-send-email-tom@harbortronics.com>
References: <1488415667-57394-1-git-send-email-tom@harbortronics.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Mar 2017 21:43:33 +0100
Message-ID: <CA+chaQcRFVzE_WEpC6SMvEoEr1DSztM_whCUB5-2qZYJU9jJXg@mail.gmail.com>
To: Tom Hayward <tom@harbortronics.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fuse-exfat: fix mount detection of mount.exfat
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
X-List-Received-Date: Thu, 02 Mar 2017 20:43:34 -0000
Content-Type: text/plain; charset=UTF-8

Can we pass correct installation path in configure instead of changing the
variable itself?

Also missing your SOB line.

On Thu, Mar 2, 2017 at 1:47 AM, Tom Hayward <tom@harbortronics.com> wrote:

> When package was switched to autotools, "DESTDIR=${D}/${base_sbindir}" was
> removed from the recipe. This left the installation target as sbindir
> (/usr/sbin/). This breaks `mount -t exfat /dev/sda1 /media/sda1`, because
> mount only searches for mount.exfat in /sbin/, /sbin/fs.d/, and /sbin/fs/.
>
> With sbindir = "${base_sbindir}", mount.exfat is installed at
> /sbin/mount.exfat
> where mount can find it.
> ---
>  meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb |
> 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-
> exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-
> exfat_1.2.3.bb
> index 639e33c..0db1252 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> @@ -18,3 +18,4 @@ SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
>  SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a
> 5a324fdd1e20f9c8acd357dd463c2355d9"
>
>  S = "${WORKDIR}/${PN}-${PV}"
> +sbindir = "${base_sbindir}"
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

