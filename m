Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QvlUP-0001St-Rs
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 09:33:37 +0200
Received: by bkbzu17 with SMTP id zu17so4551430bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 00:28:53 -0700 (PDT)
Received: by 10.204.130.11 with SMTP id q11mr1275272bks.91.1314084532777;
	Tue, 23 Aug 2011 00:28:52 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id k16sm1583142bke.28.2011.08.23.00.28.50
	(version=SSLv3 cipher=OTHER); Tue, 23 Aug 2011 00:28:51 -0700 (PDT)
Message-ID: <4E5356B2.3060908@dresearch-fe.de>
Date: Tue, 23 Aug 2011 09:28:50 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Tom Rini <tom.rini@gmail.com>, Robert Schuster <thebohemian@gmx.net>, 
	Robert Schuster <robert.schuster@tarent.de>
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
In-Reply-To: <4E4E738C.70109@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Tue, 23 Aug 2011 07:33:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2011 16:30, Steffen Sledz wrote:
> On 19.08.2011 14:13, Steffen Sledz wrote:
>> Executing: MACHINE=beagleboard bitbake cacao
>> ...
>> Build Configuration:
>> BB_VERSION        = "1.12.0"
>> METADATA_BRANCH   = "2011.03-maintenance"
>> METADATA_REVISION = "f9c0bce"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "beagleboard"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "2011.03"
>> TARGET_FPU        = "hard"
>> ...
>> NOTE: package cacao-0.99.3-r11: task do_compile: Started
>> ERROR: Logfile of failure stored in: /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/temp/log.do_compile.21957
>> Log data follows:
>> | + do_compile
>> | + base_do_compile
>> | + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
>> | + oe_runmake
>> | + oenote make
>> | + echo NOTE: make
>> | NOTE: make
>> | + make
>> | make  all-recursive
>> | make[1]: Entering directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3'
>> ...
>> | Making all in native
>> | make[3]: Entering directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src/native'
>> | Making all in include
>> | make[4]: Entering directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src/native/include'
>> | /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/bin/cacaoh-0.99.3/cacaoh -bootclasspath ../../../src/classes/classes:/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/classpath/glibj.zip -d . java.lang.Class
>> | java.lang.ClassNotFoundException: java/lang/Object
>> | /bin/sh: line 2: 22021 Aborted                 /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/bin/cacaoh-0.99.3/cacaoh -bootclasspath ../../../src/classes/classes:/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/classpath/glibj.zip -d . $class
>> | make[4]: *** [java_lang_Class.h] Error 134
>> | make[4]: Leaving directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src/native/include'
>> | make[3]: *** [all-recursive] Error 1
>> | make[3]: Leaving directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src/native'
>> | make[2]: *** [all-recursive] Error 1
>> | make[2]: Leaving directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3/src'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/cacao-0.99.3'
>> | make: *** [all] Error 2
>> | + die 'oe_runmake failed'
>> | + oefatal 'oe_runmake failed'
>> | + echo FATAL: 'oe_runmake failed'
>> | FATAL: oe_runmake failed
>> | + exit 1
>> NOTE: package cacao-0.99.3-r11: task do_compile: Failed
>> ERROR: Function 'do_compile' failed (see /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99.3-r11/temp/log.do_compile.21957 for further information)
>> ERROR: Task 13 (/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/cacao/cacao_0.99.3.bb, do_compile) failed with exit code '1'
>> ERROR: '/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/cacao/cacao_0.99.3.bb' failed
>>
>> Standard angstrom-2008.1 setup without any changes.
>>
>> Logfiles are saved and available for inspection.
> 
> I'm not a java expert, but could this be related to <http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=344>?

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


