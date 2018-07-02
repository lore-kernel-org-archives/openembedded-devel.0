Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9F24F75461
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 14:10:17 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id w16-v6so8557123wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2018 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=uRqS1qVezCqQofTo5PG01HeGOJbszOoAuxokKq6jjhc=;
	b=aSbolhZCRUArL5VHBrGEWCiXl9BcHEP5KxVQ0Eise3ux5Jsi5hL9ZfETNmFwM4/WUM
	yURrJjbxS8tFDFONjBDHNndseW2KHs5E4W9ug6e/LY7sn7nZ8hdoKmb4o2e+IU/j4eS6
	X1NnqLeq1SgFJJ8ajVz1v+IUBV8ff1QmV3aAAViBOfcF67BFyGMupHjHVOPOeuu8H1mB
	pgnXktFhCxBwl6qAh3uqgI0HAC343Kd8r1hzoBweR7vIcBnVgm9+McLPpPC6I12tRWjG
	S7ykDvRodIta2KyGPJvVuwoI1DZmZTLXVj3XTGxqJNuFHKqeaZ4JpM3W0t2le6ckvt6N
	TTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uRqS1qVezCqQofTo5PG01HeGOJbszOoAuxokKq6jjhc=;
	b=pcLnIYdBv9jaLDgUe09f7ETBF2ZOyqHAdUUydnUqR7d5ZN3eFg5UwTVkn0iA2AY9Jn
	mh173N64VTKoojfR5Yr2xZtec09+dERYOgyorrTq7Ai5qrwQzBZh59eDU02d5P9ae413
	zoTpQKGSm/3vufiaNSPpK4/y48UAq8fdKJzVBCvRNDMWG66mBG67MyD19SlH0GESHHJM
	NaPmT4eSTMGqKWkvDkN26NIHFwWe4AeEMb+Hkz0NM52ni21fdqWS6xABu/7qZ4CuTmHJ
	G2siwX6EyCayU/XDMKiYvfZkpJylnso2oG72lg42QwoVjUNtvRyuQE2roQdi/cPAZSwl
	Ttrw==
X-Gm-Message-State: APt69E0rzeqpHm5YN9D+BQ6kD5/4zfI+E4D2Bf9umJOIwAcF/ixTGv00
	cP+4FRvSx5vevg99BhHm5ZlGzyThVxZ5otKAqfdyXg==
X-Google-Smtp-Source: AAOMgpdi6yf8VbWuvcCzXxE9K2okrbfYvTtzLQBSrhcHRLqzDXif1DHW55mwVxHVRVVYxp8CCB1nLe/h0qbJUHQkF7s=
X-Received: by 2002:a1c:c14:: with SMTP id 20-v6mr3681742wmm.117.1530540617302;
	Mon, 02 Jul 2018 07:10:17 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 2 Jul 2018 16:10:06 +0200
Message-ID: <CAAfyv37TooGK_RD21SczZmVYpS+-HdE9Yy5KmcuOG9rV2o2LXQ@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: meta-java opnjdk-8 sumo coredump on sumo for BBB
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 14:10:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to check openjdk-8 for BBB. I compiled it using meta-java
but when run simple java -version I get:

root@beaglebone-yocto:~/demo# java -version
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  Internal Error (os_linux_zero.cpp:254), pid=465, tid=0xb67cc460
#  fatal error: caught unhandled signal 11
#
# JRE version:  (8.0_162-b12) (build )
# Java VM: OpenJDK Zero VM (25.162-b12 interpreted mode linux-arm )
# Failed to write core dump. Core dumps have been disabled. To enable
core dumping, try "ulimit -c unlimited" before starting Java again
#
# An error report file with more information is saved as:
# /home/root/demo/hs_err_pid465.log
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.java.com/bugreport/crash.jsp
#
Aborted
root@beaglebone-yocto:~/demo# uname -a
Linux beaglebone-yocto 4.15.13-yocto-standard #1 PREEMPT Fri Jun 29
22:51:58 UTC 2018 armv7l GNU/Linux
root@beaglebone-yocto:~/demo#

also content of error file mentioned in log error:
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  Internal Error (os_linux_zero.cpp:254), pid=465, tid=0xb67cc460
#  fatal error: caught unhandled signal 11
#
# JRE version:  (8.0_162-b12) (build )
# Java VM: OpenJDK Zero VM (25.162-b12 interpreted mode linux-arm )
# Failed to write core dump. Core dumps have been disabled. To enable
core dumping, try "ulimit -c unlimited" before starting Java again
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.java.com/bugreport/crash.jsp
#

