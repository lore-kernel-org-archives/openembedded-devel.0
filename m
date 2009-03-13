Received: from [64.135.192.34] (helo=mail.FoxValley.net ident=qmailr)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <justin.love@cesgames.com>) id 1LiCHA-0002Ja-FL
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 19:38:33 +0100
Received: (qmail 16721 invoked from network)
	for openembedded-devel@lists.openembedded.org;
	13 Mar 2009 13:38:10 -0500
Received: from 64-135-210-33.foxvalley.net (HELO ?127.0.0.1?) (64.135.210.33)
	by mail.foxvalley.net with SMTP; 13 Mar 2009 13:38:10 -0500
Message-ID: <49BAA810.4070906@cesgames.com>
Date: Fri, 13 Mar 2009 13:38:08 -0500
From: JustinLove <justin.love@cesgames.com>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: automatic fsck?
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
X-List-Received-Date: Fri, 13 Mar 2009 18:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I routinely had problems with ext2 that were fixed by fsck.  I switched to 
ext3, but there are still occasions where the filesystem gets wedged, but a 
simple fsck restores it.  Is it possible to run fsck automatically on startup, 
as many desktop systems do?  The kernel startup messages are telling me

EXT3-fs warning: maximal mount count reached, running e2fsck is recommended

I realize that most of the mechanics involve files on root, which won't do much 
good if the filesystem is corrupted.  Long term plan is to repartition and make 
root readonly, but I'd still like fsck for the other partitions.

Environment:

Linux beagleboard 2.6.27-omap1 #1 Wed Jan 14 07:47:57 CST 2009 armv7l unknown

Angstorm on beagleboard, running from SD card with 2 partitions, FAT/ext3


So far I've figured out:

- fstab has '1' in last column for rootfs
- Install e2fsprogs-fsck and/or e2fsprogs-e2fsck
- change ENABLE_ROOTFS_FSCK=yes in /etc/default/rcS
- Specify "ro" on kernel command line
- "shutdown -F -r now", but this has no effect, I still get the warning message

What am I missing?

-- 
Justin Love

Creative Electronics & Software
650 Sundown Road
South Elgin, IL 60177

Phone 847-695-0023 x233
FAX   847-695-0483



