Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <arkaitzj@gmail.com>) id 1HNpm5-0007lY-Jh
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 13:25:13 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1069433ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2007 04:25:13 -0800 (PST)
Received: by 10.67.19.20 with SMTP id w20mr7899419ugi.1173011113145;
	Sun, 04 Mar 2007 04:25:13 -0800 (PST)
Received: by 10.67.102.12 with HTTP; Sun, 4 Mar 2007 04:25:13 -0800 (PST)
Message-ID: <7ceeaed30703040425rb3316b1h4133a63e791f98@mail.gmail.com>
Date: Sun, 4 Mar 2007 13:25:13 +0100
From: Arkaitz <arkaitzj@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Cross-Compiling a simple program
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
X-List-Received-Date: Sun, 04 Mar 2007 12:25:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I've recently upgraded my NSLU with a serial port and now i am able to
debug the ucslugc at boot time.
I can see the kernel output and says:
Time: OSTS clocksource has been installed.^M
 x1205 0-006f: setting the system clock to 2007-03-02 15:44:05 (1172850245)^M
VFS: Mounted root (jffs2 filesystem).^M
Freeing init memory: 92K^M
Segmentation fault^M
MINIT: version 2.86 booting^M^M
Segmentation fault^M

mwester told me at openslug@IRC to replace the /linuxrc file with a
statically cross-compiled simple printf program to do some tests.
I wrote just a main with a printf and compiled like this:
saladino@korn:/mnt/almacen/Arkaitz/bin$
/mnt/almacen/Arkaitz/src/ucslugc/tmp/cross/armeb-linux-uclibc/bin/gcc
-static print.c -o print
/mnt/almacen/Arkaitz/src/ucslugc/tmp/cross/lib/gcc/armeb-linux-uclibc/3.4.4/../../../../armeb-linux-uclibc/bin/ld:
Warning: /tmp/ccMEWavd.o does not support interworking, whereas print
does
saladino@korn:/mnt/almacen/Arkaitz/bin$ file print
print: ELF 32-bit MSB executable, ARM, version 1 (ARM), statically
linked, not stripped

I put that as packages/slugos-init/files/boot/flash and i compiled the
image again. But i did not see any prints.
The warning about interworking confused me, am i doing something wrong?
Thanks for your time

-- 
Arkaitz


