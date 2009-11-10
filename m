Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1N7tfs-00017s-AI
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 17:34:35 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-38-4af992437f50
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <DIIE.000005E3001861E8@192.168.11.6>
References: <DIIE.000005E3001861E8@192.168.11.6>
Date: Tue, 10 Nov 2009 11:16:41 -0500
Message-Id: <1257869801.1942.25.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: question meta-toolchain on x86_64 for armv5te
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
X-List-Received-Date: Tue, 10 Nov 2009 16:34:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-10 at 16:03 +0000, Johannes Maier wrote:
> Hi@all,
> 
> I'm new to openembedded and I didn't find any answers to my questions so I hope to find here some help.
> 
> I get an error while building the meta-toolchain on x86_64 for armv5te.
> 
> So I wanted to ask if it is in general better to use a 32bit system for such tasks since I don't get any error there?

For what it's worth, I've got meta-toolchain working on x86_64 here,
though I'm not in sync with trunk and do have some mods pulled from
poky--I don't believe any of those changes were x86_64 host specific.

I would guess that you are leaking your host system headers into your
build and they end up not showing up as errors on a 32 bit host since
that presumably matches your target.

> 
> The error is as follows:
> 
> angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/config -DLOCALEDIR="\"/usr/local/angstrom/arm/share/locale\"" -DHAVE_CONFIG_H -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include/opcode -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../readline/.. -I../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include -I../libdecnumber -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../libdecnumber   -DMI_OUT=1 -DTUI=1 
> -isystem/home/test/oe/stuff/opene
> mbedded/tmp/staging/x86_64-linux/usr/include -Wall -Wdeclaration-after-statement -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wno-switch -Wno-char-subscripts -Werror /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/value.c
> | ccache gcc -c -isystem/home/test/oe/stuff/openembedded/tmp/staging/x86_64-linux/usr/include -O2   -I. -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/config -DLOCALEDIR="\"/usr/local/angstrom/arm/share/locale\"" -DHAVE_CONFIG_H -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include/opcode -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../readline/.. -I../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include -I../libdecnumber 
> -I/home/test/oe/stuff/
> openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../libdecnumber   -DMI_OUT=1 -DTUI=1 -isystem/home/test/oe/stuff/openembedded/tmp/staging/x86_64-linux/usr/include -Wall -Wdeclaration-after-statement -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wno-switch -Wno-char-subscripts -Werror /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c
> | cc1: warnings being treated as errors
> | /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c: In function 'evaluate_subexp_standard':
> | /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c:1705: error: 'subscript_array' may be used uninitialized in this function
> | /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c:1644: note: 'subscript_array' was declared here
> | make[2]: *** [eval.o] Error 1
> | make[2]: Leaving directory `/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/build-arm-angstrom-linux-gnueabi/gdb'
> | make[1]: *** [all-gdb] Error 2
> | make[1]: Leaving directory `/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/build-arm-angstrom-linux-gnueabi'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed: /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/temp/log.do_compile.19984
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/test/oe/stuff/openembedded/recipes/gdb/gdb-cross-sdk_6.8.bb do_compile failed
> ERROR: Task 434 (/home/test/oe/stuff/openembedded/recipes/gdb/gdb-cross-sdk_6.8.bb, do_compile) failed
> NOTE: Tasks Summary: Attempted 610 tasks of which 0 didn't need to be rerun and 1 failed.
> ERROR: '/home/test/oe/stuff/openembedded/recipes/gdb/gdb-cross-sdk_6.8.bb' failed
> test@test-desktop:~/oe/stuff/openembedded$
> 
> Thanks in advance,
> majo
>  
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


