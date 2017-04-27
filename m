Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7A72D6FF69;
	Thu, 27 Apr 2017 10:27:40 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id i137so4419047wmf.0;
	Thu, 27 Apr 2017 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GA11O5L3AwAhvhW495k/J04VjyoJ3oh3yJRVGquaEB8=;
	b=LJdixKP+rhTQ/qfBy0H+Xr/rN13dI9dfD5BIiE1bRO99Vh0xD2KVcropyfcM8LzbI2
	CA+gijm0gc1x3KZm7CudeYv/zVqfZuEirHu7/EEVjQip2XosckuBnFgRCD8yz/Xl17yR
	IXU74GfHwfXt6xRN6BWJCiiRoNZ/Nzq/MhXd7quRYCynuQm1xHSpR372owERJ+asHGFr
	uljuqcK2vef2fgjNHCw22IXPZvyLFRU8P3tzcvbD7ci49vOZHAwaFUixbR41ov2xbCM6
	hcD4ceymVb4ky1od9HpuRr2bgBMH8MqDx+QXE13RdcZleokRG7DvqWw5PfhZ+Yr3hAQ9
	HYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GA11O5L3AwAhvhW495k/J04VjyoJ3oh3yJRVGquaEB8=;
	b=pbN4NIkQN0c0VNLWcL4OSV5faBdKa4UZnuvVAL/yjrmcKggZE1eTKYaG+Qt+6n+Eou
	MZ9Jrn+wFQIkYYYIN+Z+UmCLIsai4OH8S93e8J8IcK+EN+z7hIp7P4K9SNuD18fQ4A09
	aLjIfczqseQ8xZger++WGK/69HXdz4lroFJUvpJslyWGeP/AOn4lttwLMWgw5UNRVN9g
	XEGnOaPsJHqHn/f5uVKL7JcrpZs3c8VVAPLhRKmOuH6aqp/mfVc1zA1soicBy+DtvKv6
	or7vmNvaUyfQsXmleRVCCRis5/Bk8V7c77sv1wONyO8KeVtacNSBBZ17ZF/w5TfuQKAQ
	cIBQ==
X-Gm-Message-State: AN3rC/5ZDXJhPcN+RPbBqn68lqPvG+LB0GjHv/5/0V84KDxR+kiIiocz
	IN9x5Q+iOgCsEoNHM/dHODzZs+ANGUxo
X-Received: by 10.80.136.74 with SMTP id c10mr4057327edc.168.1493288860983;
	Thu, 27 Apr 2017 03:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 27 Apr 2017 03:27:40 -0700 (PDT)
In-Reply-To: <20170427090921.GA3721@jama>
References: <20170427090921.GA3721@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Apr 2017 12:27:40 +0200
Message-ID: <CA+chaQc9YF0j2+Scdj3KQ9_wG0xatnLyNC=XdfqCtQw4Ts_0Xg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of bitbake world, Failed tasks 2017-04-26
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
X-List-Received-Date: Thu, 27 Apr 2017 10:27:41 -0000
Content-Type: text/plain; charset=UTF-8

One of the builds was showing tiptop failure:
http://errors.yoctoproject.org/Errors/Details/141293/

I wonder if there is still some undeterministic behavior related to flex.

It shouldn't be able to use host's flex due to HOSTTOOLS filtering.
It doesn't have the dependency on flex-native, but clearly it's calling
flex and bison in do_compile. (it has transitive dependency
with "binutils-cross-x86_64.do_prepare_recipe_sysroot" ->
"flex-native.do_populate_sysroot").


On Thu, Apr 27, 2017 at 11:09 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='14'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||ldflags
>      ||compile-host-path     ||
> |-
> ||2017-04-26    ||0     ||0     ||0     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||0
>  ||0             ||0             ||0             ||0             ||0
>      ||0             ||0             ||0             ||0             ||0
>          ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-04-26 ==
>
> INFO: jenkins-job.sh-1.8.20 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170426_225925.log
>
> === common () ===
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (0) ===
> {| class=wikitable
> |-
> || qemuarm      || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170426_081705.log/ ||
> |-
> || qemux86      || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170426_081704.log/ ||
> |-
> || qemux86_64   || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170426_102853.log/ ||
> |}
>
> === PNBLACKLISTs (433) ===
>
> === QA issues (0) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||compile-host-path
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||ldflags
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||0     ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170426_102413.log/
>
> No issues detected
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 0        issue: textrel
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 0        issue: version-going-backwards
>
>
> count: 0        issue: host-user-contaminated
>
>
> count: 0        issue: installed-vs-shipped
>
>
> count: 0        issue: unknown-configure-option
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
> count: 0        issue: ldflags
>
>
> count: 0        issue: compile-host-path
>
>
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> 21d9631 toaster: move release lookup from morty to pyro
> not included in master yet:
> c4b1613 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> e584be7 build-appliance-image: Update to master head revision
> not included in master yet:
> 67114ad qemux86: Add identical qemux86copy variant for tests
> 63e9e9d sstate-sysroot-cruft.sh: Extend the whitelist
> fe744e8 recipes: Replace "cp -a" with "cp -R --no-dereference
> --preserve=mode,links"
> 1b4ca51 buildhistory.bbclass: metadata-revs show repo parent
> 0b100a7 metadata-revs: provide more information
> ef84c55 report-error: Allow to upload reports automatically
> a43df23 Revert "mesa: Contain configure search for llvm"
> d559619 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the
> beginning and separated with dash
> fe46c11 kernel-yocto/kern-tools: fix do_validate_branches clean stage
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> ba89d451 hostapd: 2.5 -> 2.6
> not included in master yet:
> bf67dbb dnsmasq: disable the service by default
> 1a68c94 wireguard: add WireGuard kernel module and tools
> 9076683 strongswan: Split plugins
> ba15077 opensaf: Upgrade to 5.2.0
> 3e445c1 openhpi: add new recipe
> 804160a freeradius: add new recipe
> 26bf7da libnet-ldap-perl: add new recipe
> ff92147 libdata-hexdump-perl: add new recipe
> 7c4d004 libnet-telnet-perl: add new recipe
> aa737b6 libauthen-radius-perl: add new recipe
> 1c747f9 openipmi: add new recipe
> 6ba3579 ipmitool: add new recipe
> 02b4e96 kodi: Make it build again and upgrade to 17.1
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 5f837b4 qttools: add ptest
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
> not included in master yet:
>

