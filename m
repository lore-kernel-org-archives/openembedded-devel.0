Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD2B62135
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:34:26 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id g8so51635013igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vSvGNfKijC5GmNHzuTfZLiD1B+gUbSbZB2ckn+sxbQw=;
	b=FG2XdM/ZQM8Q7LwMHZO2Z81ApoNZYZk0ZQc8l8rtOrnGyx3+ABobC0cGs+JYx+yH4N
	mS4BGveehGu6P84OhKgjPUltXwTMDfNFO0XBPdAuXChPxFdOTbwHHuW8i4BHjiFy7d5N
	TYG7QQJr7WmUKJp3TtFQO7YkGokedwc+0baxhpLXH3SyuhMHnrUww96Fxt60zMXfOe3c
	H91QOtpi6C2/YACKO2Pvkca3bwXSTHXpkOfIwGgZit1VfU56Tffa7rf0yHwyg3VYVqd4
	k7zMn3lYPyn+1R2h+/65jyFDkSWHlg4tUjG9jZ6OqYfUGQtEkCGFncX6Z3PFy9MWaxaR
	XUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vSvGNfKijC5GmNHzuTfZLiD1B+gUbSbZB2ckn+sxbQw=;
	b=mnJ/dZ6YsN+2QVcYlgpP6ur8/w2qpWLyf2SWRoT+muA0hihxhZctHc4AfmFdsbE4Di
	hGGIiJouFjYDFvmwiVfflgHM5JUbi89FTnAgb8ZjbY2iuSdIWHzFQJ/xIIs/160I2gvJ
	mPjvc8ESbzFOWErD5KzzETLoMIstilGU9S6N/oO2jEwjXrVFvyarITd8/4jacHKI1He6
	wLsTQc/Q4AbVsVw8NXbynM6UGYfn6CmRpOR9LGOZect6rbTOoUNXmyFdyD0yqBU8WM1W
	s+Z6Yy18OCG1pK/PP1Q/0WlSe+F+pwgssDSkt9zsTbKus7KNaD0oNwYZBolHt0lubpuD
	DLGw==
X-Gm-Message-State: AOPr4FV60RTy0bl9hymtcS9GoFgrmVPV8w6AKdQEGCIdlGmC29uTX5zqGtBQRCeMEZi9kdy1RODZMhHaVjtZ7HGF
X-Received: by 10.50.62.20 with SMTP id u20mr11979830igr.52.1461778466808;
	Wed, 27 Apr 2016 10:34:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 10:34:07 -0700 (PDT)
In-Reply-To: <CAPuovELikTayU6Q6xCSgR8tMHKjEyDE_zvCrcH_XUg68bJGr+Q@mail.gmail.com>
References: <1461697722-20378-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LYyrrO+5277fe2q3wZ8Z_JEsxU=0OqyXu5b7CK9hsh_GQ@mail.gmail.com>
	<CAPuovELikTayU6Q6xCSgR8tMHKjEyDE_zvCrcH_XUg68bJGr+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 18:34:07 +0100
Message-ID: <CAJTo0LYVVLJ1XqQKgVtf7FCw+GkzAdJX+MB6_wB6Ffo-w0u+pg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mozjs: fix configure host contamination
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
X-List-Received-Date: Wed, 27 Apr 2016 17:34:30 -0000
Content-Type: text/plain; charset=UTF-8

On 27 April 2016 at 16:15, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> > I'm not sure using pythonnative is the right fix here.  Executing python
> > using the host python should just work, so why does importing ntpath fail
> > using your host python?
>
> Correct. Host python should and does work but configure is executing
> sysroot python and using host libraries.
>

How is it finding and executing the sysroot python without inheriting
pythonnative?

Ross

