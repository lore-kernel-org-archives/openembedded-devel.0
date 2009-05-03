Received: from [220.181.12.12] (helo=m12-12.163.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lida_mail@163.com>) id 1M0bvT-0000Pp-3W
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 May 2009 15:40:15 +0200
Received: from [192.168.58.103] (unknown [116.227.146.13])
	by smtp8 (Coremail) with SMTP id DMCowLA7h5Zhnf1JSLpXEQ--.37994S2;
	Sun, 03 May 2009 21:34:27 +0800 (CST)
From: "Daniel.Li" <lida_mail@163.com>
To: openembedded-devel@lists.openembedded.org
Organization: PALFocus (http://palfocus.oicp.net)
Date: Sun, 03 May 2009 21:34:29 +0800
Message-Id: <1241357669.13222.0.camel@daniel-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-CM-TRANSID: DMCowLA7h5Zhnf1JSLpXEQ--.37994S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrykur1fWry8XF4xWw1DGFg_yoW7Cr4rpF
	Z8try5A3ykuayUXF95Cr40vr1FgryUGrW7Ww1kGrs7JFy5J3yxXwsFkry3KFy3Cwn8WrW8
	uFn5X3yj934fWaDanT9S1TB71UUUUUUv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UU
	UYr7k042IEc7kJM7k042IE42xK82IY6r43WwAYjxAI6xAIw28IcVAK0I8IjxAxM7k042IE
	4IxYO2xFxVAqjxCEw4Av424lb7Iv0xC_Jr1lb4IE77IF4wAFF20E14v26r1j6r4UM7C26x
	Cjj4IEI4klw4CSwwAFxVCaYxvI4VCIwcAKzIAtM7CIcVAFz4kK6r1j6r18M28EF7xvwVC0
	I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4
	vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAawVAYYI1S
	6c8GOVWUur45Jryln4vEF2I2jVAIwVAKzxkI7VAqrcv_JFW8Xr15Mc804VCqF7xvr2I5Mc
	8Ir4CE8sxKj4xv1VCF748vxVAv7wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8I
	cVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UM4x0Y48IcxkI7VAKI48JM4IEnf9ElV
	AFpTB2q-sK649IAas0WaI_GwCjxxvEw4Wlc7Ca8VAvwVCjb41lc2xSY4AK67AK6ry8MxkI
	7II2jI8vz4v_Jr0_Jryl42xK82IYc2Ij64vIr41l4x8a6c8ajcxJMI8E67AF67kF1VAFwI
	0_Jr0_JrylIxkGc2Ij64vIr41lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU9fHUUUUUU
X-CM-SenderInfo: 5olgtshpdlzqqrwthudrp/
Subject: qemu-native build fail
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
X-List-Received-Date: Sun, 03 May 2009 13:40:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dear List,

I have found that qemu-native failed with gcc 3.4, see below.
Originally, qemu failed with 4.* gcc, now qemu is ok with gcc3.4 but
qemu-native failed. 

I googled, only found this http://pastebin.com/f75407ece# , which seems
failed on 20 Apr.

Now, I'm confused. Is there anyone can help me out this problem?  I'm
build fso-gta02-testing-image, with Jaunty (ubuntu 9.04). Thanks.

NOTE: Running task 241 of 253 (ID:
8, /home/daniel/work4/fso/fso-testing/openembedded/recipes/qemu/qemu-native_svn.bb, do_compile)
NOTE: package qemu-native-0.9.1+svnr4242-r15: task do_compile: started
ERROR: function do_compile failed
ERROR: see log
in /home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/temp/log.do_compile.10467
NOTE: Task
failed: /home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/temp/log.do_compile.10467
NOTE: package qemu-native-0.9.1+svnr4242-r15: task do_compile: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /home/daniel/work4/fso/fso-testing/openembedded/recipes/qemu/qemu-native_svn.bb do_compile failed
ERROR: Task 8
(/home/daniel/work4/fso/fso-testing/openembedded/recipes/qemu/qemu-native_svn.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 240 tasks of which 0 didn't need to be
rerun and 1 failed.
ERROR:
'/home/daniel/work4/fso/fso-testing/openembedded/recipes/qemu/qemu-native_svn.bb' failed



From log, we can see

gcc-3.4 -I. -I..
-I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/target-i386 -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk -MMD -MP -DNEED_CPU_H -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/tcg -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/tcg/i386 -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/fpu -DHAS_AUDIO -DHAS_AUDIO_CHOICE -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/slirp -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/i686-linux/usr/include -O2 -Wall -O2 -g -fno-strict-aliasing  -m32 -c -o kqemu.o /home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/kqemu.c
gcc-3.4 -Wall -O2 -g -fno-strict-aliasing  -fno-reorder-blocks
-fno-gcse    -fno-optimize-sibling-calls  -fno-crossjumping
-fno-align-labels  -fno-align-jumps  -fno-align-functions
-mpreferred-stack-boundary=2 -fomit-frame-pointer  -m32 -I. -I..
-I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/target-i386 -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk -MMD -MP -DNEED_CPU_H -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/tcg -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/tcg/i386 -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/fpu -DHAS_AUDIO -DHAS_AUDIO_CHOICE -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/slirp -c -o op.o /home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/target-i386/op.c
/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1
+svnr4242-r15/trunk/target-i386/ops_sse.h: In function `op_pshufw_mmx':
/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1
+svnr4242-r15/trunk/target-i386/ops_sse.h:597: error: unable to find a
register to spill in class `GENERAL_REGS'
/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1
+svnr4242-r15/trunk/target-i386/ops_sse.h:597: error: this is the insn:
(insn:HI 18 17 19
0 /home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/target-i386/ops_sse.h:592 (set (strict_low_part (subreg:HI (reg/v:DI 58 [ r ]) 0))
        (mem/s/j:HI (plus:SI (mult:SI (reg:SI 62)
                    (const_int 2 [0x2]))
                (reg/v/f:SI 60 [ s ])) [0 <variable>._w S2 A16])) 54
{*movstricthi_1} (insn_list 16 (insn_list 12 (insn_list 50 (nil))))
    (expr_list:REG_DEAD (reg:SI 62)
        (nil)))
/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1
+svnr4242-r15/trunk/target-i386/ops_sse.h:597: confused by earlier
errors, bailing out
make[1]: *** [op.o] Error 1
make[1]: Leaving directory
`/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/i386-softmmu'
make: *** [subdir-i386-softmmu] Error 2
FATAL: oe_runmake failed

-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)




