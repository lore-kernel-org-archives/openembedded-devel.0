Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JC2Pi-00054o-Kg
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 01:33:57 +0100
Received: by fg-out-1718.google.com with SMTP id 22so3943991fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2008 16:26:59 -0800 (PST)
Received: by 10.86.51.2 with SMTP id y2mr20477008fgy.56.1199736783602;
	Mon, 07 Jan 2008 12:13:03 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id e32sm28869152fke.10.2008.01.07.12.13.02
	(version=SSLv3 cipher=OTHER); Mon, 07 Jan 2008 12:13:02 -0800 (PST)
Date: Mon, 7 Jan 2008 22:18:56 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <116173998.20080107221856@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1199663243.4658.71.camel@localhost.localdomain>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: Another weird case of PACKAGES_DYNAMIC and task deps, it seems
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
X-List-Received-Date: Tue, 08 Jan 2008 00:33:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Monday, January 7, 2008, 1:47:23 AM, you wrote:

> Hi Paul,

> On Fri, 2008-01-04 at 03:17 +0200, Paul Sokolovsky wrote:
>> Hello openembedded-devel,
>> 
>>   Situation (as reported by Thomas Kunze on IRC):
>> 1. Build from scratch
>> 2. Kernel has been built.
>> 3. Bitbake of initramfs-image.
>> 4. Failure with:
>> 
>> | ERROR: Cannot satisfy the following dependencies for initramfs-module-loop:
>> |        update-modules update-modules update-modules
>> | ERROR: Cannot satisfy the following dependencies for initramfs-module-nfs:
>> |        update-modules
>> 
>> initramfs-module-* doesn't Depends: on update-modules directly, but
>> they Suggest: some kernel-module-* which in turn Depends: on
>> update-modules.

> Hmm. Which kernel is this with?

  Thomas wanted to build adhoc bootloading initramfs for Collie, so I
assume he built for it.


>> kernel.bbclass has:
>> 
>> DEPENDS += "virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
>> 
>> But as we now know, that doesn't mean there will be package written
>> for update-modules, only that it will be "built".

> Nearly but not quite. rootfs_ipk.bbclass says:

> do_rootfs[recrdeptask] += "do_package_write_ipk"

> This means that every RDEPENDS, RRECOMMENDS and DEPENDS is followed and
> the package_write_ipk for every package found must have run.

> I just did a:

> "bitbake poky-image-minimal -g; cat task-depends.dot | grep update-modules"

> which gave me this list:

> "poky-image-minimal.do_rootfs" -> "update-modules.do_populate_staging"
> "poky-image-minimal.do_rootfs" ->
> "update-modules.do_package_write_ipk"
> "linux.do_package" -> "update-modules.do_package"
> "linux.do_configure" -> "update-modules.do_populate_staging"

> and a load of other dependencies which we aren't interested in. The key
> line is:

> "poky-image-minimal.do_rootfs" ->
> "update-modules.do_package_write_ipk"

> So the question is why doesn't your test case have this (I'm assuming it
> doesn't). My best guess is that the kernel .bb file in question alters
> DEPENDS and that update-modules isn't really in DEPENDS. Which
> kernel .bb file serves the machine in question?

  Gotcha! I tried

 MACHINE=h4000 bitbake initramfs-image -g

and it gives the same matches as you quote below. But

 MACHINE=collie bitbake initramfs-image -g

Gives zero matches for update-modules. I don't try to investigate
further now, as you probably know better about it ;-).

> Cheers,

> Richard





-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



