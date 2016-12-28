Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B8F2C60053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 21:44:39 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so55691603wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gkxkGqZfTm5TUKQtQcK0MdJD8gt43L4WG5p73DWI2h8=;
	b=ac2U6wId1Wk7qY7mB8j04V0oxktCwDYHYLY+UYCCRrcpXx9uQYBN2e3SqFXiACp5gM
	x09CFWOoSfYMSmqapgl4uuqfcdCNfK3LdvzUIhOcTrf6HSw8PeSfqcAxw6+X51jyJjtk
	38pxOFaK40jONMyBdEdgLl8RWeBElISPWqOWkwIiVgME7zeuJ7FYTs2Qfoj0pAUt9HYu
	SZAU/a0LtpqSrY4FWi79KMoTsCI9DujrKhYR7uvBg+gCwkR40PsrA5V6t+QeHi7ncPAT
	dAaCMy2M+u6ulyGUzytKVXpayhQtsStaQ71zH1/Qs9YGmwbooEmIigAI7+1GBhw5hzbY
	x+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gkxkGqZfTm5TUKQtQcK0MdJD8gt43L4WG5p73DWI2h8=;
	b=K+O8N8p+V/CUiTg8p6miE4Nnet3pUmYvIkRoYsISsogGDJRx/5D+9HEQakavE8wrC+
	XtbpJHrZIL29YLgaz6lvPqZJ9j2PaWfo6AafuEQnf9pY3vRY3phEpnsfJtYIX8ZFSiUf
	BDQUYJxzenyD8SR0GvcIoCh5nEd2NXkLENI5yAIKnvUpaZLDyw9L2Takx1wwbeCGhcPs
	oSsUF4kC+y6oX2Wb3GzJ+HX33rGkH74OUQnFUVrQd6YIcxCXnhajy3is9/spwR25wv/j
	HRl3USshTlU6vZ5z5JwI+eE2PM+uSACKhUF7DjWsWZAysXVok57KJDDT0wj6CORNLfUc
	MtYg==
X-Gm-Message-State: AIkVDXIzfNy7Q7SQoND2gRItZfJFqxAoYMLqnibbJhZrEQdDXNt2Stpy/Y11+5pvaly3r0TV674k/4Z2gvY3qQ==
X-Received: by 10.194.41.163 with SMTP id g3mr33152856wjl.162.1482961480202;
	Wed, 28 Dec 2016 13:44:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 28 Dec 2016 13:44:39 -0800 (PST)
In-Reply-To: <CA+chaQcPbbhV8i2zRNxZZ1dwWQbvX7uxiT-j9V0ESt9M0mzziQ@mail.gmail.com>
References: <1482949868-19842-1-git-send-email-moritz.fischer@ettus.com>
	<CA+chaQcPbbhV8i2zRNxZZ1dwWQbvX7uxiT-j9V0ESt9M0mzziQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Dec 2016 22:44:39 +0100
Message-ID: <CA+chaQc8LPkxrjM+cTWdYK1Sotud773W1ypm5rWyjckPXr2ZKA@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: mdf@kernel.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Philip Balister <philip@opensdr.com>
Subject: Re: [PATCH] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 28 Dec 2016 21:44:40 -0000
Content-Type: text/plain; charset=UTF-8

> the email subject should mention which layer you want it applied
to (though one can determine it based on context, best practice is to
include it).

From the path starting with meta/ it looks like oe-core, then it needs to
be sent to openembedded-core ML, not openembedded-devel.

On Wed, Dec 28, 2016 at 10:43 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

>
>
> On Wed, Dec 28, 2016 at 7:31 PM, Moritz Fischer <moritz.fischer@ettus.com>
> wrote:
>
>> Add a recipe to build 'ectool', a utility to interact with the embedded
>> controller on Google's Chromebooks (and other platforms using it).
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>> ---
>>  .../chromium-utils/chromium-utils.bb               | 26
>> ++++++++++++++++++++++
>>  .../0001-build-Add-HOST_LDFLAGS.patch              | 26
>> ++++++++++++++++++++++
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 meta/recipes-devtools/chromium-utils/
>> chromium-utils.bb
>>  create mode 100644 meta/recipes-devtools/chromium
>> -utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
>>
>> diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils.bb
>> b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
>> new file mode 100644
>> index 0000000..c351717
>> --- /dev/null
>> +++ b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION = "Chromium EC utilities"
>>
>
> Use SUMMARY for short description like this.
>
>
>> +DEPENDS = "libftdi"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca36"
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
>>
>
> Why is this needed?
>
>
>> +
>> +SRCREV = "b19bb1f22a3fd0102030485d324c0321a18827e8"
>> +SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;prot
>> ocol=https \
>> +           file://0001-build-Add-HOST_LDFLAGS.patch \
>> +         "
>> +
>> +PV="1.1.9999-${SRCPV}"
>>
>
> We usually use something like:
> PV = "1.1.9999+gitr${SRCPV}"
>
> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile() {
>> +       oe_runmake HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}"
>> HOST_LDFLAGS="${LDFLAGS}" utils
>>
>
> Why not use EXTRA_OEMAKE for these added variables?
>
>
>> +}
>> +
>> +do_install() {
>> +       install -m 0755 -d ${D}${bindir}
>> +       install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
>> +}
>> +
>> +FILES_${PN} = "${bindir}"
>> diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
>> b/meta/recipes-devtools/chromium-utils/chromium-utils/0001-
>> build-Add-HOST_LDFLAGS.patch
>> new file mode 100644
>> index 0000000..46e8cad
>> --- /dev/null
>> +++ b/meta/recipes-devtools/chromium-utils/chromium-utils/0001-
>> build-Add-HOST_LDFLAGS.patch
>> @@ -0,0 +1,26 @@
>> +From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
>> +From: Moritz Fischer <moritz.fischer@ettus.com>
>> +Date: Tue, 27 Dec 2016 22:24:07 -0800
>> +Subject: [PATCH] build Add HOST_LDFLAGS
>> +
>> +Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>> +---
>> + Makefile.rules | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile.rules b/Makefile.rules
>> +index 404454d..0057ba9 100644
>> +--- a/Makefile.rules
>> ++++ b/Makefile.rules
>> +@@ -60,7 +60,7 @@ cmd_c_to_build = $(BUILDCC) $(BUILD_CFLAGS) \
>> +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c))
>> $*.c) \
>> +                $(BUILD_LDFLAGS) \
>> +                -MMD -MF $@.d -o $@
>> +-cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d  -o $@ \
>> ++cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF $@.d
>> -o $@ \
>> +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c))
>> $*.c)
>> + cmd_cxx_to_host = $(HOSTCXX) -std=c++0x $(COMMON_WARN) $(HOST_CXXFLAGS)\
>> +       -I ./$($(notdir $@)_ROOT) -o $@ $(filter %.cc,$^) $($(notdir
>> $@)_LIBS)
>> +--
>> +2.4.11
>> +
>> --
>> 2.7.4
>>
>>
>

