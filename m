Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1076093F;
	Mon,  3 Jul 2017 11:20:20 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id s15so20238025ybe.2;
	Mon, 03 Jul 2017 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Xf7I/Zhk0N2MGgno8etQR/cYePeOb/p1RXlL4nbmEnc=;
	b=eOgAc26onmCpng5LxER39MW++7DqglFobFVzHHbv0RgwCzrApDEiqcN7fOm/mwtWGL
	sDGo1tVgRaQf1MV1VTQ4PJQF3UzfHYRNuZbaZiPATkJ376fG6zxA9T3s/kjL9QBW44ux
	uCEVNNW0gG2RXL7yafIvQoBxHGSo8DlbUSQV9iwWbS4uHtRwKnAfhW/rnwhC67H3/q4k
	tbzbsaDDPrFsr/L7JyHH7PElyhiMpO+Wq35vE268sae1uEv8PcIip7pjUZZA4CFoRRrp
	GODAA2kUHA/xeOSOq0Xdknbh0lcx4DR+ovvkVR4eWhRtpqazLM8AD4tL5RfMCYtQD0U2
	E7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Xf7I/Zhk0N2MGgno8etQR/cYePeOb/p1RXlL4nbmEnc=;
	b=gkD03rHI2zvSahEmbv2myWXUAqUKxWaLkxTyyC98emxHnyCr9guMLHzIqaf6j+lC5k
	NzuZiruQceX6Os8SYWlrcRsLxAWPsdSWm15NGmcIwrCZw/wBQ/GQ/ept3Icm8cnEmrV9
	gnukpqwO5icp6k06EW4vQSvfNhjo24Z8zvUuxbU7OEjFQrs/s2gOfd5fEt0CwZlllmJl
	LMPqzTxELBMt0/0rZltj3668Q4Ynj/oHvhCzD9bV//zh+irWwLZVLiYJtDAhJMKJZ/0R
	7rBs7wontvbByLeg9KO9NjHwp77PPglTIagG3QPr7A8XZWngUN8+wKTcDQ36178Gi3Br
	JfLw==
X-Gm-Message-State: AKS2vOzTIOtZIcqr+omM4Imh5piTLBp+YBfD5X4oRuOkppZE+n/jlIDA
	g0s/KYFlEf7UAr/xH3LsobxPmOJgiTAL
X-Received: by 10.37.228.70 with SMTP id b67mr26979414ybh.28.1499080822034;
	Mon, 03 Jul 2017 04:20:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.18 with HTTP; Mon, 3 Jul 2017 04:20:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 3 Jul 2017 13:20:21 +0200
Message-ID: <CA+chaQeKdNstTz6s1KMLcM+oHE2Rb3CZ0PWo0+j+wM4kzbcQFw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-07-02
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
X-List-Received-Date: Mon, 03 Jul 2017 11:20:21 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-
||2017-07-02	||7	||8	||5	||0	||0		||1		||4		||0		||0		||1238		||1		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-07-02 ==

INFO: jenkins-job.sh-1.8.24 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170702_225940.log

=== common (3) ===
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb:do_package
    * virtual:native:meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_populate_sysroot

=== common-x86 (2) ===
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:do_compile_ptest_base

=== qemuarm (4) ===
    * meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb:do_fetch
    * meta-openembedded/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb:do_compile

=== qemux86 (1) ===
    * meta-openembedded/meta-python/recipes-devtools/python/python-pytest_3.1.2.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (20) ===
{| class=wikitable
|-
|| qemuarm 	|| 7	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170701_001009.log/
|| http://errors.yoctoproject.org/Errors/Build/40492/
|-
|| qemux86 	|| 8	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170701_001007.log/
|| http://errors.yoctoproject.org/Errors/Build/40495/
|-
|| qemux86_64 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170702_004648.log/
|| http://errors.yoctoproject.org/Errors/Build/40496/
|}

=== PNBLACKLISTs (15) ===

=== QA issues (1244) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1238	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||1	||libdir
|-
||4	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170701_233319.log/

No issues detected

