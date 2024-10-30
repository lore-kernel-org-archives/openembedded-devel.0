Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B325AD3A67E
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 09:28:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.10745.1730280519977654747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 02:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AjBajPse;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so8022598a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730280518; x=1730885318; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rEBIAapU+moq2hzgvbTOswNqNnO+2FZg2bGIztgj5T8=;
        b=AjBajPset0jInpvRh0f00XoCUIS1NWN0zT4YSgw2eJ3PCKtsNxXIV1O7uIEpVmcKbj
         JafmotmgrluFEqBG2jQcBrtFEBuYSZAEAGBvu4q8eKa6CimEslSOX9CsS573OSY+dj/U
         t+tumqoPRJRsuRx3DdZ3m4tBe1E8XINJ/ZZyXxft2evhg8B7/t8F0QGp3/M9AEpY7AM1
         U03dyHDTJ987hMldTn5LL6Inu2q2Ll9zMLFXFVo1XK5DVxBeHD+rHk6cSnbiNeKjVQYM
         iDR9gUUiASE+8w1Oh1IS9CFZktp3zFq8S1qe1nBVFI7MZWkdbyTR7bQU6E4emeDeg4VT
         rzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730280518; x=1730885318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEBIAapU+moq2hzgvbTOswNqNnO+2FZg2bGIztgj5T8=;
        b=XVGBb5tO/I0GOntBqlGbL88efflopjKw8PUF0gB5aKwRV710AEEWIzujOpFDLrth4d
         WMWi2D2trZ6KI+q89RDDV7rR+9VkJpD3WddOf45Lo0+jdD01VKjSU6/uv/cVzTqT9m1g
         nkf8/FLNR7AvdO2Gw4hg+W6egkv0uV66YBoD7eiLB1a9QY8PNiDu2PGhfUOc8P5PZDXe
         XgkWHnED9dQZ8qk2VpVbhHN/C+k3fay6Rx/tTxUSpg6JG0MLEDqvuEGdMEHxNwyFx6c+
         KbGz0uex9LQMSU1P66VxLGS/khka5AJRcjHwpZEl9XWMcKOGYy06/4aP6uaDZaOjdKXR
         bpPg==
X-Forwarded-Encrypted: i=1; AJvYcCXjeyV3rOHWOTswJgf5GHZUu5g9qDmvolW0caQH2JA0DK+EGJI4h/KRq44agQfI9vWL6638b0ztuzgfQ2MDlkGBXN0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHHxwZBl9McVwUaDSV2GkFovCL0U5RQmXJ3qvIQp4kdImHXGsv
	mdilOGZ++uikyO9Ei0gI3gfvZRicAQmu0D2s+JcFWNobERB3Hep9
X-Google-Smtp-Source: AGHT+IH23WfMSLpBHeK6FXddABPoOk/cyzs9Rb48KEZcg0ynYYkBDmt0DLGhuTAgFNavbc05Hpzc5g==
X-Received: by 2002:a05:6402:42d6:b0:5c8:9e36:ccaf with SMTP id 4fb4d7f45d1cf-5cbbf944324mr11316755a12.33.1730280517825;
        Wed, 30 Oct 2024 02:28:37 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631af0bsm4596929a12.68.2024.10.30.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 02:28:37 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:28:35 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: brgl@bgdev.pl, openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod_2.2: depend on glib-2.0
Message-ID: <ZyH8Q0_19f17Q6m6@toolbox>
References: <20241028112450.2793248-1-max.oss.09@gmail.com>
 <CAMRc=MdUQ59LmOZAJd=E7qjFiT9UGq2vx4zsHgR3cx7-kNhd=g@mail.gmail.com>
 <CAMKF1srnqVmyuX+PTVAJUWXyN5QZJjc_6JqWy+SNHBpo+LC-tA@mail.gmail.com>
 <CAMKF1srFVBeLFv99OKbThkepdGv+pE4Op0gbX4HdtMeXW=ok=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1srFVBeLFv99OKbThkepdGv+pE4Op0gbX4HdtMeXW=ok=Q@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 09:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113341

Hello Bart

