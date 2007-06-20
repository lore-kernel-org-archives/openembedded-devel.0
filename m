Received: from [65.54.246.94] (helo=bay0-omc1-s22.bay0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pelle2004@hotmail.com>) id 1I0wjw-0005Zq-F1
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 11:44:40 +0200
Received: from hotmail.com ([65.55.154.106]) by bay0-omc1-s22.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.2668); 
	Wed, 20 Jun 2007 02:40:57 -0700
Received: from mail pickup service by hotmail.com with Microsoft SMTPSVC;
	Wed, 20 Jun 2007 02:40:57 -0700
Message-ID: <BAY143-F26F6CAE5A52DDDF6A67FC9B9110@phx.gbl>
Received: from 65.55.154.123 by by143fd.bay143.hotmail.msn.com with HTTP;
	Wed, 20 Jun 2007 09:40:54 GMT
X-Originating-IP: [194.236.6.194]
X-Originating-Email: [pelle2004@hotmail.com]
X-Sender: pelle2004@hotmail.com
From: "Pelle Svensson" <pelle2004@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Bcc: 
Date: Wed, 20 Jun 2007 11:40:54 +0200
Mime-Version: 1.0
X-OriginalArrivalTime: 20 Jun 2007 09:40:57.0669 (UTC)
	FILETIME=[1AB3AF50:01C7B31F]
Subject: Question - How dose bitbake select a kernel
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
X-List-Received-Date: Wed, 20 Jun 2007 09:44:40 -0000
Content-Type: text/plain; charset=iso-8859-1; format=flowed


Hi,

I'm starting to put together a image.bb file.
I can't figure out how I control the selection of kernel.
In the tasks file it says 'RDEPENDS=... kernel ...'.
When building in verbose I get

NOTE: multiple providers are available for runtime kernel 
(poodle-kernel-2.4-embedix, LAB-kernel, linux-h1940, linux-omap-2.6, 
a780-kernel, linux-bast, corgi-kernel-2.4-embedix, 
shepherd-kernel-2.4-embedix, linux, poodle255-kernel-2.4-embedix, 
husky-kernel-2.4-embedix);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime kernel

1. How did bitbake come up with this list? Is done by bb-file's name or a 
tag inside?
2. Should I add 'PREFERRED_PROVIDER_kernel=my-target-kernel.bb'  if so 
where?

/Pelle

imabe.bb
=======

LICENSE = "MIT"
PR = "r1"

BP3155_EXTRA_INSTALL ?= ""
DISTRO_SSH_DAEMON ?= "dropbear"

RDEPENDS = "task-boot \
            ${DISTRO_SSH_DAEMON} \
	   "

export IMAGE_BASENAME = "minimalist-image"
export IMAGE_LINGUAS = ""
export PACKAGE_INSTALL = "${RDEPENDS}"

inherit image

part of task-boot.bb
==========
#
# minimal set of packages - needed to boot
#
RDEPENDS_task-boot = "\
    kernel \
    base-files \
    base-passwd \
    busybox \
    initscripts \
    modutils-initscripts \
    netbase \
    update-alternatives \
    ${DISTRO_DEV_MANAGER} \
    ${DISTRO_INIT_MANAGER} \
    ${DISTRO_LOGIN_MANAGER} \
    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

_________________________________________________________________
Se artisterna uppträda för en grön planet http://liveearth.se.msn.com/



