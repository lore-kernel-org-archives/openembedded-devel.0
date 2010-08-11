Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OjA2U-0007Yu-Fk
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 14:04:14 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 11 Aug 2010 14:03:58 +0200
X-TM-IMSS-Message-ID: <1f4097cb00007649@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 1f4097cb00007649 for
	<jaap.dejong@nedap.com>; Wed, 11 Aug 2010 14:04:02 +0100
Message-ID: <4C6291AD.1090502@nedap.com>
Date: Wed, 11 Aug 2010 14:03:57 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 11 Aug 2010 12:03:58.0448 (UTC)
	FILETIME=[4777A700:01CB394D]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: build problems openjdk-6 in stable branch
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
X-List-Received-Date: Wed, 11 Aug 2010 12:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All!

what is the status of openjdk-6 in the stable branch?
I can not get it build...

Jaap

$ bitbake openjdk-6
////
NOTE: Running task 1827 of 2707 (ID: 487, 
/media/OpenEmbedded/stable/org.openembedded.dev/recipes/llvm/llvm2.7_2.7.bb, 
do_compile)
ERROR: function do_compile failed
ERROR: log data follows 
(/media/OpenEmbedded/stable/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/temp/log.do_compile.6238)
| NOTE: make -j5
| Scanning dependencies of target count
| [  1%] Building C object utils/count/CMakeFiles/count.dir/count.c.o
| Scanning dependencies of target LLVMHello
| Linking C executable ../../bin/count
| [  1%] Building CXX object 
lib/Transforms/Hello/CMakeFiles/LLVMHello.dir/Hello.cpp.o
| Scanning dependencies of target LLVMSystem
| [  1%] [  1%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Alarm.cpp.o
| Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Atomic.cpp.o
| [  1%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Disassembler.cpp.o
| [  1%] Built target count
| [  1%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/DynamicLibrary.cpp.o
| [  2%] [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Errno.cpp.o
| Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Host.cpp.o
| [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/IncludeFile.cpp.o
| [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Memory.cpp.o
| [  2%] Building CXX object 
lib/System/CMakeFiles/LLVMSystem.dir/Mutex.cpp.o
| [  3%] Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Path.cpp.o
| Linking CXX shared module ../../LLVMHello.so
| 
/media/OpenEmbedded/stable/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/llvm-2.7/lib/System/Memory.cpp: 
In static member function 'static void 
llvm::sys::Memory::InvalidateInstructionCache(const void*, size_t)':
| 
/media/OpenEmbedded/stable/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/llvm-2.7/lib/System/Memory.cpp:67: 
error: '__clear_cache' was not declared in this scope
| [  3%] Built target LLVMHello
| [  3%] make[2]: *** 
[lib/System/CMakeFiles/LLVMSystem.dir/Memory.cpp.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| Building CXX object lib/System/CMakeFiles/LLVMSystem.dir/Process.cpp.o
| make[1]: *** [lib/System/CMakeFiles/LLVMSystem.dir/all] Error 2
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: 
/media/OpenEmbedded/stable/tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r8/temp/log.do_compile.6238
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/media/OpenEmbedded/stable/org.openembedded.dev/recipes/llvm/llvm2.7_2.7.bb 
do_compile failed
ERROR: Task 487 
(/media/OpenEmbedded/stable/org.openembedded.dev/recipes/llvm/llvm2.7_2.7.bb, 
do_compile) failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: 
/media/OpenEmbedded/stable/org.openembedded.dev/recipes/qemu/qemu-native_0.10.3.bb, 
do_compile (27024)
NOTE: 2: 
/media/OpenEmbedded/stable/org.openembedded.dev/recipes/icedtea/icedtea6-native_1.7.3.bb, 
do_compile (24621)



