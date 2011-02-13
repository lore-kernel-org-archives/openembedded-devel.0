Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PokZY-0008E0-NH
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 23:37:40 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PokYR-0002tR-3K from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 14:36:31 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 13 Feb 2011 14:36:30 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 13 Feb 2011 15:36:29 -0700
Message-ID: <4D585CE4.9090807@mentor.com>
Date: Sun, 13 Feb 2011 15:36:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201102131650.17611.schnitzeltony@gmx.de>
	<AANLkTindNuCayWTyNrhSoaaVy4P9KhXnaJ2Lae_EX13V@mail.gmail.com>
In-Reply-To: <AANLkTindNuCayWTyNrhSoaaVy4P9KhXnaJ2Lae_EX13V@mail.gmail.com>
X-OriginalArrivalTime: 13 Feb 2011 22:36:29.0705 (UTC)
	FILETIME=[75036790:01CBCBCE]
Subject: Re: [PATCH] insane.bbclass: fix the check for bad RPATH
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
X-List-Received-Date: Sun, 13 Feb 2011 22:37:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2011 01:33 PM, Khem Raj wrote:
> On Sun, Feb 13, 2011 at 7:50 AM, Andreas Mueller<schnitzeltony@gmx.de>  wrote:
>> Hi OE folks,
>>
>> Yesterday I merged latest head into my working branch and started a fresh build for xfce46-image. I get
>>
>> ERROR: QA Issue with db: package db contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db/usr/lib/libdb-5.0.so
>> ERROR: QA Issue with db: package db contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db/usr/lib/libdb-5.0.so
>> ERROR: QA Issue with db-bin: package db-bin contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db-bin/usr/bin/db_checkpoint
>> ERROR: QA Issue with db-bin: package db-bin contains bad RPATH /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db-bin/usr/bin/db_checkpoint
>> ...
>> FATAL: QA run found fatal errors. Please consider fixing them.
>> ERROR: Error in executing python function in: /home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/db/db_5.0.21.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'>  Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Function do_package_qa failed
>>
>> Without having further checks I think commit 14f7dd0965f14a09169dc5a2df18ff0b06f8bad5 causes this behaviour.
>>
>> What makes me wondering:
>>
>> - even in case I use the -k option the build aborts at the same position. Is that intended?
>> - Commit 6aa31074adaccffcfd3080e8390065ab5abda2a6 brings up many undetected RPATH cases which have to be fixed. With the current situation it is not possible to check which there are.
>>
>> How about creating a list (I know Frans did already - but I think it was before the latest RPATH commit) listing the packages with QA errors / the type of QA error / and (to prevent double efforts)  a person willing to take care. (Although I know nobody uses it :-) I take a look for clutter-box2d which has RPATH error)
>>
>> Or is there something ongoing I have missed?
>>
>
> hmm I think there are too many QA errors now it is reporting as errors
> and bailing out build. While we should fix
> the QA errors but I think we should not be that strict yet

I think we should see how many of these we can easily pull a fix out of 
from poky.

-- 
Tom Rini
Mentor Graphics Corporation


