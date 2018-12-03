Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 282E96C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 04:46:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i7so12328583qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 20:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4+gJkLgFBzMyLlVgZkj94sTKkvcO0gsqOzzkfwARl6A=;
	b=IwRbSwEq5jsrMMH4qEsChmzTJXRYcTb0jdWWZDNAwJmINh1xXjKWCIdN+VK0NWSenV
	FeZufaHvA7CIO1R2kDWr0HywuNnPp2u/WNquC0LBvoBrEX4RGGMseWzeP7YL3SQev81F
	McFBPt6fv4eGphTH5u+a7aa7mpuak8jUBB5zoM2Get8RPMCAb46I9seWVxRe5fd8+UsP
	yOE86nu1dqfTyUurBPnciE8VxnQCi9eKqWSe51ow7moZ4g/FQNgIEBGngM5gfSUeh/Pc
	YVaubPVpwJqrutVDmv0s3R6hpz+TaG5u52lJM3F+B4WPVIbPiTgQvySC5p2gMBJuRvFu
	NpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4+gJkLgFBzMyLlVgZkj94sTKkvcO0gsqOzzkfwARl6A=;
	b=hGOJ8axfK2nTivgyboPTIXpN/JDczVm7/jIiMDnwxzHNdW0f0wr05lz0FG1IKKe4NL
	TlEjMYYHHxe8ZKM6mPflGyaLOT5olR7pWG008N7X7Cnx+y9788Njty9aCbCE4D8kEpq6
	RObO9p1dsIy2g6UAlJRy5K0PyVw8gI7nJMad/7Dv764VtT2ScdpWUEaOHIMJDZ7xBQhZ
	nlbbOF16lm1T/HrE8hfFJrQ6smmnKVs4KMyEgUKrpZ68tG1XlqqN6poUTdNz4czl/Qdv
	T/HHLDygMQ6MmpMgkPMkZ5vPNrdxsuknotG1H53W7AmCXOX3ORATmGl0xeRC9om0D53N
	hSUg==
X-Gm-Message-State: AA+aEWbfz7b5WU5KdnifVKPzXy77lQ2ZO581FXkP/CqV1h6RWcDV3A1N
	1lfV4iyQrcps0atoyWaBHSVl0ZHJz48dc8ece00=
X-Google-Smtp-Source: AFSGD/Wit8JBK7JZQbgYv3VbHULNtVFo04BRNI7ZuMT+2yGp1W/hSa+k0jr8Bq7a/zaCUA3WcX/0mySHjZ8WnkkEdpI=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr13852388qtc.236.1543812386741;
	Sun, 02 Dec 2018 20:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20181202191346.15104-1-raj.khem@gmail.com>
	<eb3254e5-90c9-1bad-f187-0e95fe054e9e@gmail.com>
In-Reply-To: <eb3254e5-90c9-1bad-f187-0e95fe054e9e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2018 20:46:00 -0800
Message-ID: <CAMKF1srHSspXWvuWAZfNqAJWA0hT0H3qhfMdjcbPhMSfF5iOKQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] libvncserver: Update to latest version
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
X-List-Received-Date: Mon, 03 Dec 2018 04:46:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 2, 2018 at 12:40 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 12/2/18 11:13 AM, Khem Raj wrote:
> > From: Eddie James <eajames@linux.ibm.com>
> >
> > The latest release of libvncserver is almost two years old. A number of
> > security fixes and enhancements have recently been committed. Since the repo
> > is stable, point the recipe to the latest commit.
> >
> > libvncserver switched from autotools to cmake, so update the recipe as
> > necessary, and add PACKAGECONFIG options to allow a more minimal build and
> > install.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../libvncserver/libvncserver_0.9.11.bb       | 25 -------------------
> >  .../libvncserver/libvncserver_git.bb          | 23 +++++++++++++++++
> >  2 files changed, 23 insertions(+), 25 deletions(-)
> >  delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> >  create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> >
> > diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> > deleted file mode 100644
> > index 38dac06e64..0000000000
> > --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> > -HOMEPAGE = "https://libvnc.github.io"
> > -SECTION = "libs"
> > -PRIORITY = "optional"
> > -LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> > -
> > -DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> > -
> > -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> > -PACKAGECONFIG[systemd] = ",,systemd"
> > -
> > -RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
> > -
> > -inherit distro_features_check autotools binconfig pkgconfig
> > -
> > -REQUIRED_DISTRO_FEATURES = "x11"
>
> X11 was dropped. is it handled in some on the fashion?

what caused the x11 dep in first place ? if it was gtk+ then this has been
dropped.

