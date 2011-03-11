Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PxqmP-0005Ko-NX
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 02:04:34 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1]
	helo=[10.225.79.228])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PxqhS-0004l1-As
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 00:59:26 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 01:59:23 +0100
Message-ID: <1299805163.5437.29.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: transmission: do_configure fails
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
X-List-Received-Date: Fri, 11 Mar 2011 01:04:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "8563490"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "htcleo"
DISTRO            = "shr"
DISTRO_VERSION    = "-20110311"
TARGET_FPU        = "hard"

do_configure log data :
| checking for GIO... yes
| checking for LIBNOTIFY... yes
| checking for LIBAPPINDICATOR... no
| checking for LIBCANBERRA... yes
| checking for GCONF2... yes
| checking for DBUS_GLIB... yes
| checking for
dbus-binding-tool... /home/luke/linux/openembedded/tmp/sysroots/i686-linux/usr/bin/dbus-binding-tool
| configure: error: "The gtk client cannot be built without nls support.
Try adding either --enable-nls or --disable-gtk"

Is this possibly some distro related problem ?



