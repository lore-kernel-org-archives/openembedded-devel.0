Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD187EF4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 01:10:05 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 4so2447532pgm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2019 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LXVBeHlk3F4qWcOQ/Wxw0nEX7CoLQNgEcsFcSyulz8E=;
	b=PN557XryXLkbtML1jpaWUlVFTYmfPfxtUC4fBx9Q7ZLYt0JUvFlQ0ymTpL0wZzB8Lc
	XwEYs3WBF0Q8Jcso0KYmG3hPlijf/B7COZ6j1dnUX6vyluLZhIpUcvc2+ghWOo8NwQi8
	rOPlU7wXs2jtfs1Kwv6+m+X+TT/9bT8En8bsB68bT/vaiH3CBxP8FI0LiE2fReO+3IGK
	j3Ru0BZaiJmsXNa7WsudgAsRvUET0vbq6Y82O0Cr86ZknGoDs4Vhsy5xle8bRr1a/xqz
	xZmnJ3eI0bAb1MmRaR1VuE3WkOhEDP6sbvxxDCf7eDMnLB5jlHcT8JcbjPo1tbJdDw+h
	FIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=LXVBeHlk3F4qWcOQ/Wxw0nEX7CoLQNgEcsFcSyulz8E=;
	b=bS+ubRh2jMZpxe/1L1jNXNWvUAfp/RjzY04/7VhMK60ebWJ35mvmZ9UR3rKALrMxhw
	7aIZI2n07/+WdjG6KGAwa/bA1Lzq37CuBpMqXrxmo7zUWqjDqPTkWaLMRSkI5sill8wL
	XfKpOCS1H17THPvfDrmcyigOY1b7swqgGqAKVWwN7l0xsGbW/KOUBTGbSbjV4K8bB7t9
	PeF04eu535BGFJ5m+8s1H9yEsRkDSGtHK85y31HhLl+KGuPxUdY8fFQ+I0a+RS/Cy1l1
	LgE/TgtfCEegYvA1VHMFYsmii90LfGX81f/Fi+4o40SXWtpgANaJufRZCbXB3LPkJujQ
	GeBQ==
X-Gm-Message-State: APjAAAX5QnPR0fZF2HejhBive8J5s4LMTxe+mocIv7rgV+4GKzLFa8nI
	vSwtxl6VE6S0GV7iRtkEFn4IePwnvpE=
X-Google-Smtp-Source: APXvYqyruKbsGkSwT+nQa5pYJwa9Q/yBhFaXvS/E4+xyE5yYmhP/fcPLe27OdP/YEC9qPpatZyG98Q==
X-Received: by 2002:a62:7911:: with SMTP id u17mr7796117pfc.162.1567732205822; 
	Thu, 05 Sep 2019 18:10:05 -0700 (PDT)
Received: from [10.0.0.10] (c-73-71-176-3.hsd1.ca.comcast.net. [73.71.176.3])
	by smtp.gmail.com with ESMTPSA id
	y13sm3556822pfn.73.2019.09.05.18.10.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Sep 2019 18:10:05 -0700 (PDT)
To: Kang Kai <Kai.Kang@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20190829082942.128713-1-kai.kang@windriver.com>
	<c0d140cb-bdac-7e6f-d118-bd2a370e5d1c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <ccffd278-6ed8-ffb5-3c1d-09b945bfbb60@gmail.com>
Date: Thu, 5 Sep 2019 18:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <c0d140cb-bdac-7e6f-d118-bd2a370e5d1c@windriver.com>
Subject: Re: [meta-oe][Patch] libwacom: add recipe
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
X-List-Received-Date: Fri, 06 Sep 2019 01:10:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 9/4/19 6:51 PM, Kang Kai wrote:
> On 2019/8/29 下午4:29, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Package libinput has a package config 'libwacom'. When it is set,
>> package libwacom is required. So add the recipe of libwacom.
>>
>> Add a patch to generate udev rules file on target that it is not
>> suitable for cross compile.


fails to build