---------------  T H R E A D  ---------------

Current thread (0xb6506658):  JavaThread "main" [_thread_in_Java,
id=466, stack(0xb664e000,0xb67cd000)]

Stack: [0xb664e000,0xb67cd000],  sp=0xb670f5b4,  free space=773k
Java frames:
 0xb67cb730: stack_word[6]         = 0xb67cb6e8
 0xb67cb734: stack_word[5]         = 0xac807608
 0xb67cb738: stack_word[4]         = 0x00000001
 0xb67cb73c: stack_word[3]         = 0xac8075b8
 0xb67cb740: stack_word[2]         = 0xac8075b8
 0xb67cb744: stack_word[1]         = 0xac807448
 0xb67cb748: stack_word[0]         = 0xac807590
 0xb67cb74c: istate->_thread       = 0xb6506658
 0xb67cb750: istate->_bcp          = 0xac416e09 (bci 25)
 0xb67cb754: istate->_locals       = 0xb67cb798
 0xb67cb758: istate->_constants    = 0xac416f90
 0xb67cb75c: istate->_method       = sun.reflect.Reflection.<clinit>()V
 0xb67cb760: istate->_mdx          = 0x00000000
 0xb67cb764: istate->_stack        = 0xb67cb73c
 0xb67cb768: istate->_msg          = 0x00000008
 0xb67cb76c: istate->_result       = 0xac418100
 0xb67cb770: (istate->_result)     = 0xb44b5140
 0xb67cb774: (istate->_result)     = 0x00000003
 0xb67cb778: istate->_prev_link    = 0x00000000
 0xb67cb77c: istate->_oop_temp     = 0x00000000
 0xb67cb780: istate->_stack_base   = 0xb67cb74c
 0xb67cb784: istate->_stack_limit  = 0xb67cb72c
 0xb67cb788: istate->_monitor_base = 0xb67cb74c
 0xb67cb78c: istate->_self_link    = 0xb67cb74c
 0xb67cb790: frame_type            = INTERPRETER_FRAME
 0xb67cb794: next_frame            = 0xb67cb7a4

 0xb67cb798: local[0]              = 0xac807590
 0xb67cb79c: call_wrapper          = 0xb670fd30
 0xb67cb7a0: frame_type            = ENTRY_FRAME
 0xb67cb7a4: next_frame            = 0xb67cb808

 0xb67cb7a8: local[5]              = 0xb67cb774
 0xb67cb7ac: local[4]              = 0xac807418
 0xb67cb7b0: local[3]              = 0x00000000
 0xb67cb7b4: local[2]              = 0xac807408
 0xb67cb7b8: local[1]              = 0xac807408
 0xb67cb7bc: local[0]              = 0xac802b28
 0xb67cb7c0: istate->_thread       = 0xb6506658
 0xb67cb7c4: istate->_bcp          = 0xac3d04fe (bci 14)
 0xb67cb7c8: istate->_locals       = 0xb67cb808
 0xb67cb7cc: istate->_constants    = 0xac3eee60
 0xb67cb7d0: istate->_method       = sun.misc.Unsafe.<clinit>()V
 0xb67cb7d4: istate->_mdx          = 0x00000000
 0xb67cb7d8: istate->_stack        = 0xb67cb7b4
 0xb67cb7dc: istate->_msg          = 0x00000003
 0xb67cb7e0: istate->_result       = 0xac3cd648
 0xb67cb7e4: (istate->_result)     = 0xb44b517c
 0xb67cb7e8: (istate->_result)     = 0x00000003
 0xb67cb7ec: istate->_prev_link    = 0x00000000
 0xb67cb7f0: istate->_oop_temp     = 0x00000000
 0xb67cb7f4: istate->_stack_base   = 0xb67cb7c0
 0xb67cb7f8: istate->_stack_limit  = 0xb67cb7a4
 0xb67cb7fc: istate->_monitor_base = 0xb67cb7c0
 0xb67cb800: istate->_self_link    = 0xb67cb7c0
 0xb67cb804: frame_type            = INTERPRETER_FRAME
 0xb67cb808: next_frame            = 0xb67cb814

 0xb67cb80c: call_wrapper          = 0xb6710270
 0xb67cb810: frame_type            = ENTRY_FRAME
 0xb67cb814: next_frame            = 0xb67cb868

 0xb67cb818: local[1]              = 0x00000000
 0xb67cb81c: local[0]              = 0xb67cb7e8
 0xb67cb820: istate->_thread       = 0xb6506658
 0xb67cb824: istate->_bcp          = 0xac415320 (bci 0)
 0xb67cb828: istate->_locals       = 0xb67cb868
 0xb67cb82c: istate->_constants    = 0xac415470
 0xb67cb830: istate->_method       = sun.misc.SharedSecrets.<clinit>()V
 0xb67cb834: istate->_mdx          = 0x00000000
 0xb67cb838: istate->_stack        = 0xb67cb81c
 0xb67cb83c: istate->_msg          = 0x00000002
 0xb67cb840: istate->_result       = 0x00000000
 0xb67cb844: (istate->_result)     = 0xac4143d8
 0xb67cb848: (istate->_result)     = 0xac4141f8
 0xb67cb84c: istate->_prev_link    = 0x00000000
 0xb67cb850: istate->_oop_temp     = 0x00000000
 0xb67cb854: istate->_stack_base   = 0xb67cb820
 0xb67cb858: istate->_stack_limit  = 0xb67cb814
 0xb67cb85c: istate->_monitor_base = 0xb67cb820
 0xb67cb860: istate->_self_link    = 0xb67cb820
 0xb67cb864: frame_type            = INTERPRETER_FRAME
 0xb67cb868: next_frame            = 0xb67cb874

 0xb67cb86c: call_wrapper          = 0xb67107b0
 0xb67cb870: frame_type            = ENTRY_FRAME
 0xb67cb874: next_frame            = 0xb67cb8d4

 0xb67cb878: local[4]              = 0xb67cb838
 0xb67cb87c: local[3]              = 0x00000002
 0xb67cb880: local[2]              = 0xb67cb8d4
 0xb67cb884: local[1]              = 0xac806c08
 0xb67cb888: local[0]              = 0xac806c08
 0xb67cb88c: istate->_thread       = 0xb6506658
 0xb67cb890: istate->_bcp          = 0xac392467 (bci 71)
 0xb67cb894: istate->_locals       = 0xb67cb8dc
 0xb67cb898: istate->_constants    = 0xac3eeae8
 0xb67cb89c: istate->_method       = java.lang.ref.Reference.<clinit>()V
 0xb67cb8a0: istate->_mdx          = 0x00000000
 0xb67cb8a4: istate->_stack        = 0xb67cb884
 0xb67cb8a8: istate->_msg          = 0x00000003
 0xb67cb8ac: istate->_result       = 0xac4141f8
 0xb67cb8b0: (istate->_result)     = 0xb44b5140
 0xb67cb8b4: (istate->_result)     = 0x00000003
 0xb67cb8b8: istate->_prev_link    = 0x00000000
 0xb67cb8bc: istate->_oop_temp     = 0x00000000
 0xb67cb8c0: istate->_stack_base   = 0xb67cb88c
 0xb67cb8c4: istate->_stack_limit  = 0xb67cb874
 0xb67cb8c8: istate->_monitor_base = 0xb67cb88c
 0xb67cb8cc: istate->_self_link    = 0xb67cb88c
 0xb67cb8d0: frame_type            = INTERPRETER_FRAME
 0xb67cb8d4: next_frame            = 0xb67cb8e8

 0xb67cb8d8: local[1]              = 0xac806880
 0xb67cb8dc: local[0]              = 0xac804d60
 0xb67cb8e0: call_wrapper          = 0xb67cb968
 0xb67cb8e4: frame_type            = ENTRY_FRAME
 0xb67cb8e8: next_frame            = 0x00000000


