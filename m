Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Q6lWR-0002Ux-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 17:16:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id AB9E4314FC38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2011 17:14:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id oMQlSZUGrJKs
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2011 17:14:42 +0200 (CEST)
Received: from [172.22.22.61] (ip-109-85-231-67.web.vodafone.de
	[109.85.231.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 0BB06314FC31
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2011 17:14:41 +0200 (CEST)
Message-ID: <4D99E05E.9020100@opendreambox.org>
Date: Mon, 04 Apr 2011 17:14:38 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>	<1300983264-16652-1-git-send-email-obi@opendreambox.org>	<4D99C0EA.5070902@opendreambox.org>
	<inciqg$3vi$2@dough.gmane.org>
In-Reply-To: <inciqg$3vi$2@dough.gmane.org>
Subject: Re: [PATCHv2] kernel/module-base: Append PR to	MACHINE_KERNEL_PR
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
X-List-Received-Date: Mon, 04 Apr 2011 15:16:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/04/2011 03:58 PM, Koen Kooi wrote:
> On 04-04-11 15:00, Andreas Oberritter wrote:
>> Ping. Any votes for or against this patch with either appended or
>> prepended PR?
> 
> I don't like this patch *at all*. Recipes can already do
> MACHINE_KERNEL_PR_append = "something" if they need to.

The use of MACHINE_KERNEL_PR is optional, so it feels really wrong to
append something to it in a recipe.

> Can you should me a specific example on how this would be an improvement?

With the version below. a distro can start to use MACHINE_KERNEL_PR any
time without breaking updates.

The vast majority of modules do not use MACHINE_KERNEL_PR, as the
following numbers can tell (from 2011.03-maintenance):

$ git grep 'inherit.*module' | grep -v ^linux/ | wc -l
111
$ git grep 'MACHINE_KERNEL_PR' | grep -v ^linux/ | wc -l
33
$ git grep 'MACHINE_KERNEL_PR_' | grep -v ^linux/ | wc -l
10

Of the 33 recipes, 32 are directly related to TI, AFAICT. So, besides
TI, nobody is using MACHINE_KERNEL_PR in recipes at all, with
open-iscsi-kernel being the only exception.

Only 10 of the 33 recipes use MACHINE_KERNEL_PR_append. The other 23
users use the variable to set PR inside the recipe, which indicates that
they don't inherit module-base.bbclass.

In other words, 101 of 111 or about 91% of all recipes inheriting
module-base.bbclass currently won't rebuild automatically when their PR
gets incremented and the distro uses MACHINE_KERNEL_PR.

Regards,
Andreas

>> On 03/24/2011 05:14 PM, Andreas Oberritter wrote:
>>> Based on http://comments.gmane.org/gmane.comp.handhelds.openembedded/42905
>>>
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> CC: Denis Dydychkin <nyrl@mail.ru>
>>> CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>> ---
>>> v2: Move code to machine-kernel-pr.bbclass, to avoid duplication and to
>>>     allow other recipes to inherit it. This is useful for tasks which
>>>     depend on different kernel modules for different kernel versions,
>>>     e.g. madwifi-ng for old kernels, but ath5k for new kernels.
>>>
>>>  classes/kernel.bbclass            |    7 ++-----
>>>  classes/machine-kernel-pr.bbclass |   15 +++++++++++++++
>>>  classes/module-base.bbclass       |   11 ++---------
>>>  3 files changed, 19 insertions(+), 14 deletions(-)
>>>  create mode 100644 classes/machine-kernel-pr.bbclass
>>>
>>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>>> index 0109ce6..0187fb3 100644
>>> --- a/classes/kernel.bbclass
>>> +++ b/classes/kernel.bbclass
>>> @@ -20,13 +20,10 @@ python __anonymous () {
>>>      image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>>>      if image:
>>>          bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
>>> -
>>> -    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>>> -
>>> -    if machine_kernel_pr:
>>> -       bb.data.setVar('PR', machine_kernel_pr, d)
>>>  }
>>>  
>>> +inherit machine-kernel-pr
>>> +
>>>  INITRAMFS_IMAGE ?= ""
>>>  INITRAMFS_TASK ?= ""
>>>  
>>> diff --git a/classes/machine-kernel-pr.bbclass b/classes/machine-kernel-pr.bbclass
>>> new file mode 100644
>>> index 0000000..a72a0c0
>>> --- /dev/null
>>> +++ b/classes/machine-kernel-pr.bbclass
>>> @@ -0,0 +1,15 @@
>>> +# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>>> +# rebuilds for kernel and external modules
>>> +python __anonymous () {
>>> +    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>>> +    if machine_kernel_pr:
>>> +       # Append
>>> +       # a) .X, if the recipe's PR is rX, or
>>> +       # b) +${PR}, if the recipe's PR doesn't begin with r
>>> +       pr = bb.data.getVar('PR', d, True)
>>> +       if pr.startswith('r'):
>>> +               suffix = '.' + pr[1:]
>>> +       else:
>>> +               suffix = '+' + pr
>>> +       bb.data.setVar('PR', machine_kernel_pr + suffix, d)
>>> +}
>>> diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
>>> index 9aaaa4e..1a97955 100644
>>> --- a/classes/module-base.bbclass
>>> +++ b/classes/module-base.bbclass
>>> @@ -2,18 +2,11 @@ inherit module_strip
>>>  
>>>  inherit kernel-arch
>>>  
>>> +inherit machine-kernel-pr
>>> +
>>>  export OS = "${TARGET_OS}"
>>>  export CROSS_COMPILE = "${TARGET_PREFIX}"
>>>  
>>> -# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>>> -# rebuilds for kernel and external modules
>>> -python __anonymous () {
>>> -    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>>> -
>>> -    if machine_kernel_pr:
>>> -       bb.data.setVar('PR', machine_kernel_pr, d)
>>> -}
>>> -
>>>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>>>  export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
>>>  KERNEL_OBJECT_SUFFIX = "${@[".o", ".ko"][base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion') > "2.6.0"]}"
> 

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



