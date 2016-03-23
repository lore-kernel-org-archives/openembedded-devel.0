Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6F17B6E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:53:40 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so212419879wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Acc+OrgeIpK06j0VrVj9OosG8nriFcpysxrb/pqzrcs=;
	b=YWaMqjVZS3Zfc1lx8a7zfOVuO0t2tbPjlm7jRORyraH47hzkjtGt//o9XJ8pDwio5+
	OMAXrcsua/6PlmsM+Eco2KEQDgrhqBZieh7NXfESelNRK9vFMni99Qnr7H96zsbAUPWr
	looKSjWoPPQdQGUjt0FbFMmCrSewPYr1wbRtgKvciZ6fJIk4eYYXmb2vquIjUVMgdxVv
	XAiA/Anv0pRgzZSUJ9MJ2s2qPpXLgSkDYL19I2jeuPA+zoa0kov6jPfVTT7+ZNqUFPX0
	WBDfvALo7pJkBINpVDKQKAL11gxqSCyssbXahePEAfre3P/pywbOeIxd7Zv+bDGghHBF
	wbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Acc+OrgeIpK06j0VrVj9OosG8nriFcpysxrb/pqzrcs=;
	b=UM3KoUJ03wYbBTst2LxOk8ONvLWr09+9wpS5N4sA7rrJj4O3n+0o1dpp90+RgB5IOC
	xfyUGx1S25J1ZvBD4bwwyzk3t2otANL+Wl6ambDOCLNvAlV2XVse/cwDH8uA128Bbl0h
	oP9fzSWYahm/vyZCz/aE2X5jqoUHrveKtWwKrMSFAtBW8zZ0ZPv/5tYt7uQ9gfGgnA68
	lRtjPztRi17b6llJge1nxbjJCnYuZ2ZPy1yOL3tD5H/CkkzhFryVqfNAIJHc2ZrrLlmK
	r+AKlbc8ngdGVe0gHIcgsEo1++p7aUXUIOj+u2zIHwN+6l8GbkLzzWOPzPGSIQOHyOk1
	5KJw==
X-Gm-Message-State: AD7BkJLvPNnlCkihQ016MEcCrtaCgi3kFSCu2Sh9cKdBZM1B4E2tbfLR5MSpN9IqJLHOK64VG2q42qcsX8s66w==
MIME-Version: 1.0
X-Received: by 10.28.150.4 with SMTP id y4mr5886510wmd.43.1458766420710; Wed,
	23 Mar 2016 13:53:40 -0700 (PDT)
Received: by 10.194.102.74 with HTTP; Wed, 23 Mar 2016 13:53:40 -0700 (PDT)
In-Reply-To: <20160323143422.GC2565@jama>
References: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160323101240.GA2565@jama>
	<CAPybu_1-CCqMjSRC5it6nLL+SWzP7WfJEL6S5dY=Wjn4unon3g@mail.gmail.com>
	<20160323143422.GC2565@jama>
Date: Wed, 23 Mar 2016 21:53:40 +0100
Message-ID: <CA+chaQeCmuDayR--vozAToONS5ct_eHW6jd+Qytt0FkwS4+Lag@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: Add missing dependencies
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
X-List-Received-Date: Wed, 23 Mar 2016 20:53:42 -0000
Content-Type: text/plain; charset=UTF-8

It's also downloading something during do_configure which isn't acceptable:
http://errors.yoctoproject.org/Errors/Details/57094/

Everything should go through bitbake fetcher and premirror, so that builds
are reproducible (even after upstream sites are gone) or when user
explicitly disables network access.

Regards,

On Wed, Mar 23, 2016 at 3:34 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Mar 23, 2016 at 02:05:41PM +0100, Ricardo Ribalda Delgado wrote:
> > Hi Martin
> >
> > On Wed, Mar 23, 2016 at 11:12 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> >
> > > Still shows:
> > > WARN: opencv: libopencv-dnn rdepends on protobuf, but it isn't a build
> > > dependency?
> > >
> > > protobuf support in dnn probably depends on something else which is
> also autodetected.
> >
> > if I just clone a clean version of meta-oe and meta-core and do a
> > bitbake opencv i cannot replicate the error.
> >
> > Any idea of how to replicate it without having to do a bitbake world
> > before bitbake opencv?
>
> Check temp/log.do_package if you see protobuf dependency being added for
> libopencv-dnn package.
>
> If not then read configure script or sources to see what in
> libopencv-dnn is being autodetected -> then build these autodetected
> dependencies before rebuilding opencv and re-check the log.do_package
> file.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

