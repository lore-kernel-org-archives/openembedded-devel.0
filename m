Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7B2601D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 19:48:39 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id j127so36181414vkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4H8HVA3MjFeSgF2tQhWA+fW+fFSdkepotzoC6nakIz8=;
	b=C0u5YeQzkDszZc8WP9w4PguZ7QYlJI6loyNVG2NcMJI4fXsFhjWYtfYquOS2cCeS4R
	3GCyDnx+gtDW/AOyC2Y+F9ubL8LjffhSi50ZULTRvoVkhkyN6dQyUDG/H3SU02xdR35n
	dkfz4NJuV1G+TmO9a8oGzM2Y6uARj6+lmvgWnXcmmhGSkiwWg8Up+FG4QBS1IfTpaRvi
	8keG5ZHkKeY+gr32UzJlplTrp3F35TJofpL1aUTOzepreQVB2wuEyT4n3uzOmTtdaAZT
	YfN0rSG33S7V8Usdy1QYC/8LiDTZTl75FQwdGdw4Oq7za3ODkrLKVLm9Wcq2V6aw7yMq
	SUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4H8HVA3MjFeSgF2tQhWA+fW+fFSdkepotzoC6nakIz8=;
	b=R8BmkV20i67zn/BLVEF1I3WtCyfV5nTOulTEVJXV7imdDdDpSQiFaxsWPCoj3fxuYV
	eIiuP60HXFSBjtECaqoaNl1KcBJ9wXELd/XL9mMx+PMK7Uc6JhKfBeuYDTPH0dN/Twgs
	DHtPrY0XPczTg3eTP9w98kUCzKVze3KkNckyM8iNcuII21RpXxh29u7AswGsrrsL2IxH
	+en45zg8ZXhJKGnPnbXTyTsbFeLn1X814QrdoDtkfIXxb5mSgk4nIx1ZiCzFM/R2ggDG
	IEELvTT+/mtFMYj4FBgolJglPYHwXSv5vxNy6u/+JqzOtsmY79Lu70369CXame7E9awO
	cbZg==
X-Gm-Message-State: AN3rC/4XXMIyGfkWx0RD2MXDglQR+yBc0GBqB4Z7nY6IlOBayKFsKqqC
	mIaxiVQ23RFFNkuxk70urF/hmdVezw==
X-Received: by 10.31.133.135 with SMTP id h129mr3766587vkd.55.1492199321028;
	Fri, 14 Apr 2017 12:48:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.53 with HTTP; Fri, 14 Apr 2017 12:48:40 -0700 (PDT)
In-Reply-To: <CA+chaQeO9+92rCxVyQzvtq3d5zGyQO2ohjm2+mZafqt_t4b6ig@mail.gmail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
	<20170412195638.3243-8-schnitzeltony@googlemail.com>
	<CA+chaQeO9+92rCxVyQzvtq3d5zGyQO2ohjm2+mZafqt_t4b6ig@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 14 Apr 2017 21:48:40 +0200
Message-ID: <CALbNGRTuGRUmT2HPP4C2vS0LTf-YPtQ99iaEaMu19h=TWN0=FQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/29] xfce4-taskmanager: update 1.1.0 -> 1.2.0
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
X-List-Received-Date: Fri, 14 Apr 2017 19:48:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 14, 2017 at 9:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Fails to fetch here, might be only temporary (lets see tomorrow):
> http://errors.yoctoproject.org/Errors/Details/140439/
>
Checked: Did

bitbake -ccleanall xfce4-taskmanager
bitbake xfce4-taskmanager

and it worked fine. Let's hope it works for you tomorrow...

Andreas

