Received: from [209.85.134.184] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3CJW-0002gQ-2I
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2007 16:18:58 +0100
Received: by mu-out-0910.google.com with SMTP id w8so1737791mue.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 07:14:26 -0800 (PST)
Received: by 10.82.171.16 with SMTP id t16mr8683092bue.11.1197645265865;
	Fri, 14 Dec 2007 07:14:25 -0800 (PST)
Received: from ?192.168.61.156? ( [194.79.8.34])
	by mx.google.com with ESMTPS id p38sm12466509fke.2007.12.14.07.14.23
	(version=SSLv3 cipher=OTHER); Fri, 14 Dec 2007 07:14:24 -0800 (PST)
Date: Fri, 14 Dec 2007 17:17:58 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1786793960.20071214171758@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <476093AA.1060408@whitby.id.au>
References: <172123670.20071213035412@gmail.com>
	<476093AA.1060408@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Standardized Linux-based 2nd-stage bootloader
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
X-List-Received-Date: Fri, 14 Dec 2007 15:18:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Thursday, December 13, 2007, 4:06:34 AM, you wrote:

> Paul Sokolovsky wrote:
>>   During last few months, myself and other contributors worked on
>> bootloading solution which would satisfy the following criteria:
>> 
>> 1. Implemented as a Linux-based user-space application, taking
>> advantage of of the contemporary technologies, such as early userspace
>> configuration and initramfs.
>> 1. Light-weight and modular.
>> 2. Easily extensible.
>> 3. Small size.
>> 4. Machine-independent.
>> 5. Supports booting from flash devices, disk partitions, loopback
>> images, and NFS, to start with.
>> 
>>   These developments have been available in OE as
>> initrdscripts/initramfs-uniboot.bb and friends. The latest addition was
>> initramfs-module-bootmenu module, which scans all available devices,
>> presents user with the list of available boot sources as a simple
>> menu, allows one to make choice, and then boots rootfs from that
>> source.

> Paul,

> How will this system work on a headless device like an NSLU2?  Is there
> a way to set a "fallback" device, and a way to set the boot device for
> the "next" boot in both a temporary (test this, and revert to current if
> it didn't work and I power cycled again) and a permanent way (always
> boot this new way from now on)?

> Also, is there a way to load kernel modules and driver firmware blobs
> during this early init sequence, to allow for machines that have
> specific needs to bring up a userspace driver environment before it can
> even access the desired boot device?

> If these requirements are supported, the NSLU2-Linux team would be very
> interested in moving from our current slugos-specific scheme
> (implemented in packages/initscripts/initscripts-slugos_1.0.bb) to a
> more generic, better featured, and centrally supported scheme.

  initramfs-uniboot was exactly conceived to be modular to help with
extensibility and maintenance (shell scripts are known to have issues
with the latter ;-) ). It started with the desire to boot via NFS
without the need to have NFS server/g_ether compiled in statically,
then progressed with the need to boot from loopback files, finally
shaped out with the desire to be able to support *any* (not
necessarily all!) combination of these and other boot methods. Please
have a look at packages/initrdscripts/files/, and you'll see, that
there're few never too complex modules, communicating with each other
using a more or less defined interface (which is environment variables
for the shell scripts).

  Now about requirements you raise:

1. Loading machine-specific kernel modules: there's already separate
module initramfs-module-initfs which loads modules to support
different filesystems. It could be machine-overriden to do additional
initialization, or yet better to create initramfs-module-initmachine,
to keep up with the ultimate modularity ;-).

2. Timeout add default choice for selecting boot source: currently not
implemented, mainly because there's no support to save user's choice
for later usage. So, without such support it could default only to say
1st item in the list, which is not too useful. However, there's needed
support for timeouted reads in busybox, so such a feature would be
easy to implement.

3. Saving and then reusing last user's choice: not implemented simply
because there's no place to save information which would suit all
possible devices, so this would be inherently machine-specific. But
this could be implemented as follows: initramfs-module-bootmenu
accepts some variable, which, being set, causes it to have the
corresponding menu choice set as the initial, instead if the very
first. Then, there's machine-specific module, executed before
initramfs-module-bootmenu, which reads machine-specific source and
sets this value, then another module, executed after bootmenu, which
takes variable holding current user's choice and saves it.

4. Supporting automatic reverting to the last good configuration would
require more magic with additional support from init sequence. For
example, an initramfs-uniboot module could store 2 last used boot
sources in non-volatile area, with the new choice, stored last and
marked as "NEW". Then, there would be additional util,
run as the last item of init, which would mark last source as "OK".
Then, another initramfs-uniboot module (being run early) would check
if last boot source still has "NEW" status. If so, that would mean
that previous boot didn't finish successfully, so the module would use
previous choice.


         So, as I see, all these new features seem to be possible to
implement naturally with this framework, so you're welcome to give it a try.


> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



