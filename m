Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id C705171D86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 20:22:40 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id p9so5090395vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 12:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7eq55WSVVuVrjh9mhFFPTh9119HXn9EXzsOO0lWt/V8=;
	b=I2AfSHUmrQKClpzExx/JFIYKbsN7EqmQk3XjLZx6hAQgD3DnnKXBejqBsvLsJ+/kKo
	ZJigrMd42xK6RztCWNA4KHruVqdmSnFZ0ZDF+S4w5fl+52XLFuFsDRZXafb9D5HPLtjI
	U/mBwazmmbVzbz6EFm9U/ymAbSdYAjiISP6Hns/Wm+OubWBTMAg60UlB+7+R6yncJJLW
	AoWuqos1oJ0c4Tko2+py4p3vOClyXRUFvt9+YleLFaXBo7d8ctDP9JvIWwK+WAxORzhm
	9P0BdRee7t0+JsZ/4kFCXVrH6cB00I3uIy4PtaBt2rMscyEwYv+Dmoo3eWKbVE0MX3DQ
	O2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7eq55WSVVuVrjh9mhFFPTh9119HXn9EXzsOO0lWt/V8=;
	b=udDPhcvd/+EbYC8jB+ruot9HHXeKrXJKncn4yQYqq9lUQyPdrvUFp80HKp+caBQCNy
	rwLqYTUKk6Ri/FvhraDV6H2ATKcUCW/b2+XoCetKhlFMw1QXnoVjvq4iPhyrpPtvwyLb
	n0Fu2Ja+9p4ss5tK2cyVetrDf9yITs7jSpZ4O4cbSszuh2y0KumzLqm9eb01oNpZPMet
	gTat3IljAjgTcWYAEDxD7PSeUgA6hm7Q+MFbnIGIoGuPHAlnLO/n/dC1cGx7B3dNM5Uk
	JY+soSZhfm7+NJ+1FHR3eGSPQ5ay+PXTWm8GqHJvVAf8f4GXsiNByoQy7UORIW09vOwP
	N/0w==
X-Gm-Message-State: AKaTC03iy0+0VT3fc/CFibvrMSTF4hZEFzvTpMPuQ94XGhIqf+/Dr0y5Gjya+vTidqHRtcomuzQRYhBkgxvcLA==
X-Received: by 10.159.32.99 with SMTP id 90mr78002363uam.138.1481746962017;
	Wed, 14 Dec 2016 12:22:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 14 Dec 2016 12:22:11 -0800 (PST)
In-Reply-To: <44E60BE3F360494194A33E0B8411CB9A62BEDC@oscar.ostdom.com>
References: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
	<eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
	<44E60BE3F360494194A33E0B8411CB9A62AE16@oscar.ostdom.com>
	<2668593.4cPb1u5Jh3@peggleto-mobl.ger.corp.intel.com>
	<44E60BE3F360494194A33E0B8411CB9A62BEDC@oscar.ostdom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Dec 2016 12:22:11 -0800
Message-ID: <CAMKF1soi+D3OBPeJkBYAyGxAhGw6ua8qhCX_TttT1quh9ZGWnQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: bitbake dependency question
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
X-List-Received-Date: Wed, 14 Dec 2016 20:22:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 13, 2016 at 3:39 PM, Robert Cagle
<rcagle@omnitron-systems.com> wrote:
> Hi Paul,
> Thanks for the response.
>
>> Another way to handle this kind of situation with plugins is to simply build
>> them all with all dependencies, and have the runtime design such that it's
>> fully flexible as to which plugins are installed - then you just make the
>> choice in the image. (Perhaps what you're building is already that way and
>> you're just trying to save on build time?)
>
> Unfortunately in this particular case it is more of a "compile-time plugin". RecipeD
> generates and compiles a C file based on artifacts left in /usr/share by its
> dependencies (Recipes A, B, and/or C), so runtime configuration isn't an option.
> In this case including unused plugins would cause incorrect results.

you can insert the DEPENDS from distribution layer via a bbappend into recipe
of packageD and ensure that plugin packages install the needed spec files during
do_install so they get staged into staging sysroot before packageD
starts to configure
itself. you might even use PACKAGECONFIG to control it.

>
> It appears this form of dependency isn't supported in OE, so I'll either use a
> variable defined in local.conf or more likely restructure the app so the plugins
> and their host are all built within a single recipe/build.
>
> Thanks for the info though, it is all very interesting.
>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
> -Bob
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

