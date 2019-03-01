Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 97E7D7C4C3
	for <Openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 14:52:45 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j36so28008034qta.7
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GoVdfQro2HjzmdJBRYBm7mtWVuaGdTShLHtv7ziiA60=;
	b=hrdXaexXP+U3qBqJfPOWhypid+TLuxI7QnjT2jNXJgIoLOJTFNKZbv/e6egxK8UGr7
	Dsq7ql98lcPs3xreZRU0nfgkRDFrlyDxhPvaXXSNZuHOwFCMSPYMPXrxV9kIJnKhiEpr
	UrUX4XNaaNyXRganIy1t1reFwzs6WGIyrXasOsDN23Ilvby3QQ+mPpt3fY784O0wdgDt
	2RhJiET8t9M8zGx6rUhROUnVrgx6bVDqjbbVOm6Iw7z80OP9tlD+D/M2QyFFspdr8apf
	Hs9GYiTxbRIykK9D1AvOT85+aoiF3XunzghweKhdOmdg3K7vHOjI9zdF0hEYdV6t+FT9
	r83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GoVdfQro2HjzmdJBRYBm7mtWVuaGdTShLHtv7ziiA60=;
	b=e0+v/Qwv1MpNHWb0E4ejsz2XRai0p5iJsfz+TOq95SA73XOzxzvIZ1GDHsViX5W36I
	zSQz8jmi9UU7TfDINFdMRzqrEyHacujgxvCJO7xrbMbXRLhAria5dAr9M7nTV/Gg12XH
	ggCWZ/SV1kfMRxAcOga26FVSroTig1rStMorr99+YjfsA86lEKwjt+q6DM1VEp4VT0Vt
	0dIFmdras4dqYyiaomgbqofy9fjI+ldKvjh/QqqW7NTjVAQ/JoXFzpzyqENBVhN+7h6/
	QdctUfyndaHyYD9GENiENxYOXar/Y/tYx8JBryAQCCgQ9RJnI7oZELfhmAGy11eZP5sO
	nYKw==
X-Gm-Message-State: APjAAAWC+CUdE6Q89GCVVGoyQGEYxph999beTYbJHiciOBNPygJ5J4Bx
	y7FiqGB/Qe6fRgLdyjYLsOpQblaEOIU3pBSjlOs=
X-Google-Smtp-Source: APXvYqy8mCoXqnYq6hYx6T1Jm91bwylvZo4Oj5B0HmtTHPr7WPHlO/S+OM14z05JikJfnpYJyR8MpOuW6Tmh5dOz+44=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr3975848qvq.224.1551451966094; 
	Fri, 01 Mar 2019 06:52:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1spw7Jg63EZzJU6v8rE+sNDCbQsy_-2DEZrU0nSXTgmMpA@mail.gmail.com>
	<20190301121633.GD1503@jama>
In-Reply-To: <20190301121633.GD1503@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 06:52:19 -0800
Message-ID: <CAMKF1spQQhQg0Wm8EZNofnP8iCq+47XTaZu4O9U8a9rgOqsC=g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2019-02-28
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
X-List-Received-Date: Fri, 01 Mar 2019 14:52:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 1, 2019 at 4:16 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Thu, Feb 28, 2019 at 08:52:52PM -0800, Khem Raj wrote:
> > == Failed tasks 2019-02-28 ==
> >
> > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190228_201635.log
> >
> > === common (1) ===
> >     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
> >
> > === common-x86 (0) ===
> >
> > === qemuarm (9) ===
> >     * sources/meta-openembedded/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb:do_configure
> >     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do_compile
> >     * sources/meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb:do_package
>
> >     * sources/meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_compile
>
> this one was introduced by gcc upgrade to 8.3.0, I've added fix to
> meta-qt5/master-next

thanks Martin

