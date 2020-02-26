Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE2660B74
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 23:28:21 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c16so1107558ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8S9+zaGuz0rlKXjcyt3u7bRzIlfJ640H5NACy9UmXmY=;
	b=ulK8CxvQV1ikGXAGSbQ3vIW145ZMpS3bnrsGyW2jymZ6sI5mr18+GuFyD40GPsWQ0L
	kanzUu1QqdebR/qXc9gMtDNr8mdn8RLv+qg+ay3fwO+nSRomnanSJOf8EgKKrjKTIO/m
	H1RmFrKvgWuKJUbNtl3t6w5jYcUpHag6Dzi++tAAJYGmc8L00YT/nqLxi3G1rdUQz1ol
	gunBsNM1f+XIT3a+VLgOOSGChzPffD7JFqCvVAHNL5QULuiYXVO8s0+bCWAkG+ttPF80
	jfzu29epiWDfc07ztKit8nT+i6ou3KHny6z9Mz/Wi6Ry8r2miE1wLTdBrdoduSJACyBy
	JRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8S9+zaGuz0rlKXjcyt3u7bRzIlfJ640H5NACy9UmXmY=;
	b=fAspya6fECslUqO/tJ9Kn7PJ+sVe3sR7JSRumCzMpYV7bpdsDIGV11LHt8569TqMMt
	qkW9uR/QQHmLVLy0C33ofqUJysuBUla3qIJ0PQDzHO6kc0UMj4PpM5litzPzVds+KqKh
	efrHu6Pr8gp3bmYSQNvMl8wI34UwbeG0U9tPk85JsxBWFzYs/LN2fB9gAXpNxajzioDi
	VwWZkvtj+ZlK62tClxallpmXCHGc4sZ+u484tktsP5jWf5MIv+V/Z/lWDLFPPPVztxkS
	7zXt0evHV86V+aI0yCzHeErD2a5UwNckHr7uBEO7JFGQeEySBP8guvI63JHOuZg+xpUT
	JAXQ==
X-Gm-Message-State: APjAAAXR0HeYZgLOJVkravG5Qqf60oVM39yTu3ac8hUauEkCJ0R1BHVa
	EAnEQNPm6N6HPH1rLb0igrHiq1xT4tI=
X-Google-Smtp-Source: APXvYqyusOJZ7zg1IwdbtobgdOZjZeH3j/6kI2xvnJqpduR8vuWAq4lvHQLgRNS2mOI1nN+TIPBsYA==
X-Received: by 2002:a05:6602:2207:: with SMTP id
	n7mr1002777ion.281.1582759701551; 
	Wed, 26 Feb 2020 15:28:21 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
	([2601:646:9200:4e0:19c7:2796:79bc:80ea])
	by smtp.gmail.com with ESMTPSA id b5sm449166iob.80.2020.02.26.15.28.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 26 Feb 2020 15:28:21 -0800 (PST)
To: Jonathan Richardson <jonathan.richardson@broadcom.com>
References: <20200226202909.18208-1-jonathan.richardson@broadcom.com>
	<d9064877-aec4-47c8-f2d4-093d3b02174f@gmail.com>
	<CAHrpVsX4JUU-zFzu_KSz6DufwAQXKv0eHNUmq=0aOKuRMv7RdQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <72fec2ec-dc7e-7a7f-6062-8f4baca19ab5@gmail.com>
