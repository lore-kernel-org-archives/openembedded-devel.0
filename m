Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF0471A98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:22:11 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x186so8710300vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 04:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eYdxu1JRRkZJJ6fjpBakhLUtc7fII0fg9yLXRP58fMw=;
	b=DB+vhC1aXGS6W8AjlXSj3vqEUT0Ot7adSk8ffJ8PQLJ3kcUAZpLO9EV1+2sibCiqiO
	RiRR4EKl0ivouZ+NPdDgu+04qzuj2bo82lbByR1T3349UKJ4v6kYaL8YH6uDCL+GON5W
	su8/nmdBVjBpOSS14EGFJrMegTUI26ODpKClsIKDXGt2bcgHP/p1zEdEWiU5sSVPUM9m
	3cr3O7UUNYWcvSFY8PJIAzqlZ99ryvd93oYNw4+fBj8RKb3u492bjKjZfxWRXTe3ItES
	jRW1tXtHRqXf0ZYpYhN/sy1lEUK52W2wE6e/tA+fs6rRCssKCzggDKFBc4yz1PhOBcld
	PH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eYdxu1JRRkZJJ6fjpBakhLUtc7fII0fg9yLXRP58fMw=;
	b=Ok3K/6Gyk9lqDPyroBLIwqdzFpVfbrQzbvUQd4VcAWt5iHlb5CZSs1ppwEbh75nnXl
	xzxH0YsXcb+ZvVRSeiPEhrZKUnAQoEIqmHSmjO/QUKDHM6QEH/2XDSfBKPre2yimdlWm
	Nbrrjg27XTgHslo8yy5bkVYArR4LmgS4SI7KZ7zm5vGjdAztptQWtj43J569ePVIIKyr
	zF5OsFtpsRtn2CnIYwpy7zH8xT+IC/0qviYcVa0XSS3PMp9Ts/6JP3sSU2VjdOf+m6BU
	xCWYGZE9LXIoyv8tzKNOlbGpkDcWRqqR8BzsTOt2Ad31isrcMRy38bFhBn0fMMo4VW9B
	h1qg==
X-Gm-Message-State: AKaTC01UVN17r0fROBngWTKoMLZeALfO6isdR3Ltv3KIEVDExKFFi1k9ecCxX201VjlIHBaBsfAgqQl+6cx5gQ==
X-Received: by 10.31.50.214 with SMTP id y205mr11884084vky.29.1480508532496;
	Wed, 30 Nov 2016 04:22:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Wed, 30 Nov 2016 04:22:12 -0800 (PST)
In-Reply-To: <1480507445-20746-17-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
	<1480507445-20746-17-git-send-email-obi@opendreambox.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 30 Nov 2016 13:22:12 +0100
Message-ID: <CALbNGRQbW8hGvkCm5XZFKsNenpFcgtfAfHwbNTwcz9A1SG7_HA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 17/17] Revert "samba: blacklist, fails to build with new binutils-2.27"
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
X-List-Received-Date: Wed, 30 Nov 2016 12:22:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2016 at 1:04 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> This reverts commit 80b2d4de0ee2a5e6a3302a527e3fcfd2b99c3e37.
>
> Disable cluster support, which causes the error.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index 8c5f6d8..564b61e 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -81,7 +81,7 @@ EXTRA_OECONF += "--enable-fhs \
>                   --with-system-mitkrb5 \
>                   --without-ad-dc \
>                   ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
> -                 --with-cluster-support \
> +                 --without-cluster-support \
>                   --with-profiling-data \
>                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
>                   --with-pam --with-pammodulesdir=${base_libdir}/security \
> --
> 2.7.4
>
Commit message confuses at least me - samba isn't blacklisted currently

Andreas

