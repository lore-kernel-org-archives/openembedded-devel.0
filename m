Received: from [141.89.48.7] (helo=mail.cs.uni-potsdam.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1MtT1h-0006MM-LE
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 23:17:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id 45B5D112DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 23:17:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Y2X4YCFfMkor
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 23:17:21 +0200 (CEST)
Received: from [141.89.52.43] (orest.ift.cs.uni-potsdam.de [141.89.52.43])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.uni-potsdam.de (Postfix) with ESMTPSA id 3599410EA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 23:17:21 +0200 (CEST)
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90910010936y644282b1xe943f99e49cf5f38@mail.gmail.com>
References: <1254397289.21355.57.camel@orest.ift.cs.uni-potsdam.de>
	<ha2a3n$s6q$1@ger.gmane.org>
	<19c1b8a90910010936y644282b1xe943f99e49cf5f38@mail.gmail.com>
Date: Thu, 01 Oct 2009 23:16:36 +0200
Message-Id: <1254431796.21355.94.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 141.89.48.7
X-SA-Exim-Mail-From: akzare@cs.uni-potsdam.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How to put generated shared lib into the final output image of OE
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
X-List-Received-Date: Thu, 01 Oct 2009 21:17:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi again,

Thanks to Koen and Khem. I have built libraries for openCV and ACE. The
next step would be to add those generated libraries to final image,
therefore later our application programs would use them as shared
libraries. Refer to page#21 of usermanual.pdf, I have inserted this line
to my distro conf file:

ASSUME_SHLIBS += "libACE.so:ace-5.6.8 libcv.so.2:opencv-1.0.0
libcxcore.so.2:opencv-1.0.0 libcvaux.so.2:opencv-1.0.0
libml.so.2:opencv-1.0.0"

But, as I have already checked inside files-in-image.txt, still those
libraries are missing.    

Also, as an alternative approach, I have modified image bb file like
this:

OPENCV_INSTALL ?= "opencv"
ACE_INSTALL ?= "ace"

DEPENDS = "\
	... \
	${OPENCV_INSTALL} \
	${ACE_INSTALL} \
        ... \

RDEPENDS = "\
	${ACE_INSTALL} \
	${ACE_INSTALL}"

but, still it didn't work. In the last chance, again I have changed the
image bb file as follows:

IMAGE_INSTALL = "\
	...
        ${OPENCV_INSTALL} \
        ${ACE_INSTALL} \
	"
This time bitbake complains with such error:

--------------------------------------------------------------------------------------------------------
.
.
.
| + ln -s opkg /opt/local/oe/tmp/rootfs/etc/ipkg
| + ln -s opkg /opt/local/oe/tmp/rootfs/usr/lib/ipkg
| + log_check rootfs
| + set +x
| log_check:
Using /opt/local/oe/tmp/work/xilinx-ml403-angstrom-linux/picsy-image-1.0-r0/temp/log.do_rootfs.1487 as logfile
| log_check: There were error messages in the logfile
| log_check: Matched keyword: [Cannot find package]
| Collected errors:
|  * Cannot find package opencv.
|  * Cannot find package ace.
| + export D=/opt/local/oe/tmp/rootfs
| 
NOTE: Task
failed: /opt/local/oe/tmp/work/xilinx-ml403-angstrom-linux/picsy-image-1.0-r0/temp/log.do_rootfs.1487
ERROR: TaskFailed event exception, aborting
ERROR: Build of /opt/local/oe/openembedded/recipes/images/picsy-image.bb
do_rootfs failed
ERROR: Task 10
(/opt/local/oe/openembedded/recipes/images/picsy-image.bb, do_rootfs)
failed
NOTE: Tasks Summary: Attempted 2282 tasks of which 2282 didn't need to
be rerun and 1 failed.
ERROR: '/opt/local/oe/openembedded/recipes/images/picsy-image.bb' failed

--------------------------------------------------------------------------------------------------------

As far as I could understand from user manual, maybe the solution would
be "8.14. Staging: Making includes and libraries available for
building" or "8.16. Installation scripts: Running scripts during
package install and/or removal", but I am not sure and get confused! 

I don't know how to find a way for this issue. Any help is highly
appreciated.

Cheers
Ali



