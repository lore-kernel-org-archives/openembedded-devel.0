Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LurAa-0002kE-Sr
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 18:45:04 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lur6g-0006Xp-HU
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 16:40:02 +0000
Received: from cuo02-acns-ce1.cisco.com ([64.101.22.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 16:40:02 +0000
Received: from msundius by cuo02-acns-ce1.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 16:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Fri, 17 Apr 2009 16:34:58 +0000 (UTC)
Message-ID: <loom.20090417T162838-591@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.22.72 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: recipe "not available"
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
X-List-Received-Date: Fri, 17 Apr 2009 16:45:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I've added a recipe for glibc to build the tools used by my company
for our set top box. It seems to be parsed by bitbake (since if I
intentionally add an erroneous line, bitbake will complain) however
when it gets time to run the tasks spelled out in the recipe, I get
the following errors, and a different version is used. 

 OE Build Configuration:
BB_VERSION        = "1.8.12"
METADATA_BRANCH   = "<unknown>"
METADATA_REVISION = "<unknown>"
TARGET_ARCH       = "mips"
TARGET_OS         = "linux"
MACHINE           = "8kg6-ngp"
DISTRO            = "sciatl"
DISTRO_VERSION    = "1"
TARGET_FPU        = ""

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 2.4 of glibc not available (for item virtual/libc)
NOTE: preferred version 2.4 of glibc not available (for item libsegfault)
NOTE: preferred version 2.4 of glibc not available (for item glibc)
NOTE: preferred version 2.4 of glibc not available (for item
virtual/mips-linux-libc-for-gcc)
NOTE: preferred version 2.4 of glibc-initial not available (for item
virtual/mips-linux-libc-initial)
NOTE: preferred version 2.4 of glibc not available (for item virtual/libiconv)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 74 of 535 (ID: 406,
/home/sundism/oe/openembedded/packages/glibc/glibc-initial_2.7.bb, do_unpack)


I saw some references in the archives to a broken bitbake program, though my 
version does not match the one indicated. Further simply running bitbake -c
rebuild <package> does not resolve the problem

Is there anyone out there who might be able to help?

Thanks 
Michael Sundius




