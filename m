Received: from cortex1.nebelhauch.de ([213.133.111.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian@whisper-net.de>) id 1Tq5fM-0005I1-Jo
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2013 18:30:26 +0100
Received: by cortex1.nebelhauch.de (Postfix, from userid 65534)
	id AF3D014AA82; Tue,  1 Jan 2013 18:05:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	cortex1.nebelhauch.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from localhost (localhost [127.0.0.1])
	by cortex1.nebelhauch.de (Postfix) with ESMTP id BD42314AA87
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2013 18:05:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at nebelhauch.de
Received: from cortex1.nebelhauch.de ([127.0.0.1])
	by localhost (cortex1.nebelhauch.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id LQpQKhYjBLW3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2013 18:05:38 +0100 (CET)
Received: from [192.168.1.142] (dslb-178-006-192-165.pools.arcor-ip.net
	[178.6.192.165])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by cortex1.nebelhauch.de (Postfix) with ESMTPSA id 6AAEE14AA82
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2013 18:05:38 +0100 (CET)
Message-ID: <50E31761.5080708@whisper-net.de>
Date: Tue, 01 Jan 2013 18:05:37 +0100
From: Julian Pietron <julian@whisper-net.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.4.6
OpenPGP: id=766B590E
Subject: Problems building a working gfortran compiler
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
X-List-Received-Date: Tue, 01 Jan 2013 17:30:26 -0000
X-Groupsio-MsgNum: 42438
Content-Type: multipart/mixed; boundary="------------080407020101030007030101"

--------------080407020101030007030101
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hallo,

as my project needs liblapack I'm currently trying to build gcc with
fortran support. I did so by editing the gcc-4.7.inc file to use
FORTRAN = ",fortran" instead of ="". While building gcc-cross works
without problems, there seems to be something missing, as the consequent
build of liblapack terminates with this error message by CMake:

|   The Fortran compiler
|  
"/home/xoe/sysroots/x86_64-linux/usr/bin/i686generic-oe-linux/i586-oe-linux-gfortran"
|   is not able to compile a simple test program.
|
|   It fails with the following output:
|
|    Change Dir:
/home/xoe/work/i686generic-oe-linux/liblapack-3.4.0-r1.0/lapack-3.4.0/CMakeFiles/CMakeTmp
|
|
|
|   Run Build Command:/usr/bin/gmake "cmTryCompileExec/fast"
|
|   make -f CMakeFiles/cmTryCompileExec.dir/build.make
|   CMakeFiles/cmTryCompileExec.dir/build
|
|   make[1]: Entering directory
|  
`/home/xoe/work/i686generic-oe-linux/liblapack-3.4.0-r1.0/lapack-3.4.0/CMakeFiles/CMakeTmp'
|
|
|
|   /home/xoe/sysroots/x86_64-linux/usr/bin/cmake
|   -E cmake_progress_report
|  
/home/xoe/work/i686generic-oe-linux/liblapack-3.4.0-r1.0/lapack-3.4.0/CMakeFiles/CMakeTmp/CMakeFiles
|   1
|
|   Building Fortran object
|   CMakeFiles/cmTryCompileExec.dir/testFortranCompiler.f.o
|
|
|  
/home/xoe/sysroots/x86_64-linux/usr/bin/i686generic-oe-linux/i586-oe-linux-gfortran
|   -c
|  
/home/xoe/work/i686generic-oe-linux/liblapack-3.4.0-r1.0/lapack-3.4.0/CMakeFiles/CMakeTmp/testFortranCompiler.f
|   -o CMakeFiles/cmTryCompileExec.dir/testFortranCompiler.f.o
|
|   Linking Fortran executable cmTryCompileExec
|
|
|   /home/xoe/sysroots/x86_64-linux/usr/bin/cmake
|   -E cmake_link_script CMakeFiles/cmTryCompileExec.dir/link.txt
--verbose=1
|
|
|  
/home/xoe/sysroots/x86_64-linux/usr/bin/i686generic-oe-linux/i586-oe-linux-gfortran
|   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,--as-needed
|   CMakeFiles/cmTryCompileExec.dir/testFortranCompiler.f.o -o
cmTryCompileExec
|   -rdynamic
|
|   i586-oe-linux-gfortran: error: libgfortran.spec: No such file or
directory
|
|   make[1]: *** [cmTryCompileExec] Error 1
|
|   make[1]: Leaving directory
|  
`/home/xoe/work/i686generic-oe-linux/liblapack-3.4.0-r1.0/lapack-3.4.0/CMakeFiles/CMakeTmp'
|
|
|   gmake: *** [cmTryCompileExec/fast] Error 2


I have a setup in OE-classic that generates a working fortran compiler
(with gcc 4.5) by using the same modifications as I stated above and is
able to compile liblapack, but I want to port my project over to OE-core
now. I also tested with gcc 4.6 and got the same error from CMake upon
trying to compile liblapack.
Perhaps someone could point me to what I'm missing out here. I already
found, that gcc-runtime should generate a package libgfortran and
libgfortran-dev which might help here, but somehow the bitbaking of
gcc-runtime doesn't lead to the generation of a libgfortran.so or .a at all.

Thanks for your help,
Julian

--------------080407020101030007030101
Content-Type: application/pgp-keys;
 name="0x766B590E.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0x766B590E.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.19 (GNU/Linux)

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
=t5pm
-----END PGP PUBLIC KEY BLOCK-----

--------------080407020101030007030101--
