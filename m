Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LPhHc-0007cY-2l
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 18:54:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LPhAc-0006ql-VU
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 17:47:19 +0000
Received: from host113-252-dynamic.4-87-r.retail.telecomitalia.it
	([87.4.252.113]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 17:47:18 +0000
Received: from claudiu_fw85 by
	host113-252-dynamic.4-87-r.retail.telecomitalia.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 17:47:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Claudiu Mdc <claudiu_fw85@yahoo.it>
Date: Wed, 21 Jan 2009 17:47:10 +0000 (UTC)
Message-ID: <loom.20090121T171822-463@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 87.4.252.113 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9) Gecko/2008061015 Firefox/3.0)
Sender: news <news@ger.gmane.org>
Subject: cannot compute suffix of object files
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
X-List-Received-Date: Wed, 21 Jan 2009 17:54:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I am building bootstrap-image with OpenEmbedded, but it fails on
glibc-2.5 configure task with this error:

| checking whether ln -s works... yes
| checking for i686-angstrom-linux-gcc...
i686-angstrom-linux-gcc-4.3.1 -mcpu=pentiumpro
| checking for suffix of object files... configure: error:
 cannot compute suffix of object files: cannot compile
| See `config.log' for more details.


config.log:

configure:2776: checking for suffix of object files
configure:2797: i686-angstrom-linux-gcc-4.3.1 -mcpu=pentiumpro -c
-I/home/claudiu/oe/oetmp/staging/i686-angstrom-linux/include,
-I/home/claudiu/oe/myToolchain/cross/include  -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -Os  conftest.c >&5
/home/claudiu/oe/oetmp/work/i686-angstrom-linux/glibc-2.5-r10/
glibc-2.5/configure:
line 2798: i686-angstrom-linux-gcc-4.3.1: command not found
configure:2800: $? = 127
configure: failed program was:
| /* confdefs.h.  */
| 
| #define PACKAGE_NAME "GNU C Library"
| #define PACKAGE_TARNAME "c-library"
| #define PACKAGE_VERSION "(see version.h)"
| #define PACKAGE_STRING "GNU C Library (see version.h)"
| #define PACKAGE_BUGREPORT "glibc"
| #define USE_REGPARMS 1
| /* end confdefs.h.  */
| 
| int
| main ()
| {
| 
|   ;
|   return 0;
| }
configure:2814: error: 
cannot compute suffix of object files: cannot compile



I don't understand why in config.log it says:
i686-angstrom-linux-gcc-4.3.1: command not found


I've built a custom toolchain and it is in PATH:
~/oe$ i686-angstrom-linux<TAB><TAB> gives this output:

i686-angstrom-linux-addr2line
i686-angstrom-linux-gcc
i686-angstrom-linux-objdump
i686-angstrom-linux-ar
i686-angstrom-linux-gcc-4.3.1
i686-angstrom-linux-ranlib
i686-angstrom-linux-as
i686-angstrom-linux-gccbug
i686-angstrom-linux-readelf
i686-angstrom-linux-c++
i686-angstrom-linux-gcov
i686-angstrom-linux-size
i686-angstrom-linux-c++filt
i686-angstrom-linux-ld
i686-angstrom-linux-strings
i686-angstrom-linux-cpp
i686-angstrom-linux-nm
i686-angstrom-linux-strip
i686-angstrom-linux-g++
i686-angstrom-linux-objcopy




