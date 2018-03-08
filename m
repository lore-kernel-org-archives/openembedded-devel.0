Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 08D7A6FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 23:22:33 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id f23-v6so4200301plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 15:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3vAcyL3B5B8pfdQNV6NVGWoMBJi9oo6HANOUqP1iOow=;
	b=qeneR7xLmJM9EIVDEQCrOtyOhVSL3PdPQGkYClOXEVLg8AgJLBBWa0MDV+QPUCghjT
	LZPfyIlp5PtUG9W/azmmGsZ6PiD1YF7to9QdAJx5zDaUPgItwkaSq72VeZAPgJ2HuViw
	jSILDwBpOVTJw8d1JQkLZB+BO0C23/YPj+azJkUoee29qvMY32rD6TXC8TvKR7B2BDkk
	A5IdV2wpdKHHsFgtJAqUuTjIZiyaWNk1+TchF7QhRX59+acv6zW4YlXsu6upUZBWjfpW
	Rn4IDx8Wk04Bn5YOgZpGYwOQdGT1lxeHPnF3j1YZq4TGgo29lFeN0QI0YZFj6LsQdIMt
	nO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3vAcyL3B5B8pfdQNV6NVGWoMBJi9oo6HANOUqP1iOow=;
	b=FlpueZ1WzCjWzw0Cytv+b98C8Xr5nZLsRazEgDBbaduPQWXqHkS/h7+f5MgDBc+8wv
	y9HhsfU9kQt8iUsuqzWZAYOi12SAZoxSAOs4cS2oAw8QBX1nqy7TCMW9bPDX/oEaLbiG
	w7r6MupkqXrrbMCMZO6wDpw2MhToH2mNVr6gYQ8KKqmoTASCL9xxBzCoHp7YinhSHPEb
	FcRxjnWu4L3ZCk0uhJ9Dgu20OL1rHadqKg5Obux8TwX2iPlo0y5BMuuhQUvc68pUSwCH
	4thVvC6g+XJlJqHSdS22fuYCd05QbT2TSnxslPlQIYN9CCqwDSdlzkPzZoX3Ec2o/1kH
	NBkg==
X-Gm-Message-State: AElRT7HeC8sw51ZG7rUjO4pmOyWeB9ecLg7unC4FS1WvbgOdwKd+AGo2
	nchm6fE3lxhc4dfYofNJh7E/v8FGstRHolaS/+4=
X-Google-Smtp-Source: AG47ELtyyRsAX9W3ektlb4reJ6SLAO4+xEf0Y5S+AgzLNzA7GQh1+gIfNOxTV5jsQT3pwUBbTvv/IhIOP3ni5QhiROo=
X-Received: by 2002:a17:902:9a81:: with SMTP id
	w1-v6mr2426399plp.344.1520551355058; 
	Thu, 08 Mar 2018 15:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20180308174316.36662-1-raj.khem@gmail.com>
	<CAJ86T=WNtG1GCk4AkR5Ysd6jTZYWeUKabbR724fouKueOjoXcQ@mail.gmail.com>
In-Reply-To: <CAJ86T=WNtG1GCk4AkR5Ysd6jTZYWeUKabbR724fouKueOjoXcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 08 Mar 2018 23:22:24 +0000
Message-ID: <CAMKF1srssLFbR5RzJjpg2R7xPAjLa8B7i50eyp+pbFujKtJ_OA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Pass -DMESA_EGL_NO_X11_HEADERS=1 when x is disabled
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
X-List-Received-Date: Thu, 08 Mar 2018 23:22:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 8, 2018 at 2:07 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Mar 8, 2018 at 9:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > Some graphics drives e.g. mali/mesa depend on this define
> > to use proper guards in eglplatform.h
>
> Would it be better to patch the header directly rather than try to
> arrange that every application which uses it defines the correct
> CFLAGS?


It would mean to change all of driver sdk for Mali variants and also Mesa


>
> > Fixes
> >
> > | In file included from
> /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/qtmultimedia/5.10.1+gitAUTOINC+038716bb1f-r0/recipe-sysroot/usr/include/EGL/egl.h:36:0,
> > |                  from
> .moc/../../../../../../git/src/plugins/videonode/egl/qsgvideonode_egl.h:48,
> > |                  from .moc/moc_qsgvideonode_egl.cpp:9:
> > |
> /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/qtmultimedia/5.10.1+gitAUTOINC+038716bb1f-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:125:10:
> fatal error: X11/Xlib.h: No such file or directory
> > |  #include <X11/Xlib.h>
> > |           ^~~~~~~~~~~~
> > | compilation terminated.
> > | make[4]: *** [Makefile:461: .obj/moc_qsgvideonode_egl.o] Error 1
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-qt/qt5/qtmultimedia_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/
> qtmultimedia_git.bb
> > index 2cb1bd5..efe848f 100644
> > --- a/recipes-qt/qt5/qtmultimedia_git.bb
> > +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> > @@ -25,6 +25,7 @@ EXTRA_QMAKEVARS_CONFIGURE +=
> "${PACKAGECONFIG_CONFARGS}"
> >  # Disable GStreamer if completely disabled
> >  EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG',
> 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
> >
> > +CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
> '-DMESA_EGL_NO_X11_HEADERS=1', d)}"
> >  # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.10
> >  # 5.10.meta-qt5.2
> >  SRC_URI += "\
> > --
> > 2.16.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

