Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE4E72332
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 05:49:50 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id y20so19067406ier.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 21:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/eWnM6VHrOHPnStmsEukwARKQd/chMz+t1tkfsMIklw=;
	b=yKEfAlI+mxp8TJU8SAxhzrSpE0kitbM0W0svygIFfZH6UvganlTnYyHTZ1K/8R9Gzf
	Fnt+2EG7vu0eY3ojVLDWNGR4tpWkNo7itXSwIhKOB1hAfktO4nDDj2+WybX50ep8kmFX
	iUMGE6XcSk/Aw3AFAg2gmHY4/KQN08gWTBZYnTBPnCAGNucFLCBDSVpbq3tgV+HuKpZB
	SdLeN3tgQ9InWfpuele0yel9wZRBR+IogZGnUO+EweSmNtHvzRhFEHLJ4Sw3OLyjJHnQ
	f2Hq5z3l+0d4DbqONTT15Y1whg5KDTTAO7YyhBk67ZjsIS+k2uYOjzuu3TzuhaU35ToZ
	6KNA==
X-Received: by 10.42.38.9 with SMTP id a9mr13080908ice.68.1421387390243;
	Thu, 15 Jan 2015 21:49:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c8sm924498igx.9.2015.01.15.21.49.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jan 2015 21:49:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 21:49:38 -0800
Message-Id: <1421387378-4580-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5] hardcoded rpath in Qt 5.4.0 qtbase-native uic binary
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
X-List-Received-Date: Fri, 16 Jan 2015 05:49:51 -0000

The Qt 5.4.0 qtbase-native uic binary seems to get built with a
hardcoded RUNPATH, which causes problems when qtbase-native from
sstate is later reused by a different build. The issue has been
there since 5.4.0 alpha1 (5.3.2 is OK).

--

Build Configuration:
BB_VERSION        = "1.25.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "LinuxMint-17.1"
TARGET_SYS        = "i586-rdk-linux"
MACHINE           = "vbox32"
DISTRO            = "rdk"
DISTRO_VERSION    = "2.0"
TUNE_FEATURES     = "m32 core2"
TARGET_FPU        = ""
meta-bsp-vbox     = "(detachedfrom253724d):253724dfeace58edbb40025fa8e4b5ace2c90164"
meta-rdk          = "(detachedfrom724d5c0):724d5c0030e3d2a53aad1929393ba2c00122ab91"
meta-qt5          = "(detachedfromec50df6):ec50df68b80f9704f135dd4c9f384a5596ec77cb"
meta-metrological = "(nobranch):abbd111fee3ae1ade2fc2997ccda0eb9782da761"
meta-multimedia  
meta-filesystems
meta-oe          
meta-python      
meta-networking  
meta-ruby         = "(detachedfrom7bbacd0):7bbacd0023fa1111da94ba0b2aafd7d872301ffe"
meta              = "(detachedfromb61a2ac):b61a2acc321489c3427f0afa3059486dc144a13b"


$ readelf -d tmp/sysroots/x86_64-linux/usr/bin/qt5/uic

Dynamic section at offset 0x80c60 contains 27 entries:
  Tag        Type                         Name/Value
 0x0000000000000003 (PLTGOT)             0x481fe8
 0x0000000000000002 (PLTRELSZ)           4368 (bytes)
 0x0000000000000017 (JMPREL)             0x4033a0
 0x0000000000000014 (PLTREL)             RELA
 0x0000000000000007 (RELA)               0x4031a8
 0x0000000000000008 (RELASZ)             504 (bytes)
 0x0000000000000009 (RELAENT)            24 (bytes)
 0x0000000000000015 (DEBUG)              0x0
 0x0000000000000006 (SYMTAB)             0x400298
 0x000000000000000b (SYMENT)             24 (bytes)
 0x0000000000000005 (STRTAB)             0x401570
 0x000000000000000a (STRSZ)              6625 (bytes)
 0x000000006ffffef5 (GNU_HASH)           0x402f58
 0x0000000000000001 (NEEDED)             Shared library: [libQt5Core.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000000c (INIT)               0x4044b0
 0x000000000000000d (FINI)               0x4571cc
 0x000000000000001a (FINI_ARRAY)         0x480ce8
 0x000000000000001c (FINI_ARRAYSZ)       8 (bytes)
 0x0000000000000019 (INIT_ARRAY)         0x480cf0
 0x000000000000001b (INIT_ARRAYSZ)       8 (bytes)
 0x000000000000001d (RUNPATH)            Library runpath: [/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/lib:/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/lib]
 0x000000006ffffff0 (VERSYM)             0x402f90
 0x000000006ffffffe (VERNEED)            0x403124
 0x000000006fffffff (VERNEEDNUM)         2
 0x0000000000000000 (NULL)               0x0



