Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LyRd2-0005By-G3
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:16:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LyRY9-0002pn-7z
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 14:11:13 +0000
Received: from iap-pxy-mow1.siemens.ru ([212.248.25.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 14:11:13 +0000
Received: from dbaryshkov by iap-pxy-mow1.siemens.ru with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 14:11:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 27 Apr 2009 14:10:59 +0000 (UTC)
Message-ID: <gt4edj$k8f$1@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF77C@hiob.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: iap-pxy-mow1.siemens.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Mon, 27 Apr 2009 14:16:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sledz, Steffen wrote:

> gcc_4.2.4.bb reports these errors for a few days. Can someone please
> have a look at it.
> 
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc/usr/bin/arm-angstrom-linux-gnueabi-gcc'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.2.4/collect2'
> ERROR: QA Issue: non -dev package contains symlink .so: gcc path
> '/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.2.4/libgcc_s.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/g++/usr/bin/arm-angstrom-linux-gnueabi-g++'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/g++/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.2.4/cc1plus'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/cpp/usr/bin/arm-angstrom-linux-gnueabi-cpp'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/cpp/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.2.4/cc1'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gfortran/usr/bin/arm-angstrom-linux-gnueabi-gfortran'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gfortran/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.2.4/f951'
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcov/usr/bin/arm-angstrom-linux-gnueabi-gcov'
> ERROR: QA run found fatal errors. Please consider fixing them. ERROR:
> Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb ERROR:
> Exception:<type 'exceptions.SystemExit'> Message:1 ERROR: Printing the
> environment of the function ERROR: Error in executing:
> /opt/openembedded/recipes/gcc/gcc_4.2.4.bb ERROR: Exception:<type
> 'exceptions.SystemExit'> Message:1 ERROR: Printing the environment of
> the function ERROR: Error in executing:
> /opt/openembedded/recipes/gcc/gcc_4.2.4.bb ERROR: Exception:<type
> 'exceptions.SystemExit'> Message:1 ERROR: Printing the environment of
> the function ERROR: Error in executing:
> /opt/openembedded/recipes/gcc/gcc_4.2.4.bb ERROR: Exception:<type
> 'exceptions.SystemExit'> Message:1 ERROR: Printing the environment of
> the function ERROR: Build of /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
> do_package failed ERROR: Task 1281
> (/opt/openembedded/recipes/gcc/gcc_4.2.4.bb, do_package) failed ERROR:
> '/opt/openembedded/recipes/gcc/gcc_4.2.4.bb' failed
> 

Confirmed here for at91sam9g20-ek and for collie



-- 
With best wishes
Dmitry




