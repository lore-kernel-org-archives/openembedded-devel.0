Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NAhlx-0003m9-3O
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:28:28 +0100
Received: from homiemail-a21.g.dreamhost.com (caiajhbdcahe.dreamhost.com
	[208.97.132.74])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 5AA8A178F92
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 02:27:01 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id 91CDE300061
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 02:26:58 -0800 (PST)
Message-ID: <4B03CBF0.5010000@SSpaeth.de>
Date: Wed, 18 Nov 2009 11:26:56 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: BAD_RECOMMENDATIONS is broken
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
X-List-Received-Date: Wed, 18 Nov 2009 10:28:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

minimal.conf has
DISTRO_EXTRA_RRECOMMENDS += "[...] avahi-daemon avahi-autoipd [...]"
which leads to task-distro-base recommending those packages.

Trying to override this with
BAD_RECOMMENDATIONS="avahi-daemon avahi-autoipd"
does not wotk though, it's still pulled in.

This is what rootfs_ipk.bbclass does:

        STATUS=${IMAGE_ROOTFS}${libdir}/opkg/status
        # prime the status file with bits that we don't want
        for i in ${BAD_RECOMMENDATIONS}; do
                echo "Package: $i" >> $STATUS
                echo "Architecture: ${TARGET_ARCH}" >> $STATUS
                echo "Status: deinstall ok not-installed" >> $STATUS
                echo >> $STATUS
        done

which actually writes out the correct stuff

+STATUS=/home/[...]/tmp/rootfs/shr-image/usr/lib/opkg/status
+for i in avahi-daemon avahi-autoipd
+echo 'Package: avahi-daemon'
+echo 'Architecture: arm'
+echo 'Status: deinstall ok not-installed'
+echo
+for i in avahi-daemon avahi-autoipd
+echo 'Package: avahi-autoipd'
+echo 'Architecture: arm'
+echo 'Status: deinstall ok not-installed'
+echo

However, when task-distro-base is installed it still pulls in
avahi-daemon, so I think this way of handling BAD_RECOMMENDATIONS is
broken by different opkg behavior.

Any solution (besides removing avahi from minimal.conf where I don't
think it should be in the first place)?

spaetz


