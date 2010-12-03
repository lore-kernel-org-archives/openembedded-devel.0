Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1POWJ6-0001MB-3Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 15:08:18 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1POWHi-0003uI-O7 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 06:06:50 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 3 Dec 2010 06:06:53 -0800
Received: from [172.30.80.45] ([172.30.80.45]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 3 Dec 2010 07:06:49 -0700
Message-ID: <4CF8F96B.8080606@mentor.com>
Date: Fri, 03 Dec 2010 07:06:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF6E7CE.8090801@gmail.com>	<4CF7A630.5030001@mentor.com>
	<AANLkTimjY7=meA6JrgEfAgQ4ozX_S0fg9r1Ya+_wqt9s@mail.gmail.com>
In-Reply-To: <AANLkTimjY7=meA6JrgEfAgQ4ozX_S0fg9r1Ya+_wqt9s@mail.gmail.com>
X-OriginalArrivalTime: 03 Dec 2010 14:06:49.0782 (UTC)
	FILETIME=[54377560:01CB92F3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bind_9.3.6.bb: Don't remove nslookup, it exists in FILES_${PN}-utils.
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
X-List-Received-Date: Fri, 03 Dec 2010 14:08:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2010 05:23 PM, Graham Gower wrote:
> On 3 December 2010 00:29, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 12/01/2010 05:26 PM, Graham Gower wrote:
>>>
>>> Also fixes the following with uclibc:
>>> rm: cannot remove
>>> `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/bind-9.3.6-r1/image/usr/bin/nslookup':
>>> No such file or directory
>>>
>>> Signed-off-by: Graham Gower<graham.gower@gmail.com>
>>
>> Can you please go fixup all of the bind recipes and then add nslookup to
>> u-a?  Thanks.
>
> I'm happy to fix all the bind recipes, but does it really need to be
> added to u-a as well? What other recipe(s) ship this binary?

You know? I don't recall 100% off-hand but I think nas-server-image will 
show the conflict.

-- 
Tom Rini
Mentor Graphics Corporation


