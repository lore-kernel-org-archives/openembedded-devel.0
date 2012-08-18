Received: from the.earth.li ([46.43.34.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin@the.earth.li>) id 1T2q3Z-0005Sk-Kw
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Aug 2012 22:55:41 +0200
Received: from martin by the.earth.li with local (Exim 4.72)
	(envelope-from <martin@the.earth.li>) id 1T2prz-0003Ov-9x
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Aug 2012 21:43:43 +0100
Date: Sat, 18 Aug 2012 21:43:43 +0100
From: Martin Ling <martin-oe@earth.li>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120818204343.GG2254@earth.li>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: BUG: python-core: target configuration includes sysroot from build host
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
X-List-Received-Date: Sat, 18 Aug 2012 20:55:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am running Angstrom v2012.05 on a BeagleBone with python-core version
2.7.2-r3.17.

Python has a Makefile at /usr/lib/python2.7/config/Makefile which
includes the CFLAGS etc that should be used to build extension modules.
These are included automatically when building Python packages that
include extension modules written in C.

However, the installed copy of this Makefile includes the --sysroot
option that was used when cross-compiling Python from the build host
(e.g.
--sysroot=/OE/angstrom-v2012-05/build/tmp-angstrom_v2012_05-eglibc/sysroots/beaglebone
in the current version from the repository).

As a result, any attempt to build Python extension modules on the target
fails at the compilation step, because this --sysroot option is passed
and the compiler looks in that non-existent prefix for all header and
library files.

The --sysroot option needs to be stripped from the Makefile before
inclusion in the package. Making this change by hand allows me to build
extension modules successfully on the target.


Martin


