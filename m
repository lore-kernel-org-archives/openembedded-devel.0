Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id C8FDE60245
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2020 23:16:20 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id b1so2093480pgm.8
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2020 16:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=mQw9ShYOYKnEHgEaMC37SEjwZ07cWeD0k9w+pRRQ16o=;
	b=nb8fx0uVldnHYHTFNUnp8wkm7Sh7Evd2k0RasrKEAt3TSVF8AgPiK62vS9MRmHdaOe
	OAbeHhOyOZIp1H0EXFOKLoPqOkGaJ1yOtxVkaxOP18JWbFD22HHsaoeyJK2dYUQjMvAW
	wn6QJ9kddMqbOaJJOSuCaTIybOgJPc9tDUifAs9VIu6+csGywxbY/oivn1OUSkiGXmGn
	60eWPgJBh8MmZU1qLHEGzowPMW4pGIdA3uUZ7AVlkrkHxrUMcdtYTEphoSfDQKKQJOKo
	0GnwKA012npC/YC9Hm2GqXUaCUVAPjv2GXpI8W/FDkUYpXe20Zfb7ZSNRArAvJS+l1nZ
	pX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=mQw9ShYOYKnEHgEaMC37SEjwZ07cWeD0k9w+pRRQ16o=;
	b=Ppr4ckv1GZsJEpZJxYkghLt4qfXNE7DAtoe/ZoNFVnhL3iCHDLwy/5VQgajZt3TFGz
	kWsGIlnaqizhY83cBbRwU/7L0RDYC4+i+aFZXsWAoNZ0lHJJVQC6DY3aCE2ERvOuzv6q
	VjsMYuByDXyK2qeyj4sfxz+G41p7Hx0kXi95KYD92Z/DAeSXEHYyjKEM422qpD+U183S
	Fht2mIO8yGSPGIXlcYA7XB8gu2Adm8M0mATV5RDATZl/3z5sFSbydUkggODd7RO+c/m+
	UdWS8ABi/JL0bOlYZJFwVqcC0bwWOq2WEsvOyR5zq7d63qycXtqJbuPchCDfTe66+I8L
	aJ9g==
X-Gm-Message-State: ANhLgQ0smoK9YPtkWnZQ5N/SfEJBEAZqM3ySAR3b7uO0jfFLL/5YIKgf
	x+3db84qMfwpSVLJX0TgImNZXkes
X-Google-Smtp-Source: ADFU+vs68p7OPOonU4FgmXwM9474fIVjg+QTM50Ag5HqOYeAo3jnuYY8m2rRFc2yRkU8FjZJOLnHQg==
X-Received: by 2002:a63:36cd:: with SMTP id d196mr5815512pga.280.1584659781531;
	Thu, 19 Mar 2020 16:16:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:7d4a:161a:ec93:c30e?
	([2601:202:4180:a5c0:7d4a:161a:ec93:c30e])
	by smtp.gmail.com with ESMTPSA id
	gx22sm2954912pjb.43.2020.03.19.16.16.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Mar 2020 16:16:20 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
	<CAMKF1sooQTeEkmOSu+torVhMZ8R_3FqCzEOWwRMT0drKpAOZDw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0eab7733-7605-ff7f-a7af-c4f8e93aa258@gmail.com>
Date: Thu, 19 Mar 2020 16:16:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sooQTeEkmOSu+torVhMZ8R_3FqCzEOWwRMT0drKpAOZDw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [zeus 00/13] Patch review
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
X-List-Received-Date: Thu, 19 Mar 2020 23:16:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/19/20 1:44 AM, Khem Raj wrote:
> look
What does that mean?

- armin
>
> On Wed, Mar 11, 2020 at 7:58 PM Armin Kuster <akuster808@gmail.com> wrote:
>> Here is the next set for meta-openembedded.
>> Please have reviews back by Friday.
>>
>> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
>>
>>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
>>
>> Adrian Bunk (1):
>>   wireshark: Upgrade 3.0.6 -> 3.0.8
>>
>> Carlos Rafael Giani (1):
>>   opencv: Enable pkg-config .pc file generation
>>
>> Khem Raj (2):
>>   ade: Fix install paths in multilib builds
>>   sanlock: Replace cp -a with cp -R --no-dereference
>>
>> Martin Jansa (1):
>>   s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig:
>>     use git fetcher instead of svn fetcher
>>
>> Mike Krupicka (1):
>>   mosquitto: Use mosquitto.init for daemon init
>>
>> Paul Barker (1):
>>   lmsensors: Fix sensord dependencies
>>
>> Peter Kjellerstedt (2):
>>   lvm2, libdevmapper: Do not patch configure
>>   libldb: Do not require the "pam" distro feature to be enabled
>>
>> Ross Burton (4):
>>   opencv: don't download during configure
>>   opencv: also download face alignment data in do_fetch()
>>   opencv: PACKAGECONFIG for G-API, use system ADE
>>   opencv: abort configure if we need to download
>>
>>  .../mosquitto/files/mosquitto.init            |  2 +-
>>  .../recipes-support/libldb/libldb_1.5.6.bb    |  3 +-
>>  ...{wireshark_3.0.6.bb => wireshark_3.0.8.bb} |  4 +-
>>  .../recipes-bsp/lm_sensors/lmsensors_3.5.0.bb |  3 +-
>>  ...cp-a-with-cp-R-no-dereference-preser.patch | 51 +++++++++++++++++++
>>  .../recipes-extended/sanlock/sanlock_3.8.0.bb |  4 +-
>>  ...gure-Fix-setting-of-CLDFLAGS-default.patch | 34 +------------
>>  ...tallDirs-for-detecting-install-paths.patch | 39 ++++++++++++++
>>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  1 +
>>  .../opencv/opencv/download.patch              | 32 ++++++++++++
>>  .../recipes-support/opencv/opencv_4.1.0.bb    | 32 ++++++++++--
>>  ...3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} |  7 ++-
>>  ...3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} |  6 +--
>>  ...ive_svn.bb => sjf2410-linux-native_git.bb} | 11 ++--
>>  .../{usbpath_svn.bb => usbpath_git.bb}        | 10 ++--
>>  .../{wmiconfig_svn.bb => wmiconfig_git.bb}    | 13 +++--
>>  16 files changed, 183 insertions(+), 69 deletions(-)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)
>>  create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
>>  create mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
>>  create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
>>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} (73%)
>>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} (74%)
>>  rename meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (72%)
>>  rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb => usbpath_git.bb} (68%)
>>  rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb => wmiconfig_git.bb} (58%)
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


