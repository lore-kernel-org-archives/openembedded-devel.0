Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J4QLU-0003nk-OA
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 01:30:05 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 499C07E9A2;
	Mon, 17 Dec 2007 19:25:13 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 17 Dec 2007 19:25:13 -0500
X-Sasl-enc: 5akgTMV0SbejYQMueHlds+Eyp4h4byf2Pmtj1nlF5N6h 1197937510
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 0D5F74E5F;
	Mon, 17 Dec 2007 19:25:09 -0500 (EST)
Message-ID: <47671326.3090300@whitby.id.au>
Date: Tue, 18 Dec 2007 10:54:06 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Paul Sokolovsky <pmiscml@gmail.com>
Subject: pfalcon: revert r5dc6982e... vfat nls modules are not for task-base-kernel26
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
X-List-Received-Date: Tue, 18 Dec 2007 00:30:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<CIA-34> pfalcon org.oe.dev * r5dc6982e... / (1
packages/tasks/task-base.bb):
<CIA-34> task-base: Add NLS modules for VFAT support.
<CIA-34> * Add to task-base-kernel26, as vfat is pretty basic feature.
<CIA-34> Worth refactoring to vfat feature still, I guess.

You guessed right.

kernel26 is not a kitchen sink where you can just add vfat-related nls
modules that are not strictly required for booting a 2.6 kernel.

Your addition has just *bloated* the rootfs for *every* 2.6 machine,
including those that have no possible way of ever mounting an external
memory stick at all, let alone a vfat-formatted one.

vfat is *not* a basic feature that should be enabled for all 2.6 kernel
machines.  If you want vfat nls modules, then create a vfat feature
(just like there is an ext2 feature).  Do not pollute the basic kernel26
feature with this stuff.

And the comment about "# If you don't need VFAT support - don't enable
them in defconfig." is not applicable, because there are machines that
want vfat-related nls modules available in the feed as a downloadable
package, but not in the initial rootfs.  Therefore they need to be in
the defconfig, but certainly should not be in task-base-kernel26.

I expect you to revert this change and do it properly, or not do it at all.

-- Rod


