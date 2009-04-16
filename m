Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LuRKe-0002SU-6O
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 15:08:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LuRGt-0007wS-2S
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 13:04:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 13:04:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 13:04:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Apr 2009 15:04:39 +0200
Message-ID: <gs7ad8$jre$1@ger.gmane.org>
References: <20090414234609.GA27890@denix.org>	<1239752998-7677-1-git-send-email-denis@denix.org>	<gs3vuj$8tl$1@ger.gmane.org>	<200904150854.04328.hs4233@mail.mn-solutions.de>	<20090416000646.GB2118@denix.org>
	<be7a9f3d0904160534s3f0c87fep88051546f0184af5@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090413 Shredder/3.0b3pre
In-Reply-To: <be7a9f3d0904160534s3f0c87fep88051546f0184af5@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline
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
X-List-Received-Date: Thu, 16 Apr 2009 13:09:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-04-09 14:34, Otavio Salvador wrote:
> On Wed, Apr 15, 2009 at 9:06 PM, Denys Dmytriyenko<denis@denix.org>  wrote:
>> On Wed, Apr 15, 2009 at 08:54:04AM +0200, Holger Schurig wrote:
>>>> On 15-04-09 01:49, Denys Dmytriyenko wrote:
>>>>> +                 mv /tmp/uname /etc/uname
>>>>> +                 mv /tmp/cmdline /etc/cmdline
>>>>
>>>> I think we should put those in /etc/udev or /var/lib/udev if
>>>> udev will be the only consumer.
>>>
>>> +1, e.g.
>>>
>>> /etc/udev/saved.uname
>>> /etc/udev/saved.cmdline
>>
>> Good point, I'll be sending the update. Are there any other
>> comments/suggestions?
>
> It would be nice to, while on that, evaluate the possibility
> of updating udev; 0.141 fixes a serious security whole
> and even if most embedded systems usually runs as root,
> there're many that doesn't.

Also 141 will allow us to reduce the recipe to something like 'inherit 
autotools_stage' :)

regards,

Koen




