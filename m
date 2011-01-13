Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PdQ29-000708-OB
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 17:28:21 +0100
Received: by bwz10 with SMTP id 10so1637045bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=VEMF3BT5fHeRKLCtn9B8oZCpVj/LPEYhOKpQC5xtwAo=;
	b=dGVhj4AN+BGbds5+Q6Oe6smb110MPRRqxUhm9Di6eVrQJWaOnSnqi5aYiI3L9AIxu7
	0HGIpmFrulDWXQs4WMR1RC29n7Mlj8agXdJxsLyUFCCOLdqtNhziZI0peStx6F1zgpkg
	b+zrGpswOFEek2eHS3NibwutwPzlF6OfIwQlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	b=rucWAgCKJ9rSGTLTFRb+8LK3p6NTfwznCv7ko73cqZbJpX9sHaqRPdB4ofQ7Hc3MWc
	U0TaTGWZbW4wasDWAb323M30uLxjmXFba5UBjTq9HDuia8AFAFC88BgVYQE5BrZILbY7
	E1mguI2t9sKz4SuzOW4YzcDVyC6lWXMjnsJvM=
MIME-Version: 1.0
Received: by 10.204.102.206 with SMTP id h14mr1962213bko.45.1294936066374;
	Thu, 13 Jan 2011 08:27:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Thu, 13 Jan 2011 08:27:46 -0800 (PST)
Date: Thu, 13 Jan 2011 14:27:46 -0200
X-Google-Sender-Auth: 1nMMDTHkzSmFBiZMdJFvNDuotG4
Message-ID: <AANLkTimEtrZnB45p49pwfX5h_tcDQnc7Lea1Y1Fd3Lg2@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: gcc-cross build fail
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
X-List-Received-Date: Thu, 13 Jan 2011 16:28:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

[ Added Khem in CC since he is the patch author ]

Hello,

Commit 051c2ca2a9b0dd30556a188e1d3c941b84fa5a80 breaks the build of
gcc-cross for i586-generic (I am using an amd64 host system) and
reverting it fixes the problem.

As follows:

...
libtool: compile:
/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r29.=
0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/./gcc/xgcc
-shared-libgcc -B/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/g=
cc-cross-4.5-r29.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-lin=
ux/./gcc
-nostdinc++ -L/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-=
cross-4.5-r29.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/=
i586-oe-linux/libstdc++-v3/src
-L/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r2=
9.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linu=
x/libstdc++-v3/src/.libs
-march=3Dpentium -isystem/home/otavio/hacking/ossystems/oe/tmp/sysroots/i58=
6-oe-linux/include
-B/home/otavio/hacking/ossystems/oe/tmp/sysroots/x86_64-linux/i586/i586-oe-=
linux/bin/
-B/home/otavio/hacking/ossystems/oe/tmp/sysroots/x86_64-linux/i586/i586-oe-=
linux/lib/
-isystem /home/otavio/hacking/ossystems/oe/tmp/sysroots/x86_64-linux/i586/i=
586-oe-linux/include
-isystem /home/otavio/hacking/ossystems/oe/tmp/sysroots/x86_64-linux/i586/i=
586-oe-linux/sys-include
--sysroot=3D/home/otavio/hacking/ossystems/oe/tmp/sysroots/i586-oe-linux
-I/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r2=
9.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linu=
x/libstdc++-v3/include/i586-oe-linux
-I/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r2=
9.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linu=
x/libstdc++-v3/include
-I/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r2=
9.0+svnr168622/gcc-4_5-branch/libstdc++-v3/libsupc++
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=3Donce -ffunction-sections -fdata-sections
-g -Os -c /home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cros=
s-4.5-r29.0+svnr168622/gcc-4_5-branch/libstdc++-v3/src/ios_init.cc
-o ios_init.o >/dev/null 2>&1
make[4]: *** [ios_init.lo] Error 1
make[4]: Leaving directory
`/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r29=
.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linux=
/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r29=
.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linux=
/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r29=
.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux/i586-oe-linux=
/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/home/otavio/hacking/ossystems/oe/tmp/work/i586-oe-linux/gcc-cross-4.5-r29=
.0+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-linux'
make: *** [all] Error 2
FATAL: oe_runmake failed


It looks like a linaro related regression and it looks like linaro
people are aware of this:
http://lists.linaro.org/pipermail/linaro-toolchain/2011-January/000685.html

Any idea which change of the patch might be responsable for it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


