Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OHb6Q-0000nW-P6
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 13:18:39 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 99FB516606C6; Thu, 27 May 2010 05:14:10 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 299461660593;
	Thu, 27 May 2010 05:14:10 -0600 (MDT)
Message-ID: <4BFE5402.8030607@mlbassoc.com>
Date: Thu, 27 May 2010 05:14:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problems building Angstrom images
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
X-List-Received-Date: Thu, 27 May 2010 11:18:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

A number of images in the current tree (8bb53d3f261c59353652f0328bfd887d6aa1c112)
won't build, yielding errors like these:

| log_check: Matched keyword: [Cannot satisfy the following dependencies]
| Collected errors:
|  * resolve_conffiles: Existing conffile /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table is different from the conffile in the new 
package. The new conffile will be placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b * satisfy_dependencies_for: Cannot satisfy the following dependencies for angstrom-task-gnome:
|  *    encodings *     encodings *     encodings *
|
NOTE: package beagleboard-linuxtag2010-demo-image-1.0-r0: task do_rootfs: Failed

To be clear, I'm building
   MACHINE="beagleboard"
   DISTRO="angstrom-2008.1"

I got these errors when I tried to build:
   beagleboard-linuxtag2010-demo-image
   angstrom-gnome-image

I have success with
   beagleboard-demo-image

Any ideas how to fix this?

Thanks

n.b. yes, this is a cross post from the Angstrom list, but my
query sat there for a day with no reply and I'm hoping for some
help from the larger OE crew

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


