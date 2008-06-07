Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K4xJ0-0003Bz-7i
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 14:13:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K4xEC-0004mq-G4
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 12:09:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 07 Jun 2008 12:09:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 07 Jun 2008 12:09:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 07 Jun 2008 14:08:50 +0200
Message-ID: <g2dtoj$2u4$1@ger.gmane.org>
References: <f96d234e0805301122s1b48445ardf7d268fcebdec50@mail.gmail.com>	<200806021019.50397.openembedded@haerwu.biz>	<f96d234e0806020753l21423d51kef19c7bc00f02244@mail.gmail.com>	<loom.20080605T225939-65@post.gmane.org>	<loom.20080606T002255-512@post.gmane.org>	<f96d234e0806060651g12575666k2699643198a78262@mail.gmail.com>
	<f96d234e0806070423k5361f4a7g2b48cee0f8f0a659@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <f96d234e0806070423k5361f4a7g2b48cee0f8f0a659@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Cc: openembedded-users@lists.openembedded.org
Subject: Re: adding German local files to an image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 07 Jun 2008 12:13:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> On Fri, Jun 6, 2008 at 9:51 AM, Cliff Brake<cliff.brake@gmail.com>  wrote:
>> Another observation, I can install glibc-locale-de on a device using
>> opkg, but not at rootfs time:
>>
>> Works on device:
>>
>> root@:~# opkg install glibc-locale-de
>> Installing glibc-locale-de (2.6.1-r4) to root...
>> Downloading http://hq.bec-systems.com/feeds/armv5te/glibc-locale-de_2.6.1-r4_armv5te.ipk
>> 100% |========================================================================|
>> Configuring glibc-locale-de
>> root@:~# opkg files glibc-locale-de
>> Package glibc-locale-de (2.6.1-r4) is installed on root and has the
>> following files:
>> /usr/share/locale/de/LC_MESSAGES/libc.mo
>>
>> But not at rootfs build time if I add glibc-locale-de to IMAGE_INSTALL
>>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: '['/build//_build/oe/oe/custom/packages/images/rootfs-vac-table-image.bb']'
>> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
>> 'glibc-locale-de' but it wasn't found in any PACKAGE or RPROVIDES
>> variables
>> NOTE: Runtime target 'glibc-locale-de' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['glibc-locale-de']
>> ERROR: Required build target 'rootfs-vac-table-image' has no buildable
>> providers.
>> Missing or unbuildable dependency chain was:
>> ['rootfs-vac-table-image', 'glibc-locale-de']
>> cbrake@happy:/build//_build/oe$
>
> The reason for the above behavior is locale packages are created
> dynamically, so bitbake has no knowledge of them.  Adding the
> following to bitbake.conf as as suggested on IRC last night would fix
> that:
>
> PACKAGES_DYNAMIC = "${PN}-locale-*"
>
> Any objections to adding this?

Yes, since it's wrong for most packages. Only packages with locales will 
generated locales, and even for those we also have a global USE_NLS 
switch to disable that.

So: Nack