On Tue, Oct 29, 2024 at 06:33:12PM -0700, Khem Raj wrote:
> On Tue, Oct 29, 2024 at 6:31 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Bart,
> >
> > On Mon, Oct 28, 2024 at 12:21 PM Bartosz Golaszewski via
> > lists.openembedded.org <brgl=bgdev.pl@lists.openembedded.org> wrote:
> > >
> > > On Mon, Oct 28, 2024 at 12:26 PM Max Krummenacher via
> > > lists.openembedded.org <max.oss.09=gmail.com@lists.openembedded.org>
> > > wrote:
> > > >
> > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > >
> > > > In my setup a build fails with
> > > >
> > > > | checking for gobject-introspection... configure: error: gobject-introspection-1.0 is not installed
> > > > | NOTE: The following config.log files may provide further information.
> > > > | NOTE: /var/home/krm/build/oe-core_master/build/tmp/work/cortexa55-tdx-linux/libgpiod/2.2/build/config.log
> > > > | ERROR: configure failed
> > > >
> > > > From config.log this seems to be related to glib-2.0 not found:
> > > >
> > > > | configure:22484: $PKG_CONFIG --exists --print-errors "gobject-introspection-1.0"
> > > > | Package glib-2.0 was not found in the pkg-config search path.
> > > > | Perhaps you should add the directory containing `glib-2.0.pc'
> > > > | to the PKG_CONFIG_PATH environment variable
> > > > | Package 'glib-2.0', required by 'gobject-introspection-1.0', not found
> > > > | configure:22487: $? = 1
> > > > | configure:22491: error: gobject-introspection-1.0 is not installed
> > > >
> > > > Note that glib-2.0.pc is present in recipes-sysroot-native but not
> > > > in recipes-sysroot.
> > > >
> > > > Adding glib-2.0 to depends allows successful build of libgpiod 2.
> > > >
> > > > Fixes: 117d09ce43c7 ("libgpiod: update to v2.2")
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > ---
> > > >  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > I'm unsure if that is the correct fix.
> > > > I would have expected that if gobject-introspection-1.0.pc depends
> > > > on glib-2.0 to be present, then the inherit of gobject-introspection
> > > > would have done the needful.
> > > > However I'm not really familiar with gobject-introspection in the
> > > > first place.
> > > >
> > > > Max
> > > >
> > > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > > > index b55da72f7b7f..3d9758e27af7 100644
> > > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
> > > >      file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
> > > >  "
> > > >
> > > > +DEPENDS += "glib-2.0"
> > > > +
> > >
> > > Pulling in the entire GLib for everything in this recipe is definitely
> > > a wrong answer. I'm travelling and have limited time right now but I
> > > will take a look on Thursday or Friday. I did test disabling
> > > introspection though so I'm surprised to see this.

Thanks for looking for a 'proper' solution.
I digged a bit further.

I noticed that `--enable-introspection` is part of EXTRA_OECONF set by
the gobject-introspection.bbclass (conditions apply).
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/gobject-introspection.bbclass#n27
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/gobject-introspection-data.bbclass#n12

Instead of depending on glib-2.0 unconditionally, disabling
introspection in configure also makes the build pass.
Assuming that introspection is only used for the glib packageconfig
changing to disabling introspection when not needed might be a solution.

-PACKAGECONFIG[glib] = "--enable-bindings-glib,--disable-bindings-glib,glib-2.0 glib-2.0-native"
+PACKAGECONFIG[glib] = "--enable-bindings-glib,--disable-bindings-glib --disable-introspection,glib-2.0 glib-2.0-native"

Max

> > >
> >
> > There is a problem with this when --enable-introspection is used
> > without ptests being in distro features
> > the reason it works with ptests on is that it enables 'test'
> > packageconfig which brings in glib-2.0 dependency
> > however if we build without 'ptest' DISTRO_FEATURE it will fail to
> > configure like below
> >
> >    configure:22490: checking for gobject-introspection
> >    configure:22499: $PKG_CONFIG --exists --print-errors
> > "gobject-introspection-1.0"
> >    Package glib-2.0 was not found in the pkg-config search path.
> >    Perhaps you should add the directory containing `glib-2.0.pc'
> >    to the PKG_CONFIG_PATH environment variable
> >    Package 'glib-2.0', required by 'gobject-introspection-1.0', not found
> >    configure:22502: $? = 1
> >    configure:22506: error: gobject-introspection-1.0 is not installed
> >
> > The check inconfigure,ac is using GOBJECT_INTROSPECTION_CHECK macro
> > which is expanding to this
> > check I guess.
> >
> > It seems that glib-2.0 is a hard dep for gobject-introspection so it
> > might be better to add it in bbclass itself.
> 
> Forgot to mention that I will apply this patch since some devs have
> reported this so they can keep chugging
> along, we can unbolt it when we have a proper fix.
> 
> >
> > > Bart
> > >
> > > >  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
> > > >
> > > >  SRC_URI += "file://gpio-manager.init"
> > > > --
> > > > 2.42.0
> > > >
> > > >
> > > >
> > > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#113265): https://lists.openembedded.org/g/openembedded-devel/message/113265
> > > Mute This Topic: https://lists.openembedded.org/mt/109255084/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> 

