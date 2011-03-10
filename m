Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PxjsD-0003LC-6z
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 18:42:05 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pxjqf-0005jX-RD from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 09:40:29 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Mar 2011 09:40:29 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 10 Mar 2011 09:40:29 -0800
Message-ID: <4D790D04.5050409@mentor.com>
Date: Thu, 10 Mar 2011 10:40:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299768051.3853.21.camel@mattotaupa>	<4D78E882.5040307@mentor.com>
	<4D78F0F4.9000908@gmail.com>
	<201103101722.55323.pgsellmann@portner-elektronik.at>
In-Reply-To: <201103101722.55323.pgsellmann@portner-elektronik.at>
X-OriginalArrivalTime: 10 Mar 2011 17:40:29.0428 (UTC)
	FILETIME=[3F63F340:01CBDF4A]
Subject: Re: help2man-native: task configure fails with `configure:	error: perl module Locale::gettext required`
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2011 17:42:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 03/10/2011 09:22 AM, Peter Gsellmann wrote:
> Am Donnerstag, 10. März 2011, 16:40:36 schrieb Marco Cavallini:
>> Tom Rini ha scritto, Il 10/03/2011 16:04:
>>
>>>
>>> Is this a uclibc target perhaps?
>>>
>>
>> Hi Tom,
>>
>> Not mine, is this
>>
>> Build Configuration:
>> BB_VERSION        = "1.10.2"
>> METADATA_BRANCH   = "master"
>> METADATA_REVISION = "40a8506"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "ronetix-pm9263"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "2010.7-test-20110310"
>> TARGET_FPU        = "soft"
>>
>
> here also glibc-2.9
>
> Found this: reverting patch bccf626b1428d7087d261bf4ad91744b5b5d5418 helped.
>
> 'inherit gettext' is not a full replacement for DEPENDS = "gettext-native"
>
> Same problem and solution for packages e2fsprogs, classpath, util-linux-ng

OK, I've dug a bit more (sorry for all the breakage) and e2fsprogs / 
classpath should be fine already, but not util-linux-ng (due to 
modifying DEPENDS_virtclass-native).  I've posted a patch I think will 
fix this as it's a real problem and gettext.bbclass _should_ be a 
replacement for DEPENDS = "gettext-native".

-- 
Tom Rini
Mentor Graphics Corporation


