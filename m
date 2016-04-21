Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 85ECD65CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:52:23 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id zm5so29456476pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=J/xgIhP0L8CzxY3jD0bjR4aq/otByUfOelMm6wEY8Zk=;
	b=Bb1IrwHaqeqI999Ql/56VrCvABiyJNap8fKgEd04OwRe5arHz/tKD1wm6yzFQkd5aS
	YfklOzyeYMj8WkDzPc/D9VlyHOHRFoJ9KgW8bW1joXgSvHyy6EprL+bXRprORE1V3hxr
	Rvd5AB1+cBltDdkEeL+8eP6SsM8WfWkgmW1yNg/r2mnNd95U3AKeT1a2kWTL8ENuZdCc
	24pZdKapR5m9Ws4MIvtzCqgzC5Eqhwm5d5mIITl/svrLtX3IcT/Ll9cV065ivGEzUUvH
	/IYdIDlvyQq+Z6hlFEquL36g89JOgCDTOQsyxHrMCOqYqW86B1meSjosXCf6yetwWJ1c
	hjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=J/xgIhP0L8CzxY3jD0bjR4aq/otByUfOelMm6wEY8Zk=;
	b=Ml7JZOonjOup5TGpJbWabsm08QKlbstyY1D8bjyy7ehAvt6dl5YYACAu/XsU56g03u
	RzUtHO6iGsQ5z0XS5PFw1+o+YmX+wa+8upk3Vz80RcZ5GmNOqyxf0TivOCkoRvWEUs+z
	FYCNAVxi134mpbdyr37ty+GMc99lK8O5Tb3jyHmmX1os32vnSTW5C4iKiHYx3OJkzYaF
	CYbVnK0rkOlYoSemTv/+YVNw9ShqAbNuOid4trsmtV5S2cm8nqI2S/Wt0srCCnhkBBhF
	1I30aTJmUpVQ0rl8YdXsWEKDaLFosiiNEj6uSnN79zZZ5tvJy4RWct/wnnF2XuKCESDc
	mhTw==
X-Gm-Message-State: AOPr4FX4OTgCUqjtyaRVyIyxL3X52KPL2GQ8yKO+StMflky+TB9+8GGMlh+si5FT8s3TIA==
X-Received: by 10.66.33.1 with SMTP id n1mr20637154pai.65.1461246743881;
	Thu, 21 Apr 2016 06:52:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:b034:173b:f428:82a4?
	([2601:202:4000:1239:b034:173b:f428:82a4])
	by smtp.googlemail.com with ESMTPSA id
	ba9sm2480954pab.24.2016.04.21.06.52.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2016 06:52:22 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1461208189-2377-1-git-send-email-krzysztof.m.sywula@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5718DB14.7060405@gmail.com>
Date: Thu, 21 Apr 2016 06:52:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1461208189-2377-1-git-send-email-krzysztof.m.sywula@intel.com>
Cc: koen@dominion.thruhere.net
Subject: Re: [meta-oe][PATCH] udisks2: add acl to DEPENDS
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
X-List-Received-Date: Thu, 21 Apr 2016 13:52:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 04/20/2016 08:09 PM, Krzysztof Sywula wrote:
> fixes:
> | configure: error: *** ACL headers not found.

a version of this is in master-next

http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=dff23fc84bb116e3b31aca0c8a7731507fb6ba37

- armin

> ---
>  meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
> index d273948..1e00f71 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
> @@ -2,7 +2,7 @@ SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
>  LICENSE = "GPLv2+ & LGPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
>  
> -DEPENDS = "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
> +DEPENDS = "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native acl"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>  
>  RDEPENDS_${PN} = "acl"
> 

