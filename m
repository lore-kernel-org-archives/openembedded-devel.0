Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 692BE7DC62
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 19:50:23 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id z4so971600itc.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 12:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OPTqFTDevI5nvxb90SpHRMJ/ZHH3ziim0ffwPR8eXMI=;
	b=YFojm6Q0kJAm2LtqpAjU/4qCxL80zR3o7iMbeCTJI90cNlEO8Zfh+EAL2pAjeafaA5
	UfExG/IawaMVZ4vo3cgc51VYnod+sqYtOmYnU08ygCB5dpopVCZnX9MgjMqlaQJqgG71
	4rn6wCNhZBiFIacKZevIyvM0spaCduzXBOjpJBMe6cJFmXjAw3TmwENeF8WF1YP2+H4C
	leV2pVQ+SdrUP6ovUYj72/ZYEWCxjm3EzlKJQJJYreeoYSO2r7xzxR/71V/h/wI+kitV
	QGatHZmMPmnicTS49EuvCH3X5T4OGgI/0BS2CIBoZSY9rf+IcxgP3OHEbG6eT9Uu4Dl9
	XaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OPTqFTDevI5nvxb90SpHRMJ/ZHH3ziim0ffwPR8eXMI=;
	b=OdbFYlzstSDnP2ADn9mgujKZBfhckaqRQb7H/0bifOFZGo+XEh4+xC/YIsODl6Z8id
	4HxbIaYgIXXaydbvqogw+SOxd9RebkAxSvGjj3BZ6qyGQIEHp5KRLBvvq9xbYjYZcQcp
	Pi3N8GCkEgQVEXn9phHih1/k0Z1jlZ7w+bVMA1py9m56Oolq+KTATPNt0sK36YXaSd4B
	wJzTZWeh49UXKuNlaabhJM2++oOjdg+YsMRxmhePvXZij98nIHgJRuBK5cUhaBtWJpPZ
	J11VIa+PV3K/S8f1q47k6San+RNFqlOHF5mYLJMq4A4iWsY689zJnYF1sZtJrsYnZp/W
	+Mug==
X-Gm-Message-State: APjAAAV/nRHZqpPMU/S8+EELOHUoZl4ryl22t5Whwdcf6voWSNLdrFWt
	c6EtZFic7fgN/CRP2zguahfpHPbWl11zkwR+vcc=
X-Google-Smtp-Source: APXvYqxnrRHQktGtvttK72hJOmQdaK2DB/D+9huSYxnq8pblPVTCtaQ1UA5oTiglFeEUC3TabCrbRR/ZIo19L98h1y4=
X-Received: by 2002:a24:78c8:: with SMTP id p191mr677897itc.58.1556567424471; 
	Mon, 29 Apr 2019 12:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spVRws2HV7W9w-mvMPwEVYaTqAdt=OGv_DnuLYiMRiBoQ@mail.gmail.com>
In-Reply-To: <CAMKF1spVRws2HV7W9w-mvMPwEVYaTqAdt=OGv_DnuLYiMRiBoQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Apr 2019 21:50:12 +0200
Message-ID: <CALbNGRTPZYHSKGsYa4ft87pXjfQHqqy-0vCfifwPH=eVOtSpAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of OE World, 2019-04-28
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
X-List-Received-Date: Mon, 29 Apr 2019 19:50:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 29, 2019 at 7:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> == Failed tasks 2019-04-28 ==
>
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.20190429_101843.log
>
> === common (1) ===
>     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
>
> === common-x86 (1) ===
>     * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb:do_compile
>
> === qemuarm (10) ===
>     * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_73.0.3683.103.bb:do_compile
>     * sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb:do_configure
>     * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-kernel/cpupower/cpupower.bb:do_package
>     * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_install
>     * sources/meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:do_configure
>     * sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>     * sources/meta-rust/recipes-devtools/rust/rust_1.33.0.bb:do_compile
>     * sources/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_qa
>     * sources/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb:do_compile
^ Looked into: I can take care for xfce4-vala & gnome-desktop3 (should
be trivial :)

Andreas

