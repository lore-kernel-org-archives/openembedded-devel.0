Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF6E770DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:49:48 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 4E5AC23163
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:49:41 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
	<1443016567-15788-2-git-send-email-dv@pseudoterminal.org>
	<20151008102504.GJ2385@jama>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <5624E6E5.2000302@pseudoterminal.org>
Date: Mon, 19 Oct 2015 14:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20151008102504.GJ2385@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH 2/5] aalib: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 12:49:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Strange. This built fine for me, with the current master and MACHINE= 
qemux86-64 . Nevertheless, I'll add a CFLAGS_append = " -fPIC " line.

On 10/08/2015 12:25 PM, Martin Jansa wrote:
> On Wed, Sep 23, 2015 at 03:56:04PM +0200, Carlos Rafael Giani wrote:
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>   meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
>>
>> diff --git a/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
>> new file mode 100644
>> index 0000000..06c4e5e
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "AAlib is an portable library for rendering graphics as ASCII art."
>> +HOMEPAGE = "http://aa-project.sourceforge.net/aalib/"
>> +SECTION = "libs"
>> +
>> +DEPENDS = "ncurses"
>> +
>> +LICENSE = "LGPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>> +
>> +S = "${WORKDIR}/aalib-1.4.0"
> Fails to build
> http://errors.yoctoproject.org/Errors/Details/20262/
>
>> +
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/aa-project/aalib-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "d5aa8e9eae07b7441298b5c30490f6a6"
>> +SRC_URI[sha256sum] = "0b214b98850f559e0a9ef7282de2ff336b094e1aacedefff3ffa50f07711db58"
>> +
>> +inherit autotools
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


