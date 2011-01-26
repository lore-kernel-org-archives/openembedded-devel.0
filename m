Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiBR6-0006qK-EI
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:53:48 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PiBQK-0001Si-6x from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:53:00 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 11:53:00 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 12:52:58 -0700
Message-ID: <4D407B96.2010801@mentor.com>
Date: Wed, 26 Jan 2011 12:52:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
	<1296065612-9637-8-git-send-email-rep.dot.nop@gmail.com>
	<4D407550.8040903@mentor.com>
In-Reply-To: <4D407550.8040903@mentor.com>
X-OriginalArrivalTime: 26 Jan 2011 19:52:58.0864 (UTC)
	FILETIME=[A1DC5F00:01CBBD92]
Subject: Re: [PATCH 7/9] kernel.bbclass: simplify "if image" condition
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
X-List-Received-Date: Wed, 26 Jan 2011 19:53:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 12:26 PM, Tom Rini wrote:
> On 01/26/2011 11:13 AM, Bernhard Reutner-Fischer wrote:
>> Anything that expands image to any false value should not set
>> INITRAMFS_TASK (instead of just "" or None).
>>
>> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> ---
>> classes/kernel.bbclass | 2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>> index ea1daf6..d0608e5 100644
>> --- a/classes/kernel.bbclass
>> +++ b/classes/kernel.bbclass
>> @@ -18,7 +18,7 @@ python __anonymous () {
>> bb.data.setVar("DEPENDS", depends, d)
>>
>> image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>> - if image != '' and image is not None:
>> + if image:
>> bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
>>
>> machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>
> Er, right below these lines it still does:
> INITRAMFS_IMAGE ?= ""
> INITRAMFS_TASK ?= ""
>
> Which would be a problem yes? Or is there some pythonism I'm forgetting?

OK, after some quick IRC conversation, my only concern is the message 
wasn't clear to me, but the changes are fine.  Could it be expanded to say:
Remove some checks because <existing message more or less> means they 
aren't necessary?

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


