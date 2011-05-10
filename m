Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QJoXJ-00023t-Ef
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 17:07:45 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 10 May 2011 17:04:59 +0200
X-TM-IMSS-Message-ID: <0cc6f943000050e2@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0cc6f943000050e2 ;
	Tue, 10 May 2011 17:04:59 +0200
Message-ID: <4DC9541B.6070208@nedap.com>
Date: Tue, 10 May 2011 17:04:59 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com>	<20110510100020.GA10493@mx.loc>	<1305022004.8000.149.camel@phil-desktop>	<4DC91B33.9080807@nedap.com>	<1305025696.8000.155.camel@phil-desktop>
	<4DC91E4E.3070109@nedap.com>	<4DC9363B.6070909@nedap.com>
	<1305038299.8000.178.camel@phil-desktop>
In-Reply-To: <1305038299.8000.178.camel@phil-desktop>
X-OriginalArrivalTime: 10 May 2011 15:04:59.0945 (UTC)
	FILETIME=[A1C89190:01CC0F23]
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 15:07:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2011 04:38 PM, Phil Blundell wrote:
> On Tue, 2011-05-10 at 14:57 +0200, Jaap de Jong wrote:
>> bitbake ends with
>> |
>> /media/OpenEmbedded/release-2010.12/tmp/sysroots/i686-linux/usr/x86_64/x86_64-angstrom-linux/bin/ld:
>> cannot find /lib64/libc.so.6 inside
>> /media/OpenEmbedded/release-2010.12/tmp/sysroots/x86_64-angstrom-linux
>>
>> There is only a lib directory and no lib64 directory...
> It seems that there is some disagreement between binutils and your C
> library about where the libs should be stored.  Which DISTRO
> configuration are you using?
Build Configuration:
BB_VERSION        = "1.8.18"
METADATA_BRANCH   = "release-2010.12"
METADATA_REVISION = "dec3967"
TARGET_ARCH       = "x86_64"
TARGET_OS         = "linux"
MACHINE           = "x86_64-generic"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.12"

> If you make a symlink from lib ->  lib64 inside the sysroot, does that
> allow the build to continue?
>

Tried that one...
| 
/media/OpenEmbedded/release-2010.12/tmp/sysroots/i686-linux/usr/x86_64/x86_64-angstrom-linux/bin/ld: 
cannot find /lib64/libc.so.6 inside 
/media/OpenEmbedded/release-2010.12/tmp/sysroots/x86_64-angstrom-linux

so the answer is: no...

Jaap


