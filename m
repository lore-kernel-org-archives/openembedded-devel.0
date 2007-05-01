Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1HiniI-0003vu-E0
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2007 10:27:58 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 820B021AE93
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 May 2007 04:18:41 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Tue, 01 May 2007 04:18:41 -0400
X-Sasl-enc: ENtuKgDCLcL2GMD3bPF63tHcEKGdO3Rt9ph62BB0imAq 1178007521
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id CCBDD17862
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 May 2007 04:18:40 -0400 (EDT)
Message-ID: <4636F787.8030902@whitby.id.au>
Date: Tue, 01 May 2007 17:47:11 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Subject: RFC: Rename MACHINE_TASK_PROVIDER to DEFAULT_TASK_PROVIDER
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2007 08:27:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> <rwhitby> so in my mokoslug distro, I set MACHINE_TASK_PROVIDER to task-boot or task-base, depending on flash size.
> <rwhitby> what is MACHINE_TASK_PROVIDER really meant to be used for?
> <koen> to distinguish between task-bootstrap and task-base
> <rwhitby> does task-bootstrap still exist?
> <koen> rwhitby: I hope not
> <rwhitby> koen: so MACHINE_TASK_PROVIDER has no current reason for existence then?
> <rwhitby> (and no definition of what it should be used for if it did have a current reason for existence)
> <koen> rwhitby: not that I know off, but your task-boot suggestion would make sense
> <rwhitby> koen: So it really should now be called something like BOOTSTRAP_IMAGE_FOUNDATION_TASK or something?
> <rwhitby> (since it doesn't have anything to do with MACHINEs)
> <koen> nor with BOOTSTRAP
> <koen> something like DEFAULT_TASK_PROVIDER?
> <rwhitby> yep, DEFAULT_TASK_PROVIDER floats my boat.
> <koen> do you want to write an RFC for that?

The proposal is to replace MACHINE_TASK_PROVIDER with
DEFAULT_TASK_PROVIDER throughout OE, and encourage all image-foo.bb
maintainers to base their image on DEFAULT_TASK_PROVIDER (which can be
set to task-boot, or task-base, or perhaps some other distro-specific
single task-foo value), plus other image-specific stuff.

Comments?  Objections?

BTW, task-bootstrap existence is as follows:

> ./conf/distro/generic.conf:PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
> ./conf/distro/include/oplinux.inc:PREFERRED_PROVIDER_task-bootstrap = "task-base"
> ./conf/distro/angstrom-2007.1.conf:PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
> ./conf/distro/jlime-donkey.conf:PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
> ./conf/distro/openprotium.conf:#PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
> ./conf/machine/gumstix.conf:PREFERRED_VERSION_task-bootstrap = "1.0unionroot"
> ./packages/obsolete/tasks/task-bootstrap-unionroot.bb:PROVIDES = "task-bootstrap"
> ./packages/obsolete/tasks/task-bootstrap-unionroot.bb:RPROVIDES = "task-bootstrap"
> ./packages/obsolete/tasks/task-bootstrap-unionroot.bb:require task-bootstrap.inc
> ./packages/obsolete/tasks/task-bootstrap.bb:require task-bootstrap.inc
> ./packages/images/jlime-opie.bb:DEPENDS = "task-bootstrap task-opie"
> ./packages/images/jlime-opie.bb:INSTALL_PACKAGES = "task-bootstrap task-opie-base task-opie-base-applets \
> ./removal.txt:Package Name:   task-bootstrap*

-- Rod


