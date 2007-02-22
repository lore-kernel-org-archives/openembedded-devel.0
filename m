Received: from [206.18.177.52] (helo=alnrmhc12.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HKFAL-0000wx-22
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Feb 2007 15:43:25 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (alnrmhc12) with ESMTP
	id <20070222144324b1200b7p26e>; Thu, 22 Feb 2007 14:43:24 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id E49AA6A50; Thu, 22 Feb 2007 09:49:30 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1172155769.7346@gatekeeper.stellarwerx.com>
Date: Thu, 22 Feb 2007 09:49:29 -0500 (EST)
MIME-Version: 1.0
Subject: QA issue with *.PC file
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
X-List-Received-Date: Thu, 22 Feb 2007 14:43:26 -0000
Content-Type: multipart/mixed; boundary="bound1172155770"

--bound1172155770
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Ok, I know I'm going to get heckled on this one.  However, has the *.pc sanity check been fixed for later versions of udev when building angstrom?

Regards,
-Mark Gollahon

===========================================================

OE Build Configuration:
BB_VERSION     = "1.6.6"
OE_REVISION    = "b3d0613a356ef781ed84bdb1cd373059e4210cdd"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "spitz"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070222"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package udev-092: started
NOTE: package udev-092-r15: task do_qa_staging: started
NOTE: QA checking staging
ERROR: QA issue: libvolume_id.pc failed sanity test (reference to /usr/include or workdir)
ERROR: QA staging was broken by the package built above
ERROR: Error in executing: /var/tmp/OpenEmbedded/org.openembedded.dev/packages/udev/udev_092.bb
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function

--bound1172155770--
