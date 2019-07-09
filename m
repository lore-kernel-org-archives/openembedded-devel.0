Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7F27E27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 17:05:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id t8so16599153qkt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=njvjRea2b4GimWTc8rS9Ld+RdbveA43VXCC8ukgimi0=;
	b=PloloU4yPHdelXLJxD7eszA/yHHTsHcyjvcaR4tV4lDiqJ6U12z9tsgalVbe2Y2tM/
	ULylzQdhljgX3z7Edjzx7lVOQkbiALsf+XiA2HT+TkGuUF3oTUqs/CLzR3c/tpJFUjRc
	Dgp+ikCezMERFb8OhiwDXFROTsla4rQCLex0iP3kuWM45zPS1uPL5xbraPWFhsPxTnlj
	uvIaRBKMltQvxyDQkw1piSoJLyfnTnKbGWZJrT91sKBQnukzZVSAupTDsTIEO9sHd20n
	+dn9ejn9SdpjHJsAXMcx4i9yIj03wXBp82GZ+CZxEYHk223bhier7U6B5PrUIgB8t1oG
	HsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=njvjRea2b4GimWTc8rS9Ld+RdbveA43VXCC8ukgimi0=;
	b=i/jwfPInyhad3XDHdjdFBFE6Do6mzkszqCH6KPdeNRlO2od57Ku1RVfznZmxPxgBnL
	dLO47KsToXYVHmL/yNLw7iyNErnGlcRp5WQ006gX74uct3DpKmhdOWiDGbKMXZfi/9oF
	4Pu1ZaTcpmKB/Yr3k5Kj/mq2q1WbJpWuShBrFB5bPdP1VGoh1+bc9MgE91m3/L2p40qk
	i0lkabpbvnnI7sBEnb1TRut4pei9qIj8hrcu6+R7gN9sW/7zlUwGg23VK+Rpx6yTLDPt
	744lMjfBeBPky5a6R1TYW+g8GECYyEPqcJ1YN1ZpZTU4Pf61QWhuu5R2qNw9bBbxINNP
	Txbw==
X-Gm-Message-State: APjAAAWz1rVWbFvTQn9fRESdk+D6RkqyTX7lKbtxF1Zmf6Pad5OR9n5k
	b0+2xUstOB6Oko2dcdp8m8hIm1xYy3Rzmdbxmow=
X-Google-Smtp-Source: APXvYqz3v9ZI/wWrwm7K1hwj8qbT0PW42CHy2MfStoZN93kXIpOkDci6TIaHeCGvgswSlZr+yRXQqQLjtYL8gqmsUG8=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr17377446qkg.337.1562691912857; 
	Tue, 09 Jul 2019 10:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <4644ee2f-d23e-2698-6302-6a0cb76bb5b4@gmail.com>
In-Reply-To: <4644ee2f-d23e-2698-6302-6a0cb76bb5b4@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 10:04:46 -0700
Message-ID: <CAMKF1spMhdqZNZf8YOi_1aXgJiKGRc_GvmYSE+rDEfAg-CPMhQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: warrior-next pull request
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
X-List-Received-Date: Tue, 09 Jul 2019 17:05:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 7, 2019 at 12:39 PM akuster808 <akuster808@gmail.com> wrote:
>
> I don't see any record or recall if I sent a pull request for
> warrior-next, so here it is.
>

merged thanks
>
>
>
> The following changes since commit 6fa72d587aab8e9d56d67a2552eb9cfbe25c86d2:
>
>   aufs-util: prevent native aufs-util depending on target kernel
> (2019-05-23 07:03:43 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded warrior-next
>
> for you to fetch changes up to 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0:
>
>   turbostat: copy bits.h from kernel to turbostat (2019-06-16 08:15:44
> -0700)
>
> ----------------------------------------------------------------
> Changqing Li (1):
>       netkit-telnet: add rconflicts
>
> Hongxu Jia (1):
>       crash: do not use unstable github archive tarballs
>
> Liwei Song (1):
>       turbostat: copy bits.h from kernel to turbostat
>
> Martin Jansa (14):
>       gtkwave: add distro_features_check
>       umip: make MACHINE_ARCH
>       mscgen: fix SRC_URI for multilib
>       triggerhappy: fix issues
>       python-cassandra-driver.inc: fix DEPENDS
>       opencv: use the same package name in PACKAGES and RDEPENDS
>       igmpproxy: remove
> 0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch and
> _GNU_SOURCE
>       libvncserver: set PV in the recipe
>       ccid: fix SRC_URI
>       ne10, libopus: add armv7ve override as well
>       hunspell: use git fetcher instead of github archive
>       ttf-mplus, ttf-vlgothic: add ttf-mplus license
>       libmikmod: fix SRC_URI
>       leptonica: fix SRC_URI
>
> Mingli Yu (1):
>       mariadb: Upgrade to 10.3.15
>
> Qi.Chen@windriver.com (1):
>       polkit: fix CVE-2019-6133
>
> nick83ola (1):
>       uthash: do not use unstable github archive tarballs
>
>  .../recipes-connectivity/umip/umip_1.0.bb          |   3 +
>  ...xy.h-Include-sys-types.h-for-u_short-u_in.patch |  25 ---
>  .../recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb   |   6 +-
>  .../netkit-telnet/netkit-telnet_0.17.bb            |   1 +
>  meta-oe/licenses/ttf-mplus                         |  16 ++
>  .../packagegroups/packagegroup-meta-oe.bb          |   3 +-
>  ...native_10.3.13.bb => mariadb-native_10.3.15.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |   4 +-
>  .../{mariadb_10.3.13.bb => mariadb_10.3.15.bb}     |   0
>  ...pare-PolkitUnixProcess-uids-for-temporary.patch | 186
> +++++++++++++++++++++
>  meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   7 +-
>  .../{triggerhappy_0.5.0.bb => triggerhappy_git.bb} |  22 +--
>  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb |   4 +
>  .../recipes-graphics/leptonica/leptonica_1.74.4.bb |   2 +-
>  .../libvncserver/libvncserver_git.bb               |   2 +-
>  .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |   2 +-
>  .../ttf-fonts/ttf-vlgothic_20141206.bb             |   2 +-
>  meta-oe/recipes-kernel/crash/crash_7.2.5.bb        |   8 +-
>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb  |   2 +
>  .../recipes-multimedia/libopus/libopus_1.1.3.bb    |   3 +-
>  .../recipes-multimedia/mikmod/libmikmod_3.3.6.bb   |   2 +-
>  meta-oe/recipes-support/ccid/ccid_1.4.24.bb        |   4 +-
>  meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb |   7 +-
>  meta-oe/recipes-support/mscgen/mscgen_0.20.bb      |   2 +-
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |   4 +-
>  meta-oe/recipes-support/opencv/opencv_3.4.5.bb     |   2 +-
>  meta-oe/recipes-support/uthash/uthash_2.1.0.bb     |   7 +-
>  .../python/python-cassandra-driver.inc             |   2 +-
>  28 files changed, 258 insertions(+), 70 deletions(-)
>  delete mode 100644
> meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
>  create mode 100644 meta-oe/licenses/ttf-mplus
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.13.bb =>
> mariadb-native_10.3.15.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.13.bb =>
> mariadb_10.3.15.bb} (100%)
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
>  rename meta-oe/recipes-extended/triggerhappy/{triggerhappy_0.5.0.bb =>
> triggerhappy_git.bb} (73%)

