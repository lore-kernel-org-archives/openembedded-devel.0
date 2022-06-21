Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF74C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:56:05 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.44539.1655823360300810237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id A55584B75
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:55:58 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.45.237]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o3fIL-3ZHyBV0; Tue, 21 Jun 2022 16:55:57 +0200
Message-ID: <c0ed10f2-2107-880b-5ab6-ee941980ca21@t-online.de>
Date: Tue, 21 Jun 2022 16:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCHv3] flatbuffers: update to 2.0.6
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <16FAAA6377C274A3.32537@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16FAAA6377C274A3.32537@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1655823357-0143E336-4F1B4568/0/0 CLEAN NORMAL
X-TOI-MSGID: 983323e9-357c-4414-87f7-3a6512e603b1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jun 2022 14:56:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97556

This prevents EXTRA_OECMAKE for class-target from being overwritten 
instead of being appended.

Am 21.06.22 um 16:52 schrieb Markus Volk:
> - fix flatc not found issue
> - build the python3 module as a separate package to allow proper install
> - remove fpic CXXFLAG as it seems to be unneeded
> - use python3-native
> - remove -DCMAKE_BUILD_TYPE=Release option and its outdated comment.
>    After a long discussion the default behavior was changed:
>    https://github.com/google/flatbuffers/pull/5180
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   ...tbuffers_2.0.0.bb => flatbuffers_2.0.6.bb} | 24 +++++--------------
>   .../flatbuffers/python3-flatbuffers_2.0.6.bb  | 15 ++++++++++++
>   2 files changed, 21 insertions(+), 18 deletions(-)
>   rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_2.0.0.bb => flatbuffers_2.0.6.bb} (52%)
>   create mode 100644 meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
> similarity index 52%
> rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
> index bf74f1229..3ca477210 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
> @@ -3,41 +3,29 @@ HOMEPAGE = "https://github.com/google/flatbuffers"
>   SECTION = "console/tools"
>   LICENSE = "Apache-2.0"
>   
> -inherit python3-dir
> +PACKAGE_BEFORE_PN = "${PN}-compiler"
>   
> -PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-${PYTHON_PN}"
> +DEPENDS = "flatbuffers-native"
>   
>   RDEPENDS:${PN}-compiler = "${PN}"
> -RDEPENDS:${PN}-${PYTHON_PN} = "${PN}"
>   RDEPENDS:${PN}-dev += "${PN}-compiler"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRCREV = "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
> +SRCREV = "615616cb5549a34bdf288c04bc1b94bd7a65c396"
>   SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
>   S = "${WORKDIR}/git"
>   
>   CVE_CHECK_IGNORE += "CVE-2020-35864"
>   
> -CXXFLAGS += "-fPIC"
> -BUILD_CXXFLAGS += "-fPIC"
> -
> -# BUILD_TYPE=Release is required, otherwise flatc is not installed
> -EXTRA_OECMAKE += "\
> -    -DCMAKE_BUILD_TYPE=Release \
> +EXTRA_OECMAKE += " \
>       -DFLATBUFFERS_BUILD_TESTS=OFF \
>       -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
>   "
> +EXTRA_OECMAKE:append:class-target = " -DFLATBUFFERS_FLATC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/flatc"
>   
> -inherit cmake
> -
> -do_install:append() {
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -    cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
> -}
> +inherit cmake python3native
>   
>   FILES:${PN}-compiler = "${bindir}"
>   
> -FILES:${PN}-${PYTHON_PN} = "${PYTHON_SITEPACKAGES_DIR}"
> -
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
> new file mode 100644
> index 000000000..cc453da35
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Memory Efficient Serialization Library - Python3 Modules"
> +HOMEPAGE = "https://github.com/google/flatbuffers"
> +SECTION = "console/tools"
> +LICENSE = "Apache-2.0"
> +
> +LIC_FILES_CHKSUM = "file://../LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRCREV = "615616cb5549a34bdf288c04bc1b94bd7a65c396"
> +SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
> +S = "${WORKDIR}/git/python"
> +
> +RDEPENDS:${PN} = "flatbuffers"
> +
> +inherit setuptools3
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97555): https://lists.openembedded.org/g/openembedded-devel/message/97555
> Mute This Topic: https://lists.openembedded.org/mt/91901296/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

