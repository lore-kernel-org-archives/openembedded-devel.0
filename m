Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GGmg2-0002tq-0K
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 03:09:34 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp4-g19.free.fr (Postfix) with ESMTP id D95E84AA99
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 03:07:50 +0200 (CEST)
Message-ID: <44EFAE66.2040102@free.fr>
Date: Sat, 26 Aug 2006 04:13:58 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: busybox-1.2.1 fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Aug 2006 01:09:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I am trying to build an opie image but busybox fails.
I got this :

| 
/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/usr/sbin: 

| chroot
| fbset
| rdate
| udhcpd
|
| 
/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/usr/share: 

| udhcpc
|
| 
/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/usr/share/udhcpc: 

| default.script
| mv: cannot overwrite directory 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/bin' 


| mv: cannot overwrite directory 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/sbin' 


| mv: cannot overwrite directory 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/usr' 


NOTE: Task failed: 
/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/temp/log.do_install.19657 

NOTE: package busybox-1.2.1-r1: task do_package: failed
ERROR: TaskFailed event exception, aborting
NOTE: package busybox-1.2.1: failed
ERROR: Build of opie-image failed


Any hint please ?


Amine.


