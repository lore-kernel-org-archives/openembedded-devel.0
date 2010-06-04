Received: from relay58.tele2.vuurwerk.nl ([62.250.3.58]
	helo=relay.versatel.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1OKVFd-0006Bf-58
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 13:39:53 +0200
Received: from [87.213.192.94] (helo=hf-electronics.com)
	by relay.versatel.net with smtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1OKUls-00022u-PA
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 13:09:05 +0200
Received: from <linux@hf-electronics.com> with PostMaster 4.3.2 (MPS);
	Fri, 04 Jun 2010 13:05:42 +200
From: "Henk Geraads" <linux@hf-electronics.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Jun 2010 13:08:45 +0200
Message-ID: <NGBBLNEOGLJIIJKLFLPFAEPMFAAA.linux@hf-electronics.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.6604 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5931
Importance: Normal
X-SA-Exim-Connect-IP: 62.250.3.58
X-SA-Exim-Mail-From: linux@hf-electronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Openembedded error on building xfce-image
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
X-List-Received-Date: Fri, 04 Jun 2010 11:39:53 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

We are trying to build a OpenEmbedded xfce-image for the
compulab CM-T3530 board. Selected distribution is
Angstrom-2008.1.
We got following error message:

Henk $ bitbake xfce-image
NOTE: Handling BitBake files: - (8393/8393) [100 %]
NOTE: Parsing finished. 7595 cached, 468 parsed, 330
skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each
provide xfce4-panel
(/home/armcore/oe/openembedded/recipes/xfce-base/xfce4-panel
_4.6.3.bb
/home/armcore/oe/openembedded/recipes/xfce-base/xfce4-panel_
4.4.2.bb).
 This usually means one provides something the other doesn't
and should.
ERROR: Multiple .bb files are due to be built which each
provide xfdesktop
(/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4
.6.1.bb
/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4.
4.2.bb).
 This usually means one provides something the other doesn't
and should.
ERROR: Multiple .bb files are due to be built which each
provide xfce-utils
(/home/armcore/oe/openembedded/recipes/xfce-base/xfce-utils_
4.6.1.bb
/home/armcore/oe/openembedded/recipes/xfce-base/xfce-utils_4
.4.2.bb).
 This usually means one provides something the other doesn't
and should.
ERROR: Multiple .bb files are due to be built which each
provide xfwm4
(/home/armcore/oe/openembedded/recipes/xfce-base/xfwm4_4.6.1
.bb
/home/armcore/oe/openembedded/recipes/xfce-base/xfwm4_4.4.2.
bb).
 This usually means one provides something the other doesn't
and should.
NOTE: Executing runqueue
NOTE: Running task 2975 of 4330 (ID: 339,
/home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
ion.bb, do_qa_configure)
NOTE: Running task 2976 of 4330 (ID: 340,
/home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
ion.bb, do_compile)
NOTE: Running task 2977 of 4330 (ID: 334,
/home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
ion.bb, do_install)
NOTE: Running task 3006 of 4330 (ID: 342,
/home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
ion.bb, do_package)
NOTE: Running task 3077 of 4330 (ID: 923,
/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4.
4.2.bb, do_install)
ERROR: function do_install failed
ERROR: log data follows
(/home/armcore/oe/build/distrobuild/angstrom/work/armv7a-ang
strom-linux-gnueabi/xfdesktop-4.4.2-r2/temp/log.do_install.1
609)
| NOTE: make
DESTDIR=/home/armcore/oe/build/distrobuild/angstrom/work/arm
v7a-angstrom-linux-gnueabi/xfdesktop-4.4.2-r2/image install
| make: *** No rule to make target `install'.  Stop.
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/armcore/oe/build/distrobuild/angstrom/work/armv7a-angs
trom-linux-gnueabi/xfdesktop-4.4.2-r2/temp/log.do_install.16
09
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4.
4.2.bb do_install failed
ERROR: Task 923
(/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4
.4.2.bb, do_install) failed
NOTE: Tasks Summary: Attempted 3076 tasks of which 3072
didn't need to be rerun and 1 failed.
ERROR:
'/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4
.4.2.bb' failed

Where should we, look to fix this?


Thanks in advance,


Henk




