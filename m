Received: from [203.96.159.182] (helo=hayes.bluewaternz.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andre@bluewatersys.com>) id 1HYVbB-0002kv-9a
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 01:06:06 +0200
Received: (qmail 10538 invoked by uid 89); 2 Apr 2007 23:05:39 -0000
Received: from unknown (HELO ?192.168.2.19?) (andre@192.168.2.19)
	by 0 with ESMTPA; 2 Apr 2007 23:05:39 -0000
Message-ID: <46118C5C.2040408@bluewatersys.com>
Date: Tue, 03 Apr 2007 11:06:04 +1200
From: Andre Renaud <andre@bluewatersys.com>
User-Agent: Thunderbird 1.5.0.7 (X11/20060918)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Subject: DosFStools mirror missing
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
X-List-Received-Date: Mon, 02 Apr 2007 23:06:06 -0000
Content-Type: multipart/mixed; boundary="------------000804070706080000050705"

--------------000804070706080000050705
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The mirror for DosFSTools,
ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz

appears to be down at the moment. Using the Debian mirror however works
fine. Attached is an alternative bitbake package which uses the debian
mirror system to do the download, which should be much more robust.

Andre

-- 
Bluewater Systems Ltd - ARM Technology Solutions Centre

       Andre Renaud                             Bluewater Systems Ltd
Phone: +64 3 3779127 (Aus 1 800 148 751)        Level 17, 119 Armagh St
Fax:   +64 3 3779135                            PO Box 13889
Email: arenaud@bluewatersys.com                 Christchurch
Web:   http://www.bluewatersys.com              New Zealand
# dosfstools OE build file
# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
# Released under the MIT license (see packages/COPYING)

DESCRIPTION = "DOS FAT Filesystem Utilities"

SECTION = "base"
PRIORITY = "optional"
LICENSE = "GPL"

PR = "r0"

SRC_URI = "${DEBIAN_MIRROR}/main/d/dosfstools/dosfstools_${PV}.orig.tar.gz \
	   file://alignment_hack.patch;patch=1 \
           file://msdos_fat12_undefined.patch;patch=1 \
	   file://include-linux-types.patch;patch=1"

do_install () {
	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
		   "MANDIR=${D}${mandir}/man8" install
}

--------------000804070706080000050705--
