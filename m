Received: from ppsw-51.csi.cam.ac.uk ([131.111.8.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>)
	id 1P0xyR-0005nh-Ck; Wed, 29 Sep 2010 16:49:57 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:56656)
	by ppsw-51.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1P0xhu-0005bx-XQ (Exim 4.72)
	(return-path <jic23@cam.ac.uk>); Wed, 29 Sep 2010 15:32:30 +0100
Message-ID: <4CA34E00.8080106@cam.ac.uk>
Date: Wed, 29 Sep 2010 15:32:32 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100909 Lightning/1.0b3pre Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 131.111.8.151
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Dmitry <dbaryshkov@gmail.com>, Koen Kooi <koen@openembedded.org>,
	eric@eukrea.com
Subject: missing dependency on expat-native in gdb-cross-sdk-7.1-r7.0
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
X-List-Received-Date: Wed, 29 Sep 2010 14:50:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

Got the following error from log.do_compile when building meta-toolchain with angstrom-2010.x using latest testing-next.

gcc: /mnt/disk2/buildroot/oe/oe-stable/tmp/sysroots/x86_64-linux/usr/lib/libexpat.a: No such file or directory
make[2]: *** [gdb] Error 1
make[2]: Leaving directory `/mnt/disk2/buildroot/oe/oe-stable/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-7.1-r7.0/build-arm-angstrom-linux-gnueabi/gdb'
make[1]: *** [all-gdb] Error 2
make[1]: Leaving directory `/mnt/disk2/buildroot/oe/oe-stable/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-7.1-r7.0/build-arm-angstrom-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed

I'd suggest adding expat-native to gdb-cross-sdk.inc DEPENDS (which seems to fix the problem) No idea if it is needed
for all versions though.

Thanks,

Jonathan


