Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0679277174
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 09:14:55 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id h134so17048596vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ze6zCuDKf5zIeqh5qACG23dQVYKjqrOYdm331uQeiaE=;
	b=X7m3tD7n5pjSTJtkhujRIoJfU7PAjMxGKktWADKC1wawq2iTutgPeW9vcC4B0sEJev
	fWXq99YDfs2hyipDt1Km3AIUHdOG2IRElwGPlNepa2GKtcXeCKEKbBVC0+7kMe/XfWBu
	WlqCbXNMT0ONTtx1FGCTYttRpHiI9tG91UvYFueYkeYbQRO0ioP3Xuum8lP1VkSEW2yN
	0JPTbkwMsksPw51trkrB++NEMv1Vk0Y6ts2X/blXDtjedvYhSiEztOtoodzKS6hpamUl
	SDblUfa5ZY/AdaKshOm/N86/WcjzapmrQ1mlXNDVRC3cx45S/9BdtaKt1+TqQKU6Gir1
	6r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ze6zCuDKf5zIeqh5qACG23dQVYKjqrOYdm331uQeiaE=;
	b=jeSZiaEapXJP2B6XpeBQDYn+viV3OhwDbXtQVRUHUMJUsDoCZmUItt8agxOeMoDkjJ
	igSO8RzGpVTpo5dxdHxp+cUNSY72H0pWP0mtbXOLv9DFegdGZth3G+CcIGgULtjU9cha
	N49rgM1kvk+Nr+5bTaiSO24ufgzsA4w2zODWBmBcOPlmGQNqUoUzIQOzUn2WRPlWfSjd
	yJomnTAgVEWTxn7RM/zKowdkxI1/0l81T/SwYGMqUkTPjQ886s36P4iyn2FVNY70ZnjG
	Rv0rDPkZdhhzPAzzwbneiSD7x8+VBXBLmMPaNI6lfQeEWvPgYd9r4ZBQPCGMxECf3z9o
	bjgQ==
X-Gm-Message-State: AE9vXwNn+6MXnb9a95yB4SZN+eB6oSJ6TZc2ybsSnvXoB19kKm9wSAgcQAC/lPZ/jclGBCAVrA+0o6CUz/ncKA==
X-Received: by 10.31.58.130 with SMTP id h124mr2305016vka.141.1473930895831;
	Thu, 15 Sep 2016 02:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.1.227 with HTTP; Thu, 15 Sep 2016 02:14:54 -0700 (PDT)
In-Reply-To: <CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 11:14:54 +0200
Message-ID: <CALbNGRQTdt7fGPHOtpDooRLSgmi1d3CzK4sYAwRZ2K52uAtVsA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Thu, 15 Sep 2016 09:14:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 15, 2016 at 10:03 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>
> is reported in every report (where samba was successfully built)
> http://www.openembedded.org/wiki/Bitbake_World_Status for more than a year
> - pam isn't in typical 'crowded' sysroot unless you have pam in
> DISTRO_FEATURES and it might be always detected when you have pam in
> DISTRO_FEATURES.
>
> There is also at least one report where it failed with ld.gold also for
> qemux86, e.g.:
> http://errors.yoctoproject.org/Errors/Details/75447/
>
> I'll of course include these changes in next jenkins build to report which
> failures it will re-introduce.
>
I cannot check this now - tested at home - but as far as I can
remember I have pam in DISTRO_FEATURES.

Whatever:

* I will check for pam and send a follow up if necessary
* autobuilder will tell us if other archs need bfd too - if so I will take care

Andreas

