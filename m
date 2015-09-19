Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 678FD76417
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 19:19:08 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so56098363igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zTL1SRzaDAl0TWcXy5Dq/1bK+JWQ9z4JIdikzUNdf8s=;
	b=mO6XjL6O9Ni344NCMS9zfcXXgjTsWOlUGO3hwhJJ77mzulcIx7hHFdbIPZ471lrzUc
	bO502y3RgIvqsir5H/tShNnNmmijIxruyZQF3r2gggBx14jCZYD0tEIPTAi1w+CqoW49
	XKLDMT6sbm/axADetLi5WaEMo4Ji2ZH4pv+ffNBdJOtDHIl1ohf/fCMAqGlk3md4kjpB
	Ua19BN72gC/zgnOjsu1TGMU/xzMvL+84tmtsEdLAdWgLF43LRM1+s6bFavmDEMaeu5El
	AmaLl+zbUdhvn5ZvomYrUNEwlPnulrr+J3OB+84/Tu46F1KQV9yJyHRJ8ok38jmcboK2
	GcIA==
MIME-Version: 1.0
X-Received: by 10.50.143.4 with SMTP id sa4mr4045817igb.52.1442690348346; Sat,
	19 Sep 2015 12:19:08 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Sat, 19 Sep 2015 12:19:08 -0700 (PDT)
In-Reply-To: <1442687436-29326-2-git-send-email-andrei.kholodnyi@gmail.com>
References: <1442687436-29326-1-git-send-email-andrei.kholodnyi@gmail.com>
	<1442687436-29326-2-git-send-email-andrei.kholodnyi@gmail.com>
Date: Sat, 19 Sep 2015 21:19:08 +0200
Message-ID: <CALbNGRQLGvYmdsxTGMPMeyQ8Edj-9Buvzz6cpr4gT9JS1DhgYA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] add --with-systemdsystemunitdir in configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Sep 2015 19:19:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 19, 2015 at 8:30 PM, Andrei Kholodnyi
<andrei.kholodnyi@gmail.com> wrote:
> Otherwise sed command for blk-availability.service may fail.
> It will look for the service file in a wrong location
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 2b2d8ed..8114d5f 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -27,6 +27,7 @@ EXTRA_OECONF = "--with-user= \
>                  --enable-lvmetad \
>                  --with-udev-prefix= \
>                  --with-usrlibdir=${libdir} \
> +                --with-systemdsystemunitdir=${systemd_unitdir}/system \
>  "
>
>  PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
> --
> 2.1.4
>
Please mention lvm2 in commit message.

Andreas

