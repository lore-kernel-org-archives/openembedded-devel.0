Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA5997F0E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 19:06:26 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id p197so7144231lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=W9E1VCqieo9Oq/NFCFtgL8I9lD9nGrlDto5lzDxOuw4=;
	b=xWgC0yu6XUlDab4OXqyYQq0a0M9PeFr6pp+XdeGIe19j6xgVtwXotExOIWOFgt3Dz1
	247Sx1/U34G1NTygSUIbTDiiYmxwQTZH1ZPGzeBiIpMHUoAkBI1Kuo1GOALdKQiiqri8
	WxrjkMuQJ6XyVEeMd/a1J2YO9lRmHxrFdzp1i6uD5QrR/EGD1Tkz1fo70ckVpKcdQ7/1
	tyYkMZ93qhMrkYcv3plyUBLY7WFJtfdyj3YVhyStz2uosYqXBhswWX2Ptma8HZOjttNr
	cn8I8C7pQrazSvSH9N4dgtq7NttFOVBLsZ++UmD8UKCsNRkvy3hMyC5eE3nQ/iWcPB2J
	flyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=W9E1VCqieo9Oq/NFCFtgL8I9lD9nGrlDto5lzDxOuw4=;
	b=V8+CdMG1WqSXpXHFETHf4/suFi4AaBGQGGhyMt7YIxoOqiwoWv30fJdsoQmka3XfiX
	2fjGw3wciAjCGP57lJwyrmE5OWbkcUdnZvP8iV181JnDFPoB2gW95onIJcvzjKK6Ik0K
	H4wGjaOWdrAuvvSSi5eENv3V7odMmbp4xwGmPebnBmKPzFRKyw/qrVTTy4xAYte+SEno
	/fzS1a842ZE3GQ3FEpJY5VdNl+hMsWdXIOkBMdxDYtTMtN8BQ7IQcMmpTNCKHiy2K7Tu
	B2WWJdMwbLIb2OJMR2kUNjEVnMa95mkR46Mumk7TD50ULzDjo9dRpflAUmQk0JRh7KaJ
	BbWg==
X-Gm-Message-State: APjAAAVWQza991QNFGd2RPIPCbw9LMPYDC4OLKd0mRAFEZsEYpbUDJtF
	t8EmweaXqTspemaUbCrbMzE=
X-Google-Smtp-Source: APXvYqx/B1NvRg183Z/0Nibuhy63tlKvdpUtS1s64nlswpMemSNf4V41LZuuXlUoPE72DethSrf31Q==
X-Received: by 2002:ac2:51a3:: with SMTP id f3mr5304015lfk.94.1562958387116;
	Fri, 12 Jul 2019 12:06:27 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s19sm1564860lji.38.2019.07.12.12.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jul 2019 12:06:26 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Andrej Valek <andrej.valek@siemens.com>
References: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
	<D55698ECEC159B488D62A508E18D7FEC124BEEAB@ATNETS9912WMSX.ww300.siemens.net>
	<CAMKF1sruh5+Uy1f8useibqbossecsftyG7Bk-Gf4B2SOCnJJqw@mail.gmail.com>
	<66a42934-83cb-56ef-72c2-71b3377a6c38@siemens.com>
	<CAMKF1spFA8atd93-bUGvfE1Px6eQvcxea5ixxBy1EZVekTF_ig@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <9cf81164-e739-298e-e010-8806a7319dbc@oleksandr-kravchuk.com>
Date: Fri, 12 Jul 2019 21:06:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spFA8atd93-bUGvfE1Px6eQvcxea5ixxBy1EZVekTF_ig@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Fri, 12 Jul 2019 19:06:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 12/07/2019 18:37, Khem Raj wrote:
> On Fri, Jul 12, 2019 at 1:03 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>> Hi Khem!
>>
>> We have identified the problem. There was missing inheriting pkgconfig.
>> Fix is here
>> http://lists.openembedded.org/pipermail/openembedded-devel/2019-July/200609.html
>> .
>>
> thanks for taking care of this quickly.

I can't believe I have missed that :/ Thanks, Andrej!

>
>> Regards,
>> Andrej
>>
>> On 7/12/19 8:13 AM, Khem Raj wrote:
>>> Hi Oleksandr
>>>
>>> It fails to build on mips see
>>> https://errors.yoctoproject.org/Errors/Details/251424/
>>>
>>> I wonder if udev has something to do here
>>>
>>> On Tue, Jun 25, 2019 at 11:30 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
>>>> Hi Oleksandr!
>>>>
>>>> You have removed udev from default configuration. Because if udev is not in PACKAGECONFIG anymore, '--without-udev' will be passed as parameter in configure step.
>>>>
>>>> There are multiple options how to do that.
>>>> 1. put 'udev' into DEPENDS, RDEPENDS and put '--with-udev' into EXTRA_OECONF
>>>>  - missing option to disable it
>>>> 2. keep 'udev' in PACKAGECONFIG
>>>>  - will be enabled automatically while is not explicitly overridden by another PACKAGECONFIG
>>>>
>>>> I prefer an option 2. . Udev will be enabled by default with option to disable it.
>>>>
>>>> Regards,
>>>> Andrej
>>>>
>>>> -----Original Message-----
>>>> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of Oleksandr Kravchuk
>>>> Sent: Tuesday, June 25, 2019 10:55 PM
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>>> Subject: [oe] [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
>>>>
>>>> udev is now enabled by default and is always requested.
>>>>
>>>> License checksum changed due to modified copyright year.
>>>>
>>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>>> ---
>>>>  .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}        | 10 ++++------
>>>>  1 file changed, 4 insertions(+), 6 deletions(-)  rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (70%)
>>>>
>>>> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
>>>> similarity index 70%
>>>> rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
>>>> rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
>>>> index 84c3db7a5..e2759f47a 100644
>>>> --- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
>>>> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
>>>> @@ -5,18 +5,16 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer  HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
>>>>
>>>>  LICENSE = "BSD-2-Clause"
>>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
>>>>
>>>>  SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
>>>> -
>>>> -SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
>>>> -SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
>>>> -
>>>>  SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
>>>> +SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
>>>> +SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
>>>>
>>>>  inherit autotools-brokensep
>>>>
>>>> -PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>>>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>>>>
>>>>  PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
>>>>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

