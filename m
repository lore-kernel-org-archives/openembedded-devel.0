Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q6kM4-0007vS-F8 for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:02:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q6kK5-00079p-J7 for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:00:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 16:00:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 16:00:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 04 Apr 2011 15:58:40 +0200
Message-ID: <inciqg$3vi$2@dough.gmane.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>	<1300983264-16652-1-git-send-email-obi@opendreambox.org>
	<4D99C0EA.5070902@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D99C0EA.5070902@opendreambox.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Mon, 04 Apr 2011 14:02:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-04-11 15:00, Andreas Oberritter wrote:
> Ping. Any votes for or against this patch with either appended or
> prepended PR?

I don't like this patch *at all*. Recipes can already do
MACHINE_KERNEL_PR_append = "something" if they need to.

Can you should me a specific example on how this would be an improvement?

regards,

Koen

> 
> On 03/24/2011 05:14 PM, Andreas Oberritter wrote:
>> Based on http://comments.gmane.org/gmane.comp.handhelds.openembedded/42905
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> CC: Denis Dydychkin <nyrl@mail.ru>
>> CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>> v2: Move code to machine-kernel-pr.bbclass, to avoid duplication and to
>>     allow other recipes to inherit it. This is useful for tasks which
>>     depend on different kernel modules for different kernel versions,
>>     e.g. madwifi-ng for old kernels, but ath5k for new kernels.
>>
>>  classes/kernel.bbclass            |    7 ++-----
>>  classes/machine-kernel-pr.bbclass |   15 +++++++++++++++
>>  classes/module-base.bbclass       |   11 ++---------
>>  3 files changed, 19 insertions(+), 14 deletions(-)
>>  create mode 100644 classes/machine-kernel-pr.bbclass
>>
>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>> index 0109ce6..0187fb3 100644
>> --- a/classes/kernel.bbclass
>> +++ b/classes/kernel.bbclass
>> @@ -20,13 +20,10 @@ python __anonymous () {
>>      image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>>      if image:
>>          bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
>> -
>> -    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>> -
>> -    if machine_kernel_pr:
>> -       bb.data.setVar('PR', machine_kernel_pr, d)
>>  }
>>  
>> +inherit machine-kernel-pr
>> +
>>  INITRAMFS_IMAGE ?= ""
>>  INITRAMFS_TASK ?= ""
>>  
>> diff --git a/classes/machine-kernel-pr.bbclass b/classes/machine-kernel-pr.bbclass
>> new file mode 100644
>> index 0000000..a72a0c0
>> --- /dev/null
>> +++ b/classes/machine-kernel-pr.bbclass
>> @@ -0,0 +1,15 @@
>> +# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>> +# rebuilds for kernel and external modules
>> +python __anonymous () {
>> +    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>> +    if machine_kernel_pr:
>> +       # Append
>> +       # a) .X, if the recipe's PR is rX, or
>> +       # b) +${PR}, if the recipe's PR doesn't begin with r
>> +       pr = bb.data.getVar('PR', d, True)
>> +       if pr.startswith('r'):
>> +               suffix = '.' + pr[1:]
>> +       else:
>> +               suffix = '+' + pr
>> +       bb.data.setVar('PR', machine_kernel_pr + suffix, d)
>> +}
>> diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
>> index 9aaaa4e..1a97955 100644
>> --- a/classes/module-base.bbclass
>> +++ b/classes/module-base.bbclass
>> @@ -2,18 +2,11 @@ inherit module_strip
>>  
>>  inherit kernel-arch
>>  
>> +inherit machine-kernel-pr
>> +
>>  export OS = "${TARGET_OS}"
>>  export CROSS_COMPILE = "${TARGET_PREFIX}"
>>  
>> -# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>> -# rebuilds for kernel and external modules
>> -python __anonymous () {
>> -    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>> -
>> -    if machine_kernel_pr:
>> -       bb.data.setVar('PR', machine_kernel_pr, d)
>> -}
>> -
>>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>>  export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
>>  KERNEL_OBJECT_SUFFIX = "${@[".o", ".ko"][base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion') > "2.6.0"]}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNmc6QMkyGM64RGpERApSbAJkBcJm8dGGqOLOftp/ulcfEyQjR+ACgjPAu
LUeJwMv5bmRdL9kDne0GvIc=
=U/65
-----END PGP SIGNATURE-----



