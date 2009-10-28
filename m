Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N3785-0005AV-Pb
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 12:55:56 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 8A718491264;
	Wed, 28 Oct 2009 12:54:48 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 28 Oct 2009 12:56:55 +0100
Message-ID: <4AE830DE.5030209@dresearch.de>
Date: Wed, 28 Oct 2009 12:54:06 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 28 Oct 2009 11:56:56.0062 (UTC)
	FILETIME=[BF2669E0:01CA57C5]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: mlauer@vanille-media.de
Subject: busybox-static linking failed
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
X-List-Received-Date: Wed, 28 Oct 2009 11:55:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

After a long time i tried to build an initramfs image containing
busybox-static which fails to link (besides some warnings) with these
errors:

/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:189:
undefined reference to `__cpu_to_be16'
/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:190:
undefined reference to `__cpu_to_be16'
/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:202:
undefined reference to `__cpu_to_be16'
/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:214:
undefined reference to `__cpu_to_be16'
/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:224:
undefined reference to `__cpu_to_be16'
networking/libiproute/lib.a(iptunnel.o):/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:225:
more undefined references to `__cpu_to_be16' follow

This is really obscure for me because i can't identify the code lines
responsible for them. :(

Steffen




