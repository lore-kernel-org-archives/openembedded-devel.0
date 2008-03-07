Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JXgL9-0002th-CW
	for openembedded-devel@openembedded.org; Fri, 07 Mar 2008 18:26:44 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JXgJb-0006UR-KR
	for openembedded-devel@openembedded.org; Fri, 07 Mar 2008 17:25:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 07 Mar 2008 17:25:03 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 07 Mar 2008 17:25:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 07 Mar 2008 18:21:11 +0100
Message-ID: <fqrti8$nlt$2@ger.gmane.org>
References: <200803071113.40387.geoffrey@pager.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803071113.40387.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 init segfault: Any resolution?
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
X-List-Received-Date: Fri, 07 Mar 2008 17:26:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Geoffrey Wossum schreef:
| Hi all,
|
| With Richard's help on the toolchain and a patch to the
| conf/machine/at32stk1000.conf (submitted via Bugzilla), I can now boot
the
| kernel on my AVR32 based AT32STK1000.
|
| However, init segfaults.  Here's the last boot of the boot activity
before the
| segfault:
|
| Waiting 1sec before mounting root device...
| mmc0: new SD card at address b368
| mmcblk0: mmc0:b368 5     249856KiB
|  mmcblk0: p1
| VFS: Mounted root (ext2 filesystem).
| Freeing init memory: 64K (90000000 - 90010000)
| init[1]: segfault at 00000008 pc 2aaabbe8 sp 7ffd0f20 ecr 24
| init has generated signal 11 but has no handler for it
| Kernel panic - not syncing: Attempted to kill init!
|
|
| Alex reported the same bug about a month ago to this mailing list.  I
haven't
| seen any resolution to it, though.  Is there a resolution to this bug yet?

You should be able to use busybox as init nowadays, or add add uclibc
0.9.29 for avr32 :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH0XmHMkyGM64RGpERAoyPAKC0SkEN9V5EzmhMVt/tPu86JrhRBACfWR30
5V/VdjOq44jCE2osfsGlMvg=
=S29Z
-----END PGP SIGNATURE-----



