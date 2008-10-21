Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KsBp6-0006o4-2Y
	for openembedded-devel@openembedded.org; Tue, 21 Oct 2008 09:38:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KsBoh-0004uW-AC
	for openembedded-devel@openembedded.org; Tue, 21 Oct 2008 07:38:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Oct 2008 07:38:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Oct 2008 07:38:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Oct 2008 09:37:59 +0200
Message-ID: <gdk0so$7qm$1@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF479@hiob.intern.dresearch.de>	<f96d234e0810200859p70d3e127qa41e01266e2efd47@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF47B@hiob.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF47B@hiob.intern.dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Tue, 21 Oct 2008 07:38:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-10-2008 08:49, Sledz, Steffen wrote:
>> There is really not much more to it than create a machine conf, and a
>> kernel configuration.  For the kernel, the preferred approach seems to
>> be to use a generic linux-2.6.xx.bb recipe, and add your machine to
>> the version you support.  Occasionally, other packages will have
>> machine specific tweaks, but that is not required.
>
> Are there conventions in naming of the kernel recipes? If i look into the relevant directories i can see various methods:
>
> 1. "${MACHINE}-kernel" (e.g. mx21ads.conf)
> 2. "linux-${MACHINE}" (e.g. magicbox.conf)
> 3. fix names like "linux-wrap-geode" for wrap.conf
>
> Is one of them preferred?

None of the above. As Cliff said in his earlier mail:

   "For the kernel, the preferred approach seems to be to use a generic 
linux-2.6.xx.bb recipe, and add your machine to the version you support."

So:

a) find out which kernel version your custom kernel is (e.g 2.6.27)
b) extract the diff (diff -Nurd linux-2.6.27/ linux-2.6.27-mymachine/)
c) add SRC_URI_append_mymachine = "file://mymachine.diff" to linux_2.6.27.bb
d) put defconfig in packages/linux/linux-2.6.27/mymachine/defconfig

Step b) is optional if you already have a diff.

If you really, really need to be 'special'[1][2] you can create your 
'own' kernel recipe with the naming options you mentioned, then please 
use linux.inc to the basics working well. If even that is not 'special' 
enough, then well, you are on your own.

By reusing a linux_2.6.xx recipe you can easily see what kind of patches 
other machines are applying and how issues with that kernel get solved.

Most of the time people that add new hardware to OE go through something 
like this (ARM example):

- add mymachine.conf, linux-mymachine_2.6.xx.bb, openmymachine.conf distro
- complain toolchain doesn't build, copy over versions from angstrom to 
get it fixed
- complain their device doesn't boot, change defconfig to support EABI 
to get it fixed
- complain NFS doesn't work, change defconfig to get that fixed

The toolchain problems wouldn't have been there if people had used an 
existing, working distro like angstrom, the kernel issues mentioned 
above are all handled automagically by linux.inc.

So people, please start by reusing existing things and creating your own 
stuff *when need arises*, not when NIH arises.

</rant>

regards,

Koen

[1] Which you really don't need, but companies seem to feel better when 
their name is plastered all over the place e.g. linux-mycompany_2.6.27.bb.
[2] No, I'm not a native English speaker, but yes, I do understand the 
special-between-quotes connotation.



