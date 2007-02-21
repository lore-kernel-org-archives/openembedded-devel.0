Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <arkaitzj@gmail.com>) id 1HJwd9-0005jq-KR
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Feb 2007 19:55:55 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1117130ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2007 10:55:55 -0800 (PST)
Received: by 10.66.216.20 with SMTP id o20mr10111284ugg.1172084155000;
	Wed, 21 Feb 2007 10:55:55 -0800 (PST)
Received: by 10.67.102.12 with HTTP; Wed, 21 Feb 2007 10:55:54 -0800 (PST)
Message-ID: <7ceeaed30702211055q3f2c8c2dt869fe8a5c2f6bb8a@mail.gmail.com>
Date: Wed, 21 Feb 2007 19:55:54 +0100
From: Arkaitz <arkaitzj@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Migrating ucslugc to gcc 4.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2007 18:55:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I was using gcc version 3.4.4 and compiling tar package the compiler
failed giving "mc_ucontext incomplete type" or something like
that(i've not here) so i decided to try switching to a newer gcc,
although with this version i manage to compile the full image and lots
of packages after some patches.
The gcc 4.1.1 failed with "internal compiler error: in
thumb_find_work_register, at config/arm/arm.c:3348" when compiling gcc
so i am trying with 4.1.0 now.
But when i was compiling with 4.1.0 the uclibc do_install failed with:
cd lib && tar -cf - *.so.* | tar -xf - -C
/mnt/almacen/Arkaitz/src/ucslugc/tmp/work/ixp4xxbe-linux-uclibc/uclibc-0.9.28+svn20070221-r4/image/lib
  CC utils/readelf
/mnt/almacen/Arkaitz/src/ucslugc/tmp/cross/lib/gcc/armeb-linux-uclibc/4.1.0/../../../../armeb-linux-uclibc/bin/ld:
unrecognised emulation mode: armelf_linux
Supported emulations: armelfb_linux armelfb
collect2: ld returned 1 exit status

Now i am stucked here and i don't know how to continue with this. I
hope that somebody can give me a hint.
Thanks for your time
-- 
Arkaitz