---------------  P R O C E S S  ---------------

Java Threads: ( => current thread )
  0xb65602c8 JavaThread "Reference Handler" daemon [_thread_blocked,
id=468, stack(0xabd80000,0xabf00000)]
=>0xb6506658 JavaThread "main" [_thread_in_Java, id=466,
stack(0xb664e000,0xb67cd000)]

Other Threads:
  0xb655b910 VMThread [stack: 0xac07e000,0xac0fd000] [id=467]

VM state:not at safepoint (normal execution)

VM Mutex/Monitor currently owned by a thread: None

Heap:
 def new generation   total 2432K, used 29K [0xac800000, 0xacaa0000, 0xaf150000)
  eden space 2176K,   1% used [0xac800000, 0xac807648, 0xaca20000)
  from space 256K,   0% used [0xaca20000, 0xaca20000, 0xaca60000)
  to   space 256K,   0% used [0xaca60000, 0xaca60000, 0xacaa0000)
 tenured generation   total 5504K, used 0K [0xaf150000, 0xaf6b0000, 0xb4400000)
   the space 5504K,   0% used [0xaf150000, 0xaf150000, 0xaf150200, 0xaf6b0000)
 Metaspace       used 661K, capacity 2200K, committed 2200K, reserved 4400K

Card table byte_map: [0xac7c1000,0xac800000] byte_map_base: 0xac25d000