https://errors.yoctoproject.org/Errors/Details/268566/

https://errors.yoctoproject.org/Errors/Details/268387/


>
> Ping.
>
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../generate-udev-rules-on-target.patch       | 59 +++++++++++++++++++
>>   .../recipes-extended/libwacom/libwacom_1.0.bb | 17 ++++++
>>   2 files changed, 76 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
>>   create mode 100644 meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
>>
>> diff --git
>> a/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
>> b/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
>>
>> new file mode 100644
>> index 000000000..27e037c98
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
>> @@ -0,0 +1,59 @@
>> +libwacom create a native executable file to generate udev rules
>> file. But it is
>> +not suitable for cross compile. And it is complicate to create
>> libwacom-native
>> +that libgudev-native and udev-native are required.
>> +
>> +So do not generate udev rules file during compilation. Install the
>> executable
>> +file to generate udev rules on target. It should put the generated
>> rules file
>> +at /lib/udev/rules.d/65-libwacom.rules.
>> +
>> +Upstream-Status: Inappropriate [cross-compile specific]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> +diff --git a/meson.build b/meson.build
>> +index 6584c86..4009f5f 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -407,20 +407,20 @@ executable('libwacom-list-local-devices',
>> +        include_directories: [includes_src],
>> +        install: true)
>> +
>> +-tools_cflags = ['-DTOPSRCDIR="@0@"'.format(meson.source_root())]
>> ++tools_cflags = ['-DTOPSRCDIR="@0@"'.format(meson.source_root()),
>> '-DLIBWACOM_DATA_DIR="@0@"'.format(dir_data)]
>> +
>> +-gen_udev_rules = executable('generate-udev-rules',
>> ++gen_udev_rules = executable('libwacom-generate-udev-rules',
>> +                 'tools/generate-udev-rules.c',
>> +                 dependencies: [dep_libwacom, dep_glib],
>> +                 include_directories: [includes_src],
>> +                 c_args: tools_cflags,
>> +-                install: false)
>> +-custom_target('udev-rules',
>> +-          command: gen_udev_rules,
>> +-          capture: true,
>> +-          output: '65-libwacom.rules',
>> +-          install: true,
>> +-          install_dir: join_paths(dir_udev, 'rules.d'))
>> ++                install: true)
>> ++#custom_target('udev-rules',
>> ++#          command: gen_udev_rules,
>> ++#          capture: true,
>> ++#          output: '65-libwacom.rules',
>> ++#          install: true,
>> ++#          install_dir: join_paths(dir_udev, 'rules.d'))
>> +
>> + executable('list-devices',
>> +        'tools/list-devices.c',
>> +diff --git a/tools/generate-udev-rules.c b/tools/generate-udev-rules.c
>> +index bb00e7b..fbf49f0 100644
>> +--- a/tools/generate-udev-rules.c
>> ++++ b/tools/generate-udev-rules.c
>> +@@ -229,7 +229,7 @@ int main(int argc, char **argv)
>> +     }
>> +
>> +
>> +-    db = libwacom_database_new_for_path(TOPSRCDIR"/data");
>> ++    db = libwacom_database_new_for_path(LIBWACOM_DATA_DIR);
>> +
>> +     list = libwacom_list_devices_from_database(db, NULL);
>> +     if (!list) {
>> diff --git a/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
>> b/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
>> new file mode 100644
>> index 000000000..0787ad246
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
>> @@ -0,0 +1,17 @@
>> +DESCRIPTION = "libwacom is a library to identify wacom tablets and
>> their model-specific features."
>> +HOMEPAGE = "https://github.com/linuxwacom/libwacom/wiki"
>> +SECTION = "libs"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
>> +
>> +DEPENDS = "libgudev libxml2"
>> +
>> +SRC_URI = "git://github.com/linuxwacom/libwacom.git;protocol=https \
>> +           file://generate-udev-rules-on-target.patch \
>> +           "
>> +SRCREV = "ae6c9cf78802844349986ac2a708d87e891a3e6e"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig
>
>

