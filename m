Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P5kNG-0004xg-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 21:19:02 +0200
Received: by vws3 with SMTP id 3so1464504vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 12:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type;
	bh=hRlmXRFCPFiTyThPNphi/yFDGCRLQbJLvpBEsY7duYg=;
	b=m8a7UqNnX8dcemDI33CXFJ78w+d8bNDGrWukyXAQsHwaPz6r6HcGhWwhRGDAE9byIB
	uM7iFFLMWIbjqGPfQtV/wq0iDdUXY5reP9q0cc2fs0GVDryqMZj3R+3UwVvS6kBMqOCJ
	3HEqFKj1sXKQ5yekYQyT6k3F27m3MSJWM9ZeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=QYcAiKRE5e0I4l+5c3LLphO1wsxCAXqDFYJI7Y7fLJrPM+U9OEn3TWRrOyNg1OCygu
	7ENOknp58b4mehOUDbZAdtPpeDb1bj9mKbyyf1ow78ZfpUN/jAqm+8J9RNXEjID38VeS
	F8VZBSbPqLd9GEwl/LGSY+TSdcuwB9rUtedb8=
MIME-Version: 1.0
Received: by 10.220.191.1 with SMTP id dk1mr1598375vcb.215.1286911093972; Tue,
	12 Oct 2010 12:18:13 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Tue, 12 Oct 2010 12:18:13 -0700 (PDT)
Date: Tue, 12 Oct 2010 12:18:13 -0700
Message-ID: <AANLkTi=C+v2LfaXUuwTARn6hTmriWcUdBqKfq6pHPTAr@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Libprelude fails on oe_runmake
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
X-List-Received-Date: Tue, 12 Oct 2010 19:19:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Anyone have any ideas as how to fix this or what may be causing this?
I bumped my image to using barnyard2 and brought up this issue for me.
Thanks for the help, I am only posting part of the error as its really
long:

| arm-angstrom-linux-gnueabi-libtool: compile:
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
-DHAVE_CONFIG_H -I. -I../..
-I/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-linux
-isystem/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/include
-O2 -g -I../.. -I../../src/include -I../../src/include
-I../../src/libprelude-error -I../../bindings/c++/include
-I../../libmissing -I../../libmissing
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb2 -fpermissive -fvisibility-inlines-hidden -MT
PreludeEasy_la-PreludeEasy.lo -MD -MP -MF
.deps/PreludeEasy_la-PreludeEasy.Tpo -c PreludeEasy.cxx  -fPIC -DPIC
-o .libs/PreludeEasy_la-PreludeEasy.o
| In file included from
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-linux/missing.h:16:0,
|                  from
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-linux/ruby.h:755,
|                  from PreludeEasy.cxx:856:
| ../../libmissing/sys/time.h:85:58: error: conflicting declaration
'void* restrict'
| ../../libmissing/sys/time.h:85:42: error: 'restrict' has a previous
declaration as 'timeval* restrict'
| make[3]: *** [PreludeEasy_la-PreludeEasy.lo] Error 1
| make[3]: Leaving directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r0/libprelude-1.0.0/bindings/ruby'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r0/libprelude-1.0.0/bindings'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r0/libprelude-1.0.0'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r0/temp/log.do_compile.30120
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/libprelude/libprelude_1.0.0.bb
do_compile failed
ERROR: Task 15 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/libprelude/libprelude_1.0.0.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1090 tasks of which 1084 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/libprelude/libprelude_1.0.0.bb'
failed


