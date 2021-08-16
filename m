Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web11.25003.1629124731060347106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 07:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.3] (unknown [112.65.48.221])
	by kozue.soulik.info (Postfix) with ESMTPSA id 60B9810202E
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Aug 2021 23:37:11 +0900 (JST)
To: openembedded-devel@lists.openembedded.org
From: "Randy Li" <ayaka@soulik.info>
Subject: [meta-android-ndk]: initial version that could build some simple utility
Message-ID: <886093c9-8b20-cf35-d1d8-73afeea11b8d@soulik.info>
Date: Mon, 16 Aug 2021 22:38:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello All:


I post this to the wrong list last time while I was fixing the compiling 
issue with the Android c++.


It now could compile some simple projects(likes libpng and its unit 
test), I could run it on an Android 11 board. But there are still many 
problems waiting for solving.


The building above would fail the OE package QA test. There is not a 
library linker file in Android, all the library files won't have a 
version suffix, I am still finding a method to let this checking being 
disable for the Android target.

You could try it here

https://github.com/hizukiayaka/meta-android-ndk 
<https://github.com/hizukiayaka/meta-android-ndk>


I am not sure I understand all the variables that were not recorded from 
the reference manuals. So I didn't package the Android NDK toolchain 
into an OE toolchain and I skip the canadian toolchain as I don't think 
an external toolchain would need it. I left many things hardcode in the 
tcmode file as I have no idea how to make the meta-clang not try to 
build me a new clang cross compiler. I am not familiar with LLVM as 
well, I don't much idea on which library comes from where and Google 
also lacks documents for it.


Let me list those things I am not sure whether I did it right here, 
please help me solve them.

 1. I have to export some variables globally, like HOST_SYS,
    TARGET_PREFIX, and TARGET_OS. I thought the meta-external-clang
    would help me overwrite them but it doesn't.
 2. Both HOST_PREFIX and TARGET_PREFIX objdump would be used in some
    classes but android only provides a version. Also, there is an
    llvm-objcopy(and llvm-objdump), I didn't found meta-clang would use it;
 3. Should I package the Android NDK toolchain into
    clang-cross-${TARGET_ARCH} ? I could certainly skip the candian part
    right?
 4. How to deal with those recipes depending on a kernel module?
    Although I could let the OE build a kernel image it just would not
    be used anywhere, could I just make a dummy target?


Later we could move to the final packing, we should not ship those 
public libraries from the Android NDK and get rid of all the daemon 
service files. But I could just copy what I need from the staging 
directory so far, we could think of this later.


I may start another layer called meta-android-vndk which would be used 
for packing the image for the andoird vendor partition. Because it is 
hard to deal with symbols exporting with application.


Yours

ayaka

