Return-Path: <dmitri.vorobiev@movial.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0C978200
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 19:31:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f140so14755888wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 11:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=movial-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eEG04YcJsPrc7PR71xaMY4QcCGb+s5jh7qiRO7Cvk1c=;
	b=dd3ZCbUWQ9DYBeYN4UVwk9AXHv5jUvZykdZqNSik8BYIX4pfu9uGTktkuaUlxGt+9g
	/Ej3WwraTwR+vkx+x4NuuFf/2QHXxNT8doNnggoABc2oBmoTeDibrvxvMRM2M1i9SqrN
	JNkDoAHSZHUySoLX7xWgfwUpLH3moiVNReJrjvOfG8EwR+XFGd4l1hv1C8sKn+MfikZ5
	0sRwf7nRva3cieIRfXndgZ3kk7g6SFlvGOtIYKGkATfjaJKpcVx8I58/j94RQ1CCf5bm
	1S9Qr9ISM2P3HeP4VzRz7qKvRqV2xLmz9k2ES97ACxR2Ol4SwnGPlHhJFraHr++OgTfU
	/E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eEG04YcJsPrc7PR71xaMY4QcCGb+s5jh7qiRO7Cvk1c=;
	b=WalWe7cFinh3GcRD09WulsQ3E56P43cOyZyagwhL/fUloPuCOLVeN5KHPeRDH7XB6o
	Cp4pX8ZFDJW56IemNTcP/Yg31puOrsq4ogFaLOCdBiqqtn2fAppeAHig+Oue8Ln4a3TL
	7Szv2iFXQla7U8E5kcMnu+9PTpbkUcocrTQwioBgBekXUb4HY0RYJouDXkIRUj5MwcvS
	/aN3E0aSnyiqsW8grjBd+QWTVYYvbFDY9qkWWAo7qbpK3cEwOJHCdKv+Cq41CVudGbsY
	aMjxVoh/9V+VBBhmMfIPw9uXlkDU16DCvShqcEUI/2XBohtqxhrMhvOqKUXrDQ6h0ZLK
	G3dQ==
X-Gm-Message-State: AKGB3mIk2FEl7DH5x1hwVwsdiB9NvJ5T5TvVKsiT39314s75njD7+8V1
	4rGwlBToVyq7TXBUTveOnIsW79JcSZFMhttec2/rUA==
X-Google-Smtp-Source: AGs4zMa56NPg6siUmpKf5jQQKBWrgQNEQ1yAlI0tXE06J/1XqdjYLEg3G6mAtbp1wSgPzHIHD/J7RbOwF/yUvBw3Exw=
X-Received: by 10.28.14.141 with SMTP id 135mr2144711wmo.104.1512675079819;
	Thu, 07 Dec 2017 11:31:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.178.240 with HTTP; Thu, 7 Dec 2017 11:30:39 -0800 (PST)
In-Reply-To: <CAMKF1so1QVxOL7V0mJMxGmX5A2ccduwY00XveGU+954XcPQ11w@mail.gmail.com>
References: <1512652745-22945-1-git-send-email-dmitri.vorobiev@movial.com>
	<CAMKF1so1QVxOL7V0mJMxGmX5A2ccduwY00XveGU+954XcPQ11w@mail.gmail.com>
From: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
Date: Thu, 7 Dec 2017 21:30:39 +0200
Message-ID: <CAE3k13d8N02kfR+VmpXRZPywTdU1Rm6vaRhB-gb29G4Hqbo-kw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 07 Dec 2017 19:31:19 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, it is needed, as documented on the home page of the project [1]:

"You need program releases from 2.4.0 upward because of updated
parameters/functions."

[1] http://www.draisberghof.de/usb_modeswitch/

Thanks,
Dmitri

On Thu, 7 Dec 2017 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Dec 7, 2017 at 5:19 AM, Dmitri Vorobiev
> <dmitri.vorobiev@movial.com> wrote:
> > Use the latest version of usb-modeswitch (2.5.1) and
> > usb-modeswitch-data (20170806).
> >
> > Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
> > ---
> >  ...-modeswitch-data_20140529.bb => usb-modeswitch-data_20170806.bb} |
> 6 +++---
> >  .../{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.1.bb}            |
> 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-
> data_20140529.bb => usb-modeswitch-data_20170806.bb} (66%)
> >  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.2.0.bb
> => usb-modeswitch_2.5.1.bb} (79%)
> >
> > diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20170806.bb
> > similarity index 66%
> > rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20140529.bb
> > rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20170806.bb
> > index a265411..3926feb 100644
> > --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20140529.bb
> > +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20170806.bb
> > @@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 94d55d512a9ba36caa9b7df079bae19f"
> >  inherit allarch
> >
> >  SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> > -SRC_URI[md5sum] = "dff94177781298aaf0b3c2a3c3dea6b2"
> > -SRC_URI[sha256sum] = "53889157937109e04dafe897c098ec
> 94f3f44f9c0c83fc6ec8417aa9a587e536"
> > +SRC_URI[md5sum] = "fb50d15b52e909d742dd16f0a9882316"
> > +SRC_URI[sha256sum] = "ce413ef2a50e648e9c81bc3ea6110e
> 7324a8bf981034fc9ec4467d3562563c2c"
> >
> >  do_install() {
> >      oe_runmake install DESTDIR=${D}
> >  }
> >
> > -RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
> > +RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
>
> is versions specific dep still needed.
>
> >  FILES_${PN} += "${base_libdir}/udev/rules.d/ \
> >                  ${datadir}/usb_modeswitch"
> > diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.
> 0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> > similarity index 79%
> > rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.
> 0.bb
> > rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> > index 425f66b..e2d211b 100644
> > --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> > +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> > @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 94d55d512a9ba36caa9b7df079bae19f"
> >  DEPENDS = "libusb1"
> >
> >  SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> > -SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
> > -SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e1
> 6c9ee3e8e394dd39c5991f7680eb908a3a"
> > +SRC_URI[md5sum] = "7e6435a2afe7aed8574fe59cf09a3503"
> > +SRC_URI[sha256sum] = "f6e44bfc6e8d531ac6759791cf79ee
> 9c618e7894fcf37170c8a5559718f9abd2"
> >
> >  EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
> >
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

