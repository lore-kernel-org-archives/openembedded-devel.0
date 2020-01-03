Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD80D7F969
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 18:08:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p14so23850850pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2020 10:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=rpql6h9DsTdGIhwY++JYUcvub+k4WBOW8e1/At7sWlg=;
	b=BaVvyfjynmjMJdnPUQETmCN71q6xhF8g4ssAZdtI010wE9x0FfwjExj9zsEW5su13T
	3vh9XId+BsO1SsS0XUhfmlfb6nNoB4Cvteenr5ICZxvxNb0GE/ANPC+kxYF0AaHassex
	pYp3iMXqXY8Xl9vB+sFTs93s6gDurmPCMoxjLAaUg9fK6Bw2rMoRxpnGEYfiwlgVw8Zo
	NHKpQkfOqb9hUSK07o3I2GDk2BEa8Xpf1raB9PraB9nPyYSmr1MKiA33VhHoVNwVvLCL
	gl5g3AgzPoTXdjPiu9o69ob57aE5TIPO5x2YApo+ntLkc6Qz22w1+grotHNZrQseysqE
	H6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=rpql6h9DsTdGIhwY++JYUcvub+k4WBOW8e1/At7sWlg=;
	b=d7REFpN35zxcicLM3K8rD6e+PoO9sl0b8hPQf40SKcxu3zjPRq1SFFr0Ofmbaw9IDK
	19o34059UglI1E4xmyx39yW/+EE6nB0AtcvH3QJ5r4ynJUoCbe04fJArPG5sf4GHt+Lk
	WiofxBCbCt+XXhkBY5PYcGbo9tREnra4BBYck7jiK9DJkQSJpjAYAe1jUbipxpg/tMCJ
	X86aCWyY00NGGjlMz1LktU9YF9Bqm8HlJJsxxv5vEwO37/0vPFg1KoV2w0XP/nh0mxGv
	RdQbO9ZiRcGLsKNyd5Y2Pt/VZJdkkptoNHkrXCFylCGr7IvCJc1bRoTSgbPXqsvRrele
	C+/A==
X-Gm-Message-State: APjAAAVIBImxKqVOj+Y/549I9hA27B8wDTSeVyfudwPY8V3JsnjKunGX
	qz407MLlN7W5BMDxPFMfFMFniK+EVEE=
X-Google-Smtp-Source: APXvYqyQs4TAjS3fYe17XGZ0ZkqY8/2KhOXTvpsOPJYyd44EdMwaR+v96w4ORk2CF9muIa2aJMRt5g==
X-Received: by 2002:a63:c20c:: with SMTP id b12mr95153575pgd.407.1578074916628;
	Fri, 03 Jan 2020 10:08:36 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:555:ddff:6770:148b?
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	133sm68183806pfy.14.2020.01.03.10.08.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 03 Jan 2020 10:08:36 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
	<CAMKF1spJeTLGUwerZNSjk3W821puo=-wsGaDCUd6B4q6PL5uvw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8e3274f5-1aa9-d9c6-0dee-d1eec74531dd@gmail.com>
