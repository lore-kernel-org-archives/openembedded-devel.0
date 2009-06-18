Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1MH5EG-0008RQ-GO
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 02:11:44 +0200
Received: by yw-out-1718.google.com with SMTP id 5so306819ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=/WS+OPVxo+J6jSsQQi1OqPIHUg02DJ4NX/ai8u9zK6A=;
	b=SDJ787/VC/H3Kdje3xTZ4P76rG+s48DveKRAmbmFVMZ1FrS0tBroR5XHH5qVUKAR2e
	6AuoJAjWm1Gp7/PsMXjNomn3VAKCGNebuX4THl7zEhaV7YYmHUU2yPqix/ZZYRFnta6H
	4uPSmhk5NsyIa5zY5PLFA2lVTqk2UHV2vItLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Fhva68uoWr2Krhnt8T1Gll4QHjWlPoWY0ketm5Wge9NYwAi0mlLceLCYuplc+6aPLp
	LxmxUL3UeWL0Ba0zczDFc8Nfy24nZ4PBeyrNdOqIA/0EQY+ldc1/SmZnJknEkTgThi85
	UJWCwkK7T70DV2W9kfYgsJvvPS6WSCEp3ura8=
MIME-Version: 1.0
Received: by 10.151.7.10 with SMTP id k10mr2255015ybi.260.1245283274385; Wed, 
	17 Jun 2009 17:01:14 -0700 (PDT)
Date: Wed, 17 Jun 2009 21:01:14 -0300
Message-ID: <37367b3a0906171701h2a5b7f38wf1f52ebeead3972d@mail.gmail.com>
From: Alan Carvalho de Assis <acassis@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Error building busybox_1.13.2
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
X-List-Received-Date: Thu, 18 Jun 2009 00:11:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi list,

I am updating mx27ads as suggested by Tom Rini, but I found an issue.

The busybox_1.13.2 is broking during the do_install phase.

It is looking for:
tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/simple.script

instead:
tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/busybox-1.13.2/examples/udhcp/simple.script
(see error log below for further information)

I fixed it editing "openembedded/recipes/busybox/busybox.inc" and replacing:

install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default

by this one:

install -m 0755 ${S}/examples/udhcp/simple.script
${D}${sysconfdir}/udhcpc.d/50default


Is this fix right? Or would be better to create a specific
busybox_1.13.2.bb to solve it?

Regards,

Alan

NOTE: Running task 324 of 461 (ID: 8,
/home/alan/oe/stuff/openembedded/recipes/busybox/busybox_1.13.2.bb,
do_install)
ERROR: function do_install failed
ERROR: log data follows
(/home/alan/oe/stuff/tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/temp/log.do_install.15786)
| NOTE: make -e MAKEFLAGS= V=1 ARCH=arm
CROSS_COMPILE=arm-angstrom-linux-gnueabi-
CROSS=arm-angstrom-linux-gnueabi- busybox.links
| make: `busybox.links' is up to date.
| CONFIG_HTTPD=y
| CONFIG_APP_UDHCPD=y
| CONFIG_HWCLOCK=y
| CONFIG_APP_UDHCPC=y
| install: cannot stat
`/home/alan/oe/stuff/tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/simple.script':
No such file or directory
NOTE: Task failed:
/home/alan/oe/stuff/tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/temp/log.do_install.15786
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/alan/oe/stuff/openembedded/recipes/busybox/busybox_1.13.2.bb
do_install failed
ERROR: Task 8 (/home/alan/oe/stuff/openembedded/recipes/busybox/busybox_1.13.2.bb,
do_install) failed
NOTE: Tasks Summary: Attempted 323 tasks of which 323 didn't need to
be rerun and 1 failed.
ERROR: '/home/alan/oe/stuff/openembedded/recipes/busybox/busybox_1.13.2.bb'
failed
BB>> exit
alan@metropolis:~/oe/stuff$ cd
/home/alan/oe/stuff/tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/
alan@metropolis:~/oe/stuff/tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1$
find . -name simple.script
./busybox-1.13.2/examples/udhcp/simple.script
./busybox-1.13.2/.pc/udhcpscript.patch/examples/udhcp/simple.script
./busybox-1.13.2/.pc/udhcpc-fix-nfsroot.patch/examples/udhcp/simple.script


