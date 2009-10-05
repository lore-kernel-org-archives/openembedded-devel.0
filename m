Received: from [141.89.48.7] (helo=mail.cs.uni-potsdam.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1Mul9k-0007l1-CC
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 12:51:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id BF5F784001
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 12:51:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Rw-e9mddX1lZ
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 12:51:08 +0200 (CEST)
Received: from [141.89.52.43] (orest.ift.cs.uni-potsdam.de [141.89.52.43])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.uni-potsdam.de (Postfix) with ESMTPSA id B083B7C001
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 12:51:08 +0200 (CEST)
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254396803.21355.48.camel@orest.ift.cs.uni-potsdam.de>
References: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
	<1254396803.21355.48.camel@orest.ift.cs.uni-potsdam.de>
Date: Mon, 05 Oct 2009 12:50:09 +0200
Message-Id: <1254739809.14756.20.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 141.89.48.7
X-SA-Exim-Mail-From: akzare@cs.uni-potsdam.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How do I build OE for PPC-405 inside Virtex 4?
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
X-List-Received-Date: Mon, 05 Oct 2009 10:51:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo,

Only for notation, I have solved my issue referring to the limitation on
ramdisk size.

Inside the Linux Kernel Configuration, the "Default RAM disk size"
should be modified:

--------------
Linux kernel Configuration utility:

|-- Device Drivers
|    |-- Block devices
|         |-- RAM block device support
|              |-- (xxx) Default RAM disk size (kbytes)
--------------

with changing (xxx) value it would be possible to use ramdisk space up
to 60M (xxx -> 61440) or ... and seems it was the boundary which
controls the settings inside the bitbake.conf.

Also, scp is used instead of ftp and is working perfect, but on each
system reboot I must delete the relevant RSA host key
in ../.ssh/known_hosts file inside my desktop PC.

ciao
Ali

PS: Embedded Linux Primer by Christopher Hallinan was an invaluable book
to get me help understanding a lot of things around system boot
procedure and I would strongly recommend it to anyone who is beginner
(newbie) like me in this area.

> 1) If I would increase the size of ramdisk more than approximately 25%
> of total installed physical memory size, I will hit with another problem
> in the boots up time which complains for exceeding the threshold size.
> It seems somewhere should be a limitation or setting for it. Is there
> any idea where?
> 
> 2) More often in our development and debug process, ftp would be desired
> to copy the new application binary through network. As I checked there
> is no ftp tool already installed in the ramdisk (only there is tftp from
> busybox-1.13.2-r18). Would you let me know how I should put ftp in the
> generated image file?




