Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
 by mx.groups.io with SMTP id smtpd.web12.45378.1622474261490477467
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 08:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=z6GGm6ug;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.13, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=SHj/AkwVeluws/M2q6NKqpwXV3t+m6fNbapFrjmqLYc=;
	b=z6GGm6ugwI/9176H30VY2+8tZd6CXtDYZJMR6jziN+VlTG4RB0JbikeWdY9/9toUzUXKgJA9z0p+/
	 6IliuoIVZQ990MAXFFJBdMHqdtBG/Kl8iM4n5owfVZs9wpTDblVTJmxkGsXAnfasG5B3/k7B+s5QoN
	 TYRkPBKPXifxjhB0w11RlyVS94IVrxvnsOarvbEV8h4iUZsriczRr8huNMOUnItPfQm/PlKytkSD9H
	 yRxK5NE+x4KDqch/rDn/sz9jEjd4wwTWgRq/PUYCz6F4uLzAdtPYv9ZDdLhzr2tj8OU3ZG1TfxarYJ
	 CLNBI5Hl2lLPe1cP64ixuYD+tQQ5KcQ==
X-HalOne-Cookie: e87845e2ca9cf8a948c76b71c2699ad4a3c899aa
X-HalOne-ID: 554a67ef-c223-11eb-a907-d0431ea8bb10
Received: from [192.168.178.41] (x4dbd064c.dyn.telefonica.de [77.189.6.76])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 554a67ef-c223-11eb-a907-d0431ea8bb10;
	Mon, 31 May 2021 15:17:38 +0000 (UTC)
Subject: Re: [oe] [meta-oe][PATCH] evemu-tools: Add initial recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210530172125.16258-1-ayoub.zaki@embexus.com>
 <CAMKF1sq56JqYJ6+R8On3zc_HnUO4VwvAP91QNASS8y_P7AZCgw@mail.gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Message-ID: <588c056c-7880-c98f-7464-beb6347017bf@embexus.com>
Date: Mon, 31 May 2021 17:17:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq56JqYJ6+R8On3zc_HnUO4VwvAP91QNASS8y_P7AZCgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

On 5/31/21 4:45 PM, Khem Raj wrote:
> On Sun, May 30, 2021 at 10:21 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>> ---
>>   .../evemu-tools/evemu-tools_git.bb            | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>>
>> diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>> new file mode 100644
>> index 000000000..f1172b0ef
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "Kernel evdev device emulation"
>> +DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices."
>> +HOMEPAGE = "https://www.freedesktop.org/wiki/Evemu"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
>> +
>> +DEPENDS = "libevdev"
>> +
>> +SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
>> +SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
>> +
>> +S = "${WORKDIR}/git"
>> +PV = "gitr${SRCPV}"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF_append = " --prefix=/usr"
> why do we need this


default prefix is /usr/local

>
>> +
>> +PACKAGES =+ "${PN}-python"
>> +FILES_${PN}-python = "${libdir}/python*/site-packages/*"
>> +RDEPENDS_${PN}-python = "python3"
>> +
>> --
>> 2.17.1
>>
>>
>> 
>>
Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634