Polling page: 0xb6f1a000

CodeCache: size=32768Kb used=67Kb max_used=67Kb free=32700Kb
 bounds [0xb44b5000, 0xb44dd000, 0xb64b5000]
 total_blobs=44 nmethods=0 adapters=37
 compilation: disabled (interpreter mode)

Compilation events (0 events):
No events

GC Heap History (0 events):
No events

Deoptimization events (0 events):
No events

Classes redefined (0 events):
No events

Internal exceptions (2 events):
Event: 0.155 Thread 0xb6506658 Exception <a 'java/lang/NoSuchMethodError':
Method sun.misc.Unsafe.defineClass(Ljava/lang/String;[BII)Ljava/lang/Class;
name or signature does not match> (0xac806e88) thrown at
[/usr/src/debug/openjdk-8/162b12-r0/jdk8u-4be07cb28b21/hotspot/src/share/vm/pr
Event: 0.155 Thread 0xb6506658 Exception <a
'java/lang/NoSuchMethodError': Method
sun.misc.Unsafe.prefetchRead(Ljava/lang/Object;J)V name or signature
does not match> (0xac807158) thrown at
[/usr/src/debug/openjdk-8/162b12-r0/jdk8u-4be07cb28b21/hotspot/src/share/vm/prims/jni.cpp,
line

Events (10 events):
Event: 0.152 loading class sun/misc/SharedSecrets
Event: 0.153 loading class sun/misc/SharedSecrets done
Event: 0.153 loading class java/lang/NoSuchMethodError
Event: 0.154 loading class java/lang/IncompatibleClassChangeError
Event: 0.154 loading class java/lang/IncompatibleClassChangeError done
Event: 0.154 loading class java/lang/NoSuchMethodError done
Event: 0.155 loading class sun/reflect/Reflection
Event: 0.156 loading class sun/reflect/Reflection done
Event: 0.157 loading class java/util/HashMap
Event: 0.159 loading class java/util/HashMap done


Dynamic libraries:
00010000-00011000 r-xp 00000000 b3:02 423        /usr/lib/jvm/openjdk-8/bin/java
00020000-00021000 r--p 00000000 b3:02 423        /usr/lib/jvm/openjdk-8/bin/java
00021000-00022000 rw-p 00001000 b3:02 423        /usr/lib/jvm/openjdk-8/bin/java
00022000-00043000 rw-p 00000000 00:00 0          [heap]
abd80000-abd83000 ---p 00000000 00:00 0
abd83000-abf00000 rw-p 00000000 00:00 0
abf00000-abf21000 rw-p 00000000 00:00 0
abf21000-ac000000 ---p 00000000 00:00 0
ac07c000-ac07d000 ---p 00000000 00:00 0
ac07d000-ac14b000 rw-p 00000000 00:00 0
ac14b000-ac31a000 r--s 03354000 b3:02 541
/usr/lib/jvm/openjdk-8/jre/lib/rt.jar
ac31a000-ac59b000 rw-p 00000000 00:00 0
ac59b000-ac7c1000 ---p 00000000 00:00 0
ac7c1000-ac7c3000 rw-p 00000000 00:00 0
ac7c3000-ac7d5000 ---p 00000000 00:00 0
ac7d5000-ac7d9000 rw-p 00000000 00:00 0
ac7d9000-ac7ff000 ---p 00000000 00:00 0
ac7ff000-acaa0000 rw-p 00000000 00:00 0
acaa0000-af150000 ---p 00000000 00:00 0
af150000-af6b0000 rw-p 00000000 00:00 0
af6b0000-b4400000 ---p 00000000 00:00 0
b440b000-b440e000 rw-p 00000000 00:00 0
b440e000-b4435000 ---p 00000000 00:00 0
b4435000-b4436000 rw-p 00000000 00:00 0
b4436000-b44b5000 ---p 00000000 00:00 0
b44b5000-b44dd000 rwxp 00000000 00:00 0
b44dd000-b64b5000 ---p 00000000 00:00 0
b64b5000-b64bb000 r-xp 00000000 b3:02 561
/usr/lib/jvm/openjdk-8/jre/lib/arm/libzip.so
b64bb000-b64ca000 ---p 00006000 b3:02 561
/usr/lib/jvm/openjdk-8/jre/lib/arm/libzip.so
b64ca000-b64cb000 r--p 00005000 b3:02 561
/usr/lib/jvm/openjdk-8/jre/lib/arm/libzip.so
b64cb000-b64cc000 rw-p 00006000 b3:02 561
/usr/lib/jvm/openjdk-8/jre/lib/arm/libzip.so
b64cc000-b64ef000 r-xp 00000000 b3:02 562
/usr/lib/jvm/openjdk-8/jre/lib/arm/libjava.so
b64ef000-b64fe000 ---p 00023000 b3:02 562
/usr/lib/jvm/openjdk-8/jre/lib/arm/libjava.so
b64fe000-b64ff000 r--p 00022000 b3:02 562
/usr/lib/jvm/openjdk-8/jre/lib/arm/libjava.so
b64ff000-b6500000 rw-p 00023000 b3:02 562
/usr/lib/jvm/openjdk-8/jre/lib/arm/libjava.so
b6500000-b6563000 rw-p 00000000 00:00 0
b6563000-b6600000 ---p 00000000 00:00 0
b6603000-b6609000 r-xp 00000000 b3:02 878        /lib/libnss_compat-2.27.so
b6609000-b6618000 ---p 00006000 b3:02 878        /lib/libnss_compat-2.27.so
b6618000-b6619000 r--p 00005000 b3:02 878        /lib/libnss_compat-2.27.so
b6619000-b661a000 rw-p 00006000 b3:02 878        /lib/libnss_compat-2.27.so
b661a000-b6623000 r-xp 00000000 b3:02 552
/usr/lib/jvm/openjdk-8/jre/lib/arm/libverify.so
b6623000-b6633000 ---p 00009000 b3:02 552
/usr/lib/jvm/openjdk-8/jre/lib/arm/libverify.so
b6633000-b6634000 r--p 00009000 b3:02 552
/usr/lib/jvm/openjdk-8/jre/lib/arm/libverify.so
b6634000-b6635000 rw-p 0000a000 b3:02 552
/usr/lib/jvm/openjdk-8/jre/lib/arm/libverify.so
b6635000-b663b000 r-xp 00000000 b3:02 880        /lib/librt-2.27.so
b663b000-b664a000 ---p 00006000 b3:02 880        /lib/librt-2.27.so
b664a000-b664b000 r--p 00005000 b3:02 880        /lib/librt-2.27.so
b664b000-b664c000 rw-p 00006000 b3:02 880        /lib/librt-2.27.so
b664c000-b664d000 ---p 00000000 00:00 0
b664d000-b664e000 rw-p 00000000 00:00 0
b664e000-b6651000 ---p 00000000 00:00 0
b6651000-b67cd000 rw-p 00000000 00:00 0
b67cd000-b67e9000 r-xp 00000000 b3:02 925        /lib/libgcc_s.so.1
b67e9000-b67f8000 ---p 0001c000 b3:02 925        /lib/libgcc_s.so.1
b67f8000-b67f9000 r--p 0001b000 b3:02 925        /lib/libgcc_s.so.1
b67f9000-b67fa000 rw-p 0001c000 b3:02 925        /lib/libgcc_s.so.1
b67fa000-b6800000 r-xp 00000000 b3:02 412        /usr/lib/libffi.so.6.0.4
b6800000-b680f000 ---p 00006000 b3:02 412        /usr/lib/libffi.so.6.0.4
b680f000-b6810000 r--p 00005000 b3:02 412        /usr/lib/libffi.so.6.0.4
b6810000-b6811000 rw-p 00006000 b3:02 412        /usr/lib/libffi.so.6.0.4
b6811000-b6885000 r-xp 00000000 b3:02 883        /lib/libm-2.27.so
b6885000-b6894000 ---p 00074000 b3:02 883        /lib/libm-2.27.so
b6894000-b6895000 r--p 00073000 b3:02 883        /lib/libm-2.27.so
b6895000-b6896000 rw-p 00074000 b3:02 883        /lib/libm-2.27.so
b6896000-b6cf0000 r-xp 00000000 b3:02 569
/usr/lib/jvm/openjdk-8/jre/lib/arm/server/libjvm.so
b6cf0000-b6cff000 ---p 0045a000 b3:02 569
/usr/lib/jvm/openjdk-8/jre/lib/arm/server/libjvm.so
b6cff000-b6d0b000 r--p 00459000 b3:02 569
/usr/lib/jvm/openjdk-8/jre/lib/arm/server/libjvm.so
b6d0b000-b6d1e000 rw-p 00465000 b3:02 569
/usr/lib/jvm/openjdk-8/jre/lib/arm/server/libjvm.so
b6d1e000-b6d2f000 rw-p 00000000 00:00 0
b6d2f000-b6d45000 r-xp 00000000 b3:02 915        /lib/libpthread-2.27.so
b6d45000-b6d54000 ---p 00016000 b3:02 915        /lib/libpthread-2.27.so
b6d54000-b6d55000 r--p 00015000 b3:02 915        /lib/libpthread-2.27.so
b6d55000-b6d56000 rw-p 00016000 b3:02 915        /lib/libpthread-2.27.so
b6d56000-b6d58000 rw-p 00000000 00:00 0
b6d58000-b6d5a000 r-xp 00000000 b3:02 876        /lib/libdl-2.27.so
b6d5a000-b6d69000 ---p 00002000 b3:02 876        /lib/libdl-2.27.so
b6d69000-b6d6a000 r--p 00001000 b3:02 876        /lib/libdl-2.27.so
b6d6a000-b6d6b000 rw-p 00002000 b3:02 876        /lib/libdl-2.27.so
b6d6b000-b6d7e000 r-xp 00000000 b3:02 924        /lib/libz.so.1.2.11
b6d7e000-b6d8d000 ---p 00013000 b3:02 924        /lib/libz.so.1.2.11
b6d8d000-b6d8e000 r--p 00012000 b3:02 924        /lib/libz.so.1.2.11
b6d8e000-b6d8f000 rw-p 00013000 b3:02 924        /lib/libz.so.1.2.11
b6d8f000-b6eba000 r-xp 00000000 b3:02 872        /lib/libc-2.27.so
b6eba000-b6ec9000 ---p 0012b000 b3:02 872        /lib/libc-2.27.so
b6ec9000-b6ecb000 r--p 0012a000 b3:02 872        /lib/libc-2.27.so
b6ecb000-b6ecc000 rw-p 0012c000 b3:02 872        /lib/libc-2.27.so
b6ecc000-b6ecf000 rw-p 00000000 00:00 0
b6ecf000-b6edc000 r-xp 00000000 b3:02 590
/usr/lib/jvm/openjdk-8/lib/arm/jli/libjli.so
b6edc000-b6eeb000 ---p 0000d000 b3:02 590
/usr/lib/jvm/openjdk-8/lib/arm/jli/libjli.so
b6eeb000-b6eec000 r--p 0000c000 b3:02 590
/usr/lib/jvm/openjdk-8/lib/arm/jli/libjli.so
b6eec000-b6eed000 rw-p 0000d000 b3:02 590
/usr/lib/jvm/openjdk-8/lib/arm/jli/libjli.so
b6eed000-b6f0d000 r-xp 00000000 b3:02 885        /lib/ld-2.27.so
b6f10000-b6f18000 rw-s 00000000 00:11 12557
/var/volatile/tmp/hsperfdata_root/465
b6f18000-b6f1a000 rw-p 00000000 00:00 0
b6f1a000-b6f1b000 r--p 00000000 00:00 0
b6f1b000-b6f1d000 rw-p 00000000 00:00 0
b6f1d000-b6f1e000 r--p 00020000 b3:02 885        /lib/ld-2.27.so
b6f1e000-b6f1f000 rw-p 00021000 b3:02 885        /lib/ld-2.27.so
bed7a000-bed9b000 rw-p 00000000 00:00 0          [stack]
bedd9000-bedda000 r-xp 00000000 00:00 0          [sigpage]
bedda000-beddb000 r--p 00000000 00:00 0          [vvar]
beddb000-beddc000 r-xp 00000000 00:00 0          [vdso]
ffff0000-ffff1000 r-xp 00000000 00:00 0          [vectors]

VM Arguments:
java_command: <unknown>
java_class_path (initial): .
Launcher Type: SUN_STANDARD

Environment Variables:
JAVA_HOME=/usr/lib/jvm/openjdk-8
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
SHELL=/bin/sh

Signal Handlers:
SIGSEGV: [libjvm.so+0x3e16d4],
sa_mask[0]=11111111011111111101111111111110,
sa_flags=SA_RESTART|SA_SIGINFO
SIGBUS: [libjvm.so+0x3e16d4],
sa_mask[0]=11111111011111111101111111111110,
sa_flags=SA_RESTART|SA_SIGINFO
SIGFPE: [libjvm.so+0x320858],
sa_mask[0]=11111111011111111101111111111110,
sa_flags=SA_RESTART|SA_SIGINFO
SIGPIPE: [libjvm.so+0x320858],
sa_mask[0]=11111111011111111101111111111110,
sa_flags=SA_RESTART|SA_SIGINFO
SIGXFSZ: [libjvm.so+0x320858],
sa_mask[0]=11111111011111111101111111111110,
sa_flags=SA_RESTART|SA_SIGINFO
SIGILL: [libjvm.so+0x320858],
sa_mask[0]=11111111011111111101111111111110,
sa_flags=SA_RESTART|SA_SIGINFO
SIGUSR1: SIG_DFL, sa_mask[0]=00000000000000000000000000000000, sa_flags=none
SIGUSR2: [libjvm.so+0x320568],
sa_mask[0]=00000000000000000000000000000000,
sa_flags=SA_RESTART|SA_SIGINFO
SIGHUP: SIG_DFL, sa_mask[0]=00000000000000000000000000000000, sa_flags=none
SIGINT: SIG_DFL, sa_mask[0]=00000000000000000000000000000000, sa_flags=none
SIGTERM: SIG_DFL, sa_mask[0]=00000000000000000000000000000000, sa_flags=none
SIGQUIT: SIG_DFL, sa_mask[0]=00000000000000000000000000000000, sa_flags=none


---------------  S Y S T E M  ---------------

OS:Linux
uname:Linux 4.15.13-yocto-standard #1 PREEMPT Fri Jun 29 22:51:58 UTC
2018 armv7l
libc:glibc 2.27 NPTL 2.27
rlimit: STACK 8192k, CORE 0k, NPROC 3796, NOFILE 4096, AS infinity
load average:0.07 0.03 0.04

/proc/meminfo:
MemTotal:         503316 kB
MemFree:          470240 kB
MemAvailable:     479972 kB
Buffers:            2752 kB
Cached:            11688 kB
SwapCached:            0 kB
Active:            13908 kB
Inactive:           3416 kB
Active(anon):       2944 kB
Inactive(anon):      100 kB
Active(file):      10964 kB
Inactive(file):     3316 kB
Unevictable:           0 kB
Mlocked:               0 kB
HighTotal:             0 kB
HighFree:              0 kB
LowTotal:         503316 kB
LowFree:          470240 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                84 kB
Writeback:             0 kB
AnonPages:          2892 kB
Mapped:             8412 kB
Shmem:               152 kB
Slab:              10924 kB
SReclaimable:       6744 kB
SUnreclaim:         4180 kB
KernelStack:         400 kB
PageTables:          196 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      251656 kB
Committed_AS:      18364 kB
VmallocTotal:     516096 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB
CmaTotal:          16384 kB
CmaFree:           16116 kB


CPU:total 1 (initial active 1)

/proc/cpuinfo:
processor       : 0
model name      : ARMv7 Processor rev 2 (v7l)
BogoMIPS        : 996.14
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc08
CPU revision    : 2

Hardware        : Generic AM33XX (Flattened Device Tree)
Revision        : 0000
Serial          : 0000000000000000


Memory: 4k page, physical 503316k(470240k free), swap 0k(0k free)

vm_info: OpenJDK Zero VM (25.162-b12) for linux-arm JRE
(1.8.0_162-internal-b12), built on Jun 29 2018 23:04:59 by "marek"
with gcc 7.3.0

time: Fri Jun 29 23:27:31 2018
elapsed time: 0 seconds (0d 0h 0m 0s)

Any ideas? Thanks.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

