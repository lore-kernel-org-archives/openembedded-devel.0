Received: from [212.124.40.25] (helo=mail.huber-online.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jm@huber-online.com>) id 1N7tJQ-0008Pd-0t
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 17:11:23 +0100
Received: from 192.168.11.6 ([213.23.61.90]:2165)
	by mail.wiessoft.de ([192.168.62.2]:25) with [XMail 1.25 ESMTP Server]
	id <SC13C61> for <openembedded-devel@lists.openembedded.org> from
	<jm@huber-online.com>; Tue, 10 Nov 2009 16:57:00 +0100
From: "Johannes Maier" <jm@huber-online.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 16:03:06 +0000
Priority: normal
X-Priority: 3 (Normal)
Importance: normal
X-Mailer: DvISE by Tobit Software, Germany (0250.444B484C494747504A4B),
	Mime Converter 101.20
X-David-Sym: 0
X-David-Flags: 33554432
Message-ID: <DIIE.000005E3001861E8@192.168.11.6>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.124.40.25
X-SA-Exim-Mail-From: jm@huber-online.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: question meta-toolchain on x86_64 for armv5te
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
X-List-Received-Date: Tue, 10 Nov 2009 16:11:23 -0000
Content-Type: text/plain;
 charset="iso-8859-1"
Content-Transfer-Encoding: 7Bit

Hi@all,

I'm new to openembedded and I didn't find any answers to my questions so I hope to find here some help.

I get an error while building the meta-toolchain on x86_64 for armv5te.

So I wanted to ask if it is in general better to use a 32bit system for such tasks since I don't get any error there?

The error is as follows:

angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/config -DLOCALEDIR="\"/usr/local/angstrom/arm/share/locale\"" -DHAVE_CONFIG_H -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include/opcode -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../readline/.. -I../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include -I../libdecnumber -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../libdecnumber   -DMI_OUT=1 -DTUI=1 
-isystem/home/test/oe/stuff/opene
mbedded/tmp/staging/x86_64-linux/usr/include -Wall -Wdeclaration-after-statement -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wno-switch -Wno-char-subscripts -Werror /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/value.c
| ccache gcc -c -isystem/home/test/oe/stuff/openembedded/tmp/staging/x86_64-linux/usr/include -O2   -I. -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/config -DLOCALEDIR="\"/usr/local/angstrom/arm/share/locale\"" -DHAVE_CONFIG_H -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include/opcode -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../readline/.. -I../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include -I../libdecnumber 
-I/home/test/oe/stuff/
openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../libdecnumber   -DMI_OUT=1 -DTUI=1 -isystem/home/test/oe/stuff/openembedded/tmp/staging/x86_64-linux/usr/include -Wall -Wdeclaration-after-statement -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wno-switch -Wno-char-subscripts -Werror /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c
| cc1: warnings being treated as errors
| /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c: In function 'evaluate_subexp_standard':
| /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c:1705: error: 'subscript_array' may be used uninitialized in this function
| /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c:1644: note: 'subscript_array' was declared here
| make[2]: *** [eval.o] Error 1
| make[2]: Leaving directory `/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/build-arm-angstrom-linux-gnueabi/gdb'
| make[1]: *** [all-gdb] Error 2
| make[1]: Leaving directory `/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/build-arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/temp/log.do_compile.19984
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/test/oe/stuff/openembedded/recipes/gdb/gdb-cross-sdk_6.8.bb do_compile failed
ERROR: Task 434 (/home/test/oe/stuff/openembedded/recipes/gdb/gdb-cross-sdk_6.8.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 610 tasks of which 0 didn't need to be rerun and 1 failed.
ERROR: '/home/test/oe/stuff/openembedded/recipes/gdb/gdb-cross-sdk_6.8.bb' failed
test@test-desktop:~/oe/stuff/openembedded$

Thanks in advance,
majo
 




