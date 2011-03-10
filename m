Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pxiuv-0003y1-8J
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 17:40:49 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PxitL-0001fc-TI from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 08:39:11 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Mar 2011 08:39:11 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 10 Mar 2011 08:39:11 -0800
Message-ID: <4D78FEA5.6040205@mentor.com>
Date: Thu, 10 Mar 2011 09:39:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299768051.3853.21.camel@mattotaupa>
	<4D78E882.5040307@mentor.com> <4D78F0F4.9000908@gmail.com>
In-Reply-To: <4D78F0F4.9000908@gmail.com>
X-OriginalArrivalTime: 10 Mar 2011 16:39:11.0709 (UTC)
	FILETIME=[AF4C90D0:01CBDF41]
Subject: Re: help2man-native: task configure fails with `configure: error: perl module Locale::gettext required`
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
X-List-Received-Date: Thu, 10 Mar 2011 16:40:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2011 08:40 AM, Marco Cavallini wrote:
> Tom Rini ha scritto, Il 10/03/2011 16:04:
>
>>
>> Is this a uclibc target perhaps?
>>
>
> Hi Tom,
>
> Not mine, is this
>
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "40a8506"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "ronetix-pm9263"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2010.7-test-20110310"
> TARGET_FPU        = "soft"

Blarg.  I guess this will finally teach me my lesson.  Reverted.

-- 
Tom Rini
Mentor Graphics Corporation


