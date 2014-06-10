Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id B6A906B232
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 15:40:42 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id md12so6407887pbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 08:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=uCz/8b62JvQYRQKYoJg9/N67BiIvylsoLGWyUJ4yC6A=;
	b=RvefEDxeR6LY6KAgrPf1vzJtSGJ81zV5R2acJUZAxoEdvLtIHrd5y+ge9s8B5QkdkI
	NDn1aH8zRQ/Pp8U6aMctiyHUrdtDbsCvWW0Laf66DVJKCs7/uh1aYFYyVS+KIqumk+Uz
	wlsH1YxK0i8wHyIxC8meioZCxP/dx/tA8tdMLeTNyPu3fJuvvKdnmJ+ZYlV0aaueWW2J
	Z52iEtDIu5jDTOvOrI2pGeVJaAPNCiv3c4xuzU+v1SyjLuitPwHqaBkORLHSVQobAQ37
	TA0dR8NIsG7fHcwI6j++TKK1/gqV2mmlR2xHBthZ1Ll5rgj/vU78RWuCitcIfODml3Gn
	YOZw==
X-Gm-Message-State: ALoCoQkEa4iqyUus/IoXGu3LTeOlIAGfdIb0OX+aH50po3A8gMbv8UB8PmcDYSAV8lCHt3S84Ghk
X-Received: by 10.67.30.163 with SMTP id kf3mr751591pad.144.1402414843385;
	Tue, 10 Jun 2014 08:40:43 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	av2sm70187941pbc.16.2014.06.10.08.40.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Jun 2014 08:40:42 -0700 (PDT)
Message-ID: <539726F8.3010109@mvista.com>
Date: Tue, 10 Jun 2014 08:40:40 -0700
From: "akuster@mvista" <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140610100722.GC2433@jama>
In-Reply-To: <20140610100722.GC2433@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Tue, 10 Jun 2014 15:40:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 06/10/2014 03:07 AM, Martin Jansa wrote:
> On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
>> This build still contains huge patch setting B = S or inherit for
>> autotools-brokensep for all recipes which were failing in earlier
>> master builds.
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-06-10 ==
>
> === common (17) ===
>      * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_compile
>      * meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile

>      * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb, do_compile
>      * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb, do_compile
>      * meta-openembedded/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb, do_configure
I can look into curlpp, lksctp-tools and libnet

- armin

>      * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb, do_package
>      * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb, do_compile
>      * meta-openembedded/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb, do_configure
>      * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compile
>      * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb, do_configure
>      * meta-openembedded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_compile
>      * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb, do_compile
>      * meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb, do_compile
>      * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb, do_compile
>      * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_install
>      * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc_git.bb, do_compile
>      * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, do_compile
>
> === common-x86 (3) ===
>      * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_compile
>      * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>      * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>
> === qemuarm (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (1) ===
>      * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_compile
>
> === Number of failed tasks ===
> {| class=wikitable
> |-
> ||qemuarm       ||17    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140606_153039.log/
> |-
> ||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140609_094000.log/
> |-
> ||qemux86_64    ||21    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140610_021320.log/
> |}
>
>
>


