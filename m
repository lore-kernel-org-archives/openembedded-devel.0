Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1La6td-0006x5-9e
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 12:16:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1La6rL-0002k4-2u
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 11:14:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 19 Feb 2009 11:14:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Feb 2009 11:14:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 19 Feb 2009 12:14:18 +0100
Message-ID: <gnjeua$b0f$1@ger.gmane.org>
References: <gneadq$s6g$1@ger.gmane.org>	<20090217163526.GF11815@smtp.west.cox.net>	<gnhksv$49n$1@ger.gmane.org>	<20090218192246.GM11815@smtp.west.cox.net>
	<gnjcun$429$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <gnjcun$429$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] removing DISTRO_* vars from task-boot
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
X-List-Received-Date: Thu, 19 Feb 2009 11:16:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-02-09 11:40, Koen Kooi wrote:
> On 18-02-09 20:22, Tom Rini wrote:
>> On Wed, Feb 18, 2009 at 07:43:42PM +0100, Koen Kooi wrote:
>>> On 17-02-09 17:35, Tom Rini wrote:
>>>> On Tue, Feb 17, 2009 at 01:26:34PM +0100, Koen Kooi wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> Lately I have been wondering how to change the /dev manager on a per
>>>>> image base, since I want udev for most images and busybox-mdev for
>>>>> special-purpose stuff. The catch is that I want to keep using
>>>>> task-boot
>>>>> for both.
>>>>>
>>>>> Currently we have:
>>>>>
>>>>> DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES",
>>>>> "kernel26",
>>>>> "udev","",d)}"
>>>>> DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
>>>>> DISTRO_INITSCRIPTS ?= "initscripts"
>>>>> DISTRO_LOGIN_MANAGER ?= "tinylogin"
>>>>>
>>>>> in task-boot.bb
>>>>>
>>>>> There are various ways we could attack this:
>>>>>
>>>>> 1) The image.bbclass way:
>>>>>
>>>>> Put the following in image.bbclass:
>>>>>
>>>>> IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",
>>>>> "udev","",d)}"
>>>>> IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
>>>>> IMAGE_INITSCRIPTS ?= "initscripts"
>>>>> IMAGE_LOGIN_MANAGER ?= "tinylogin"
>>>>>
>>>>> Pros:
>>>>> * Takes immediate effect
>>>>> * Can have distro defaults, overridable per image
>>>>>
>>>>> Cons:
>>>>> * marks them as 'user installed'
>>>>> * you can't 'debootstrap' from tasks anymore, you need to encode
>>>>> knowledge about the above vars into the debootstrap script
>>>> I really like this one as for our uses there's times where I'd rather
>>>> let busybox handle INIT_MANAGER and LOGIN_MANAGER too.
>>> Philip C. agrees with you. Should be move everything over or start with
>>> IMAGE_DEV_MANAGER?
>>
>> I say do it all now. Flexibility is good, lets get it done.
>
> The patch should appear on this ml right about now.

Mailman seems to hate me:

http://amethyst.openembedded.net/~koen/0001-task-boot-rename-DISTRO_-vars-to-IMAGE_-vars-and-mo.patch



