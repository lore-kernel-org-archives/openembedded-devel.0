Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 610D660B34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:12:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u12so11891838pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=E12qppDMewYfi5zO7Uc6gTneBICGzhKC8ZB+rVOlQKQ=;
	b=grNw8LNFEnXOQrvsswJ9w5uWC6PTo7vIWwDjsEtLfYSLhdku82NZ2+NyeDgw/7fqVr
	NiK8JvpCPx9ItcAAVkead6JQT0ocEHGjQMmXmtjEdBIL4tyn3GZEjewpMTei3sGIN3zC
	OeYNdv3VA1ar75zMhRZ10qebrlzQqMoIqAHcmgJtxcARY7kfp13ESJlzy1FMoWLzb5BW
	BbTZd/AKJfMZ2rOz//qCj86XcqVBkMaw1QWFGpGBwN/kDMfMksooKlOQeEuhNEaqfLmG
	soOR0ByHaEqpEo4JRRxfpKzHc09MUQCfSPoamth524jhsEVF4sZed/xdDzPYlxwWdssv
	CDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=E12qppDMewYfi5zO7Uc6gTneBICGzhKC8ZB+rVOlQKQ=;
	b=CFZf1o+9MNcIY4jRFRbuqUD410TGA/UMGKRe2p0XKE1rh6e9pv/jsAjDVCUXdIQS92
	cyILbsmESH9uaD3k8jHuya1z9GjXL3gontx1PlXtaBbF27LLz/6NUVyiW7bHB8nQD+cH
	u9zwLEb2X78TBluzzyBWuSlWkT8meJzisHKMefslo75NsQQ6B+lD1ZYBeoESk3B3Bpmf
	FYPzL3S130cYSqA8xgwwIw3uLYHfOyNQi90RYs2YBuTJj8c5RcUgcM628pTTmBvAKmVs
	9GbPYMUbYctaLbG8wm/UmW5eDtGZJ2BTloAtb9IHZ8uE2Cqy6IwNY1SUJ/hjH2wJUYTS
	BmFw==
X-Gm-Message-State: ANhLgQ3Hmz656BD2WxOtwLx1sHWOLW9tOHDTRfm21Crj7ssZjXP1gx7I
	8i13xEpDpTQ5Pi/fXlDccNnlu8+i
X-Google-Smtp-Source: ADFU+vtlZquTrR02vjqrf8VINyLogh8BuaWgBe1OGP9C2tyw1TzfG/DRjehkv9oNEEgZgbvDDgEnJg==
X-Received: by 2002:aa7:9530:: with SMTP id c16mr5896489pfp.157.1584457976842; 
	Tue, 17 Mar 2020 08:12:56 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:8879:dca4:8dd7:7b83?
	([2601:202:4180:a5c0:8879:dca4:8dd7:7b83])
	by smtp.gmail.com with ESMTPSA id
	b20sm2617793pff.51.2020.03.17.08.12.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 08:12:56 -0700 (PDT)
To: Paul Barker <pbarker@konsulko.com>
References: <c68254db-aa96-df47-7b86-179bab336393@gmail.com>
	<20200317150405.578ddb5f@ub1910>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8b1a37c0-ec84-6989-459a-d55c739c055c@gmail.com>
Date: Tue, 17 Mar 2020 08:12:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150405.578ddb5f@ub1910>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: zeus pull request
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
X-List-Received-Date: Tue, 17 Mar 2020 15:12:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/17/20 8:04 AM, Paul Barker wrote:
> On Tue, 17 Mar 2020 07:48:47 -0700
> akuster808 <akuster808@gmail.com> wrote:
>
>> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
>>
>>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/meta-openembedded zeus-next
>>
>> for you to fetch changes up to 9e60d30669a2ad0598e9abf0cd15ee06b523986b:
>>
>>   sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15
>> 13:30:34 -0700)
>>
>> ----------------------------------------------------------------
>> Adrian Bunk (1):
>>       wireshark: Upgrade 3.0.6 -> 3.0.8
>>
>> Carlos Rafael Giani (1):
>>       opencv: Enable pkg-config .pc file generation
>>
>> Khem Raj (2):
>>       ade: Fix install paths in multilib builds
>>       sanlock: Replace cp -a with cp -R --no-dereference
>>
>> Martin Jansa (1):
>>       s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath,
>> wmiconfig: use git fetcher instead of svn fetcher
>>
>> Mike Krupicka (1):
>>       mosquitto: Use mosquitto.init for daemon init
>>
>> Paul Barker (1):
>>       lmsensors: Fix sensord dependencies
>>
>> Peter Kjellerstedt (2):
>>       lvm2, libdevmapper: Do not patch configure
>>       libldb: Do not require the "pam" distro feature to be enabled
>>
>> Ross Burton (4):
>>       opencv: don't download during configure
>>       opencv: also download face alignment data in do_fetch()
>>       opencv: PACKAGECONFIG for G-API, use system ADE
>>       opencv: abort configure if we need to download
>>
>>  .../mosquitto/files/mosquitto.init                 |  2 +-
>>  .../recipes-support/libldb/libldb_1.5.6.bb         |  3 +-
>>  .../{wireshark_3.0.6.bb => wireshark_3.0.8.bb}     |  4 +-
>>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb  |  3 +-
>>  ...lace-cp-a-with-cp-R-no-dereference-preser.patch | 51
>> ++++++++++++++++++++++
>>  meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb  |  4 +-
>>  ...configure-Fix-setting-of-CLDFLAGS-default.patch | 34 +--------------
>>  ...NUInstallDirs-for-detecting-install-paths.patch | 39 +++++++++++++++++
>>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb       |  1 +
>>  .../recipes-support/opencv/opencv/download.patch   | 32 ++++++++++++++
>>  meta-oe/recipes-support/opencv/opencv_4.1.0.bb     | 32 ++++++++++++--
>>  .../{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb}   |  7 ++-
>>  .../{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb}   |  6 +--
>>  ...x-native_svn.bb => sjf2410-linux-native_git.bb} | 11 +++--
>>  .../usbpath/{usbpath_svn.bb => usbpath_git.bb}     | 10 ++---
>>  .../{wmiconfig_svn.bb => wmiconfig_git.bb}         | 13 +++---
>>  16 files changed, 183 insertions(+), 69 deletions(-)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb =>
>> wireshark_3.0.8.bb} (95%)
>>  create mode 100644
>> meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
>>  create mode 100644
>> meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
>>  create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
>>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb
>> => s3c24xx-gpio_git.bb} (73%)
>>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb
>> => s3c64xx-gpio_git.bb} (74%)
>>  rename
>> meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb
>> => sjf2410-linux-native_git.bb} (72%)
>>  rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb =>
>> usbpath_git.bb} (68%)
>>  rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb =>
>> wmiconfig_git.bb} (58%)
>>
> Could we also consider backport of:
hmm, that might be a bit hard. 
>
> kernel-yocto.bbclass: Support config fragments with externalsrc (44f04c03)
> perf: Fix externalsrc support (eab605ba)
> kernelsrc.bbclass: Fix externalsrc support (2c17d35c)

aren't this in core ??

- armin
> Thanks,
>


