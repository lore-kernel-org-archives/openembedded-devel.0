Return-Path: <prvs=672648817=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 21EE074846
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 21:07:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,427,1520895600"; d="scan'208";a="10411920"
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20180518075009.4612-1-richard.leitner@skidata.com>
	<50ba6ce942eb43fd86ae092df8e891ad@XBOX02.axis.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <79e4dbc5-15ff-4284-5364-4f625c7f6d72@skidata.com>
Date: Mon, 21 May 2018 23:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <50ba6ce942eb43fd86ae092df8e891ad@XBOX02.axis.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-oe][PATCH v2] stm32flash: add recipe
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
X-List-Received-Date: Mon, 21 May 2018 21:07:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 05/18/2018 07:20 PM, Peter Kjellerstedt wrote:
> We have had our own recipe for stm32flash for a few years, so I 
> have a couple of comments to improve this recipe.
> 
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Richard Leitner
>> Sent: den 18 maj 2018 09:50
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH v2] stm32flash: add recipe
>>
>> Add recipe for version 0.5 of stm32flash, an open source flash program for
>> STM32 using the ST serial bootloader.
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
>>  meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>>
>> diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>> new file mode 100644
>> index 000000000..7f1a7823a
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
>> +HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
>> +BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
>> +LICENSE = "GPLv2"
> 
> The license is GPLv2 or later, so change this to:
> 
> LICENSE = "GPL-2.0+"
> 
>> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +inherit autotools-brokensep
> 
> Remove the inherit of autotools-brokensep. This is not an 
> autotools-based package.
> 
>> +
>> +EXTRA_OEMAKE = "PREFIX=${prefix}"
> 
> Remove this as well (see below).
> 
>> +
>> +S = "${WORKDIR}/${PN}"
>> +
>> +SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"
> 
> Replace with:
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
> 
>> +
>> +SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
>> +SRC_URI[sha256sum] = "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
> 
> Add:
> 
> do_install() {
> 	oe_runmake install DESTDIR=${D} PREFIX=${prefix}
> }

Thank you for your feedback. I'm fine with all of these changes and will
send a v3 asap!

> 
> //Peter
> 

regards;Richard.L

