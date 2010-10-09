Received: from topaz.fbs.net ([208.82.160.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nik@nikom.net>) id 1P4XFU-0005Ac-51
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:05:59 +0200
Received: from nikel ([71.43.229.162]) by fbs.net with MailEnable ESMTP;
	Sat, 9 Oct 2010 07:00:51 -0400
From: "N Twerdochlib" <nik@nikom.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 9 Oct 2010 07:00:04 -0400
Message-ID: <018d01cb67a1$20dde640$6299b2c0$@net>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: ActnoR+Pd5i45m1BQJauwqx9KMaeDA==
x-cr-hashedpuzzle: A67L CF4c Ce/B DMki DdcB DyS6 D6GU Eg8f HCKA HzRS Iaqv Irpb
	I9Pc JmFx JsxC LUvh; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {81D6D7C7-5B29-4A83-B351-93CB35846A63};
	bgBpAGsAQABuAGkAawBvAG0ALgBuAGUAdAA=;
	Sat, 09 Oct 2010 11:00:02 GMT;
	QwBhAG4AIABzAG8AbQBlAG8AbgBlACAAcAByAG8AdgBpAGQAZQAgAGEAbgB5ACAAaQBuAHAAdQB0ACAAYQBzACAAdABvACAAdwBoAHkAIAB0AGgAaQBzACAAaQBzACAAZgBhAGkAbABpAG4AZwAgAHQAbwAgAGIAdQBpAGwAZAA/AA==
x-cr-puzzleid: {81D6D7C7-5B29-4A83-B351-93CB35846A63}
X-SA-Exim-Connect-IP: 208.82.160.44
X-SA-Exim-Mail-From: nik@nikom.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Can someone provide any input as to why this is failing to build?
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
X-List-Received-Date: Sat, 09 Oct 2010 11:05:59 -0000
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

nik@bobbob:~/development/embedded$ bitbake  -b
/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb

NOTE: Preparing runqueue

NOTE: Executing runqueue

NOTE: Running task 7 of 17 (ID: 13,
/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb,
do_compile)

ERROR: Task 13
(/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb,
do_compile) failed with 256

ERROR:
'/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb'
failed

NOTE: package libvpx-0.9.1-r5.0: task do_compile: Started

ERROR: Function do_compile failed

NOTE: Task failed: ('function do_compile failed',
'/home/nik/development/embedded/tmp.overo.6/work/armv7a-angstrom-linux-gnuea
bi/libvpx-0.9.1-r5.0/temp/log.do_compile.9925')

ERROR: Logfile of failure stored in:
/home/nik/development/embedded/tmp.overo.6/work/armv7a-angstrom-linux-gnueab
i/libvpx-0.9.1-r5.0/temp/log.do_compile.9925

Log data follows:

| NOTE: make -j 4 -e MAKEFLAGS=

|
/home/nik/development/embedded/tmp.overo.6/work/armv7a-angstrom-linux-gnueab
i/libvpx-0.9.1-r5.0/libvpx-0.9.1/vp8/vp8_common.mk:184: warning: overriding
commands for target `vpx_asm_offsets.asm'

|
/home/nik/development/embedded/tmp.overo.6/work/armv7a-angstrom-linux-gnueab
i/libvpx-0.9.1-r5.0/libvpx-0.9.1/vp8/vp8_common.mk:184: warning: ignoring
old commands for target `vpx_asm_offsets.asm'

| make: *** [.DEFAULT] Error 2

| FATAL: oe_runmake failed

NOTE: package libvpx-0.9.1-r5.0: task do_compile: Failed

ERROR: TaskFailed event exception, aborting

ERROR: Build of
/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb
do_compile failed

ERROR: Task 13
(/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb,
do_compile) failed with 256

ERROR:
'/home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb'
failed

 

 

Running with the -D does not provide any clues either.

 

Thanks,

Nik


