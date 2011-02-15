Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PpFiY-00073i-9m
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 08:53:02 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A2239F.dip0.t-ipconnect.de [87.162.35.159])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1F7psTu013826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 08:51:54 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 3BFA637B31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 08:51:53 +0100 (CET)
Message-ID: <4D5A3098.8060102@dresearch.de>
Date: Tue, 15 Feb 2011 08:51:52 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: do_rootfs failure (angstrom-x-image testing-release-2011.03)
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
X-List-Received-Date: Tue, 15 Feb 2011 07:53:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

| Collected errors:
|  * check_data_file_clashes: Package xfce4-notifyd wants to install file /var/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image/usr/share/dbus-1/services/org.freedesktop.Notifications.service
| 	But that file is already provided by package  * notification-daemon
|  * opkg_install_cmd: Cannot install package task-xfce46-extras.
|  * resolve_conffiles: Existing conffile /var/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image/etc/device_table is different from the conffile in the new package. The new conffile will be placed at /var/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image/etc/device_table-opkg.
NOTE: package angstrom-x-image-1.0-r0: task do_rootfs: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /var/lib/jenkins/jobs/OE-testing/workspace/openembedded/recipes/images/angstrom-x-image.bb do_rootfs failed

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "testing-release-2011.03"
METADATA_REVISION = "af8541c"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "hipox"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110214"
TARGET_FPU        = "soft"


