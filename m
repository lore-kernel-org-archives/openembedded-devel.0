Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P2eqC-0006TL-LL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 08:48:05 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 4 Oct 2010 08:47:52 +0200
X-TM-IMSS-Message-ID: <05d8d9aa00000d46@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 05d8d9aa00000d46 for
	<jaap.dejong@nedap.com>; Mon, 4 Oct 2010 08:47:48 +0100
Message-ID: <4CA97897.4020001@nedap.com>
Date: Mon, 04 Oct 2010 08:47:51 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 04 Oct 2010 06:47:52.0227 (UTC)
	FILETIME=[11067F30:01CB6390]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: trouble compiling udev
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
X-List-Received-Date: Mon, 04 Oct 2010 06:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,
a fresh rebuild failed in compiling udev.
Any clues?
Thanks!
Jaap


ERROR: function do_compile failed
ERROR: log data follows 
(/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/udev-151-r17/temp/log.do_compile.15484)
| NOTE: make -j 5
| mkdir -p extras/keymap
|   GEN    extras/keymap/keys.txt
|   GEN    extras/keymap/keys-from-name.gperf
|   GEN    extras/keymap/keys-to-name.h
|   GEN    extras/keymap/keys-from-name.h
| make --no-print-directory all-recursive
| Making all in .
|   CC     libudev/libudev-ctrl.lo
|   CC     libudev/libudev-util-private.lo
|   CC     libudev/libudev-device-private.lo
|   CC     libudev/libudev-queue-private.lo
|   CC     libudev/libudev.lo
|   CC     libudev/libudev-list.lo
|   CC     libudev/libudev-util.lo
|   CC     libudev/libudev-device.lo
|   CC     libudev/libudev-enumerate.lo
|   CC     libudev/libudev-monitor.lo
|   CC     libudev/libudev-queue.lo
|   CC     extras/gudev/extras_gudev_libgudev_1_0_la-gudevclient.lo
| libudev/libudev-queue.c: In function 'udev_queue_skip_devpath':
| libudev/libudev-queue.c:185:1: internal compiler error: in 
cond_exec_process_insns, at ifcvt.c:273
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[2]: *** [libudev/libudev-queue.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [all-recursive] Error 1
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: 
/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/udev-151-r17/temp/log.do_compile.15484
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/OpenEmbedded/unstable/org.openembedded.dev/recipes/udev/udev_151.bb 
do_compile failed
ERROR: Task 993 
(/OpenEmbedded/unstable/org.openembedded.dev/recipes/udev/udev_151.bb, 
do_compile) failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: 
/OpenEmbedded/unstable/org.openembedded.dev/recipes/pam/libpam_1.1.1.bb, 
do_configure (8274)
NOTE: 2: 
/OpenEmbedded/unstable/org.openembedded.dev/recipes/gnutls/gnutls_2.10.1.bb, 
do_configure (28171)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: 
/OpenEmbedded/unstable/org.openembedded.dev/recipes/gnutls/gnutls_2.10.1.bb, 
do_configure (28171)
NOTE: Tasks Summary: Attempted 1435 tasks of which 328 didn't need to be 
rerun and 1 failed.
ERROR: 
'/OpenEmbedded/unstable/org.openembedded.dev/recipes/udev/udev_151.bb' 
failed




