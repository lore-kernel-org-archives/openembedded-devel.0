Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J4R2I-0004Pk-Mx
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 02:14:18 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 16FF77E9FF;
	Mon, 17 Dec 2007 20:09:27 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 17 Dec 2007 20:09:27 -0500
X-Sasl-enc: nFuJYq+4wSXrbxYvROFXUWiLe+BySZGNRWJfSBbYagXq 1197940166
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id A7D20B745;
	Mon, 17 Dec 2007 20:09:25 -0500 (EST)
Message-ID: <47671D87.8090709@whitby.id.au>
Date: Tue, 18 Dec 2007 11:38:23 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <47671326.3090300@whitby.id.au>
	<1672988162.20071218025052@gmail.com>
In-Reply-To: <1672988162.20071218025052@gmail.com>
X-Enigmail-Version: 0.95.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pfalcon: revert r5dc6982e... vfat nls modules are not for task-base-kernel26
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2007 01:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Tuesday, December 18, 2007, 2:24:06 AM, you wrote:
>> kernel26 is not a kitchen sink where you can just add vfat-related nls
>> modules that are not strictly required for booting a 2.6 kernel.
> 
>   As you perfectly know, defining what is strictly required is yet
> long task to do for OE and specific machine in it. Whereas Angstrom
> RCs are something to do right now.

Are you seriously putting forward the position that vfat nls modules
should be part of the basic kernel26 task, even when you yourself put a
comment in the file saying that it should be in a separate feature?

Angstrom RCs are not a license to violate basic task separation principles.

>> Your addition has just *bloated* the rootfs for *every* 2.6 machine,
> 
>   No, it did not. It just added 10k of uncompressed modules.

10k that is not required, and is forcibly imposed, is a bloat.
task-base has a fine granularity for a reason (in fact, that is the very
reason it was created).  You are violating that fine granularity, and
imposing your choice on others without allowing them to 'opt-in' via a
feature.

>> vfat is *not* a basic feature that should be enabled for all 2.6 kernel
>> machines.  If you want vfat nls modules, then create a vfat feature
>> (just like there is an ext2 feature).  Do not pollute the basic kernel26
>> feature with this stuff.
> 
>   Yeah, I have hundreds of other items on my list too ;-).

The length of your todo list is immaterial to committing correct changes
to task-base.

>> And the comment about "# If you don't need VFAT support - don't enable
>> them in defconfig." is not applicable, because there are machines that
>> want vfat-related nls modules available in the feed as a downloadable
>> package, but not in the initial rootfs.  Therefore they need to be in
>> the defconfig, but certainly should not be in task-base-kernel26.
> 
>   Again, lots of things need to be, etc. But for now (as is), my doing it
> right won't help any machine except some small nslu2.

nslu2 is irrelevant here.  This is a violation of the basic principle
upon which task-base was created.

> Because vfat of
> course will be a distro feature, and so far 1) only nslu overrides
> angstrom's DISTRO_FEATURES. Also, there're following things to
> consider:
> 
> 2) It's unclear if vfat feature should ship only 40-50K of kernel
> modules, or truly bloat it with dosfsutils. Maybe fdisk?

If that is the case, then those things can be incrementally added to
task-base-vfat, without impacting machines that do not enable
task-base-vfat.

> 3) There's also need to clear off machine configs from this stuff,
> including proverbial fic-gta*.conf.

Yes, and those machines that want to take advantage of vfat nls modules
can enable the vfat feature.  And those machines that do not want to
take advantage of the feature are not *forced* *without* *choice* to
include those things in the rootfs.

>   So, I'm actually glad that you care about such stuff. So, while I
> planned to do all stuff above via RFCs over following Angstrom RCs,

Sorry, but Angstrom RCs are not a license to violate basic task-base
principles.

> I'd be glad to just do another quick fix now as you request and
> offload tasks 1-3 above to you. How that sounds?

Well, I've already sent you an example patch (it's not correct, nor
complete, so don't commit it as-is).  For #1 and #3 it's up to each
distro or machine maintainer to make the conscious choice to enable this
new feature.  For #2, that's something that is done incrementally by
each person who requires another package to be added to task-base-vfat.
 If these things are done properly, then tasks can be done incrementally
without impacting other distros and machines.

If you instead want to put in a quick fix for a particular machine or
distro, then use a machine and distro override.  Do *not* pollute all
machines or distros that use task-base by violating the basic principles
of the task-base package.

-- Rod


