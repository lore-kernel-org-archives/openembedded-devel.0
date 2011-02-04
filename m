Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PlFw7-0003LF-Gp
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 08:18:31 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id CB08A491278;
	Fri,  4 Feb 2011 08:17:35 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 4 Feb 2011 08:17:35 +0100
Message-ID: <4D4BA80B.2090601@dresearch.de>
Date: Fri, 04 Feb 2011 08:17:31 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinTV+FMDzCSQKGjB81LGgp4L8eyceusVNs4CWCL@mail.gmail.com>
In-Reply-To: <AANLkTinTV+FMDzCSQKGjB81LGgp4L8eyceusVNs4CWCL@mail.gmail.com>
X-OriginalArrivalTime: 04 Feb 2011 07:17:35.0790 (UTC)
	FILETIME=[98EBDCE0:01CBC43B]
Subject: Re: testing branch 2011-01-28
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
X-List-Received-Date: Fri, 04 Feb 2011 07:18:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Here's another issue in do_rootfs for angstrom-x-image:

Collected errors:
 * check_data_file_clashes: Package xfce4-notifyd wants to install file /home/sledz/work/OE-testing/tmp.6/rootfs/angstrom-x-image/usr/share/dbus-1/services/org.freedesktop.Notifications.service
	But that file is already provided by package  * notification-daemon
 * opkg_install_cmd: Cannot install package task-xfce46-extras.
 * resolve_conffiles: Existing conffile /home/sledz/work/OE-testing/tmp.6/rootfs/angstrom-x-image/etc/device_table is different from the conffile in the new package. The new conffile will be placed at /home/sledz/work/OE-testing/tmp.6/rootfs/angstrom-x-image/etc/device_table-opkg.
ERROR: Function do_rootfs failed

see <http://tinderbox.openembedded.net/packages/1903422/>



