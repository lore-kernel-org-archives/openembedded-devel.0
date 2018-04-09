Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id D4E0A607E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:39:37 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id s10-v6so6090474plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qO8EM4xtf2QvHPbHS10HTbVuZthdAdKi4OaXDn+k3Wc=;
	b=sUa3gQhjImq3EjjOksMviaxgyUbpuKmDy0fw0y5S2Ae8I93uhqjrpme3WMDR2nHbK0
	NqwsUi7xGadb6MRzZ4vlworuPxsCFNRu9BZu3bTrJtuF+aBDQBVZU0MT4ydiViK3HHIM
	1mKfjge9d6ce/YQWFZGANcydEGYgcTzANOEXpB4f8QusnbfQAe9Xl1OjxUtNUB6JFlVh
	Ehg+uQK2dlmqCHpcNAwRWd+hN+70eRTYIrY9ZTWzWzSXyj2irM7ZHb0sOgi2KRwKP8KS
	wA1kXlXMsS8fOs6I+x9vC/VMtKcvJVg/gMDrH4UdqLGBlAV3Qe7Y+8n6cDfQoWJjpi8j
	5CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qO8EM4xtf2QvHPbHS10HTbVuZthdAdKi4OaXDn+k3Wc=;
	b=ixTini2rV7kHnvBY7RP1BIkEV4q1egyo3Oypnsyu4atIK63kni+6jd3xEHjASOhtEB
	D6o9z34NAkwP+3b4IJFPp9n6VN8KPaunYz1pwZxZr4nVh+cMKudvL2pqPuYghLaK7xqO
	DPpgWxU7ACTPgKK/c6IYxdQPgCcttFBCecbS+gdgMCav6eveTJJSJkp2ueq/sRWNT64+
	ENy1wqC+sRp65llHPiLY7Gt1A6WDv1nert9wR7l3lkopVIrUsTQqt4fJKI+IjEp/Q2IN
	EgfNS/9SeJS7CiS2DHPUEsFTUvv9veXXcFhY/OOtYHHE/exlbUlkLYQ3Td4Pkj8oss+y
	zcXw==
X-Gm-Message-State: AElRT7GGa3lMw+ntA2veqoRPw9iL5oTG1/NEs9nwGdYNO7f2/Ne7hwWa
	Sfj58LSoCoh12qRq+GZVnD2GmA==
X-Google-Smtp-Source: AIpwx4+BqFWfvBbIPrqgSJzUEqWp9WWZkE80nyrbfIF8wxbFb4XnV9zAzO0pPUj/l6m+32ESSb21WA==
X-Received: by 2002:a17:902:2468:: with SMTP id
	m37-v6mr39748392plg.388.1523313578506; 
	Mon, 09 Apr 2018 15:39:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	e130sm2216343pfh.85.2018.04.09.15.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 15:39:37 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3a6ed034-db91-c9e1-5a90-b5dc7e820814@gmail.com>
Date: Mon, 9 Apr 2018 15:39:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH 0/9] Fixes and updates for sumo
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
X-List-Received-Date: Mon, 09 Apr 2018 22:39:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/09/2018 03:02 PM, Andreas Müller wrote:
> History:
>
> 1. networkmanager: fix gobject-introspection/musl and cleanup: This was sent
>    already but not applied yet. Now I know why: It introduced a parse error
>    for PACKAGECONFIG. I removed this 'fix' - the recipe was perfectly fine. I did
>    not notice this error because one of my layers overrided PACKAGECONFIG for
>    networkmanager.
> 2. poppler: Rework patch fixing do_configure: resend
> 3. poppler: update 0.62.0- > 0.63.0: resend
> 4. poppler: fix build for TARGET_FPU = "soft": Fix for qemuarm build error on
>    autobuilder
> 5. New - more meta-gnome cleanup
> 6.-
> 9. New - build- and run-tested on Raspi3

Thanks. I will pull in for the next planed build.

regards,
Armin
>
> The following changes since commit fa1913215275899b09c49c0bb5531f26909c5790:
>
>   samba: update to 4.7.6 (2018-04-09 12:32:07 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/schnitzeltony/meta-openembedded.git more-sumo
>
> for you to fetch changes up to b3117108ca0c464638d401602a84b52ff05e0b41:
>
>   thunar: update 1.6.14 -> 1.6.15 (2018-04-09 23:40:27 +0200)
>
> ----------------------------------------------------------------
> Andreas Müller (9):
>       networkmanager: fix gobject-introspection/musl and cleanup
>       poppler: Rework patch fixing do_configure
>       poppler: update 0.62.0- > 0.63.0
>       poppler: fix build for TARGET_FPU = "soft"
>       samba: refresh patches
>       polkit-gnome: remove
>       xfce4-terminal: update 0.8.7.2 -> 0.8.7.3
>       xfce4-whiskermenu-plugin: update 2.1.5 -> 2.1.6
>       thunar: update 1.6.14 -> 1.6.15
>
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch              |  86 ------------------------------------------------------------
>  ...05-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => 0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} |   0
>  .../{0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} |   0
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch          |  30 ---------------------
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch                                        |  39 ---------------------------
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch   |  77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch              |  92 ----------------------------------------------------------------
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch                     |  67 -----------------------------------------------
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch                                        |  53 +++++++++++++++++++++++++++++++++++++
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch                          |  35 +++++++++++++++++++++++++
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch                              |  72 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch                                 |  62 +++++++++++++++++++++++++++++++++++++++++++
>  meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb                                                         |  31 ++++++++++++----------
>  meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch                     |   5 ++--
>  meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch                                             |  56 ++++++++++++++++++++++++---------------
>  meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch                                         |  19 +++++++-------
>  meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch                                                                            |  12 ---------
>  meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb                                                                                |  28 --------------------
>  meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch                                              |  36 +++++++++++++------------
>  meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch                              | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb}                                                             |   5 ++--
>  meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.2.bb => xfce4-terminal_0.8.7.3.bb}                                       |   4 +--
>  meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.5.bb => xfce4-whiskermenu-plugin_2.1.6.bb}                 |   4 +--
>  meta-xfce/recipes-xfce/thunar/{thunar_1.6.14.bb => thunar_1.6.15.bb}                                                                 |   4 +--
>  24 files changed, 492 insertions(+), 425 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => 0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} (100%)
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} (100%)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
>  delete mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch
>  rename meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb} (90%)
>  rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.2.bb => xfce4-terminal_0.8.7.3.bb} (68%)
>  rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.5.bb => xfce4-whiskermenu-plugin_2.1.6.bb} (66%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.14.bb => thunar_1.6.15.bb} (88%)
>


