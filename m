Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1P5cPa-0001Yt-3X
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 12:49:05 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:33396)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1P5c3h-0005G9-DJ (Exim 4.72) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Tue, 12 Oct 2010 11:26:13 +0100
Message-ID: <4CB4391E.6030909@cam.ac.uk>
Date: Tue, 12 Oct 2010 11:31:58 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100928 Lightning/1.0b3pre Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 131.111.8.152
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-10-08: Udev 151 issues.
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
X-List-Received-Date: Tue, 12 Oct 2010 10:49:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi All,

I'm getting, 

NOTE: make
mkdir -p extras/keymap
  GEN    extras/keymap/keys.txt
  GEN    extras/keymap/keys-from-name.gperf
  GEN    extras/keymap/keys-from-name.h
  GEN    extras/keymap/keys-to-name.h
make --no-print-directory all-recursive
Making all in .
  CC     libudev/libudev.lo
  CC     libudev/libudev-list.lo
  CC     libudev/libudev-util.lo
  CC     libudev/libudev-device.lo
  CC     libudev/libudev-enumerate.lo
  CC     libudev/libudev-monitor.lo
  CC     libudev/libudev-queue.lo
libudev/libudev-queue.c: In function 'udev_queue_skip_devpath':
libudev/libudev-queue.c:185:1: internal compiler error: in cond_exec_process_insns, at ifcvt.c:273
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[2]: *** [libudev/libudev-queue.lo] Error 1
make[1]: *** [all-recursive] Error 1
make: *** [all] Error 2
FATAL: oe_runmake failed


in udev 151 and have been since 2010-10-04 (worked previously though I guess udev may
have changed).

Building imote2-image
 
MACHINE = "imote2"
DISTRO = "angstrom-2010.x"

Anyone seeing anything similar?

Jonathan


