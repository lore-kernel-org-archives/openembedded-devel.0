Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD2C78A10
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 17:09:51 +0000 (UTC)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 302FA2086E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1530810592;
	bh=CvRHHvf1ZL4ZcfTvBn4+e8qGy+EXbSj9x7MZg/q5Cdo=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=PF8W7R8Be0U5TfyO6fMS76/uwKoLiOsxlXjQRJk5Q+mgvYzRBUlryTuOpRhxuFfla
	hmi67Ga8hjZIqrLtSi6L/uVjoy+16J3ourXqHoR0UbGiQUSeRONMw9Cspbemk/KFJL
	mz+NpVNFIEmh0llnSypMufft9kQDzvq3XXILjdyE=
Received: by mail-wm0-f48.google.com with SMTP id i139-v6so12303093wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 10:09:52 -0700 (PDT)
X-Gm-Message-State: APt69E1IU/l7I/Hno3KItJLBpG7br+3S0n+Go+LzxaHtJxsA3pILtqr1
	rrw7imJiX5lod2aZP5j3+oLAwmTDbTq1oZvth1k=
X-Google-Smtp-Source: AAOMgpcl5fwrcjXcxYUlKM3V8jOXWkgRnPl3LNiYCM1G+QfwWqPrR+WyHdChAZFqKEhCMH3JA/39vheZd0pU84uJJLI=
X-Received: by 2002:a1c:ce0a:: with SMTP id
	e10-v6mr4236098wmg.135.1530810590709; 
	Thu, 05 Jul 2018 10:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9166:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 10:09:50 -0700 (PDT)
In-Reply-To: <a3b348af-5c71-f8f9-d5a9-cc5e7ab2cd14@gmail.com>
References: <20180705165513.28142-1-krzk@kernel.org>
	<20180705165513.28142-4-krzk@kernel.org>
	<a3b348af-5c71-f8f9-d5a9-cc5e7ab2cd14@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 5 Jul 2018 19:09:50 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeV3KkvZ_rFSgi=KyBND2PNyqpQJsxBsQ16-NHDvsY3GA@mail.gmail.com>
Message-ID: <CAJKOXPeV3KkvZ_rFSgi=KyBND2PNyqpQJsxBsQ16-NHDvsY3GA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v4 3/3] kernel_wireless_regdb: Add class for embedding regulatory data into older kernel
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
X-List-Received-Date: Thu, 05 Jul 2018 17:09:51 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 July 2018 at 19:07, Khem Raj <raj.khem@gmail.com> wrote:
> On 7/5/18 9:55 AM, Krzysztof Kozlowski wrote:
>> Linux kernels before v4.15, allowed to be compiled with static
>> regulatory dabatase if it was put under net/wireless/db.txt.
>>
>> Add kernel_wireless_regdb class which allows in such cases to embed the
>> wireless regulatory database directly in the Linux kernel during build
>> process.
>>
>> Usage:
>> 1. The class should be inherited by kernel recipe (e.g. in
>>    linux-yocto_%.bbappend).
>> 2. For Linux kernels up to v4.14, build kernel with CONFIG_EXPERT and
>>    CONFIG_CFG80211_INTERNAL_REGDB.
>
> I think it will be good to add this in comments in bbclass as well.

Sure.

>
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>  meta-networking/classes/kernel_wireless_regdb.bbclass         | 11 +++++++++++
>>  .../wireless-regdb/wireless-regdb_2018.05.31.bb               | 10 ++++++++++
>>  2 files changed, 21 insertions(+)
>>  create mode 100644 meta-networking/classes/kernel_wireless_regdb.bbclass
>>
>> diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
>> new file mode 100644
>> index 000000000000..a1eb4c532667
>> --- /dev/null
>> +++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
>> @@ -0,0 +1,11 @@
>> +# Copies the regulatory plaintext database to kernel sources before compiling.
>> +# Linux kernel must be compiled with CONFIG_CFG80211_INTERNAL_REGDB to use it.
>> +
>> +DEPENDS += "wireless-regdb-native"
>> +
>> +SRCTREECOVEREDTASKS += "do_kernel_add_regdb"
>> +do_kernel_add_regdb() {
>> +    cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
>> +}
>> +do_kernel_add_regdb[dirs] = "${S}"
>> +addtask kernel_add_regdb before do_build after do_configure
>> diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
>> index d40756ff2bbf..0b7930718761 100644
>> --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
>> +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
>> @@ -23,6 +23,7 @@ do_install() {
>>
>>  # Install static regulatory DB in /lib/firmware for kernel to load.
>>  # This requires Linux kernel >= v4.15.
>> +# For kernel <= v4.14, inherit the kernel_wireless_regdb.bbclass in kernel's recipe.
>>  PACKAGES =+ "${PN}-static"
>>  RCONFLICTS_${PN} = "${PN}-static"
>>
>> @@ -31,4 +32,13 @@ FILES_${PN}-static = " \
>>      ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
>>  "
>>
>> +# Native users might want to use the source of regulatory DB.
>> +# This is for example used by Linux kernel <= v4.14 and kernel_wireless_regdb.bbclass.
>> +do_install_append_class-native() {
>> +    install -d -m 0755 ${D}${libdir}/crda
>
> add -D to below cmd and you can avoid this line.

Thanks for review, I'll fix them in v5.

Best regards,
Krzysztof

