Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6E19561BB2
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 23:12:13 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w65so2206152pfb.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=wm/ys9IVWdtPLM5tnsLy5eQ3ecdp6Uye+De6vhAbJi8=;
	b=rQMXhK0uZiTBGprO6q1u6oFIqKZdfvUniNYo2zHv8UDDvSH20HXfiF7hb4VeAtTJNB
	JtiECFGtI3s5zoA4WVmOc+ZA//amKQwe9feh85vr+D85ER9YOhLWv0aa1AnkCCPIcJZD
	ZRKrrMEiqC9dpzTjP0GwOoaWzcWIli93B6+lB4WMum7OZzO34dErdUvGY9uMdDxe1nQF
	1PsIWDdg8/X2v2fJV9GTUiJo4ie0zViZcaruQH6F/XATS4TT7lRmiZUogp2ZQXRQFsCO
	O2udpS1f/wpuEjVriGxFmVhSBoRyxd8xwMQML2v9cU7/TsM2TnhgifPuoE36QZ+n0w8f
	91vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language;
	bh=wm/ys9IVWdtPLM5tnsLy5eQ3ecdp6Uye+De6vhAbJi8=;
	b=X0yHd3Sf+tNlHqY6fJxS1H9YntMQUtZ9v4NP68Nf/tnHkYa2Tldp9ib80BJ9FfKTpj
	mMpPiD+MjKlUNEw0TqmDi7kY9CdA05maRM3GHrjMq3eY2C2wvbcR3GwFfBJTndz1/erW
	1f/6x/xu9mGHMgt9CNvYG0dAHq0PRF8xTZm7e47RMLay7Vgv7JN+9+nnmkCTssBJk0bW
	UezZKLipeLhloCf5NQHtPL3Pa7BFfpVIglLU2NXfqgn5jFLJ6YeiMd69p58a8Ylv4X40
	qg7R01dYLJ7hXh6OlfLv22GhNUUqenVRaRCSNmZ42C3U1LFL5y6zDi0FH9LDYFJIn+zc
	qkZQ==
X-Gm-Message-State: ANhLgQ0ycU8Dslt/vZu5sYv4gi3uDBMKgzFGCevewZbB2TppDnd4eNRP
	kJs9YrTUcVrg1/DzyURLwS+HOHHa
X-Google-Smtp-Source: ADFU+vuT8pXVEUzgsyw43lRs819j3c5vXTRXmg5f6kn2YSXb+rPdsPtM0c6HmsCURulCwqhmFR3B9w==
X-Received: by 2002:a63:5011:: with SMTP id e17mr4867548pgb.338.1583968333905; 
	Wed, 11 Mar 2020 16:12:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:60a5:8a88:a7f9:d809?
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id h2sm6392510pjc.7.2020.03.11.16.12.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 16:12:13 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1spbcLr-ZA8KrObx3OAhv0A7gJ2Dk+Zkj0FZzbMr7C_Maw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c06e6d10-600b-17a1-a343-b414875bc988@gmail.com>
Date: Wed, 11 Mar 2020 16:12:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spbcLr-ZA8KrObx3OAhv0A7gJ2Dk+Zkj0FZzbMr7C_Maw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of OE world - 2020-03-09
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
X-List-Received-Date: Wed, 11 Mar 2020 23:12:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Khem,

There is something wrong with this.

No one will be able to get to those logs posted in this email or what is
on the wiki.

I think we need some links like:

http://logs.nslu2-linux.org/buildlogs/oe/world/dunfell/log.world.qemuarm.20191213_215925.log/


-armin