Date: Wed, 26 Feb 2020 15:28:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHrpVsX4JUU-zFzu_KSz6DufwAQXKv0eHNUmq=0aOKuRMv7RdQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/1] open-lldp: Add initial version 1.0.1
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
X-List-Received-Date: Wed, 26 Feb 2020 23:28:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/26/20 2:54 PM, Jonathan Richardson wrote:
> On Wed, Feb 26, 2020 at 12:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Thanks Jonathan, I have few more comments.
>>
>> On 2/26/20 12:29 PM, Jonathan Richardson via Openembedded-devel wrote:
>>> Open-LLDP provides a Link Layer Discovery Protocol agent that supports
>>> DCB (Data Center Bridging). The tc utility from iproute is needed to
>>> manipulate  traffic control settings in the kernel.
>>>
>>> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
>>> ---
>>>    .../0001-Fix-musl-libc-build-issue.patch      | 25 ++++++++
>>>    ...tion-to-disable-installation-of-syst.patch | 57 +++++++++++++++++++
>>>    .../openlldp/openlldp_1.0.1.bb                | 39 +++++++++++++
>>>    3 files changed, 121 insertions(+)
>>>    create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
>>>    create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
>>>    create mode 100644 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
>>>
>>> diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
>>> new file mode 100644
>>> index 000000000..d8d5df218
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
>>> @@ -0,0 +1,25 @@
>>> +From b20d64f814c15efbd6a19aacfbfecf15083a83dc Mon Sep 17 00:00:00 2001
>>> +From: Jonathan Richardson <jonathan.richardson@broadcom.com>
>>> +Date: Wed, 26 Feb 2020 12:16:38 -0800
>>> +Subject: [PATCH] Fix musl libc build issue
>>> +
>>> +clif.h should include sys/types.h for the definition of pid_t. It fails
>>> +to compile when using musl libc.
>>> +
>>> +Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
>>> +---
>>> + include/clif.h | 1 +
>>> + 1 file changed, 1 insertion(+)
>>> +
>>> +diff --git a/include/clif.h b/include/clif.h
>>> +index 648eedf..92f4fd8 100644
>>> +--- a/include/clif.h
>>> ++++ b/include/clif.h
>>> +@@ -32,6 +32,7 @@
>>> + #ifndef CLIF_H
>>> + #define CLIF_H
>>> +
>>> ++#include <sys/types.h>
>>> + #include <sys/un.h>
>>> + #include "clif_sock.h"
>>> +
>>> diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
>>> new file mode 100644
>>> index 000000000..86c9f4463
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
>>> @@ -0,0 +1,57 @@
>>> +From 1c1e01b2414ca5b3cf5a21b6e6389f9ca82fd7e9 Mon Sep 17 00:00:00 2001
>>> +From: Jonathan Richardson <jonathan.richardson@broadcom.com>
>>> +Date: Fri, 6 Apr 2018 10:49:04 -0700
>>> +Subject: [PATCH 1/1] autotools: Add option to disable installation of systemd
>>> + conf files
>>> +
>>> +Add option to configure.ac to enable or disable install of systemd conf
>>> +files. If --with-systemdsystemunitdir is passed to configure then the
>>> +files will be installed to the provided directory. If the option isn't
>>> +provided then the value is determined from the systemd pkgconfig file,
>>> +if found in PKG_CONFIG_PATH.
>>> +
>>> +This change is required because Makefile.am always installed the files
>>> +to a hard coded path that couldn't be changed.
>>> +---
>>> + Makefile.am  | 3 ++-
>>> + configure.ac | 9 +++++++++
>>> + 2 files changed, 11 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/Makefile.am b/Makefile.am
>>> +index 551d4c7..5491c61 100644
>>> +--- a/Makefile.am
>>> ++++ b/Makefile.am
>>> +@@ -133,8 +133,9 @@ install-data-hook:       installdirs-local
>>> + pkgconfigdir = ${libdir}/pkgconfig
>>> + pkgconfig_DATA = lldpad.pc liblldp_clif.pc
>>> +
>>> +-systemdsystemunitdir = $(prefix)/lib/systemd/system
>>> ++if HAVE_SYSTEMD
>>> + dist_systemdsystemunit_DATA = lldpad.service lldpad.socket
>>> ++endif
>>> +
>>> + bashcompletiondir = $(sysconfdir)/bash_completion.d
>>> + dist_bashcompletion_DATA = contrib/bash_completion/lldpad contrib/bash_completion/lldptool
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 0667446..f75f433 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -95,6 +95,15 @@ AC_TYPE_UINT16_T
>>> + AC_TYPE_UINT32_T
>>> + AC_TYPE_UINT8_T
>>> +
>>> ++# Support for systemd unit files.
>>> ++AC_ARG_WITH([systemdsystemunitdir],
>>> ++        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
>>> ++        [], [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
>>> ++if test "x$with_systemdsystemunitdir" != xno; then
>>> ++        AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
>>> ++fi
>>> ++AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
>>> ++
>>> + AC_CONFIG_FILES([Makefile include/version.h lldpad.spec lldpad.pc liblldp_clif.pc])
>>> + AC_CONFIG_MACRO_DIR([m4])
>>> + AC_OUTPUT
>>> +--
>>> +1.9.1
>>> +
>>> diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
>>> new file mode 100644
>>> index 000000000..ef8d780c6
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
>>> @@ -0,0 +1,39 @@
>>> +SUMMARY = "Open-LLDP"
>>> +DESCRIPTION = "Link Layer Discovery Protocol for Linux that includes support for DCBX"
>>> +HOMEPAGE = "http://open-lldp.org/start"
>>> +
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit pkgconfig autotools
>>> +inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', '', d)}
>>> +
>>> +DEPENDS = "libnl libconfig readline"
>>> +
>>> +SRCREV = "36d729de7ce5b56cf061d94d610cf0510154820c"
>>> +SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master \
>>> +           file://0001-autotools-Add-option-to-disable-installation-of-syst.patch \
>>> +           file://0001-Fix-musl-libc-build-issue.patch \
>>> +           "
>>> +
>>> +# Even though .ac allows disabling -Werror, Makefile.am adds it to AM_CFLAGS
>>> +# causing it to always be enabled. There are warnings so disable it.
>>> +TARGET_CFLAGS += "-Wno-error"
>>
>> is there configure option --disable-werror, we should use that if available.
> 
> No unfortunately it's not supported. I'll fix the comment. .ac doesn't
> allow disabling
> of Werror. Support would have to be added to .ac.

OK, I think this should be fine. Ideally we should try to fix the warnings.

> 
>>
>>> +
>>> +# configure.ac generates version.h from include/version.h.in but autotools puts
>>> +# build artefacts in $B, not $S and the header can't be found. To avoid
>>> +# inheriting autotools-brokensep and messing up the source dir just tell Makefile
>>> +# where it is.
>>> +TARGET_CFLAGS += "-I ${B}/include"
>>
>> Can we avoid using B here.
> 
> The output file from AC_CONFIG_FILES goes to $B and this path isn't included
> automatically by autoconf. inheriting autotools-brokensep would avoid
> the problem.
> I can add another patch but there doesn't seem to be a variable for
> the output dir
> of this macro that I could use in cflags.. or at least I can't find it.

ah I see. Its perhaps using ${srcdir} in Makefile.am. I think you should 
be able to fix it by modifying AM_CPPFLAGS in Makefile.am to use 
I${top_builddir}/include, such a patch should be sent upstream as well 
to fix out of tree builds. Its a good thing.

> 
>>
>>> +
>>> +# Enable install of systemd conf files.
>>> +EXTRA_OECONF += "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"
>>
>> we should be checking for systemd in DISTRO_FEATURES here.
> 
> Ok.
> 
>>
>>> +
>>> +SYSTEMD_SERVICE_${PN} = "lldpad.service lldpad.socket"
>>> +
>>> +# To enable service at boot set to enable in local.conf.
>>> +SYSTEMD_AUTO_ENABLE ?= "disable"
>>> +
>>> +RRECOMMENDS_${PN} = "iproute2-tc"
>>>

