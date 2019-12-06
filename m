Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A95C67F962
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 11:19:54 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id 2so4094380ion.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 03:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6jwDCFEmhVSI50tVesYWnaCynjnoNgxw37QUUZg1+Yc=;
	b=sSt4r91IMBTvFd2wmOY5z7XMAVeePYF88aoqVQbyN/g1TlChDHAs9eIlZO0mvtxaMy
	X+p6lZpOlW1L8SRyagYsXv4ZQjF8J7uDuNNhoDCQOtUP+DOsAo6X6DSphWblQuqXAh9T
	iv/aDNtvNp37tp9fjZkSC4CEIJE4Qq1ZDA3VK8v/VZqfBfwOacfYG5It5FtA/7nDhVDB
	Orj/pPgFkAlvIe0o6F2YL38PZ34kU/8o7K7vHq+WgHhdPFegGWhITDiCGLIeYz12sHLS
	3RGu2Xj+5iiOLBqzJIe6a08XX5lFIN+oq54gKOxtx1LqA7fQB8noMw/uYGzIGeVlAz5N
	8XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6jwDCFEmhVSI50tVesYWnaCynjnoNgxw37QUUZg1+Yc=;
	b=qqFRKsHOLRMKEMlvxExhrCxzFcGY2kT1dj0zfwPJiIUYOWfQhqx8FaaZfl5ZufdDX9
	+TXsxo4ERdv8YTRRPjzcOgJ0bkVfOSZGTVjLAvcB7yXfoXv2u2i8z0EJ08OPkFktAAhz
	/bJl+aBW+n/mx9mMkxkJ1p84wJjAR80gvjK3cYffNISj82SdufztdhGqrUSdhdxtwUf2
	ZtyDj8A0mndX24AcGkbX8MYu3riPDN7Yy7X9ASf+DHX6qLfLVIp1iAf2hU175RfYeuSN
	Nk1GpvcYXKfT+ckhGRD17kz0aqxNlA0VKNBEg2LApYQGgChH4Ns+ApjIq4e2HCQhRtYb
	Le/g==
X-Gm-Message-State: APjAAAUrqT0aCiwyBCsnWs4U/J7AySJss3hr63pb9WQeGYaolywL8RLl
	bKA8k4pwixuZFO0OKyU+nEBLPWzGVMMZSpd4/lo=
X-Google-Smtp-Source: APXvYqw52XTntHHMvtV4Wpj1zgvm3PSQcX6O7IfD4bDtkTz3gpWbMEylKy0F+yQqmK1QI8V7zyUjFJhKNRLndIu9Z84=
X-Received: by 2002:a05:6602:2806:: with SMTP id
	d6mr10133417ioe.299.1575631195730; 
	Fri, 06 Dec 2019 03:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
	<CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
	<20191206102605.GA18604@localhost>
In-Reply-To: <20191206102605.GA18604@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 12:19:44 +0100
Message-ID: <CALbNGRRh14Hx371rh_p5XcG8dr-77n6UCy-+dZcCz-QfF_H7mQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Fri, 06 Dec 2019 11:19:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 6, 2019 at 11:26 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Dec 05, 2019 at 11:12:11PM -0800, Khem Raj wrote:
> > Seeing below parsing errors
> >
> > 20:27:29 ERROR: Nothing PROVIDES 'gdm' (but
> > /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
> > DEPENDS on or otherwise requires it)
> > 20:27:29 gdm was skipped: missing required distro feature 'systemd'
> > (not in DISTRO_FEATURES)
> >...
>
> Making GNOME work without systemd would be a lot of extra work,
> builds should be with systemd.
>
Right and it is the same as ever: It works for me is not enough...

Hope to send out V2 during this night.

Andreas