On 3/11/20 3:40 PM, Khem Raj wrote:
> == Failed tasks 2020-03-09 ==
>
> INFO: jenkins-job.sh-1.8.46 Complete log available at
> /media/ra_build_share/buildlogs/oe/world/dunfell/log.report.20200310_140304.log
>
> === common (0) ===
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemuarm64 (1) ===
>     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (1) ===
> {| class=wikitable
> |-
> || qemuarm || 0 ||
> /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemuarm.20200309_132038.log/
> ||
> |-
> || qemuarm64 || 1 ||
> /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemuarm64.20200309_202041.log/
> || http://errors.yoctoproject.org/Errors/Build/99898/
> |-
> || qemux86 || 0 ||
> /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemux86.20200309_202040.log/
> ||
> |-
> || qemux86_64 || 0 ||
> /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.world.qemux86-64.20200309_202038.log/
> ||
> |}
>
> === PNBLACKLISTs (20) ===
>
>
> sources/meta-openembedded:
>     * meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:PNBLACKLIST[netkit-rusers]
> = "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or
> directory"
>     * meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb:PNBLACKLIST[drbd]
> = "Kernel module Needs forward porting to kernel 5.2+"
>     * meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb:PNBLACKLIST[lowpan-tools]
> = "WARNING these tools are deprecated! Use wpan-tools instead"
>     * meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb:PNBLACKLIST[dnf-plugin-tui]
> ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does
> not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
>     * meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb:PNBLACKLIST[nanopb]
> = "Needs forward porting to use python3"
>     * meta-oe/recipes-extended/socketcan/can-isotp_git.bb:PNBLACKLIST[can-isotp]
> = "Kernel module Needs forward porting to kernel 5.2+"
>     * meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:PNBLACKLIST[dnfdragora]
> ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does
> not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
>     * meta-oe/recipes-kernel/bpftool/bpftool.bb:PNBLACKLIST[bpftool] =
> "Needs forward porting to kernel 5.2+"
>
>
> sources/meta-yoe:
>     * conf/distro/yoe.inc:PNBLACKLIST[build-appliance-image] = "tries
> to include whole downloads directory in /home/builder/poky :/"
>     * conf/distro/yoe.inc:PNBLACKLIST[smartrefrigerator] = "Needs
> porting to QT > 5.6"
>     * conf/distro/yoe.inc:PNBLACKLIST[qmlbrowser] = "Needs porting to QT > 5.6"
>     * conf/distro/yoe.inc:PNBLACKLIST[minehunt] = "Needs porting to QT > 5.6"
>     * conf/distro/yoe.inc:PNBLACKLIST[homeautomation] = "Needs porting
> to QT > 5.6"
>     * conf/distro/yoe.inc:PNBLACKLIST[samegame] = "Needs porting to QT > 5.6"
>     * conf/distro/yoe.inc:PNBLACKLIST[applicationlauncher] = "Needs
> porting to QT > 5.6"
>     * conf/distro/yoe.inc:PNBLACKLIST[spacetouch] = "Needs porting to
> libplanes 1.0"
>     * conf/distro/yoe.inc:PNBLACKLIST[qtviewplanes] = "Needs porting
> to libplanes 1.0"
>     * conf/distro/yoe.inc:PNBLACKLIST[egt-thermostat] = "Needs porting
> to egt 0.8.2+"
>
>
> sources/openembedded-core:
>     * meta/recipes-devtools/dnf/dnf_4.2.2.bb:PNBLACKLIST[dnf] ?=
> "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not
> build without package_rpm in PACKAGE_CLASSES due disabled rpm support
> in libsolv', d)}"
>     * meta/recipes-devtools/libdnf/libdnf_0.28.1.bb:PNBLACKLIST[libdnf]
> ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does
> not build without package_rpm in PACKAGE_CLASSES due disabled rpm
> support in libsolv', d)}"
>
>
> conf/local.conf:
>     * PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need
> to be tested so much"
>     * PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to
> be tested so much"
>     * PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to
> be tested so much"
>     * PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need
> to be tested so much"
>     * PNBLACKLIST[build-appliance-image] = "tries to include whole
> downloads directory in /home/builder/poky :/"
>
> === QA issues (0) ===
> {| class=wikitable
> !| Count ||Issue
> |-
> ||0 ||already-stripped
> |-
> ||0 ||build-deps
> |-
> ||0 ||compile-host-path
> |-
> ||0 ||file-rdeps
> |-
> ||0 ||host-user-contaminated
> |-
> ||0 ||installed-vs-shipped
> |-
> ||0 ||invalid-pkgconfig
> |-
> ||0 ||ldflags
> |-
> ||0 ||libdir
> |-
> ||0 ||pkgname
> |-
> ||0 ||qa_pseudo
> |-
> ||0 ||symlink-to-sysroot
> |-
> ||0 ||textrel
> |-
> ||0 ||unknown-configure-option
> |-
> ||0 ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.signatures.20200309_212117.log/
>
> No issues detected
>
>
> QA issues by type:
> count: 0 issue: already-stripped
>
>
> count: 0 issue: libdir
>
>
> count: 0 issue: textrel
>
>
> count: 0 issue: build-deps
>
>
> count: 0 issue: file-rdeps
>
>
> count: 0 issue: version-going-backwards
>
>
> count: 0 issue: host-user-contaminated
>
>
> count: 0 issue: installed-vs-shipped
>
>
> count: 0 issue: unknown-configure-option
>
>
> count: 0 issue: symlink-to-sysroot
>
>
> count: 0 issue: invalid-pkgconfig
>
>
> count: 0 issue: pkgname
>
>
> count: 0 issue: ldflags
>
>
> count: 0 issue: compile-host-path
>
>
> count: 0 issue: qa_pseudo
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
> ~/oe/world/yoe ~/oe/world/yoe