Date: Fri, 3 Jan 2020 10:08:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spJeTLGUwerZNSjk3W821puo=-wsGaDCUd6B4q6PL5uvw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus 00/17] Patch review
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
X-List-Received-Date: Fri, 03 Jan 2020 18:08:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/2/20 7:38 PM, Khem Raj wrote:
> On Thu, Jan 2, 2020 at 6:49 PM Armin Kuster <akuster808@gmail.com> wrote:
>> Please have comments back by Saturday.
>>
>> The following changes since commit fbe4cf8d56eea586c096621e7c913b24bd99c9c6:
>>
>>   gtkwave: add the libtirpc dependence and config (2019-12-17 21:57:51 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>>
>> Adrian Bunk (3):
>>   networkmanager: Upgrade 1.18.2 -> 1.18.4
>>   gpsd: Backport a memory leak fix
>>   libqmi: Upgrade 1.24.0 -> 1.24.2
>>
>> Changqing Li (1):
>>   xfce-dusk-gtk3: correct invalid SRC_URI
>>
>> Hongxu Jia (1):
>>   python-more-itertools: downgrade 7.2.0 -> 5.0.0
>>
>> Kai Kang (1):
>>   fltk: fix build error when enable package config examples
>>
>> Khem Raj (9):
>>   grpc: Define libdir and cmakedir in terms of multilib
>>   tinyalsa: fix installation libdir path to match multilibs
>>   libqb: Add --enable-nosection-fallback with mips64/clang
>>   x11vnc: Fix build for 32bit arches with 64bit time_t
>>   evtest: Fix build for 32bit arches with 64bit time_t
>>   lirc: Fix build for 32bit arches with 64bit time_t
>>   utouch-evemu,utouch-frame: Fix build for 32bit arches with 64bit
>>     time_t
>>   directfb: Fix build for 32bit arches with 64bit time_t
>>   ruli: Fix install step and build samples too
>>
> 64bit time_t fixes are not necessary but are not hurtful either, since the
> C libraries in zeus do not have the needed bits to enable 64bit time_t
> so unless someone else has issues with it, I am fine to bring them to zeus
will drop the 64bit time_t changes.

- armin
>
>> Stefan Agner (1):
>>   networkmanager: do not deploy unnecessary udev rule file
>>
>> zhangxiao (1):
>>   syslog-ng: Fix multilib header conflict - syslog-ng-config.h
>>
>>  .../recipes-multimedia/tinyalsa/tinyalsa.bb   |   4 +-
>>  ...L_-path-instead-of-hardcoding-bin-li.patch |  46 +++++
>>  ...ger_1.18.2.bb => networkmanager_1.18.4.bb} |   9 +-
>>  .../recipes-devtools/grpc/grpc_1.24.1.bb      |   4 +-
>>  ...-Fix-build-with-format-string-checks.patch |  29 ++-
>>  ...ake-space-for-flags-from-environment.patch |  95 +++++++++
>>  ...v-Mark-prev_addr_list_size-as-unused.patch |  35 ++++
>>  .../recipes-support/ruli/files/Makefile.patch | 122 ------------
>>  .../recipes-support/ruli/ruli_0.36.bb         |  23 ++-
>>  .../{libqmi_1.24.0.bb => libqmi_1.24.2.bb}    |   4 +-
>>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  40 ++++
>>  .../recipes-connectivity/lirc/lirc_0.9.4d.bb  |   1 +
>>  meta-oe/recipes-extended/libqb/libqb_1.0.5.bb |   6 +-
>>  .../recipes-graphics/directfb/directfb.inc    |   3 +-
>>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 139 +++++++++++++
>>  ...ld-on-32bit-arches-with-64bit-time_t.patch | 111 +++++++++++
>>  .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   5 +-
>>  .../0001-gps_shm_close-Free-privdata.patch    |  37 ++++
>>  meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb  |   1 +
>>  meta-oe/recipes-support/fltk/fltk.bb          |   7 +-
>>  ...-when-enable-package-config-examples.patch | 182 ++++++++++++++++++
>>  .../recipes-support/syslog-ng/syslog-ng.inc   |   4 +-
>>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  76 ++++++++
>>  .../utouch/utouch-evemu_git.bb                |   4 +-
>>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  41 ++++
>>  ...tat.h-for-fixing-build-issue-on-musl.patch |   0
>>  .../remove-man-page-creation.patch            |   0
>>  .../utouch/utouch-frame_git.bb                |   1 +
>>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  41 ++++
>>  meta-oe/recipes-test/evtest/evtest_1.34.bb    |   6 +-
>>  .../python/python-more-itertools.inc          |   3 -
>>  .../python/python-more-itertools_5.0.0.bb     |   7 +
>>  .../python/python-more-itertools_7.2.0.bb     |   2 -
>>  .../python/python3-more-itertools_7.2.0.bb    |   3 +
>>  .../xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb      |   2 +-
>>  35 files changed, 935 insertions(+), 158 deletions(-)
>>  create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
>>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (94%)
>>  create mode 100644 meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
>>  create mode 100644 meta-networking/recipes-support/ruli/files/0001-ruli_srv-Mark-prev_addr_list_size-as-unused.patch
>>  delete mode 100644 meta-networking/recipes-support/ruli/files/Makefile.patch
>>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb} (85%)
>>  create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>  create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>  create mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
>>  create mode 100644 meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
>>  create mode 100644 meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>  create mode 100644 meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>  rename meta-oe/recipes-support/utouch/{files => utouch-frame}/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch (100%)
>>  rename meta-oe/recipes-support/utouch/{files => utouch-frame}/remove-man-page-creation.patch (100%)
>>  create mode 100644 meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
>>  delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


