Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HcI2V-0000EJ-09
	for openembedded-devel@openembedded.org; Fri, 13 Apr 2007 11:25:55 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 5FEE7215FAA
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 05:26:02 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 13 Apr 2007 05:25:55 -0400
X-Sasl-enc: slnTqnE56P2DVN2ICAYvZUnCRvXppcSlGT8rAIkUtG1G 1176456354
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 27E2516681
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Apr 2007 05:25:53 -0400 (EDT)
Message-ID: <461F4C4A.7010401@whitby.id.au>
Date: Fri, 13 Apr 2007 18:54:26 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.0.0
Subject: Where should MACHINE_TASK_PROVIDER be defined?
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
X-List-Received-Date: Fri, 13 Apr 2007 09:25:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

There seems to be significant inconsistency in the way that
MACHINE_TASK_PROVIDER is defined in OE (see the output of a recursive
grep command in .../conf at the end of this message).

It's defaulted to "task-base" in bitbake.conf, and then every man and
his dog forcibly defines it to the same thing in a variety of
machine.conf files and distro.conf files.

Should all of these instances simply be deleted, cause none of them
actually change the default, and all of them stop the user from changing
 it in local.conf ...

If it is to be overridden, should it be a distro override or a machine
override?  What would be normal reasons for overriding it?

> find . -type f -print0 | xargs -0 grep MACHINE_TASK_PROVIDER
> ./distro/include/angstrom.inc:MACHINE_TASK_PROVIDER = "task-base"
> ./distro/include/openmoko.inc:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/collie.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/h3600.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/jornada6xx.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/jornada7xx.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/mainstone.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/netvista.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/nokia770.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/omap5912osk.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/include/zaurus-2.6.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/include/lsppc.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/simpad.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/x86.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/devkitidp-pxa255.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/qemuarm.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/efika.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/logicpd-pxa270.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/htcuniversal.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/dht-walnut.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/titan.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/wrap.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/smdk2440.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/compulab-pxa270.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/storcenter.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/qemux86.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/fic-gta01.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/shark.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/turbostation.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/n2100.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/smdk2443.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./machine/lsarm.conf:MACHINE_TASK_PROVIDER = "task-base"
> ./bitbake.conf:MACHINE_TASK_PROVIDER ?= "task-base"

-- Rod



