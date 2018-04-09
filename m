Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E78874619
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 08:17:52 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id m22-v6so4601337otf.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1uBUtgLO/syf2RtkOpsXP5SdCGnoOypD8Rnolao4j6I=;
	b=rKFxOmbsCwkBzhLdtx7PyNPjKQDecJT8F2hW/VAdY2abdsp5UTO1daRaahwpIyM3QP
	MpkKTwgduShdlBlS7onU59BDLUjOjPU5u7l7teFvpbxmB8RAiExluF9W5pi1xZbc/K2d
	oXI1tqve9if4iFGlW5JzJFZcJZB8WSINQtOLY2jmgyGr3gr6IvvbM+ApgwEMwdkyLi4a
	uKK2DBZtmQhiTb/nr+ilBP3iLodqQ+gOc9zDyvtKEfM+hlGpA0ecODD+/Voi8u95KmRM
	ln3pZZ4FPdmoOQDDVqrz7042XBTN/yYBNVOmFCsxuSvckfFRMaUFIysRqVF3PUdrxHoZ
	OtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1uBUtgLO/syf2RtkOpsXP5SdCGnoOypD8Rnolao4j6I=;
	b=fQIBf2SvSHDrMmrm5Kj2+xhy9+UUSRLgCo5bTfqCMStf1OJpkEFoP48O7hMIeYUyKq
	gVXr0MRLgEgkLt8LHXnlj5YhZJyLh1CjeCh+SoDR9UxNS9H4Y6FMZq0Xj1dFjMLXUNML
	6fo2P3/gbblUmOa3vUjuEO8GpgavsT9G3zpHWFW+68XSXpHu/XQcl8vzFX0C/M2Gcn5b
	/MWKUWQ0rgw9ImLsJ/Z62OtU+JsztkTm5v82AD3V/PIxXaTKrfm09ucXqH/xAMHd41GW
	re1mWK3GIY3q04e1iMewDtOxyqAJMUy8HEh30tBxG7gAAy0h4o8+/J+FpuZ4nD/nh8qv
	E0wA==
X-Gm-Message-State: ALQs6tDbIzoRyQlYl4MC8rOtlpCiB9tvWuaWeASiUgBXKKhUah3NFMgz
	58NwLTHdxUpOrmRSWwd1ZfyontLUyKt1myTGJdE=
X-Google-Smtp-Source: AIpwx49/5MNLUCSgjZc4r7O+3b+vt/K44xk5HnM+esuRqApJwGPbwrWgi++NFxv3zbA5shpRLdYa25Acf9UYp+PDgmE=
X-Received: by 2002:a9d:3f06:: with SMTP id
	m6-v6mr21166462otc.321.1523261873901; 
	Mon, 09 Apr 2018 01:17:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Mon, 9 Apr 2018 01:17:52 -0700 (PDT)
In-Reply-To: <34fa43b4-67f5-5de1-effb-0caa473061d6@gmail.com>
References: <34fa43b4-67f5-5de1-effb-0caa473061d6@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 9 Apr 2018 10:17:52 +0200
Message-ID: <CALbNGRRWzPyjP16gtg6UR25+rt2oguxJtcNq0t4Bv0R-sFUkZg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-03-19
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
X-List-Received-Date: Mon, 09 Apr 2018 08:17:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 21, 2018 at 9:29 PM, akuster808 <akuster808@gmail.com> wrote:
> == Failed tasks 2018-03-19 ==
>
> INFO: jenkins-job.sh-1.8.44 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180321_040648.log
>
> === common (7) ===
>     * meta-openembedded/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb:do_install_ptest_base
>     * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb:do_configure
^ will send a patch to kick out
>     * meta-openembedded/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb:do_configure
^ was removed already
>     * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:do_packagedata
>     * meta-openembedded/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb:do_compile
>     * openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.15.bb:do_compile
>
> === common-x86 (2) ===
>     * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
>
> === qemuarm (8) ===
>     * meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb:do_compile
^ Can be ignored - old version
>     * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_packagedata
>     * meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.62.0.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
>     * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.27.bb:do_package_qa
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_compile
>
> === qemuarm64 (7) ===
>     * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go_1.10.bb:do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile
>
What's the status of networkmanager (upgrade to 1.10.6 / fix
gobject-introspection/musl and cleanup)?

Andreas

