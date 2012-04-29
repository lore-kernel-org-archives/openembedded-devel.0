Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SOcqX-0000Iu-0d
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 00:44:01 +0200
Received: by wera1 with SMTP id a1so1663614wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=D2BcEf6eAAsWuPmAlBGwjZw6qmajjYtH55XCJ6yIt5I=;
	b=H8XN6v0McUshKh+FwdWltv9OEybT1amIaS74BpZYlppfdCGiLRK+Jr29RuYMdlOPFv
	/g9drStzy4N2GHljgHqCQJYytvquZHAdwwjLuV366KjhcgZG09yuGsELwGEwTQo+XEH7
	HTc1sCuEZfoP9PlrVuukqBSlkjwc1abxvWZYtYaHgwyz4+jkgxt0RcYb4wByg6idY0qk
	vopVlSWcjsTwNJmhA6hFVNJ+V5f/SM0TEe1mdlXrX1c8ytxkspn/GdDkOfn061cwd2ff
	E/niTWiyGrVn4M8sz4cFDmox5pW+/GJbAPVPz+VzlH6DbsxIXvflbdzFkrx2EhquIvr5
	SvqA==
Received: by 10.180.100.230 with SMTP id fb6mr14867973wib.3.1335738860049;
	Sun, 29 Apr 2012 15:34:20 -0700 (PDT)
Received: from [192.168.1.33] (29.Red-83-60-182.dynamicIP.rima-tde.net.
	[83.60.182.29])
	by mx.google.com with ESMTPS id 17sm24596461wis.0.2012.04.29.15.34.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 15:34:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
Date: Mon, 30 Apr 2012 00:34:17 +0200
Message-Id: <169F7DFB-B916-4EA8-BC37-C451F76E466A@gmail.com>
References: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
	<CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1257)
Subject: Re: gcc-4.4.1 assembler error: offset out of range
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
X-List-Received-Date: Sun, 29 Apr 2012 22:44:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Apr 29, 2012, at 7:15 PM, Khem Raj wrote:

> Anyhow, when you are changing from 4.3.3 why to 4.4.1 and not 4.5 that
> has been in OE for long and is default compiler for many OE based
> distributions out there


I get more of the assembler errors, when rebuilding the gcc recipe, =
using gcc-4.5. Any clues on how to resolve this?

| arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb =
--sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c =
 -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 =
-ggdb2 -DIN_GCC   -W -Wall -Wwrite-strings -Wcast-qual =
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attribute =
-pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings =
-Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. =
-I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc =
-I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc/. =
-I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc/../include =
-I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc/../libcpp/include =
-I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc/../libdecnumber =
-I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc/../libdecnumber/dpd -I../libdecnumber   =
-I/usr/include/libelf   =
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr17=
0880/gcc-4_5-branch/gcc/calls.c -o calls.o
| /tmp/ccIA0vqC.s: Assembler messages:
| /tmp/ccIA0vqC.s:520: Error: offset out of range
| /tmp/ccIA0vqC.s:522: Error: offset out of range
| /tmp/ccIA0vqC.s:586: Error: offset out of range
| /tmp/ccIA0vqC.s:587: Error: offset out of range
| /tmp/ccIA0vqC.s:683: Error: offset out of range
| /tmp/ccIA0vqC.s:687: Error: offset out of range
| /tmp/ccIA0vqC.s:1075: Error: offset out of range
| /tmp/ccIA0vqC.s:1076: Error: offset out of range
| /tmp/ccIA0vqC.s:1507: Error: offset out of range
| /tmp/ccIA0vqC.s:1508: Error: offset out of range
| /tmp/ccIA0vqC.s:1547: Error: offset out of range
| /tmp/ccIA0vqC.s:1548: Error: offset out of range
| /tmp/ccIA0vqC.s:1667: Error: offset out of range
| /tmp/ccIA0vqC.s:1668: Error: offset out of range
| /tmp/ccIA0vqC.s:2071: Error: offset out of range
| /tmp/ccIA0vqC.s:2074: Error: offset out of range
| /tmp/ccIA0vqC.s:2234: Error: offset out of range
| /tmp/ccIA0vqC.s:2235: Error: offset out of range
| /tmp/ccIA0vqC.s:2536: Error: offset out of range
| /tmp/ccIA0vqC.s:2540: Error: offset out of range
| /tmp/ccIA0vqC.s:3105: Error: offset out of range
| /tmp/ccIA0vqC.s:3110: Error: offset out of range
| /tmp/ccIA0vqC.s:3425: Error: offset out of range
| /tmp/ccIA0vqC.s:3426: Error: offset out of range
| /tmp/ccIA0vqC.s:4048: Error: offset out of range
| /tmp/ccIA0vqC.s:4055: Error: offset out of range
| make[2]: *** [caller-save.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| rm fsf-funding.pod gfdl.pod cpp.pod gcc.pod gcov.pod gfortran.pod
| make[2]: Leaving directory =
`/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr1=
70880/gcc-4_5-branch/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-g=
nueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory =
`/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr1=
70880/gcc-4_5-branch/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-g=
nueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gcc-4.5-r41.1+svnr170880: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of =
/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.5.bb do_compile =
failed
ERROR: Task 13 =
(/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.5.bb, do_compile) =
failed with 256
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.5.bb' =
failed
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.5.bb' =
failed


Best regards,

Elvis Dowson=


