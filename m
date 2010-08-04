Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan@trolocsis.com>) id 1OggLU-0005CD-Ac
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 17:58:16 +0200
Received: by pxi12 with SMTP id 12so2093886pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 08:57:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.46.14 with SMTP id t14mr10766795wat.67.1280937395731; Wed, 
	04 Aug 2010 08:56:35 -0700 (PDT)
Received: by 10.220.169.4 with HTTP; Wed, 4 Aug 2010 08:56:35 -0700 (PDT)
Date: Wed, 4 Aug 2010 10:56:35 -0500
Message-ID: <AANLkTinhOYuaOPbgK1tk3qtUwRPTKs1EDvU8BtH9yWJF@mail.gmail.com>
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: ryan@trolocsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OpenEmbedded compile error with MIPS and EGLIBC
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
X-List-Received-Date: Wed, 04 Aug 2010 15:58:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi All,

I=92m trying to get openembedded to build me a 32bit MIPS toolchain
using EGLIBC (GLIBC is working ok). GCC seems to compile ok, but when
I get to eglibc 2.10 and 2.11 the compiler spits this error:

| /home/rphillips/sdk/build-dell-tor-angstrom/tmp/work/mips-angstrom-linux/=
eglibc-2.11-r11.6/build-mips-angstrom-linux/libc_pic.os:
In function `_mcount':
| (.debug_macinfo+0x5d7a7a8): relocation truncated to fit: R_MIPS_HI16
against `_gp_disp'
| collect2: ld returned 1 exit status
| make[1]: *** [/home/rphillips/sdk/build-dell-tor-angstrom/tmp/work/mips-a=
ngstrom-linux/eglibc-2.11-r11.6/build-mips-angstrom-linux/libc.so]
Error 1
| make[1]: Leaving directory
`/home/rphillips/sdk/build-dell-tor-angstrom/tmp/work/mips-angstrom-linux/e=
glibc-2.11-r11.6/eglibc-2_11/libc'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/rphillips/sdk/build-dell-tor-angstrom/tmp/work/mips-angstrom-linux/eg=
libc-2.11-r11.6/temp/log.do_compile.10164
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/rphillips/work/mips/sdk/openembedded/recipes/eglibc/eglibc_2.11.bb
do_compile failed
ERROR: Task 9 (/home/rphillips/work/mips/sdk/openembedded/recipes/eglibc/eg=
libc_2.11.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 475 tasks of which 159 didn't need to
be rerun and 1 failed.
ERROR: '/home/rphillips/work/mips/sdk/openembedded/recipes/eglibc/eglibc_2.=
11.bb'
failed

It appears the Debian MIPS stack uses EGLIBC and GCC 4 successfully.
Does anyone know what the problem is, and how I can fix it?

Regards,
Ryan Phillips


