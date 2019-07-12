Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 611 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Jul 2019 08:13:57 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 95C0E7F0E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:13:57 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6C83jQv031889
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 12 Jul 2019 10:03:45 +0200
Received: from [192.168.20.128] ([163.242.58.54])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6C83hf9017224;
	Fri, 12 Jul 2019 10:03:43 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
	<D55698ECEC159B488D62A508E18D7FEC124BEEAB@ATNETS9912WMSX.ww300.siemens.net>
	<CAMKF1sruh5+Uy1f8useibqbossecsftyG7Bk-Gf4B2SOCnJJqw@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Message-ID: <66a42934-83cb-56ef-72c2-71b3377a6c38@siemens.com>
Date: Fri, 12 Jul 2019 10:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sruh5+Uy1f8useibqbossecsftyG7Bk-Gf4B2SOCnJJqw@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
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
X-List-Received-Date: Fri, 12 Jul 2019 08:13:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem!

We have identified the problem. There was missing inheriting pkgconfig.
Fix is here
http://lists.openembedded.org/pipermail/openembedded-devel/2019-July/200609.html
.

Regards,
Andrej

On 7/12/19 8:13 AM, Khem Raj wrote:
> Hi Oleksandr
> 
> It fails to build on mips see
> https://errors.yoctoproject.org/Errors/Details/251424/
> 
> I wonder if udev has something to do here
> 
> On Tue, Jun 25, 2019 at 11:30 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
>>
>> Hi Oleksandr!
>>
>> You have removed udev from default configuration. Because if udev is not in PACKAGECONFIG anymore, '--without-udev' will be passed as parameter in configure step.
>>
>> There are multiple options how to do that.
>> 1. put 'udev' into DEPENDS, RDEPENDS and put '--with-udev' into EXTRA_OECONF
>>  - missing option to disable it
>> 2. keep 'udev' in PACKAGECONFIG
>>  - will be enabled automatically while is not explicitly overridden by another PACKAGECONFIG
>>
>> I prefer an option 2. . Udev will be enabled by default with option to disable it.
>>
>> Regards,
>> Andrej
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of Oleksandr Kravchuk
>> Sent: Tuesday, June 25, 2019 10:55 PM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> Subject: [oe] [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
>>
>> udev is now enabled by default and is always requested.
>>
>> License checksum changed due to modified copyright year.
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}        | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)  rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (70%)
>>
>> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
>> similarity index 70%
>> rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
>> rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
>> index 84c3db7a5..e2759f47a 100644
>> --- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
>> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
>> @@ -5,18 +5,16 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer  HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
>>
>>  LICENSE = "BSD-2-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
>>
>>  SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
>> -
>> -SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
>> -SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
>> -
>>  SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
>> +SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
>> +SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
>>
>>  inherit autotools-brokensep
>>
>> -PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>>
>>  PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
>>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

