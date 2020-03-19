Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 24AAF60B4C
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2020 08:44:52 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id j4so1916436qkc.11
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2020 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w1IYeYSBNIZ6KEH+Z+plgpGkpdIseymDgjoefVOUWmc=;
	b=SpTGGKbio0QplHaGsgcaEtHxvuDGU6SM2o8cSIG4urR7bVXIbAUZn2FD9sipWeB2Nt
	s3x39TCYR2/IkHpwzXd3AJpzIcpnyNsS0umi9wSWjhIZHiYKTMhM7mjb7Ifmh9NBlA11
	1lXRDY2IplDP8BMCFf25nzWydft1qbhLzx1/ocMuO6SF+ABHxlDDBZUqVuijKFZrtJRb
	mqiKDIJ4BneN0bQWxqzkMkSPArnCTlNhCmUhhZ+M9pJzqRNotWgkbgUh7233SiVXZ5Bd
	NZhdjDN5LOq86boJ44gJBeon+uXNRzCEertD3E1JJteRzPIJ5ol3TXDailb1OtrWaYuU
	LIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w1IYeYSBNIZ6KEH+Z+plgpGkpdIseymDgjoefVOUWmc=;
	b=D0Olu0QswhZ84oNi5ybsQUDcxrQ69JbKVjy7dfpbHcVkPT2orbnqRrgP6CFdFA5XoA
	6uQkas/wHGP63kDcKX8Te6btT1V0UhsVjFTcwRQqtnO5yNw6Y1AD6+oWcaH1SeN7vbtp
	xCc5bpuZjrRH9X4N1bBnIxH1qk3GvvDqKBUKYpkM80NbMSZ1o3DGMp9VcgfeSqcmBbZJ
	TnqAZ5tsStByX6dzqssQ+h8DoknWwS4+W1XjRcvmR1T9xcVxfdVtfR5U3we5FGU32r/Y
	88Zq6yGPchRUVOibOZo7b9hpe9OjqxdYLNHRMt1Bt+xRrr3Ed6inIthc+GHZ0FLAmpPT
	tnfg==
X-Gm-Message-State: ANhLgQ1yhDRPIkHYxroc5hBrxTw8WZGUbGNpHiDyOAUuWgkpEuM6I8HU
	9sJKyf7elV+v1fUIfD4Bw6FCOWhWklkYpu050go=
X-Google-Smtp-Source: ADFU+vsrRwCTJ41J8k94zH6C5szxyIDx9KwonTHxP4MvC9+caAah4/I53VSspDR0Ai+wNHBslTwp8G3L47znAzM0AlE=
X-Received: by 2002:a37:b003:: with SMTP id z3mr1772043qke.431.1584607492791; 
	Thu, 19 Mar 2020 01:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583981708.git.akuster808@gmail.com>
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Mar 2020 01:44:25 -0700
Message-ID: <CAMKF1sooQTeEkmOSu+torVhMZ8R_3FqCzEOWwRMT0drKpAOZDw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [zeus 00/13] Patch review
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
X-List-Received-Date: Thu, 19 Mar 2020 08:44:52 -0000
Content-Type: text/plain; charset="UTF-8"

look

On Wed, Mar 11, 2020 at 7:58 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Here is the next set for meta-openembedded.
> Please have reviews back by Friday.
>
> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
>
>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>
> Adrian Bunk (1):
>   wireshark: Upgrade 3.0.6 -> 3.0.8
>
> Carlos Rafael Giani (1):
>   opencv: Enable pkg-config .pc file generation
>
> Khem Raj (2):
>   ade: Fix install paths in multilib builds
>   sanlock: Replace cp -a with cp -R --no-dereference
>
> Martin Jansa (1):
>   s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig:
>     use git fetcher instead of svn fetcher
>
> Mike Krupicka (1):
>   mosquitto: Use mosquitto.init for daemon init
>
> Paul Barker (1):
>   lmsensors: Fix sensord dependencies
>
> Peter Kjellerstedt (2):
>   lvm2, libdevmapper: Do not patch configure
>   libldb: Do not require the "pam" distro feature to be enabled
>
> Ross Burton (4):
>   opencv: don't download during configure
>   opencv: also download face alignment data in do_fetch()
>   opencv: PACKAGECONFIG for G-API, use system ADE
>   opencv: abort configure if we need to download
>
>  .../mosquitto/files/mosquitto.init            |  2 +-
>  .../recipes-support/libldb/libldb_1.5.6.bb    |  3 +-
>  ...{wireshark_3.0.6.bb => wireshark_3.0.8.bb} |  4 +-
>  .../recipes-bsp/lm_sensors/lmsensors_3.5.0.bb |  3 +-
>  ...cp-a-with-cp-R-no-dereference-preser.patch | 51 +++++++++++++++++++
>  .../recipes-extended/sanlock/sanlock_3.8.0.bb |  4 +-
>  ...gure-Fix-setting-of-CLDFLAGS-default.patch | 34 +------------
>  ...tallDirs-for-detecting-install-paths.patch | 39 ++++++++++++++
>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  1 +
>  .../opencv/opencv/download.patch              | 32 ++++++++++++
>  .../recipes-support/opencv/opencv_4.1.0.bb    | 32 ++++++++++--
>  ...3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} |  7 ++-
>  ...3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} |  6 +--
>  ...ive_svn.bb => sjf2410-linux-native_git.bb} | 11 ++--
>  .../{usbpath_svn.bb => usbpath_git.bb}        | 10 ++--
>  .../{wmiconfig_svn.bb => wmiconfig_git.bb}    | 13 +++--
>  16 files changed, 183 insertions(+), 69 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)
>  create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
>  create mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} (73%)
>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} (74%)
>  rename meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (72%)
>  rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb => usbpath_git.bb} (68%)
>  rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb => wmiconfig_git.bb} (58%)
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

