Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MgbSx-0005nr-LZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 11:40:23 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id AE4E616E235
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 11:22:21 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 6D1522A4246
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 11:22:21 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 27 Aug 2009 11:22:18 +0200
Message-ID: <4A965026.3020701@dresearch.de>
Date: Thu, 27 Aug 2009 11:21:42 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 27 Aug 2009 09:22:18.0203 (UTC)
	FILETIME=[DF80FAB0:01CA26F7]
Subject: nfs-utils-1.1.2 problem
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
X-List-Received-Date: Thu, 27 Aug 2009 09:40:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I see a problem with mountd from nfs-utils-1.1.2 (Angstrom, current OE dev branch):

starting mountd: /usr/sbin/mountd: line 148: /usr/bin/sed: not found
/usr/sbin/mountd: line 148: /usr/bin/sed: not found
/usr/sbin/mountd: cd: line 1: can't cd to /home/DRESEARCH/production/METABUILD/20090826190001-hydraip-build-1978/OE/tmp.3/wor
k/armv5te-angstrom-linux-gnueabi/nfs-utils-1.1.2-r4/nfs-utils-1.1.2/utils/mountd
arm-angstrom-linux-gnueabi-gcc: mountd-mountd.o: No such file or directory
arm-angstrom-linux-gnueabi-gcc: mountd-mount_dispatch.o: No such file or directory
arm-angstrom-linux-gnueabi-gcc: mountd-auth.o: No such file or directory
...

The first problem is that /usr/sbin/mountd uses /usr/bin/sed but sed is installed under /bin/sed.

The second one is that /usr/sbin/mountd contains a relink_command which uses pathes from the build host:

relink_command="(cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/nfs-utils-1.1.2-r4/nfs-utils-1.1.2/utils/mountd;  ...

Could someone please have a look at this.

Thx,
Steffen




