Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1OrCFa-0001eU-0N
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 18:03:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 4BDD72C839
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 15:56:21 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ezjkKu-FAtP
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 15:56:17 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 9C71D2C824
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 15:56:16 +0000 (UTC)
Message-ID: <4C7FCA85.8050807@gmail.com>
Date: Thu, 02 Sep 2010 18:02:13 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: minimal-image doesn't boot
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
X-List-Received-Date: Thu, 02 Sep 2010 16:03:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
I have been trying to run a minimal-image on an ARM system, because I
plan to use it on a 16MB NOR Flash.

I started wirh a PXA270 based board but I faced to puzzling jffs2
errors, then I tried on a more reliable machine (for me) Ronetix-pm9263
with same results.

Does anybody tested minimal-image recently?
Did it work?
With which machine?

Any hint will be greatly appreciated.


IP-Config: Complete:
     device=eth0, addr=192.168.3.222, mask=255.255.255.0, gw=192.168.3.1,
     host=PM9263, domain=, nis-domain=(none),
     bootserver=192.168.3.1, rootserver=192.168.3.1, rootpath=
uncorrectable error : <3>uncorrectable error : <3>uncorrectable error :
<3>uncorrectable error : <3>uncorrectable errorr
jffs2_scan_eraseblock(): Node at 0x000006a4 {0x1985, 0xe001, 0x00000020)
has invalid CRC 0x78262e60 (calculated 0xaa27e)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006a8:
0x0020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006ac:
0x2e60 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006b4:
0x000f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006b8:
0x0011 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006c4:
0x181c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006c8:
0x3443 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006cc:
0x6461 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006d0:
0x0900 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000006d4:
0x0004 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x0000a480
You cannot use older JFFS2 filesystems with newer kernels
Old JFFS2 bitmask found at 0x00018d94
You cannot use older JFFS2 filesystems with newer kernels
Old JFFS2 bitmask found at 0x0001b0f8
You cannot use older JFFS2 filesystems with newer kernels
uncorrectable error : <3>uncorrectable error : <3>uncorrectable error :
<3>uncorrectable error : <4>mtd->read(0x400 bytr
jffs2_scan_eraseblock(): Node at 0x00020000 {0x1985, 0xe002, 0x00000a1c)
has invalid CRC 0x3a21180e (calculated 0x9bd95)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004:
0x0a1c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008:
0x180e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002000c:
0x0014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020010:
0x0029 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020014:
0x89ed instead


/marco


