Received: from [38.98.186.166] (helo=smtp.01.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1K6AJZ-0007LQ-N2
	for openembedded-devel@openembedded.org; Tue, 10 Jun 2008 22:19:34 +0200
Received: from asav-2.01.com (localhost.localdomain [127.0.0.1])
	by asav-2.01.com (8.13.1/8.13.1) with SMTP id m5AKDQbG023621
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 15:13:26 -0500
Received: from smtp-2.01.com (smtp-2.01.com [38.98.186.158])
	by asav-2.01.com (asav-2.01.com [10.25.1.12])
	id k59FDQ0360403406kI ret-id none; Tue, 10 Jun 2008 15:13:26 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp-2.01.com (Postfix) with ESMTP id 161531AD3B6
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 15:13:26 -0500 (CDT)
Received: from smtp-2.01.com ([127.0.0.1])
	by localhost (smtp-2.01.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynnGBG+AfvQk for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 15:13:26 -0500 (CDT)
Received: from [192.168.1.119] (unknown [206.127.125.130])
	by smtp-2.01.com (Postfix) with ESMTP id BC0281AD3B7
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jun 2008 15:13:25 -0500 (CDT)
Message-ID: <484EE136.2050901@buglabs.net>
Date: Tue, 10 Jun 2008 16:16:54 -0400
From: Ken Gilmer <ken@buglabs.net>
User-Agent: Thunderbird 2.0.0.14 (X11/20080518)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-FSL-MailScanner-Information: Please contact postmaster@01.com for more
	information
X-FSL-MailScanner: Found to be clean
X-FSL-MailScanner-SpamCheck: 
X-FSL-MailScanner-From: ken@buglabs.net
Subject: Error building classpath-initial
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 10 Jun 2008 20:19:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Hello,

  I'm trying to build classpath-initial and am getting the following
error.  My local.conf file is pretty stock, and I'm using the example
machine provided.  The distro is angstrom-2008.1.  I'm able to build a
variety of other packages.  I've updated my tree (org.openembedded.dev)
today.  Has anyone run into this error before?  Ideas on how to resolve?

$ bitbake classpath-minimal
NOTE: Handling BitBake files: \ (5485/5485) [100 %]
NOTE: Parsing finished. 5249 cached, 0 parsed, 236 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200806101611: started

OE Build Configuration:
BB_VERSION        = "1.8.11"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "0f761bf9a1994f4bbf445420d19be2f5e8038ee2"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "c7x0"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2008.1-test-20080610"
TARGET_FPU        = "soft"

...

| /bin/sh ../../../i686-linux-libtool --tag=CC   --mode=link ccache gcc
-W -Wall -Wmissing-declarations -Wwrite-strings -Wmissing-prototypes
-Wno-long-long -Wstrict-prototypes -pedantic -Werror
-isystem/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/include
-Os -module -version-info 0:0:0 -no-undefined
-L/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/lib
-Wl,-rpath-link,/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/lib
-Wl,-rpath,/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/lib
-Wl,-O1 -o libjavanet.la -rpath
/home/kgilmer/dev/sandbox/oe-dev/tmp/staging/i686-linux/usr/lib/classpath-initial
javanet.lo java_net_VMInetAddress.lo java_net_VMNetworkInterface.lo
java_net_VMURLConnection.lo gnu_java_net_VMPlainSocketImpl.lo
gnu_java_net_local_LocalSocketImpl.lo
../../../native/jni/classpath/jcl.lo
../../../native/jni/native-lib/libclasspathnative.la -lmagic
| i686-linux-libtool: link: unsupported hardcode properties
| i686-linux-libtool: link: See the libtool documentation for more
information.
| i686-linux-libtool: link: Fatal configuration error.

TIA,
ken



