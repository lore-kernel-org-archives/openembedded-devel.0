Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1PJ7TV-0000kp-Se
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 17:36:42 +0100
Received: from [192.168.1.12] (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 97315304EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 11:35:25 -0500 (EST)
Message-ID: <4CE555C8.5000503@zenlinux.com>
Date: Thu, 18 Nov 2010 08:35:20 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290046421-22553-1-git-send-email-sgarman@zenlinux.com>	<4CE48CFF.7070406@balister.org>
	<4CE493E2.3010509@zenlinux.com>	<4CE49577.4030100@balister.org>	<AANLkTimRDgCPqg3g45cQkM6M1dnBa+SRD55Kyu=pFBcN@mail.gmail.com>
	<AANLkTikWQH5fqT3VuOyrPjmevfOGtP2bHxU1Kat2cjTX@mail.gmail.com>
In-Reply-To: <AANLkTikWQH5fqT3VuOyrPjmevfOGtP2bHxU1Kat2cjTX@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 97315304EC.4C193
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tar: upgrade to version 1.25
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
X-List-Received-Date: Thu, 18 Nov 2010 16:36:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2010 12:34 AM, Martin Jansa wrote:
>>>>> Can you add tar-1.23 to the removal.txt file? Ask it be removed in a
>>>>> couple of months. This way we have a schedule to delete the older recipe.
>>>>
>>>> Thanks for the quick ack, Philip. Question though on the removal.txt
>>>> addition - this patch deletes the v1.23 version already. Does it need to
>>>> be kept around instead? I would think not given that this is a pretty
>>>> trivial update.
>>>>
>>>> Perhaps you meant tar v1.18 and/or v1.20, which are still there?
>>>
>>> Oops, I wasn't paying that close attention. I'd still leave 1.23 around for
>>> a couple of months, just in case there is some weird issue with 1.25. We
>>> should check on the older ones and add them to removal.txt also. I'd like to
>>> see us get into a sane clean up old stuff cycle, instead of the delete
>>> everything at once approach. Of course checking to see if any in tree
>>> distros use them is  good thing.
>>>
>>
>> Yeah probably a sane thing. Make 1.25 default and let 1.23 linger
>> around for a while
>> just in case.
>
> Gentoo already has serious bug reported against 1.25
> http://bugs.gentoo.org/342983
> resulting in added 1.25 being masked now there
>
> Maybe we should keep 1.23 default until it's resolved or confirmed
> that OE is not affected by this.

Thanks Martin for that research. I'm going to remove my patch from 
patchwork and look into this further. If the bug against 1.25 doesn't 
look like it will affect us, I will re-submit the patch such that 1.23 
is kept around. Otherwise we may be better off simply waiting for 
another release of tar.

FWIW tar 1.25 came out only two weeks after 1.24, which implies to me 
that they were fixing some relatively urgent bugs. As mentioned on the 
tar home page, these issues were reportedly fixed in 1.25:

* Fix extraction of empty directories with the -C option in effect
* Fix extraction of device nodes
* Make sure name matching occurs before eventual name transformation
* Fix the behavior of tar -x --overwrite on hosts lacking O_NOFOLLOW.
* Improve the testsuite

I also maintain the tar recipe for Poky, so I'll investigate further.

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


