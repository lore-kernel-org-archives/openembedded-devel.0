Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCW8S-0006Wv-L5
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 15:08:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0D90D315A8D6;
	Tue, 27 Mar 2012 14:59:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id d3SA5fX+wl+z; Tue, 27 Mar 2012 14:59:18 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014418.pool.mediaWays.net [77.1.68.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 96DB2315A8DD;
	Tue, 27 Mar 2012 14:59:18 +0200 (CEST)
Message-ID: <4F71B9A5.3080405@opendreambox.org>
Date: Tue, 27 Mar 2012 14:59:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
	<71df8a759f91e821a2daee22f34eaa3a31708775.1332849864.git.sledz@dresearch-fe.de>
	<4F71B620.7020304@opendreambox.org>
	<4F71B7BF.6010707@dresearch-fe.de>
In-Reply-To: <4F71B7BF.6010707@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 3/3] python-2.6.6: Fix python-2.6.6 build failure on linux-3.x
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
X-List-Received-Date: Tue, 27 Mar 2012 13:08:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2012 14:51, Steffen Sledz wrote:
> On 27.03.2012 14:44, Andreas Oberritter wrote:
>> On 27.03.2012 14:07, Steffen Sledz wrote:
>>> From: Ulf Samuelsson <ulf_samuelsson@telia.com>
>>>
>>> python-2.6.6 build will crash when host is running linux kernel 3.x.
>>>
>>> Fix backported from openembedded-core.
>>> meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
>>
>> This patch has been superseded by a backport from upstream python,
>> causing linux2 to be used for all kernel versions. See commit
>> accb2b728ab10cae20be59253a56ac6410b8de10 in oe-core.
> 
> Is this patch available in oe-classic master?

I don't know.

> I'm just trying to keep the 2011.03-maintenance branch usable with a minimum of work. And the one from the pull request is good enough for me at the moment.

I don't want to block your pull request. I was just trying to make you
aware of problems that have already been fixed in oe-core. Building
python on 32-bit vs. 64-bit build systems and on 2.x vs. 3.x kernels
(running on the build system) produces different results, even with this
patch applied. Some of these problems have already been fixed in
oe-core, some are still pending (patches were sent to the oe-core
mailing list).

Regards,
Andreas


