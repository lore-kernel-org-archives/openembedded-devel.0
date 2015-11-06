Return-Path: <erkka.kaaria@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A99A75EE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 11:44:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2015 03:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,251,1444719600"; d="scan'208";a="844098891"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 03:44:01 -0800
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.229]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.138]) with mapi id
	14.03.0248.002; Fri, 6 Nov 2015 11:44:00 +0000
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] Sporadic segfaults when compiling jamvm-native and
	classpath-native
Thread-Index: AdEYh1mleQZx3N4ORrSipg5JNSUBow==
Date: Fri, 6 Nov 2015 11:44:00 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEA213D3@IRSMSX106.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.42]
MIME-Version: 1.0
Subject: [meta-java] Sporadic segfaults when compiling jamvm-native and classpath-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2015 11:44:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

There seems to be something wrong with cacao-initial-native JIT compiler th=
at causes sporadic segfaults when compiling jamvm-native or classpath-nativ=
e. This is fairly rare, I estimate around 1% of the builds fail due to segf=
ault. I use 64 bit Ubuntu 15.04 with GCC 4.9.2 as build machine.

Example do_compile log:

make[6]: Entering directory '<path-snip>/build/tmp/work/x86_64-linux/jamvm-=
native/1.5.5+1.6.0-devel+gitAUTOINC+ebd11bde0a-r0/build/src/classlib/gnucla=
sspath/lib'
mkdir classes
<snip, ecj-initial compiling lots of java files>
LOG: [0x00007f32c46a7700] We received a SIGSEGV and tried to handle it, but=
 we were
LOG: [0x00007f32c46a7700] unable to find a Java method at:
LOG: [0x00007f32c46a7700]
LOG: [0x00007f32c46a7700] PC=3D0x0000000000440c09
LOG: [0x00007f32c46a7700]
LOG: [0x00007f32c46a7700] Dumping the current stacktrace:
    <<No stacktrace available>>
LOG: [0x00007f32c46a7700] Exiting...
Aborted (core dumped)
Makefile:662: recipe for target 'classes.zip' failed


Examination of the core dump in this particular case indicates that the seg=
fault is caused by null pointer dereference in builtin_new at builtin.c:764:

<snip, signal handlers, java stacktrace code etc>
#5 <signal handler called>
#6 builtin_new (c=3D0x0) at builtin.c:764
#7 0x00007f23badb5a5f in ?? ()
#8 0x0000000000000000 in ?? ()

Gdb is unable to show the calling method, and judging by the fact that the =
old instruction pointer does not match any shared library addresses, I thin=
k it originates from JIT compiled code.

This http://c1.complang.tuwien.ac.at/pipermail/cacao/2011-March/001350.html=
 thread seems to indicate that there could be a race condition in cacao JIT=
 compiler when multiple Java threads are involved. I forced the ecj to only=
 use one thread and segfaulting seems to have stopped.

Given the non-deterministic nature of the bug, I am not sure if I actually =
managed to fix this or if I have just been lucky. As such, I request help to

a) Verify the presence of the bug
b) Verify that forcing ecj to only use single thread fixes the issue.

Multihreading can be disabled by adding -Djdt.compiler.useSingleThread=3Dtr=
ue to the third line in "ecj-initial" script in build/tmp/sysroots/<build m=
achine folder>/usr/bin/

example line:
${RUNTIME} -Xmx512m -Djdt.compiler.useSingleThread=3Dtrue -cp ${ECJ_JAR} or=
g.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}


Script I use for the recompilation. I usually get a failure within 90 minut=
es, but this naturally varies between computers. Run from the build folder

#!/bin/bash
while [ true ]; do
  echo $(date)
  echo "Cleaning..."
  bitbake -c cleansstate jamvm-native > /dev/null
  echo "Compiling..."
  bitbake -c compile jamvm-native > /dev/null   || { echo "Stopping"; exit =
1; }
done

Best regards,
Erkka K=E4=E4ri=E4
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


