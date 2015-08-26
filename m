Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 159F5734B8;
	Wed, 26 Aug 2015 22:24:07 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so833343lbb.0;
	Wed, 26 Aug 2015 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+XO6hccmfX3YO4uCg6EhDmA9I77ZoN3uyu22tK6vXfk=;
	b=xjTw1KcslCAWcIpbFzv03NT2DQiloRXBngT0mIE5JHi7Bq0FBNDDWmthX4SqvzgRD3
	5HYslF5qcXtyNMun89SC4RFTix1VvBrHcyY3Im74eKlC6UwoTIMBTL1Se1/z+y7Vt1Hm
	8VwZLAyq3yxXc4zoZ3Z526UZQ+dXxhSeiqrO47/vRzXhDd0uSEpLY0xmwWDYmVSv/3+k
	2ke9bBmhI6eT8LX2HuFgwTq5NWYkP8cpJxm4yOogzE7oJmBPFReGFVd5v8Fc+ZWZwUKv
	2cFNs9Ar+K7DFHu4++2EVHAFLKcY7jndC3Q8XRvbEbN8TiTTaBadJR0pUwn1gIq20d2Q
	GFZg==
MIME-Version: 1.0
X-Received: by 10.112.52.2 with SMTP id p2mr955051lbo.8.1440627846487; Wed, 26
	Aug 2015 15:24:06 -0700 (PDT)
Received: by 10.25.89.74 with HTTP; Wed, 26 Aug 2015 15:24:06 -0700 (PDT)
In-Reply-To: <20150826135604.GA2449@jama>
References: <20150826135604.GA2449@jama>
Date: Wed, 26 Aug 2015 15:24:06 -0700
Message-ID: <CANx9H-BF76n0yD2xisT1R3TDHgUfC019Y=pKyvFKWZO=DFn4Vg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-08-24
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 22:24:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 6:56 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Time for even more PNBLACKLISTs..
>
<snip>

> == Failed tasks 2015-08-24 ==
>
> INFO: jenkins-job.sh-1.3.1 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150825_231149.log
>
> === common (7) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/
> mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/
> vlc_2.2.1.bb, do_compile
>
I am working on a patch for this. This one is difficult for me to replicate.


>     * /meta-openembedded/meta-oe/recipes-support/libdbi/
> libdbi-drivers_0.8.3-1.bb, do_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/
> python-pyopenssl_0.15.1.bb, do_populate_sysroot
>     * /meta-openembedded/meta-xfce/recipes-art/rodent-icon-theme/
> rodent-icon-theme_5.0.bb, do_populate_sysroot
>     * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb,
> do_compile
>
> === common-x86 (6) ===
>     * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb,
> do_compile
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/
> inetutils_1.9.4.bb, do_fetch
>     * /meta-openembedded/meta-networking/recipes-kernel/netmap/
> netmap-modules_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.1.bb,
> do_compile
>     * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile
>     * /meta-qt5/recipes-qt/qt5/qtwebkit_git.bb, do_compile
>
> === qemuarm (2) ===
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/
> inetutils_1.9.4.bb, do_patch
>     * /meta-openembedded/meta-python/recipes-extended/python-pyparted/
> python-pyparted_3.10.5.bb, do_compile
>
> I have a patch for this (and raised an issue upstream
https://github.com/rhinstaller/pyparted/pull/15 ). It is an indirect cause
of the parted_1.8.6 recipe. python-pyparted_3.10.5 requires libparted >=
2.3 (so the 3.% in core will work). The '1.8.6' string is not being cast
properly by float().


> === qemux86 (1) ===
>     * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-geode_2.11.16.bb, do_compile
>
> === qemux86_64 (2) ===
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/collectd/
> collectd_5.5.0.bb, do_compile
>
> === Number of failed tasks (38) ===
> {| class=wikitable
> |-
> || qemuarm      || 9     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_114047.log//
> || http://errors.yoctoproject.org:80/Errors/Build/8163/
> |-
> || qemux86      || 14    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_134017.log//
> ||
> |-
> || qemux86_64   || 15    ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150824_225042.log//
> ||
> |
>
<snip>

--Tim

