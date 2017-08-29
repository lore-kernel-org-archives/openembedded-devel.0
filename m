Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9867E65D35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 12:26:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7TCQuC8017750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 29 Aug 2017 05:26:56 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 05:26:56 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1503977887-29630-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1spC+B8DhcFZ3jP84J66Uucw_UWujCyA+UHtTJ5zvJNcRw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5123012b-2564-2c42-0709-7529cafd593a@windriver.com>
Date: Tue, 29 Aug 2017 08:26:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spC+B8DhcFZ3jP84J66Uucw_UWujCyA+UHtTJ5zvJNcRw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireguard: fix kernel 4.12 build issues
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
X-List-Received-Date: Tue, 29 Aug 2017 12:26:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/29/2017 01:06 AM, Khem Raj wrote:
> On Mon, Aug 28, 2017 at 8:38 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> We upgrade the module + tools recipes to fix the following build error:
>>
>>   wireguard-module/0.0.20170517-r0/WireGuard-0.0.20170517/src/device.c:
>>   In function 'setup':
>>   |
>>   wireguard-module/0.0.20170517-r0/WireGuard-0.0.20170517/src/device.c:269:7:
>>   error: 'struct net_device' has no member named 'destructor'; did you
>>   mean 'priv_destructor'?
>>   |   dev->destructor = destruct;
>>   |        ^~~~~~~~~~
>>   |        priv_destructor
>>
>> We also add a RDEPENDS on "bash" to the wireguard-tools recipe to fix
>> the following QA issue that appeared with the version bump:
>>
>>    ERROR: wireguard-tools-0.0.20170810-r0 do_package_qa: QA Issue:
>>    /usr/bin/wg-quick contained in package wireguard-tools requires
>>    /bin/bash, but no providers found in RDEPENDS_wireguard-tools?
>>    [file-rdeps]
>>
> 
> already fixed with
> https://patchwork.openembedded.org/patch/143341/
> https://patchwork.openembedded.org/patch/143280/
> 

Damn! I missed that going to the list. Luckily, it wasn't much
work to fix :D

Bruce

> your commit msg is better though
> 
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   ...eguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} | 0
>>   ...ireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} | 2 +-
>>   meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} (100%)
>>   rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} (93%)
>>
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
>> similarity index 100%
>> rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
>> rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
>> similarity index 93%
>> rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
>> rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
>> index 79d420f1a417..c4ddbcb0e90f 100644
>> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
>> @@ -24,4 +24,4 @@ FILES_${PN} = " \
>>       ${bindir} \
>>   "
>>
>> -RDEPENDS_${PN} = "wireguard-module"
>> +RDEPENDS_${PN} = "wireguard-module bash"
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> index 9e38c57ffa5b..b26536d3308c 100644
>> --- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>
>>   SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
>>
>> -SRC_URI[md5sum] = "e9969ebbdf525fcbe91a513db8a5c864"
>> -SRC_URI[sha256sum] = "7303e973654a3585039f4789e89a562f807f0d6010c7787b9b69ca72aa7a6908"
>> +SRC_URI[md5sum] = "8dd3e080407b8295c25565a847a4ca27"
>> +SRC_URI[sha256sum] = "ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7"
>>
>>   S = "${WORKDIR}/WireGuard-${PV}/src/"
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


