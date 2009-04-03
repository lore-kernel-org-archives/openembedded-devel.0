Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LprNj-0005GN-Hl
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 23:57:06 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n33KsvQq014293 for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Apr 2009 16:54:57 -0400 (EDT)
Message-ID: <49D677A3.2070702@cs.cmu.edu>
Date: Fri, 03 Apr 2009 16:54:59 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uclibc build failure on armv4t with -mthumb (internal compiler error)
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
X-List-Received-Date: Fri, 03 Apr 2009 21:57:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm having trouble building uclibc in thumb mode for armv4t.  It is 
getting an internal compiler error when compiling ldso.  The error 
message is:

NOTE: make STRIPTOOL=true LD=arm-angstrom-linux-uclibcgnueabi-ld 
LOCALE_DATA_FILENAME=uClibc-locale-030818.arm.tgz CC=ccache 
arm-angstrom-linux-uclibcgnueabi-gcc -march=armv4t -mtune=arm920t 
-mthumb-interwork -mthumb 
HOSTCFLAGS=-I/home/dhuggins/Projects/TeRK/oe/tmp/staging/x86_64-linux/usr/include
  CC ldso/ldso/ldso.oS
ldso/ldso/dl-elf.c: In function '_dl_dprintf':
ldso/ldso/dl-elf.c:913: error: unable to find a register to spill in 
class 'LO_REGS'
ldso/ldso/dl-elf.c:913: error: this is the insn:
(insn 121 120 122 6 (set (reg/f:SI 406)
        (plus:SI (reg/f:SI 25 sfp)
            (reg:SI 405))) 5 {*thumb_addsi3} (nil)
    (expr_list:REG_DEAD (reg:SI 405)
        (nil)))
ldso/ldso/dl-elf.c:913: confused by earlier errors, bailing out
make: *** [ldso/ldso/ldso.oS] Error 1
FATAL: oe_runmake failed

I'm using the stable/2009 branch and this is GCC 4.2.4-r5

I believe there were some patches for this recently (in particular, 
building ldso with -O0) but I'm still getting the error - note that it 
is in a different function than the one seen earlier.

I worked around this by forcing ldso to compile with the ARM instruction 
set, but I'm not sure if this is the right approach or not.


