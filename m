Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SjX1D-0000Pu-8N
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jun 2012 16:45:29 +0200
Received: from [192.168.0.49] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 00E3360002
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 15:20:36 +0100 (BST)
Message-ID: <4FE9C8B9.5090808@communistcode.co.uk>
Date: Tue, 26 Jun 2012 15:35:37 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: net-snmp build failure
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
X-List-Received-Date: Tue, 26 Jun 2012 14:45:31 -0000
X-Groupsio-MsgNum: 39392
Content-Type: multipart/mixed; boundary="------------080906060602050406090300"

--------------080906060602050406090300
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Has anyone successfully built net-snmp-server for the Beaglebone under 
the Poky distribution (or more generally using GCC 4.7.x for arm)? I had 
a go today but it failed (see file attached) and it looks to me like a 
bug in GCC or a bug in net-snmp that GCC 4.7 has shown up...

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------080906060602050406090300
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.18915"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.18915"

DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux',=
 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
DEBUG: Executing shell function do_compile
NOTE: make INSTALL_PREFIX=3D/home/jack/Projects/poky-denzil.git/r0005-new/t=
mp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/image
WARNING: not running autoheader
arm-poky-linux-gnueabi-gcc -E --sysroot=3D/home/jack/Projects/poky-denzil.g=
it/r0005-new/tmp/sysroots/beaglebone  -march=3Darmv7-a -fno-tree-vectorize =
    -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 =
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Iinclude -I./include -I./ag=
ent/mibgroup -I. -I. -DDONT_INC_STRUCTS -DBINDIR=3D/usr/bin  ./sedscript.in=
 | egrep '^s[/#]' | sed 's/REMOVEME//g;s# */#/#g;s/ *#/#/g;s#/ *#/#g;s/# g/=
#g/;' > sedscript
arm-poky-linux-gnueabi-gcc: warning: ./sedscript.in: linker input file unus=
ed because linking not done
echo 's/VERSIONINFO/5.7.1/g' >> sedscript
echo 's#DATADIR#/usr/share#g' >> sedscript
echo 's#LIBDIR#/usr/lib#g' >> sedscript
echo 's#BINDIR#/usr/bin#g' >> sedscript
echo 's#PERSISTENT_DIRECTORY#/var/net-snmp#g' >> sedscript
echo 's#SYSCONFDIR#/etc#g' >> sedscript
/bin/sed -f sedscript ./EXAMPLE.conf.def > EXAMPLE.conf
making all in /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a=
-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/snmplib
make[1]: Entering directory `/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.=
7.1/snmplib'
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_client.lo snmp_client.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_client.c  -fPIC -=
DPIC -o .libs/snmp_client.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_client.c -o snmp_=
client.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o m=
ib.lo mib.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c mib.c  -fPIC -DPIC -o =
.libs/mib.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c mib.c -o mib.o >/dev/n=
ull 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o p=
arse.lo parse.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c parse.c  -fPIC -DPIC -=
o .libs/parse.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c parse.c -o parse.o >/d=
ev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_api.lo snmp_api.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_api.c  -fPIC -DPI=
C -o .libs/snmp_api.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_api.c -o snmp_api=
.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp.lo snmp.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp.c  -fPIC -DPIC -o=
 .libs/snmp.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp.c -o snmp.o >/dev=
/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_auth.lo snmp_auth.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_auth.c  -fPIC -DP=
IC -o .libs/snmp_auth.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_auth.c -o snmp_au=
th.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o a=
sn1.lo asn1.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c asn1.c  -fPIC -DPIC -o=
 .libs/asn1.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c asn1.c -o asn1.o >/dev=
/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o m=
d5.lo md5.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c md5.c  -fPIC -DPIC -o =
.libs/md5.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c md5.c -o md5.o >/dev/n=
ull 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_parse_args.lo snmp_parse_args.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_parse_args.c  -fP=
IC -DPIC -o .libs/snmp_parse_args.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_parse_args.c -o s=
nmp_parse_args.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
ystem.lo system.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c system.c  -fPIC -DPIC =
-o .libs/system.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c system.c -o system.o >=
/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o v=
acm.lo vacm.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c vacm.c  -fPIC -DPIC -o=
 .libs/vacm.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c vacm.c -o vacm.o >/dev=
/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o i=
nt64.lo int64.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c int64.c  -fPIC -DPIC -=
o .libs/int64.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c int64.c -o int64.o >/d=
ev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o r=
ead_config.lo read_config.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c read_config.c  -fPIC -=
DPIC -o .libs/read_config.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c read_config.c -o read_=
config.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o p=
kcs.lo pkcs.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c pkcs.c  -fPIC -DPIC -o=
 .libs/pkcs.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c pkcs.c -o pkcs.o >/dev=
/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_debug.lo snmp_debug.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_debug.c  -fPIC -D=
PIC -o .libs/snmp_debug.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_debug.c -o snmp_d=
ebug.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ools.lo tools.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c tools.c  -fPIC -DPIC -=
o .libs/tools.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c tools.c -o tools.o >/d=
ev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_logging.lo snmp_logging.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_logging.c  -fPIC =
-DPIC -o .libs/snmp_logging.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_logging.c -o snmp=
_logging.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ext_utils.lo text_utils.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c text_utils.c  -fPIC -D=
PIC -o .libs/text_utils.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c text_utils.c -o text_u=
tils.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o l=
arge_fd_set.lo large_fd_set.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c large_fd_set.c  -fPIC =
-DPIC -o .libs/large_fd_set.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c large_fd_set.c -o larg=
e_fd_set.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
ert_util.lo cert_util.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c cert_util.c  -fPIC -DP=
IC -o .libs/cert_util.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c cert_util.c -o cert_ut=
il.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_openssl.lo snmp_openssl.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_openssl.c  -fPIC =
-DPIC -o .libs/snmp_openssl.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_openssl.c -o snmp=
_openssl.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmpv3.lo snmpv3.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmpv3.c  -fPIC -DPIC =
-o .libs/snmpv3.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmpv3.c -o snmpv3.o >=
/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o l=
cd_time.lo lcd_time.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c lcd_time.c  -fPIC -DPI=
C -o .libs/lcd_time.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c lcd_time.c -o lcd_time=
.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o k=
eytools.lo keytools.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c keytools.c  -fPIC -DPI=
C -o .libs/keytools.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c keytools.c -o keytools=
.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
capi.lo scapi.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c scapi.c  -fPIC -DPIC -=
o .libs/scapi.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c scapi.c -o scapi.o >/d=
ev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
allback.lo callback.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c callback.c  -fPIC -DPI=
C -o .libs/callback.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c callback.c -o callback=
.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o d=
efault_store.lo default_store.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c default_store.c  -fPIC=
 -DPIC -o .libs/default_store.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c default_store.c -o def=
ault_store.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_alarm.lo snmp_alarm.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_alarm.c  -fPIC -D=
PIC -o .libs/snmp_alarm.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_alarm.c -o snmp_a=
larm.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o d=
ata_list.lo data_list.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c data_list.c  -fPIC -DP=
IC -o .libs/data_list.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c data_list.c -o data_li=
st.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o o=
id_stash.lo oid_stash.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c oid_stash.c  -fPIC -DP=
IC -o .libs/oid_stash.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c oid_stash.c -o oid_sta=
sh.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o f=
d_event_manager.lo fd_event_manager.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c fd_event_manager.c  -f=
PIC -DPIC -o .libs/fd_event_manager.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c fd_event_manager.c -o =
fd_event_manager.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
heck_varbind.lo check_varbind.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c check_varbind.c  -fPIC=
 -DPIC -o .libs/check_varbind.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c check_varbind.c -o che=
ck_varbind.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o m=
t_support.lo mt_support.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c mt_support.c  -fPIC -D=
PIC -o .libs/mt_support.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c mt_support.c -o mt_sup=
port.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_enum.lo snmp_enum.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_enum.c  -fPIC -DP=
IC -o .libs/snmp_enum.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_enum.c -o snmp_en=
um.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp-tc.lo snmp-tc.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp-tc.c  -fPIC -DPIC=
 -o .libs/snmp-tc.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp-tc.c -o snmp-tc.o=
 >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_service.lo snmp_service.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_service.c  -fPIC =
-DPIC -o .libs/snmp_service.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_service.c -o snmp=
_service.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nprintf.lo snprintf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snprintf.c  -fPIC -DPI=
C -o .libs/snprintf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snprintf.c -o snprintf=
.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_transport.lo snmp_transport.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_transport.c  -fPI=
C -DPIC -o .libs/snmp_transport.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_transport.c -o sn=
mp_transport.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpUDPBaseDomain.lo transports/snmpUDPBaseDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUDPBase=
Domain.c  -fPIC -DPIC -o transports/.libs/snmpUDPBaseDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUDPBase=
Domain.c -o transports/snmpUDPBaseDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpUDPIPv4BaseDomain.lo transports/snmpUDPIPv4BaseDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUDPIPv4=
BaseDomain.c  -fPIC -DPIC -o transports/.libs/snmpUDPIPv4BaseDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUDPIPv4=
BaseDomain.c -o transports/snmpUDPIPv4BaseDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpTCPBaseDomain.lo transports/snmpTCPBaseDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpTCPBase=
Domain.c  -fPIC -DPIC -o transports/.libs/snmpTCPBaseDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpTCPBase=
Domain.c -o transports/snmpTCPBaseDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpSocketBaseDomain.lo transports/snmpSocketBaseDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpSocketB=
aseDomain.c  -fPIC -DPIC -o transports/.libs/snmpSocketBaseDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpSocketB=
aseDomain.c -o transports/snmpSocketBaseDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpIPv4BaseDomain.lo transports/snmpIPv4BaseDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpIPv4Bas=
eDomain.c  -fPIC -DPIC -o transports/.libs/snmpIPv4BaseDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpIPv4Bas=
eDomain.c -o transports/snmpIPv4BaseDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpUDPDomain.lo transports/snmpUDPDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUDPDoma=
in.c  -fPIC -DPIC -o transports/.libs/snmpUDPDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUDPDoma=
in.c -o transports/snmpUDPDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpTCPDomain.lo transports/snmpTCPDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpTCPDoma=
in.c  -fPIC -DPIC -o transports/.libs/snmpTCPDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpTCPDoma=
in.c -o transports/snmpTCPDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpAliasDomain.lo transports/snmpAliasDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpAliasDo=
main.c  -fPIC -DPIC -o transports/.libs/snmpAliasDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpAliasDo=
main.c -o transports/snmpAliasDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpUnixDomain.lo transports/snmpUnixDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUnixDom=
ain.c  -fPIC -DPIC -o transports/.libs/snmpUnixDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpUnixDom=
ain.c -o transports/snmpUnixDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o t=
ransports/snmpCallbackDomain.lo transports/snmpCallbackDomain.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpCallbac=
kDomain.c  -fPIC -DPIC -o transports/.libs/snmpCallbackDomain.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c transports/snmpCallbac=
kDomain.c -o transports/snmpCallbackDomain.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_secmod.lo snmp_secmod.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_secmod.c  -fPIC -=
DPIC -o .libs/snmp_secmod.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_secmod.c -o snmp_=
secmod.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmpusm.lo snmpusm.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmpusm.c  -fPIC -DPIC=
 -o .libs/snmpusm.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmpusm.c -o snmpusm.o=
 >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
nmp_version.lo snmp_version.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_version.c  -fPIC =
-DPIC -o .libs/snmp_version.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c snmp_version.c -o snmp=
_version.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
ontainer.lo container.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container.c  -fPIC -DP=
IC -o .libs/container.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container.c -o contain=
er.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
ontainer_binary_array.lo container_binary_array.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_binary_array=
.c  -fPIC -DPIC -o .libs/container_binary_array.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_binary_array=
.c -o container_binary_array.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o u=
cd_compat.lo ucd_compat.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c ucd_compat.c  -fPIC -D=
PIC -o .libs/ucd_compat.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c ucd_compat.c -o ucd_co=
mpat.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
trlcat.lo strlcat.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c strlcat.c  -fPIC -DPIC=
 -o .libs/strlcat.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c strlcat.c -o strlcat.o=
 >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o s=
trlcpy.lo strlcpy.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c strlcpy.c  -fPIC -DPIC=
 -o .libs/strlcpy.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c strlcpy.c -o strlcpy.o=
 >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o d=
ir_utils.lo dir_utils.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c dir_utils.c  -fPIC -DP=
IC -o .libs/dir_utils.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c dir_utils.c -o dir_uti=
ls.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o f=
ile_utils.lo file_utils.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c file_utils.c  -fPIC -D=
PIC -o .libs/file_utils.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c file_utils.c -o file_u=
tils.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
ontainer_null.lo container_null.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_null.c  -fPI=
C -DPIC -o .libs/container_null.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_null.c -o co=
ntainer_null.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
ontainer_list_ssll.lo container_list_ssll.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_list_ssll.c =
 -fPIC -DPIC -o .libs/container_list_ssll.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_list_ssll.c =
-o container_list_ssll.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. 	-I../snmplib  -fno-strict-aliasing -=
O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3Dlinux  -c -o c=
ontainer_iterator.lo container_iterator.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_iterator.c  =
-fPIC -DPIC -o .libs/container_iterator.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../snmplib -fno-strict-aliasing -O2 -pipe -g -feli=
minate-unused-debug-types -Ulinux -Dlinux=3Dlinux -c container_iterator.c -=
o container_iterator.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dlink arm-poky-linux-gnueabi-gcc=
  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3D=
softfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sy=
sroots/beaglebone -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debu=
g-types -Ulinux -Dlinux=3Dlinux  -rpath /usr/lib -version-info 30:1:0 -o li=
bnetsnmp.la snmp_client.lo mib.lo parse.lo snmp_api.lo snmp.lo snmp_auth.lo=
 asn1.lo md5.lo snmp_parse_args.lo system.lo vacm.lo int64.lo read_config.l=
o pkcs.lo snmp_debug.lo tools.lo  snmp_logging.lo	 text_utils.lo large_fd_s=
et.lo cert_util.lo snmp_openssl.lo snmpv3.lo lcd_time.lo keytools.lo scapi.=
lo callback.lo default_store.lo snmp_alarm.lo data_list.lo oid_stash.lo fd_=
event_manager.lo check_varbind.lo mt_support.lo snmp_enum.lo snmp-tc.lo snm=
p_service.lo snprintf.lo snmp_transport.lo  transports/snmpUDPBaseDomain.lo=
 transports/snmpUDPIPv4BaseDomain.lo transports/snmpTCPBaseDomain.lo transp=
orts/snmpSocketBaseDomain.lo transports/snmpIPv4BaseDomain.lo transports/sn=
mpUDPDomain.lo transports/snmpTCPDomain.lo transports/snmpAliasDomain.lo tr=
ansports/snmpUnixDomain.lo transports/snmpCallbackDomain.lo snmp_secmod.lo =
 snmpusm.lo snmp_version.lo container.lo container_binary_array.lo ucd_comp=
at.lo strlcat.lo strlcpy.lo dir_utils.lo file_utils.lo container_null.lo co=
ntainer_list_ssll.lo container_iterator.lo   -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed   -lcrypto
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc  -march=3D=
armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfp=
u=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
--sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beag=
lebone -shared  -fPIC -DPIC  .libs/snmp_client.o .libs/mib.o .libs/parse.o =
.libs/snmp_api.o .libs/snmp.o .libs/snmp_auth.o .libs/asn1.o .libs/md5.o .l=
ibs/snmp_parse_args.o .libs/system.o .libs/vacm.o .libs/int64.o .libs/read_=
config.o .libs/pkcs.o .libs/snmp_debug.o .libs/tools.o .libs/snmp_logging.o=
 .libs/text_utils.o .libs/large_fd_set.o .libs/cert_util.o .libs/snmp_opens=
sl.o .libs/snmpv3.o .libs/lcd_time.o .libs/keytools.o .libs/scapi.o .libs/c=
allback.o .libs/default_store.o .libs/snmp_alarm.o .libs/data_list.o .libs/=
oid_stash.o .libs/fd_event_manager.o .libs/check_varbind.o .libs/mt_support=
.o .libs/snmp_enum.o .libs/snmp-tc.o .libs/snmp_service.o .libs/snprintf.o =
.libs/snmp_transport.o transports/.libs/snmpUDPBaseDomain.o transports/.lib=
s/snmpUDPIPv4BaseDomain.o transports/.libs/snmpTCPBaseDomain.o transports/.=
libs/snmpSocketBaseDomain.o transports/.libs/snmpIPv4BaseDomain.o transport=
s/.libs/snmpUDPDomain.o transports/.libs/snmpTCPDomain.o transports/.libs/s=
nmpAliasDomain.o transports/.libs/snmpUnixDomain.o transports/.libs/snmpCal=
lbackDomain.o .libs/snmp_secmod.o .libs/snmpusm.o .libs/snmp_version.o .lib=
s/container.o .libs/container_binary_array.o .libs/ucd_compat.o .libs/strlc=
at.o .libs/strlcpy.o .libs/dir_utils.o .libs/file_utils.o .libs/container_n=
ull.o .libs/container_list_ssll.o .libs/container_iterator.o   -lcrypto  -m=
arch=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=
=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sysroot=3D/ho=
me/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beaglebone -O2 -Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libnetsnmp.so.=
30 -o .libs/libnetsnmp.so.30.0.1
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmp.so.3=
0" && ln -s "libnetsnmp.so.30.0.1" "libnetsnmp.so.30")
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmp.so" =
&& ln -s "libnetsnmp.so.30.0.1" "libnetsnmp.so")
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ar cru .libs/l=
ibnetsnmp.a  snmp_client.o mib.o parse.o snmp_api.o snmp.o snmp_auth.o asn1=
.o md5.o snmp_parse_args.o system.o vacm.o int64.o read_config.o pkcs.o snm=
p_debug.o tools.o snmp_logging.o text_utils.o large_fd_set.o cert_util.o sn=
mp_openssl.o snmpv3.o lcd_time.o keytools.o scapi.o callback.o default_stor=
e.o snmp_alarm.o data_list.o oid_stash.o fd_event_manager.o check_varbind.o=
 mt_support.o snmp_enum.o snmp-tc.o snmp_service.o snprintf.o snmp_transpor=
t.o transports/snmpUDPBaseDomain.o transports/snmpUDPIPv4BaseDomain.o trans=
ports/snmpTCPBaseDomain.o transports/snmpSocketBaseDomain.o transports/snmp=
IPv4BaseDomain.o transports/snmpUDPDomain.o transports/snmpTCPDomain.o tran=
sports/snmpAliasDomain.o transports/snmpUnixDomain.o transports/snmpCallbac=
kDomain.o snmp_secmod.o snmpusm.o snmp_version.o container.o container_bina=
ry_array.o ucd_compat.o strlcat.o strlcpy.o dir_utils.o file_utils.o contai=
ner_null.o container_list_ssll.o container_iterator.o
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ranlib .libs/l=
ibnetsnmp.a
arm-poky-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libnetsnmp.la"=
 && ln -s "../libnetsnmp.la" "libnetsnmp.la" )
: libnetsnmp.la
make[1]: Leaving directory `/home/jack/Projects/poky-denzil.git/r0005-new/t=
mp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7=
.1/snmplib'
making all in /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a=
-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/agent
make[1]: Entering directory `/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.=
7.1/agent'
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/all_helpers.lo helpers/all_helpers.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/all_helpers.c  -fPIC -DPIC -o helpers/.libs/all_helpers.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/all_helpers.c -o helpers/all_helpers.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/baby_steps.lo helpers/baby_steps.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/baby_steps.c  -fPIC -DPIC -o helpers/.libs/baby_steps.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/baby_steps.c -o helpers/baby_steps.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/bulk_to_next.lo helpers/bulk_to_next.=
c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/bulk_to_next.c  -fPIC -DPIC -o helpers/.libs/bulk_to_next.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/bulk_to_next.c -o helpers/bulk_to_next.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/cache_handler.lo helpers/cache_handle=
r.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/cache_handler.c  -fPIC -DPIC -o helpers/.libs/cache_handle=
r.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/cache_handler.c -o helpers/cache_handler.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/debug_handler.lo helpers/debug_handle=
r.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/debug_handler.c  -fPIC -DPIC -o helpers/.libs/debug_handle=
r.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/debug_handler.c -o helpers/debug_handler.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/instance.lo helpers/instance.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/instance.c  -fPIC -DPIC -o helpers/.libs/instance.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/instance.c -o helpers/instance.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/mode_end_call.lo helpers/mode_end_cal=
l.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/mode_end_call.c  -fPIC -DPIC -o helpers/.libs/mode_end_cal=
l.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/mode_end_call.c -o helpers/mode_end_call.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/multiplexer.lo helpers/multiplexer.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/multiplexer.c  -fPIC -DPIC -o helpers/.libs/multiplexer.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/multiplexer.c -o helpers/multiplexer.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/null.lo helpers/null.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/null.c  -fPIC -DPIC -o helpers/.libs/null.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/null.c -o helpers/null.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/old_api.lo helpers/old_api.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/old_api.c  -fPIC -DPIC -o helpers/.libs/old_api.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/old_api.c -o helpers/old_api.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/read_only.lo helpers/read_only.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/read_only.c  -fPIC -DPIC -o helpers/.libs/read_only.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/read_only.c -o helpers/read_only.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/row_merge.lo helpers/row_merge.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/row_merge.c  -fPIC -DPIC -o helpers/.libs/row_merge.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/row_merge.c -o helpers/row_merge.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/scalar.lo helpers/scalar.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/scalar.c  -fPIC -DPIC -o helpers/.libs/scalar.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/scalar.c -o helpers/scalar.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/scalar_group.lo helpers/scalar_group.=
c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/scalar_group.c  -fPIC -DPIC -o helpers/.libs/scalar_group.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/scalar_group.c -o helpers/scalar_group.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/serialize.lo helpers/serialize.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/serialize.c  -fPIC -DPIC -o helpers/.libs/serialize.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/serialize.c -o helpers/serialize.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/snmp_get_statistic.lo helpers/snmp_ge=
t_statistic.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/snmp_get_statistic.c  -fPIC -DPIC -o helpers/.libs/snmp_ge=
t_statistic.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/snmp_get_statistic.c -o helpers/snmp_get_statistic.o >/dev=
/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/stash_cache.lo helpers/stash_cache.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/stash_cache.c  -fPIC -DPIC -o helpers/.libs/stash_cache.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/stash_cache.c -o helpers/stash_cache.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/stash_to_next.lo helpers/stash_to_nex=
t.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/stash_to_next.c  -fPIC -DPIC -o helpers/.libs/stash_to_nex=
t.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/stash_to_next.c -o helpers/stash_to_next.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table.lo helpers/table.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table.c  -fPIC -DPIC -o helpers/.libs/table.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table.c -o helpers/table.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_array.lo helpers/table_array.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_array.c  -fPIC -DPIC -o helpers/.libs/table_array.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_array.c -o helpers/table_array.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_container.lo helpers/table_cont=
ainer.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_container.c  -fPIC -DPIC -o helpers/.libs/table_cont=
ainer.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_container.c -o helpers/table_container.o >/dev/null =
2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_data.lo helpers/table_data.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_data.c  -fPIC -DPIC -o helpers/.libs/table_data.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_data.c -o helpers/table_data.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_dataset.lo helpers/table_datase=
t.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_dataset.c  -fPIC -DPIC -o helpers/.libs/table_datase=
t.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_dataset.c -o helpers/table_dataset.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_iterator.lo helpers/table_itera=
tor.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_iterator.c  -fPIC -DPIC -o helpers/.libs/table_itera=
tor.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_iterator.c -o helpers/table_iterator.o >/dev/null 2>=
&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_row.lo helpers/table_row.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_row.c  -fPIC -DPIC -o helpers/.libs/table_row.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_row.c -o helpers/table_row.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/table_tdata.lo helpers/table_tdata.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_tdata.c  -fPIC -DPIC -o helpers/.libs/table_tdata.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/table_tdata.c -o helpers/table_tdata.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o helpers/watcher.lo helpers/watcher.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/watcher.c  -fPIC -DPIC -o helpers/.libs/watcher.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c helpers/watcher.c -o helpers/watcher.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o agent_handler.lo agent_handler.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_handler.c  -fPIC -DPIC -o .libs/agent_handler.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_handler.c -o agent_handler.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o agent_index.lo agent_index.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_index.c  -fPIC -DPIC -o .libs/agent_index.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_index.c -o agent_index.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o agent_read_config.lo agent_read_config.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_read_config.c  -fPIC -DPIC -o .libs/agent_read_config.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_read_config.c -o agent_read_config.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o agent_registry.lo agent_registry.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_registry.c  -fPIC -DPIC -o .libs/agent_registry.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_registry.c -o agent_registry.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o agent_sysORTable.lo agent_sysORTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_sysORTable.c  -fPIC -DPIC -o .libs/agent_sysORTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_sysORTable.c -o agent_sysORTable.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o agent_trap.lo agent_trap.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_trap.c  -fPIC -DPIC -o .libs/agent_trap.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c agent_trap.c -o agent_trap.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o kernel.lo kernel.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c kernel.c  -fPIC -DPIC -o .libs/kernel.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c kernel.c -o kernel.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o snmp_agent.lo snmp_agent.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c snmp_agent.c  -fPIC -DPIC -o .libs/snmp_agent.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c snmp_agent.c -o snmp_agent.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o snmp_vars.lo snmp_vars.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c snmp_vars.c  -fPIC -DPIC -o .libs/snmp_vars.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c snmp_vars.c -o snmp_vars.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/snmpv3/usmConf.lo mibgroup/snmpv3/us=
mConf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/snmpv3/usmConf.c  -fPIC -DPIC -o mibgroup/snmpv3/.libs/us=
mConf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/snmpv3/usmConf.c -o mibgroup/snmpv3/usmConf.o >/dev/null =
2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/agentx/master.lo mibgroup/agentx/mas=
ter.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/master.c  -fPIC -DPIC -o mibgroup/agentx/.libs/mas=
ter.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/master.c -o mibgroup/agentx/master.o >/dev/null 2>=
&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/agentx/subagent.lo mibgroup/agentx/s=
ubagent.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/subagent.c  -fPIC -DPIC -o mibgroup/agentx/.libs/s=
ubagent.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/subagent.c -o mibgroup/agentx/subagent.o >/dev/nul=
l 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/utilities/execute.lo mibgroup/utilit=
ies/execute.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/utilities/execute.c  -fPIC -DPIC -o mibgroup/utilities/.l=
ibs/execute.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/utilities/execute.c -o mibgroup/utilities/execute.o >/dev=
/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/utilities/iquery.lo mibgroup/utiliti=
es/iquery.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/utilities/iquery.c  -fPIC -DPIC -o mibgroup/utilities/.li=
bs/iquery.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/utilities/iquery.c -o mibgroup/utilities/iquery.o >/dev/n=
ull 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/mibII/vacm_conf.lo mibgroup/mibII/va=
cm_conf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/mibII/vacm_conf.c  -fPIC -DPIC -o mibgroup/mibII/.libs/va=
cm_conf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/mibII/vacm_conf.c -o mibgroup/mibII/vacm_conf.o >/dev/nul=
l 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/agentx/protocol.lo mibgroup/agentx/p=
rotocol.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/protocol.c  -fPIC -DPIC -o mibgroup/agentx/.libs/p=
rotocol.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/protocol.c -o mibgroup/agentx/protocol.o >/dev/nul=
l 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/agentx/client.lo mibgroup/agentx/cli=
ent.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/client.c  -fPIC -DPIC -o mibgroup/agentx/.libs/cli=
ent.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/client.c -o mibgroup/agentx/client.o >/dev/null 2>=
&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/agentx/master_admin.lo mibgroup/agen=
tx/master_admin.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/master_admin.c  -fPIC -DPIC -o mibgroup/agentx/.li=
bs/master_admin.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/master_admin.c -o mibgroup/agentx/master_admin.o >=
/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mibgroup/agentx/agentx_config.lo mibgroup/age=
ntx/agentx_config.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/agentx_config.c  -fPIC -DPIC -o mibgroup/agentx/.l=
ibs/agentx_config.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mibgroup/agentx/agentx_config.c -o mibgroup/agentx/agentx_config.o=
 >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dlink arm-poky-linux-gnueabi-gcc=
  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3D=
softfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sy=
sroots/beaglebone -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debu=
g-types -Ulinux -Dlinux=3Dlinux  -rpath /usr/lib -version-info 30:1:0 -o li=
bnetsnmpagent.la helpers/all_helpers.lo helpers/baby_steps.lo helpers/bulk_=
to_next.lo helpers/cache_handler.lo helpers/debug_handler.lo helpers/instan=
ce.lo helpers/mode_end_call.lo helpers/multiplexer.lo helpers/null.lo helpe=
rs/old_api.lo helpers/read_only.lo helpers/row_merge.lo helpers/scalar.lo h=
elpers/scalar_group.lo helpers/serialize.lo helpers/snmp_get_statistic.lo h=
elpers/stash_cache.lo helpers/stash_to_next.lo helpers/table.lo helpers/tab=
le_array.lo helpers/table_container.lo helpers/table_data.lo helpers/table_=
dataset.lo helpers/table_iterator.lo helpers/table_row.lo helpers/table_tda=
ta.lo helpers/watcher.lo agent_handler.lo agent_index.lo agent_read_config.=
lo agent_registry.lo agent_sysORTable.lo agent_trap.lo kernel.lo snmp_agent=
.lo snmp_vars.lo mibgroup/snmpv3/usmConf.lo mibgroup/agentx/master.lo mibgr=
oup/agentx/subagent.lo mibgroup/utilities/execute.lo mibgroup/utilities/iqu=
ery.lo mibgroup/mibII/vacm_conf.lo mibgroup/agentx/protocol.lo mibgroup/age=
ntx/client.lo mibgroup/agentx/master_admin.lo mibgroup/agentx/agentx_config=
.lo  ../snmplib/libnetsnmp.la   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-nee=
ded    -lm
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc  -march=3D=
armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfp=
u=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
--sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beag=
lebone -shared  -fPIC -DPIC  helpers/.libs/all_helpers.o helpers/.libs/baby=
_steps.o helpers/.libs/bulk_to_next.o helpers/.libs/cache_handler.o helpers=
/.libs/debug_handler.o helpers/.libs/instance.o helpers/.libs/mode_end_call=
.o helpers/.libs/multiplexer.o helpers/.libs/null.o helpers/.libs/old_api.o=
 helpers/.libs/read_only.o helpers/.libs/row_merge.o helpers/.libs/scalar.o=
 helpers/.libs/scalar_group.o helpers/.libs/serialize.o helpers/.libs/snmp_=
get_statistic.o helpers/.libs/stash_cache.o helpers/.libs/stash_to_next.o h=
elpers/.libs/table.o helpers/.libs/table_array.o helpers/.libs/table_contai=
ner.o helpers/.libs/table_data.o helpers/.libs/table_dataset.o helpers/.lib=
s/table_iterator.o helpers/.libs/table_row.o helpers/.libs/table_tdata.o he=
lpers/.libs/watcher.o .libs/agent_handler.o .libs/agent_index.o .libs/agent=
_read_config.o .libs/agent_registry.o .libs/agent_sysORTable.o .libs/agent_=
trap.o .libs/kernel.o .libs/snmp_agent.o .libs/snmp_vars.o mibgroup/snmpv3/=
.libs/usmConf.o mibgroup/agentx/.libs/master.o mibgroup/agentx/.libs/subage=
nt.o mibgroup/utilities/.libs/execute.o mibgroup/utilities/.libs/iquery.o m=
ibgroup/mibII/.libs/vacm_conf.o mibgroup/agentx/.libs/protocol.o mibgroup/a=
gentx/.libs/client.o mibgroup/agentx/.libs/master_admin.o mibgroup/agentx/.=
libs/agentx_config.o   ../snmplib/.libs/libnetsnmp.so -lcrypto -lm  -march=
=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcor=
tex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sysroot=3D/home/jac=
k/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beaglebone -O2 -Wl,-O1 -W=
l,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libnetsnmpagent.so.3=
0 -o .libs/libnetsnmpagent.so.30.0.1
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmpagent=
.so.30" && ln -s "libnetsnmpagent.so.30.0.1" "libnetsnmpagent.so.30")
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmpagent=
.so" && ln -s "libnetsnmpagent.so.30.0.1" "libnetsnmpagent.so")
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ar cru .libs/l=
ibnetsnmpagent.a  helpers/all_helpers.o helpers/baby_steps.o helpers/bulk_t=
o_next.o helpers/cache_handler.o helpers/debug_handler.o helpers/instance.o=
 helpers/mode_end_call.o helpers/multiplexer.o helpers/null.o helpers/old_a=
pi.o helpers/read_only.o helpers/row_merge.o helpers/scalar.o helpers/scala=
r_group.o helpers/serialize.o helpers/snmp_get_statistic.o helpers/stash_ca=
che.o helpers/stash_to_next.o helpers/table.o helpers/table_array.o helpers=
/table_container.o helpers/table_data.o helpers/table_dataset.o helpers/tab=
le_iterator.o helpers/table_row.o helpers/table_tdata.o helpers/watcher.o a=
gent_handler.o agent_index.o agent_read_config.o agent_registry.o agent_sys=
ORTable.o agent_trap.o kernel.o snmp_agent.o snmp_vars.o mibgroup/snmpv3/us=
mConf.o mibgroup/agentx/master.o mibgroup/agentx/subagent.o mibgroup/utilit=
ies/execute.o mibgroup/utilities/iquery.o mibgroup/mibII/vacm_conf.o mibgro=
up/agentx/protocol.o mibgroup/agentx/client.o mibgroup/agentx/master_admin.=
o mibgroup/agentx/agentx_config.o
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ranlib .libs/l=
ibnetsnmpagent.a
arm-poky-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libnetsnmpagen=
t.la" && ln -s "../libnetsnmpagent.la" "libnetsnmpagent.la" )
: libnetsnmpagent.la
making all in /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a=
-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/agent/helpe=
rs
make[2]: Entering directory `/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.=
7.1/agent/helpers'
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib  -fno-strict-aliasing -O2 -pipe -g -feliminate-unused=
-debug-types -Ulinux -Dlinux=3Dlinux  -c -o dummy.lo dummy.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c dummy.c  -fPIC -DPIC -o .libs/dummy.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c dummy.c -o dummy.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dlink arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-d=
ebug-types -Ulinux -Dlinux=3Dlinux  -rpath /usr/lib -version-info 30:1:0 -o=
 libnetsnmphelpers.la dummy.lo  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-nee=
ded =20
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc  -march=3D=
armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfp=
u=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
--sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beag=
lebone -shared  -fPIC -DPIC  .libs/dummy.o    -march=3Darmv7-a -mthumb-inte=
rwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--ha=
sh-style=3Dgnu -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.=
git/r0005-new/tmp/sysroots/beaglebone -O2 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed   -Wl,-soname -Wl,libnetsnmphelpers.so.30 -o .libs/libnetsnmp=
helpers.so.30.0.1
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmphelpe=
rs.so.30" && ln -s "libnetsnmphelpers.so.30.0.1" "libnetsnmphelpers.so.30")
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmphelpe=
rs.so" && ln -s "libnetsnmphelpers.so.30.0.1" "libnetsnmphelpers.so")
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ar cru .libs/l=
ibnetsnmphelpers.a  dummy.o
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ranlib .libs/l=
ibnetsnmphelpers.a
arm-poky-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libnetsnmphelp=
ers.la" && ln -s "../libnetsnmphelpers.la" "libnetsnmphelpers.la" )
: libnetsnmphelpers.la
make[2]: Leaving directory `/home/jack/Projects/poky-denzil.git/r0005-new/t=
mp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7=
.1/agent/helpers'
making all in /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a=
-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/agent/mibgr=
oup
make[2]: Entering directory `/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.=
7.1/agent/mibgroup'
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmpv3/snmpMPDStats_5_5.lo snm=
pv3/snmpMPDStats_5_5.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/snmpMPDStats_5_5.c  -fPIC -DPIC -o snmpv3/.libs=
/snmpMPDStats_5_5.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/snmpMPDStats_5_5.c -o snmpv3/snmpMPDStats_5_5.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmpv3/usmStats_5_5.lo snmpv3/=
usmStats_5_5.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/usmStats_5_5.c  -fPIC -DPIC -o snmpv3/.libs/usm=
Stats_5_5.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/usmStats_5_5.c -o snmpv3/usmStats_5_5.o >/dev/n=
ull 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmpv3/snmpEngine.lo snmpv3/sn=
mpEngine.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/snmpEngine.c  -fPIC -DPIC -o snmpv3/.libs/snmpE=
ngine.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/snmpEngine.c -o snmpv3/snmpEngine.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmpv3/usmUser.lo snmpv3/usmUs=
er.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/usmUser.c  -fPIC -DPIC -o snmpv3/.libs/usmUser.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmpv3/usmUser.c -o snmpv3/usmUser.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/snmp_mib_5_5.lo mibII/sn=
mp_mib_5_5.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/snmp_mib_5_5.c  -fPIC -DPIC -o mibII/.libs/snmp_=
mib_5_5.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/snmp_mib_5_5.c -o mibII/snmp_mib_5_5.o >/dev/nul=
l 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/system_mib.lo mibII/syst=
em_mib.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/system_mib.c  -fPIC -DPIC -o mibII/.libs/system_=
mib.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/system_mib.c -o mibII/system_mib.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/sysORTable.lo mibII/sysO=
RTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/sysORTable.c  -fPIC -DPIC -o mibII/.libs/sysORTa=
ble.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/sysORTable.c -o mibII/sysORTable.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/at.lo mibII/at.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/at.c  -fPIC -DPIC -o mibII/.libs/at.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/at.c -o mibII/at.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/ip.lo mibII/ip.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/ip.c  -fPIC -DPIC -o mibII/.libs/ip.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/ip.c -o mibII/ip.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/tcp.lo mibII/tcp.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/tcp.c  -fPIC -DPIC -o mibII/.libs/tcp.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/tcp.c -o mibII/tcp.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/icmp.lo mibII/icmp.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/icmp.c  -fPIC -DPIC -o mibII/.libs/icmp.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/icmp.c -o mibII/icmp.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/udp.lo mibII/udp.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/udp.c  -fPIC -DPIC -o mibII/.libs/udp.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/udp.c -o mibII/udp.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/vacm_vars.lo mibII/vacm_=
vars.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/vacm_vars.c  -fPIC -DPIC -o mibII/.libs/vacm_var=
s.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/vacm_vars.c -o mibII/vacm_vars.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/setSerialNo.lo mibII/set=
SerialNo.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/setSerialNo.c  -fPIC -DPIC -o mibII/.libs/setSer=
ialNo.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/setSerialNo.c -o mibII/setSerialNo.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/disk_hw.lo ucd-snmp/d=
isk_hw.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/disk_hw.c  -fPIC -DPIC -o ucd-snmp/.libs/disk=
_hw.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/disk_hw.c -o ucd-snmp/disk_hw.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/proc.lo ucd-snmp/proc=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/proc.c  -fPIC -DPIC -o ucd-snmp/.libs/proc.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/proc.c -o ucd-snmp/proc.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/versioninfo.lo ucd-sn=
mp/versioninfo.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/versioninfo.c  -fPIC -DPIC -o ucd-snmp/.libs/=
versioninfo.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/versioninfo.c -o ucd-snmp/versioninfo.o >/dev=
/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/pass.lo ucd-snmp/pass=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/pass.c  -fPIC -DPIC -o ucd-snmp/.libs/pass.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/pass.c -o ucd-snmp/pass.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/pass_persist.lo ucd-s=
nmp/pass_persist.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/pass_persist.c  -fPIC -DPIC -o ucd-snmp/.libs=
/pass_persist.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/pass_persist.c -o ucd-snmp/pass_persist.o >/d=
ev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/loadave.lo ucd-snmp/l=
oadave.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/loadave.c  -fPIC -DPIC -o ucd-snmp/.libs/load=
ave.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/loadave.c -o ucd-snmp/loadave.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/extend.lo agent/extend.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/extend.c  -fPIC -DPIC -o agent/.libs/extend.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/extend.c -o agent/extend.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/errormib.lo ucd-snmp/=
errormib.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/errormib.c  -fPIC -DPIC -o ucd-snmp/.libs/err=
ormib.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/errormib.c -o ucd-snmp/errormib.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/file.lo ucd-snmp/file=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/file.c  -fPIC -DPIC -o ucd-snmp/.libs/file.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/file.c -o ucd-snmp/file.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/dlmod.lo ucd-snmp/dlm=
od.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/dlmod.c  -fPIC -DPIC -o ucd-snmp/.libs/dlmod.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/dlmod.c -o ucd-snmp/dlmod.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/proxy.lo ucd-snmp/pro=
xy.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/proxy.c  -fPIC -DPIC -o ucd-snmp/.libs/proxy.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/proxy.c -o ucd-snmp/proxy.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/logmatch.lo ucd-snmp/=
logmatch.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/logmatch.c  -fPIC -DPIC -o ucd-snmp/.libs/log=
match.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/logmatch.c -o ucd-snmp/logmatch.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/memory.lo ucd-snmp/me=
mory.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/memory.c  -fPIC -DPIC -o ucd-snmp/.libs/memor=
y.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/memory.c -o ucd-snmp/memory.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/vmstat.lo ucd-snmp/vm=
stat.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/vmstat.c  -fPIC -DPIC -o ucd-snmp/.libs/vmsta=
t.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/vmstat.c -o ucd-snmp/vmstat.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o notification/snmpNotifyTable.l=
o notification/snmpNotifyTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c notification/snmpNotifyTable.c  -fPIC -DPIC -o notific=
ation/.libs/snmpNotifyTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c notification/snmpNotifyTable.c -o notification/snmpNot=
ifyTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o notification/snmpNotifyFilterP=
rofileTable.lo notification/snmpNotifyFilterProfileTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c notification/snmpNotifyFilterProfileTable.c  -fPIC -DP=
IC -o notification/.libs/snmpNotifyFilterProfileTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c notification/snmpNotifyFilterProfileTable.c -o notific=
ation/snmpNotifyFilterProfileTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o notification-log-mib/notificat=
ion_log.lo notification-log-mib/notification_log.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c notification-log-mib/notification_log.c  -fPIC -DPIC -=
o notification-log-mib/.libs/notification_log.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c notification-log-mib/notification_log.c -o notificatio=
n-log-mib/notification_log.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o target/target_counters_5_5.lo =
target/target_counters_5_5.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/target_counters_5_5.c  -fPIC -DPIC -o target/.l=
ibs/target_counters_5_5.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/target_counters_5_5.c -o target/target_counters=
_5_5.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o target/snmpTargetAddrEntry.lo =
target/snmpTargetAddrEntry.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/snmpTargetAddrEntry.c  -fPIC -DPIC -o target/.l=
ibs/snmpTargetAddrEntry.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/snmpTargetAddrEntry.c -o target/snmpTargetAddrE=
ntry.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o target/snmpTargetParamsEntry.l=
o target/snmpTargetParamsEntry.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/snmpTargetParamsEntry.c  -fPIC -DPIC -o target/=
.libs/snmpTargetParamsEntry.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/snmpTargetParamsEntry.c -o target/snmpTargetPar=
amsEntry.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o target/target.lo target/target=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/target.c  -fPIC -DPIC -o target/.libs/target.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c target/target.c -o target/target.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/nsTransactionTable.lo ag=
ent/nsTransactionTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsTransactionTable.c  -fPIC -DPIC -o agent/.libs=
/nsTransactionTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsTransactionTable.c -o agent/nsTransactionTable=
.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/nsModuleTable.lo agent/n=
sModuleTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsModuleTable.c  -fPIC -DPIC -o agent/.libs/nsMo=
duleTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsModuleTable.c -o agent/nsModuleTable.o >/dev/n=
ull 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/nsDebug.lo agent/nsDebug=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsDebug.c  -fPIC -DPIC -o agent/.libs/nsDebug.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsDebug.c -o agent/nsDebug.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/nsCache.lo agent/nsCache=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsCache.c  -fPIC -DPIC -o agent/.libs/nsCache.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsCache.c -o agent/nsCache.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/nsLogging.lo agent/nsLog=
ging.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsLogging.c  -fPIC -DPIC -o agent/.libs/nsLoggin=
g.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsLogging.c -o agent/nsLogging.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o agent/nsVacmAccessTable.lo age=
nt/nsVacmAccessTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsVacmAccessTable.c  -fPIC -DPIC -o agent/.libs/=
nsVacmAccessTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c agent/nsVacmAccessTable.c -o agent/nsVacmAccessTable.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteScalars.lo dis=
man/event/mteScalars.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteScalars.c  -fPIC -DPIC -o disman/event=
/.libs/mteScalars.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteScalars.c -o disman/event/mteScalars.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTrigger.lo dis=
man/event/mteTrigger.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTrigger.c  -fPIC -DPIC -o disman/event=
/.libs/mteTrigger.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTrigger.c -o disman/event/mteTrigger.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTriggerTable.l=
o disman/event/mteTriggerTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerTable.c  -fPIC -DPIC -o disman/=
event/.libs/mteTriggerTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerTable.c -o disman/event/mteTrig=
gerTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTriggerDeltaTa=
ble.lo disman/event/mteTriggerDeltaTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerDeltaTable.c  -fPIC -DPIC -o di=
sman/event/.libs/mteTriggerDeltaTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerDeltaTable.c -o disman/event/mt=
eTriggerDeltaTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTriggerExisten=
ceTable.lo disman/event/mteTriggerExistenceTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerExistenceTable.c  -fPIC -DPIC -=
o disman/event/.libs/mteTriggerExistenceTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerExistenceTable.c -o disman/even=
t/mteTriggerExistenceTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTriggerBoolean=
Table.lo disman/event/mteTriggerBooleanTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerBooleanTable.c  -fPIC -DPIC -o =
disman/event/.libs/mteTriggerBooleanTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerBooleanTable.c -o disman/event/=
mteTriggerBooleanTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTriggerThresho=
ldTable.lo disman/event/mteTriggerThresholdTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerThresholdTable.c  -fPIC -DPIC -=
o disman/event/.libs/mteTriggerThresholdTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerThresholdTable.c -o disman/even=
t/mteTriggerThresholdTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteTriggerConf.lo=
 disman/event/mteTriggerConf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerConf.c  -fPIC -DPIC -o disman/e=
vent/.libs/mteTriggerConf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteTriggerConf.c -o disman/event/mteTrigg=
erConf.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteEvent.lo disma=
n/event/mteEvent.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEvent.c  -fPIC -DPIC -o disman/event/.=
libs/mteEvent.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEvent.c -o disman/event/mteEvent.o >/d=
ev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteEventTable.lo =
disman/event/mteEventTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventTable.c  -fPIC -DPIC -o disman/ev=
ent/.libs/mteEventTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventTable.c -o disman/event/mteEventT=
able.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteEventSetTable.=
lo disman/event/mteEventSetTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventSetTable.c  -fPIC -DPIC -o disman=
/event/.libs/mteEventSetTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventSetTable.c -o disman/event/mteEve=
ntSetTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteEventNotificat=
ionTable.lo disman/event/mteEventNotificationTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventNotificationTable.c  -fPIC -DPIC =
-o disman/event/.libs/mteEventNotificationTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventNotificationTable.c -o disman/eve=
nt/mteEventNotificationTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteEventConf.lo d=
isman/event/mteEventConf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventConf.c  -fPIC -DPIC -o disman/eve=
nt/.libs/mteEventConf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteEventConf.c -o disman/event/mteEventCo=
nf.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteObjects.lo dis=
man/event/mteObjects.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteObjects.c  -fPIC -DPIC -o disman/event=
/.libs/mteObjects.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteObjects.c -o disman/event/mteObjects.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteObjectsTable.l=
o disman/event/mteObjectsTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteObjectsTable.c  -fPIC -DPIC -o disman/=
event/.libs/mteObjectsTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteObjectsTable.c -o disman/event/mteObje=
ctsTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/event/mteObjectsConf.lo=
 disman/event/mteObjectsConf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteObjectsConf.c  -fPIC -DPIC -o disman/e=
vent/.libs/mteObjectsConf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/event/mteObjectsConf.c -o disman/event/mteObjec=
tsConf.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/schedule/schedCore.lo d=
isman/schedule/schedCore.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/schedule/schedCore.c  -fPIC -DPIC -o disman/sch=
edule/.libs/schedCore.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/schedule/schedCore.c -o disman/schedule/schedCo=
re.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/schedule/schedConf.lo d=
isman/schedule/schedConf.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/schedule/schedConf.c  -fPIC -DPIC -o disman/sch=
edule/.libs/schedConf.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/schedule/schedConf.c -o disman/schedule/schedCo=
nf.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o disman/schedule/schedTable.lo =
disman/schedule/schedTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/schedule/schedTable.c  -fPIC -DPIC -o disman/sc=
hedule/.libs/schedTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c disman/schedule/schedTable.c -o disman/schedule/schedT=
able.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o utilities/override.lo utilitie=
s/override.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c utilities/override.c  -fPIC -DPIC -o utilities/.libs/o=
verride.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c utilities/override.c -o utilities/override.o >/dev/nul=
l 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hrh_storage.lo host/hrh_s=
torage.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrh_storage.c  -fPIC -DPIC -o host/.libs/hrh_stor=
age.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrh_storage.c -o host/hrh_storage.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hrh_filesys.lo host/hrh_f=
ilesys.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrh_filesys.c  -fPIC -DPIC -o host/.libs/hrh_file=
sys.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrh_filesys.c -o host/hrh_filesys.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hrSWInstalledTable.lo hos=
t/hrSWInstalledTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrSWInstalledTable.c  -fPIC -DPIC -o host/.libs/h=
rSWInstalledTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrSWInstalledTable.c -o host/hrSWInstalledTable.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hrSWRunTable.lo host/hrSW=
RunTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrSWRunTable.c  -fPIC -DPIC -o host/.libs/hrSWRun=
Table.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrSWRunTable.c -o host/hrSWRunTable.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_system.lo host/hr_syst=
em.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_system.c  -fPIC -DPIC -o host/.libs/hr_system.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_system.c -o host/hr_system.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_device.lo host/hr_devi=
ce.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_device.c  -fPIC -DPIC -o host/.libs/hr_device.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_device.c -o host/hr_device.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_other.lo host/hr_other=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_other.c  -fPIC -DPIC -o host/.libs/hr_other.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_other.c -o host/hr_other.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_proc.lo host/hr_proc.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_proc.c  -fPIC -DPIC -o host/.libs/hr_proc.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_proc.c -o host/hr_proc.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_network.lo host/hr_net=
work.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_network.c  -fPIC -DPIC -o host/.libs/hr_networ=
k.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_network.c -o host/hr_network.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_print.lo host/hr_print=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_print.c  -fPIC -DPIC -o host/.libs/hr_print.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_print.c -o host/hr_print.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_disk.lo host/hr_disk.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_disk.c  -fPIC -DPIC -o host/.libs/hr_disk.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_disk.c -o host/hr_disk.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hr_partition.lo host/hr_p=
artition.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_partition.c  -fPIC -DPIC -o host/.libs/hr_part=
ition.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hr_partition.c -o host/hr_partition.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o util_funcs/header_generic.lo u=
til_funcs/header_generic.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/header_generic.c  -fPIC -DPIC -o util_funcs=
/.libs/header_generic.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/header_generic.c -o util_funcs/header_gener=
ic.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/updates.lo mibII/updates=
.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/updates.c  -fPIC -DPIC -o mibII/.libs/updates.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/updates.c -o mibII/updates.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o util_funcs.lo util_funcs.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs.c  -fPIC -DPIC -o .libs/util_funcs.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs.c -o util_funcs.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/kernel_linux.lo mibII/ke=
rnel_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/kernel_linux.c  -fPIC -DPIC -o mibII/.libs/kerne=
l_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/kernel_linux.c -o mibII/kernel_linux.o >/dev/nul=
l 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/ipAddr.lo mibII/ipAddr.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/ipAddr.c  -fPIC -DPIC -o mibII/.libs/ipAddr.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/ipAddr.c -o mibII/ipAddr.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/var_route.lo mibII/var_r=
oute.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/var_route.c  -fPIC -DPIC -o mibII/.libs/var_rout=
e.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/var_route.c -o mibII/var_route.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/route_write.lo mibII/rou=
te_write.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/route_write.c  -fPIC -DPIC -o mibII/.libs/route_=
write.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/route_write.c -o mibII/route_write.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/tcpTable.lo mibII/tcpTab=
le.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/tcpTable.c  -fPIC -DPIC -o mibII/.libs/tcpTable.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/tcpTable.c -o mibII/tcpTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/udpTable.lo mibII/udpTab=
le.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/udpTable.c  -fPIC -DPIC -o mibII/.libs/udpTable.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/udpTable.c -o mibII/udpTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o mibII/vacm_context.lo mibII/va=
cm_context.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/vacm_context.c  -fPIC -DPIC -o mibII/.libs/vacm_=
context.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c mibII/vacm_context.c -o mibII/vacm_context.o >/dev/nul=
l 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ip_scalars.lo ip-mib/ip=
_scalars.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ip_scalars.c  -fPIC -DPIC -o ip-mib/.libs/ip_sc=
alars.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ip_scalars.c -o ip-mib/ip_scalars.o >/dev/null =
2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o util_funcs/header_simple_table=
.lo util_funcs/header_simple_table.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/header_simple_table.c  -fPIC -DPIC -o util_=
funcs/.libs/header_simple_table.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/header_simple_table.c -o util_funcs/header_=
simple_table.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o util_funcs/restart.lo util_fun=
cs/restart.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/restart.c  -fPIC -DPIC -o util_funcs/.libs/=
restart.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/restart.c -o util_funcs/restart.o >/dev/nul=
l 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ucd-snmp/pass_common.lo ucd-sn=
mp/pass_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/pass_common.c  -fPIC -DPIC -o ucd-snmp/.libs/=
pass_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ucd-snmp/pass_common.c -o ucd-snmp/pass_common.o >/dev=
/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o header_complex.lo header_compl=
ex.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c header_complex.c  -fPIC -DPIC -o .libs/header_complex.=
o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c header_complex.c -o header_complex.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmp-notification-mib/snmpNoti=
fyFilterTable/snmpNotifyFilterTable.lo snmp-notification-mib/snmpNotifyFilt=
erTable/snmpNotifyFilterTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmp-notification-mib/snmpNotifyFilterTable/snmpNotify=
FilterTable.c  -fPIC -DPIC -o snmp-notification-mib/snmpNotifyFilterTable/.=
libs/snmpNotifyFilterTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmp-notification-mib/snmpNotifyFilterTable/snmpNotify=
FilterTable.c -o snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFilt=
erTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/data_access/swinst.lo hos=
t/data_access/swinst.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swinst.c  -fPIC -DPIC -o host/data_ac=
cess/.libs/swinst.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swinst.c -o host/data_access/swinst.o=
 >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/data_access/swrun.lo host=
/data_access/swrun.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swrun.c  -fPIC -DPIC -o host/data_acc=
ess/.libs/swrun.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swrun.c -o host/data_access/swrun.o >=
/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/hrSWRunPerfTable.lo host/=
hrSWRunPerfTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrSWRunPerfTable.c  -fPIC -DPIC -o host/.libs/hrS=
WRunPerfTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/hrSWRunPerfTable.c -o host/hrSWRunPerfTable.o >/d=
ev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/ifTable/ifTable.lo if-m=
ib/ifTable/ifTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifTable/ifTable.c  -fPIC -DPIC -o if-mib/ifTabl=
e/.libs/ifTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifTable/ifTable.c -o if-mib/ifTable/ifTable.o >=
/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/ifXTable/ifXTable.lo if=
-mib/ifXTable/ifXTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifXTable/ifXTable.c  -fPIC -DPIC -o if-mib/ifXT=
able/.libs/ifXTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifXTable/ifXTable.c -o if-mib/ifXTable/ifXTable=
.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipAddressTable/ipAddres=
sTable.lo ip-mib/ipAddressTable/ipAddressTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressTable/ipAddressTable.c  -fPIC -DPIC -o=
 ip-mib/ipAddressTable/.libs/ipAddressTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressTable/ipAddressTable.c -o ip-mib/ipAdd=
ressTable/ipAddressTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipAddressPrefixTable/ip=
AddressPrefixTable.lo ip-mib/ipAddressPrefixTable/ipAddressPrefixTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressPrefixTable/ipAddressPrefixTable.c  -f=
PIC -DPIC -o ip-mib/ipAddressPrefixTable/.libs/ipAddressPrefixTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressPrefixTable/ipAddressPrefixTable.c -o =
ip-mib/ipAddressPrefixTable/ipAddressPrefixTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipDefaultRouterTable/ip=
DefaultRouterTable.lo ip-mib/ipDefaultRouterTable/ipDefaultRouterTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable.c  -f=
PIC -DPIC -o ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable.c -o =
ip-mib/ipDefaultRouterTable/ipDefaultRouterTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/inetNetToMediaTable/ine=
tNetToMediaTable.lo ip-mib/inetNetToMediaTable/inetNetToMediaTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/inetNetToMediaTable/inetNetToMediaTable.c  -fPI=
C -DPIC -o ip-mib/inetNetToMediaTable/.libs/inetNetToMediaTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/inetNetToMediaTable/inetNetToMediaTable.c -o ip=
-mib/inetNetToMediaTable/inetNetToMediaTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/inetNetToMediaTable/ine=
tNetToMediaTable_interface.lo ip-mib/inetNetToMediaTable/inetNetToMediaTabl=
e_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/inetNetToMediaTable/inetNetToMediaTable_interfa=
ce.c  -fPIC -DPIC -o ip-mib/inetNetToMediaTable/.libs/inetNetToMediaTable_i=
nterface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/inetNetToMediaTable/inetNetToMediaTable_interfa=
ce.c -o ip-mib/inetNetToMediaTable/inetNetToMediaTable_interface.o >/dev/nu=
ll 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/inetNetToMediaTable/ine=
tNetToMediaTable_data_access.lo ip-mib/inetNetToMediaTable/inetNetToMediaTa=
ble_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/inetNetToMediaTable/inetNetToMediaTable_data_ac=
cess.c  -fPIC -DPIC -o ip-mib/inetNetToMediaTable/.libs/inetNetToMediaTable=
_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/inetNetToMediaTable/inetNetToMediaTable_data_ac=
cess.c -o ip-mib/inetNetToMediaTable/inetNetToMediaTable_data_access.o >/de=
v/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipSystemStatsTable/ipSy=
stemStatsTable.lo ip-mib/ipSystemStatsTable/ipSystemStatsTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipSystemStatsTable/ipSystemStatsTable.c  -fPIC =
-DPIC -o ip-mib/ipSystemStatsTable/.libs/ipSystemStatsTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipSystemStatsTable/ipSystemStatsTable.c -o ip-m=
ib/ipSystemStatsTable/ipSystemStatsTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipSystemStatsTable/ipSy=
stemStatsTable_interface.lo ip-mib/ipSystemStatsTable/ipSystemStatsTable_in=
terface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface=
.c  -fPIC -DPIC -o ip-mib/ipSystemStatsTable/.libs/ipSystemStatsTable_inter=
face.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface=
.c -o ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.o >/dev/null 2=
>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipSystemStatsTable/ipSy=
stemStatsTable_data_access.lo ip-mib/ipSystemStatsTable/ipSystemStatsTable_=
data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_acce=
ss.c  -fPIC -DPIC -o ip-mib/ipSystemStatsTable/.libs/ipSystemStatsTable_dat=
a_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_acce=
ss.c -o ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_access.o >/dev/nu=
ll 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipv6ScopeZoneIndexTable=
/ipv6ScopeZoneIndexTable.lo ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneInd=
exTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
.c  -fPIC -DPIC -o ip-mib/ipv6ScopeZoneIndexTable/.libs/ipv6ScopeZoneIndexT=
able.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
.c -o ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable.o >/dev/null 2=
>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipIfStatsTable/ipIfStat=
sTable.lo ip-mib/ipIfStatsTable/ipIfStatsTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable.c  -fPIC -DPIC -o=
 ip-mib/ipIfStatsTable/.libs/ipIfStatsTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable.c -o ip-mib/ipIfS=
tatsTable/ipIfStatsTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipIfStatsTable/ipIfStat=
sTable_interface.lo ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c  -fPI=
C -DPIC -o ip-mib/ipIfStatsTable/.libs/ipIfStatsTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable_interface.c -o ip=
-mib/ipIfStatsTable/ipIfStatsTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipIfStatsTable/ipIfStat=
sTable_data_access.lo ip-mib/ipIfStatsTable/ipIfStatsTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable_data_access.c  -f=
PIC -DPIC -o ip-mib/ipIfStatsTable/.libs/ipIfStatsTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable_data_access.c -o =
ip-mib/ipIfStatsTable/ipIfStatsTable_data_access.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/ipCidrRouteTabl=
e/ipCidrRouteTable.lo ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable.c  -f=
PIC -DPIC -o ip-forward-mib/ipCidrRouteTable/.libs/ipCidrRouteTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable.c -o =
ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/inetCidrRouteTa=
ble/inetCidrRouteTable.lo ip-forward-mib/inetCidrRouteTable/inetCidrRouteTa=
ble.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable.c=
  -fPIC -DPIC -o ip-forward-mib/inetCidrRouteTable/.libs/inetCidrRouteTable=
.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable.c=
 -o ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/tcpConnectionTable/tcp=
ConnectionTable.lo tcp-mib/tcpConnectionTable/tcpConnectionTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpConnectionTable/tcpConnectionTable.c  -fPIC=
 -DPIC -o tcp-mib/tcpConnectionTable/.libs/tcpConnectionTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpConnectionTable/tcpConnectionTable.c -o tcp=
-mib/tcpConnectionTable/tcpConnectionTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/tcpListenerTable/tcpLi=
stenerTable.lo tcp-mib/tcpListenerTable/tcpListenerTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpListenerTable/tcpListenerTable.c  -fPIC -DP=
IC -o tcp-mib/tcpListenerTable/.libs/tcpListenerTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpListenerTable/tcpListenerTable.c -o tcp-mib=
/tcpListenerTable/tcpListenerTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o udp-mib/udpEndpointTable/udpEn=
dpointTable.lo udp-mib/udpEndpointTable/udpEndpointTable.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/udpEndpointTable/udpEndpointTable.c  -fPIC -DP=
IC -o udp-mib/udpEndpointTable/.libs/udpEndpointTable.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/udpEndpointTable/udpEndpointTable.c -o udp-mib=
/udpEndpointTable/udpEndpointTable.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o hardware/fsys/hw_fsys.lo hardw=
are/fsys/hw_fsys.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/fsys/hw_fsys.c  -fPIC -DPIC -o hardware/fsys/=
.libs/hw_fsys.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/fsys/hw_fsys.c -o hardware/fsys/hw_fsys.o >/d=
ev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o hardware/fsys/fsys_mntent.lo h=
ardware/fsys/fsys_mntent.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/fsys/fsys_mntent.c  -fPIC -DPIC -o hardware/f=
sys/.libs/fsys_mntent.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/fsys/fsys_mntent.c -o hardware/fsys/fsys_mnte=
nt.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o hardware/memory/hw_mem.lo hard=
ware/memory/hw_mem.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/memory/hw_mem.c  -fPIC -DPIC -o hardware/memo=
ry/.libs/hw_mem.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/memory/hw_mem.c -o hardware/memory/hw_mem.o >=
/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o hardware/memory/memory_linux.l=
o hardware/memory/memory_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/memory/memory_linux.c  -fPIC -DPIC -o hardwar=
e/memory/.libs/memory_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/memory/memory_linux.c -o hardware/memory/memo=
ry_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o hardware/cpu/cpu.lo hardware/c=
pu/cpu.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/cpu/cpu.c  -fPIC -DPIC -o hardware/cpu/.libs/=
cpu.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/cpu/cpu.c -o hardware/cpu/cpu.o >/dev/null 2>=
&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o hardware/cpu/cpu_linux.lo hard=
ware/cpu/cpu_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/cpu/cpu_linux.c  -fPIC -DPIC -o hardware/cpu/=
.libs/cpu_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c hardware/cpu/cpu_linux.c -o hardware/cpu/cpu_linux.o >=
/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmp-notification-mib/snmpNoti=
fyFilterTable/snmpNotifyFilterTable_interface.lo snmp-notification-mib/snmp=
NotifyFilterTable/snmpNotifyFilterTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmp-notification-mib/snmpNotifyFilterTable/snmpNotify=
FilterTable_interface.c  -fPIC -DPIC -o snmp-notification-mib/snmpNotifyFil=
terTable/.libs/snmpNotifyFilterTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmp-notification-mib/snmpNotifyFilterTable/snmpNotify=
FilterTable_interface.c -o snmp-notification-mib/snmpNotifyFilterTable/snmp=
NotifyFilterTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o snmp-notification-mib/snmpNoti=
fyFilterTable/snmpNotifyFilterTable_data_access.lo snmp-notification-mib/sn=
mpNotifyFilterTable/snmpNotifyFilterTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmp-notification-mib/snmpNotifyFilterTable/snmpNotify=
FilterTable_data_access.c  -fPIC -DPIC -o snmp-notification-mib/snmpNotifyF=
ilterTable/.libs/snmpNotifyFilterTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c snmp-notification-mib/snmpNotifyFilterTable/snmpNotify=
FilterTable_data_access.c -o snmp-notification-mib/snmpNotifyFilterTable/sn=
mpNotifyFilterTable_data_access.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/data_access/swinst_pkginf=
o.lo host/data_access/swinst_pkginfo.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swinst_pkginfo.c  -fPIC -DPIC -o host=
/data_access/.libs/swinst_pkginfo.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swinst_pkginfo.c -o host/data_access/=
swinst_pkginfo.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o host/data_access/swrun_procfs_=
status.lo host/data_access/swrun_procfs_status.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swrun_procfs_status.c  -fPIC -DPIC -o=
 host/data_access/.libs/swrun_procfs_status.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c host/data_access/swrun_procfs_status.c -o host/data_ac=
cess/swrun_procfs_status.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/data_access/interface.l=
o if-mib/data_access/interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/data_access/interface.c  -fPIC -DPIC -o if-mib/=
data_access/.libs/interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/data_access/interface.c -o if-mib/data_access/i=
nterface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/ifTable/ifTable_interfa=
ce.lo if-mib/ifTable/ifTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifTable/ifTable_interface.c  -fPIC -DPIC -o if-=
mib/ifTable/.libs/ifTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifTable/ifTable_interface.c -o if-mib/ifTable/i=
fTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/ifTable/ifTable_data_ac=
cess.lo if-mib/ifTable/ifTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifTable/ifTable_data_access.c  -fPIC -DPIC -o i=
f-mib/ifTable/.libs/ifTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifTable/ifTable_data_access.c -o if-mib/ifTable=
/ifTable_data_access.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/ifXTable/ifXTable_inter=
face.lo if-mib/ifXTable/ifXTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifXTable/ifXTable_interface.c  -fPIC -DPIC -o i=
f-mib/ifXTable/.libs/ifXTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifXTable/ifXTable_interface.c -o if-mib/ifXTabl=
e/ifXTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/ifXTable/ifXTable_data_=
access.lo if-mib/ifXTable/ifXTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifXTable/ifXTable_data_access.c  -fPIC -DPIC -o=
 if-mib/ifXTable/.libs/ifXTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/ifXTable/ifXTable_data_access.c -o if-mib/ifXTa=
ble/ifXTable_data_access.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipAddressTable/ipAddres=
sTable_interface.lo ip-mib/ipAddressTable/ipAddressTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressTable/ipAddressTable_interface.c  -fPI=
C -DPIC -o ip-mib/ipAddressTable/.libs/ipAddressTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressTable/ipAddressTable_interface.c -o ip=
-mib/ipAddressTable/ipAddressTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipAddressTable/ipAddres=
sTable_data_access.lo ip-mib/ipAddressTable/ipAddressTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressTable/ipAddressTable_data_access.c  -f=
PIC -DPIC -o ip-mib/ipAddressTable/.libs/ipAddressTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressTable/ipAddressTable_data_access.c -o =
ip-mib/ipAddressTable/ipAddressTable_data_access.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipAddressPrefixTable/ip=
AddressPrefixTable_interface.lo ip-mib/ipAddressPrefixTable/ipAddressPrefix=
Table_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressPrefixTable/ipAddressPrefixTable_inter=
face.c  -fPIC -DPIC -o ip-mib/ipAddressPrefixTable/.libs/ipAddressPrefixTab=
le_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressPrefixTable/ipAddressPrefixTable_inter=
face.c -o ip-mib/ipAddressPrefixTable/ipAddressPrefixTable_interface.o >/de=
v/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipAddressPrefixTable/ip=
AddressPrefixTable_data_access.lo ip-mib/ipAddressPrefixTable/ipAddressPref=
ixTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressPrefixTable/ipAddressPrefixTable_data_=
access.c  -fPIC -DPIC -o ip-mib/ipAddressPrefixTable/.libs/ipAddressPrefixT=
able_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipAddressPrefixTable/ipAddressPrefixTable_data_=
access.c -o ip-mib/ipAddressPrefixTable/ipAddressPrefixTable_data_access.o =
>/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipDefaultRouterTable/ip=
DefaultRouterTable_interface.lo ip-mib/ipDefaultRouterTable/ipDefaultRouter=
Table_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_inter=
face.c  -fPIC -DPIC -o ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterTab=
le_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_inter=
face.c -o ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_interface.o >/de=
v/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipDefaultRouterTable/ip=
DefaultRouterTable_data_access.lo ip-mib/ipDefaultRouterTable/ipDefaultRout=
erTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data_=
access.c  -fPIC -DPIC -o ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterT=
able_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data_=
access.c -o ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data_access.o =
>/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipDefaultRouterTable/ip=
DefaultRouterTable_data_get.lo ip-mib/ipDefaultRouterTable/ipDefaultRouterT=
able_data_get.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data_=
get.c  -fPIC -DPIC -o ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterTabl=
e_data_get.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data_=
get.c -o ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data_get.o >/dev/=
null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/arp_common.=
lo ip-mib/data_access/arp_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/arp_common.c  -fPIC -DPIC -o ip-mib=
/data_access/.libs/arp_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/arp_common.c -o ip-mib/data_access/=
arp_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/arp_netlink=
.lo ip-mib/data_access/arp_netlink.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/arp_netlink.c  -fPIC -DPIC -o ip-mi=
b/data_access/.libs/arp_netlink.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/arp_netlink.c -o ip-mib/data_access=
/arp_netlink.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/systemstats=
_common.lo ip-mib/data_access/systemstats_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/systemstats_common.c  -fPIC -DPIC -=
o ip-mib/data_access/.libs/systemstats_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/systemstats_common.c -o ip-mib/data=
_access/systemstats_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/systemstats=
_linux.lo ip-mib/data_access/systemstats_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/systemstats_linux.c  -fPIC -DPIC -o=
 ip-mib/data_access/.libs/systemstats_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/systemstats_linux.c -o ip-mib/data_=
access/systemstats_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/scalars_lin=
ux.lo ip-mib/data_access/scalars_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/scalars_linux.c  -fPIC -DPIC -o ip-=
mib/data_access/.libs/scalars_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/scalars_linux.c -o ip-mib/data_acce=
ss/scalars_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipv6ScopeZoneIndexTable=
/ipv6ScopeZoneIndexTable_interface.lo ip-mib/ipv6ScopeZoneIndexTable/ipv6Sc=
opeZoneIndexTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
_interface.c  -fPIC -DPIC -o ip-mib/ipv6ScopeZoneIndexTable/.libs/ipv6Scope=
ZoneIndexTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
_interface.c -o ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable_inte=
rface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipv6ScopeZoneIndexTable=
/ipv6ScopeZoneIndexTable_data_access.lo ip-mib/ipv6ScopeZoneIndexTable/ipv6=
ScopeZoneIndexTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
_data_access.c  -fPIC -DPIC -o ip-mib/ipv6ScopeZoneIndexTable/.libs/ipv6Sco=
peZoneIndexTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
_data_access.c -o ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable_da=
ta_access.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/ipIfStatsTable/ipIfStat=
sTable_data_get.lo ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c  -fPIC=
 -DPIC -o ip-mib/ipIfStatsTable/.libs/ipIfStatsTable_data_get.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.c -o ip-=
mib/ipIfStatsTable/ipIfStatsTable_data_get.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/ipCidrRouteTabl=
e/ipCidrRouteTable_interface.lo ip-forward-mib/ipCidrRouteTable/ipCidrRoute=
Table_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_inter=
face.c  -fPIC -DPIC -o ip-forward-mib/ipCidrRouteTable/.libs/ipCidrRouteTab=
le_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_inter=
face.c -o ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_interface.o >/de=
v/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/ipCidrRouteTabl=
e/ipCidrRouteTable_data_access.lo ip-forward-mib/ipCidrRouteTable/ipCidrRou=
teTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_data_=
access.c  -fPIC -DPIC -o ip-forward-mib/ipCidrRouteTable/.libs/ipCidrRouteT=
able_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_data_=
access.c -o ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_data_access.o =
>/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/inetCidrRouteTa=
ble/inetCidrRouteTable_interface.lo ip-forward-mib/inetCidrRouteTable/inetC=
idrRouteTable_interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_i=
nterface.c  -fPIC -DPIC -o ip-forward-mib/inetCidrRouteTable/.libs/inetCidr=
RouteTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_i=
nterface.c -o ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_interfac=
e.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/inetCidrRouteTa=
ble/inetCidrRouteTable_data_access.lo ip-forward-mib/inetCidrRouteTable/ine=
tCidrRouteTable_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_d=
ata_access.c  -fPIC -DPIC -o ip-forward-mib/inetCidrRouteTable/.libs/inetCi=
drRouteTable_data_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_d=
ata_access.c -o ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_data_a=
ccess.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/data_access/tcpConn_co=
mmon.lo tcp-mib/data_access/tcpConn_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/data_access/tcpConn_common.c  -fPIC -DPIC -o t=
cp-mib/data_access/.libs/tcpConn_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/data_access/tcpConn_common.c -o tcp-mib/data_a=
ccess/tcpConn_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/data_access/tcpConn_li=
nux.lo tcp-mib/data_access/tcpConn_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/data_access/tcpConn_linux.c  -fPIC -DPIC -o tc=
p-mib/data_access/.libs/tcpConn_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/data_access/tcpConn_linux.c -o tcp-mib/data_ac=
cess/tcpConn_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o util_funcs/get_pid_from_inode.=
lo util_funcs/get_pid_from_inode.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/get_pid_from_inode.c  -fPIC -DPIC -o util_f=
uncs/.libs/get_pid_from_inode.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c util_funcs/get_pid_from_inode.c -o util_funcs/get_pid_=
from_inode.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/tcpConnectionTable/tcp=
ConnectionTable_interface.lo tcp-mib/tcpConnectionTable/tcpConnectionTable_=
interface.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpConnectionTable/tcpConnectionTable_interfac=
e.c  -fPIC -DPIC -o tcp-mib/tcpConnectionTable/.libs/tcpConnectionTable_int=
erface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpConnectionTable/tcpConnectionTable_interfac=
e.c -o tcp-mib/tcpConnectionTable/tcpConnectionTable_interface.o >/dev/null=
 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/tcpConnectionTable/tcp=
ConnectionTable_data_access.lo tcp-mib/tcpConnectionTable/tcpConnectionTabl=
e_data_access.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpConnectionTable/tcpConnectionTable_data_acc=
ess.c  -fPIC -DPIC -o tcp-mib/tcpConnectionTable/.libs/tcpConnectionTable_d=
ata_access.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpConnectionTable/tcpConnectionTable_data_acc=
ess.c -o tcp-mib/tcpConnectionTable/tcpConnectionTable_data_access.o >/dev/=
null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/tcpListenerTable/tcpLi=
stenerTable_interface.lo tcp-mib/tcpListenerTable/tcpListenerTable_interfac=
e.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpListenerTable/tcpListenerTable_interface.c =
 -fPIC -DPIC -o tcp-mib/tcpListenerTable/.libs/tcpListenerTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpListenerTable/tcpListenerTable_interface.c =
-o tcp-mib/tcpListenerTable/tcpListenerTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o tcp-mib/tcpListenerTable/tcpLi=
stenerTable_data_access.lo tcp-mib/tcpListenerTable/tcpListenerTable_data_a=
ccess.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpListenerTable/tcpListenerTable_data_access.=
c  -fPIC -DPIC -o tcp-mib/tcpListenerTable/.libs/tcpListenerTable_data_acce=
ss.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c tcp-mib/tcpListenerTable/tcpListenerTable_data_access.=
c -o tcp-mib/tcpListenerTable/tcpListenerTable_data_access.o >/dev/null 2>&=
1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o udp-mib/udpEndpointTable/udpEn=
dpointTable_interface.lo udp-mib/udpEndpointTable/udpEndpointTable_interfac=
e.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/udpEndpointTable/udpEndpointTable_interface.c =
 -fPIC -DPIC -o udp-mib/udpEndpointTable/.libs/udpEndpointTable_interface.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/udpEndpointTable/udpEndpointTable_interface.c =
-o udp-mib/udpEndpointTable/udpEndpointTable_interface.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o udp-mib/udpEndpointTable/udpEn=
dpointTable_data_access.lo udp-mib/udpEndpointTable/udpEndpointTable_data_a=
ccess.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/udpEndpointTable/udpEndpointTable_data_access.=
c  -fPIC -DPIC -o udp-mib/udpEndpointTable/.libs/udpEndpointTable_data_acce=
ss.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/udpEndpointTable/udpEndpointTable_data_access.=
c -o udp-mib/udpEndpointTable/udpEndpointTable_data_access.o >/dev/null 2>&=
1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/data_access/interface_l=
inux.lo if-mib/data_access/interface_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/data_access/interface_linux.c  -fPIC -DPIC -o i=
f-mib/data_access/.libs/interface_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/data_access/interface_linux.c -o if-mib/data_ac=
cess/interface_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o if-mib/data_access/interface_i=
octl.lo if-mib/data_access/interface_ioctl.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/data_access/interface_ioctl.c  -fPIC -DPIC -o i=
f-mib/data_access/.libs/interface_ioctl.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c if-mib/data_access/interface_ioctl.c -o if-mib/data_ac=
cess/interface_ioctl.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/ipaddress_c=
ommon.lo ip-mib/data_access/ipaddress_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipaddress_common.c  -fPIC -DPIC -o =
ip-mib/data_access/.libs/ipaddress_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipaddress_common.c -o ip-mib/data_a=
ccess/ipaddress_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/ipaddress_l=
inux.lo ip-mib/data_access/ipaddress_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipaddress_linux.c  -fPIC -DPIC -o i=
p-mib/data_access/.libs/ipaddress_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipaddress_linux.c -o ip-mib/data_ac=
cess/ipaddress_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/defaultrout=
er_common.lo ip-mib/data_access/defaultrouter_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/defaultrouter_common.c  -fPIC -DPIC=
 -o ip-mib/data_access/.libs/defaultrouter_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/defaultrouter_common.c -o ip-mib/da=
ta_access/defaultrouter_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/defaultrout=
er_linux.lo ip-mib/data_access/defaultrouter_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/defaultrouter_linux.c  -fPIC -DPIC =
-o ip-mib/data_access/.libs/defaultrouter_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/defaultrouter_linux.c -o ip-mib/dat=
a_access/defaultrouter_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/ipv6scopezo=
ne_common.lo ip-mib/data_access/ipv6scopezone_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipv6scopezone_common.c  -fPIC -DPIC=
 -o ip-mib/data_access/.libs/ipv6scopezone_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipv6scopezone_common.c -o ip-mib/da=
ta_access/ipv6scopezone_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/ipv6scopezo=
ne_linux.lo ip-mib/data_access/ipv6scopezone_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipv6scopezone_linux.c  -fPIC -DPIC =
-o ip-mib/data_access/.libs/ipv6scopezone_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipv6scopezone_linux.c -o ip-mib/dat=
a_access/ipv6scopezone_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/data_access/rou=
te_common.lo ip-forward-mib/data_access/route_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/data_access/route_common.c  -fPIC -DPIC=
 -o ip-forward-mib/data_access/.libs/route_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/data_access/route_common.c -o ip-forwar=
d-mib/data_access/route_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/data_access/rou=
te_linux.lo ip-forward-mib/data_access/route_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/data_access/route_linux.c  -fPIC -DPIC =
-o ip-forward-mib/data_access/.libs/route_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/data_access/route_linux.c -o ip-forward=
-mib/data_access/route_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-forward-mib/data_access/rou=
te_ioctl.lo ip-forward-mib/data_access/route_ioctl.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/data_access/route_ioctl.c  -fPIC -DPIC =
-o ip-forward-mib/data_access/.libs/route_ioctl.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-forward-mib/data_access/route_ioctl.c -o ip-forward=
-mib/data_access/route_ioctl.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o udp-mib/data_access/udp_endpoi=
nt_common.lo udp-mib/data_access/udp_endpoint_common.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/data_access/udp_endpoint_common.c  -fPIC -DPIC=
 -o udp-mib/data_access/.libs/udp_endpoint_common.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/data_access/udp_endpoint_common.c -o udp-mib/d=
ata_access/udp_endpoint_common.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o udp-mib/data_access/udp_endpoi=
nt_linux.lo udp-mib/data_access/udp_endpoint_linux.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/data_access/udp_endpoint_linux.c  -fPIC -DPIC =
-o udp-mib/data_access/.libs/udp_endpoint_linux.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c udp-mib/data_access/udp_endpoint_linux.c -o udp-mib/da=
ta_access/udp_endpoint_linux.o >/dev/null 2>&1
../../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnuea=
bi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-=
abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/=
tmp/sysroots/beaglebone -I../../include -I. -I../../agent -I../../agent/mib=
group -I../../snmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unuse=
d-debug-types -Ulinux -Dlinux=3Dlinux  -c -o ip-mib/data_access/ipaddress_i=
octl.lo ip-mib/data_access/ipaddress_ioctl.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipaddress_ioctl.c  -fPIC -DPIC -o i=
p-mib/data_access/.libs/ipaddress_ioctl.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../../include -I. -I../../agent -I../../agent/mibgroup -I../../snmp=
lib -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinu=
x -Dlinux=3Dlinux -c ip-mib/data_access/ipaddress_ioctl.c -o ip-mib/data_ac=
cess/ipaddress_ioctl.o >/dev/null 2>&1
make[2]: Leaving directory `/home/jack/Projects/poky-denzil.git/r0005-new/t=
mp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7=
.1/agent/mibgroup'
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o mib_modules.lo mib_modules.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mib_modules.c  -fPIC -DPIC -o .libs/mib_modules.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c mib_modules.c -o mib_modules.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o auto_nlist.lo auto_nlist.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c auto_nlist.c  -fPIC -DPIC -o .libs/auto_nlist.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c auto_nlist.c -o auto_nlist.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dlink arm-poky-linux-gnueabi-gcc=
  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3D=
softfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sy=
sroots/beaglebone -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debu=
g-types -Ulinux -Dlinux=3Dlinux  -rpath /usr/lib -version-info 30:1:0 -o li=
bnetsnmpmibs.la mibgroup/snmpv3/snmpMPDStats_5_5.lo mibgroup/snmpv3/usmStat=
s_5_5.lo mibgroup/snmpv3/snmpEngine.lo mibgroup/snmpv3/usmUser.lo mibgroup/=
mibII/snmp_mib_5_5.lo mibgroup/mibII/system_mib.lo mibgroup/mibII/sysORTabl=
e.lo mibgroup/mibII/at.lo mibgroup/mibII/ip.lo mibgroup/mibII/tcp.lo mibgro=
up/mibII/icmp.lo mibgroup/mibII/udp.lo mibgroup/mibII/vacm_vars.lo mibgroup=
/mibII/setSerialNo.lo mibgroup/ucd-snmp/disk_hw.lo mibgroup/ucd-snmp/proc.l=
o mibgroup/ucd-snmp/versioninfo.lo mibgroup/ucd-snmp/pass.lo mibgroup/ucd-s=
nmp/pass_persist.lo mibgroup/ucd-snmp/loadave.lo mibgroup/agent/extend.lo m=
ibgroup/ucd-snmp/errormib.lo mibgroup/ucd-snmp/file.lo mibgroup/ucd-snmp/dl=
mod.lo mibgroup/ucd-snmp/proxy.lo mibgroup/ucd-snmp/logmatch.lo mibgroup/uc=
d-snmp/memory.lo mibgroup/ucd-snmp/vmstat.lo mibgroup/notification/snmpNoti=
fyTable.lo mibgroup/notification/snmpNotifyFilterProfileTable.lo mibgroup/n=
otification-log-mib/notification_log.lo mibgroup/target/target_counters_5_5=
.lo mibgroup/target/snmpTargetAddrEntry.lo mibgroup/target/snmpTargetParams=
Entry.lo mibgroup/target/target.lo mibgroup/agent/nsTransactionTable.lo mib=
group/agent/nsModuleTable.lo mibgroup/agent/nsDebug.lo mibgroup/agent/nsCac=
he.lo mibgroup/agent/nsLogging.lo mibgroup/agent/nsVacmAccessTable.lo mibgr=
oup/disman/event/mteScalars.lo mibgroup/disman/event/mteTrigger.lo mibgroup=
/disman/event/mteTriggerTable.lo mibgroup/disman/event/mteTriggerDeltaTable=
.lo mibgroup/disman/event/mteTriggerExistenceTable.lo mibgroup/disman/event=
/mteTriggerBooleanTable.lo mibgroup/disman/event/mteTriggerThresholdTable.l=
o mibgroup/disman/event/mteTriggerConf.lo mibgroup/disman/event/mteEvent.lo=
 mibgroup/disman/event/mteEventTable.lo mibgroup/disman/event/mteEventSetTa=
ble.lo mibgroup/disman/event/mteEventNotificationTable.lo mibgroup/disman/e=
vent/mteEventConf.lo mibgroup/disman/event/mteObjects.lo mibgroup/disman/ev=
ent/mteObjectsTable.lo mibgroup/disman/event/mteObjectsConf.lo mibgroup/dis=
man/schedule/schedCore.lo mibgroup/disman/schedule/schedConf.lo mibgroup/di=
sman/schedule/schedTable.lo mibgroup/utilities/override.lo mibgroup/host/hr=
h_storage.lo mibgroup/host/hrh_filesys.lo mibgroup/host/hrSWInstalledTable.=
lo mibgroup/host/hrSWRunTable.lo mibgroup/host/hr_system.lo mibgroup/host/h=
r_device.lo mibgroup/host/hr_other.lo mibgroup/host/hr_proc.lo mibgroup/hos=
t/hr_network.lo mibgroup/host/hr_print.lo mibgroup/host/hr_disk.lo mibgroup=
/host/hr_partition.lo mibgroup/util_funcs/header_generic.lo mibgroup/mibII/=
updates.lo mibgroup/util_funcs.lo mibgroup/mibII/kernel_linux.lo mibgroup/m=
ibII/ipAddr.lo mibgroup/mibII/var_route.lo mibgroup/mibII/route_write.lo mi=
bgroup/mibII/tcpTable.lo mibgroup/mibII/udpTable.lo mibgroup/mibII/vacm_con=
text.lo mibgroup/ip-mib/ip_scalars.lo mibgroup/util_funcs/header_simple_tab=
le.lo mibgroup/util_funcs/restart.lo mibgroup/ucd-snmp/pass_common.lo mibgr=
oup/header_complex.lo mibgroup/snmp-notification-mib/snmpNotifyFilterTable/=
snmpNotifyFilterTable.lo mibgroup/host/data_access/swinst.lo mibgroup/host/=
data_access/swrun.lo mibgroup/host/hrSWRunPerfTable.lo mibgroup/if-mib/ifTa=
ble/ifTable.lo mibgroup/if-mib/ifXTable/ifXTable.lo mibgroup/ip-mib/ipAddre=
ssTable/ipAddressTable.lo mibgroup/ip-mib/ipAddressPrefixTable/ipAddressPre=
fixTable.lo mibgroup/ip-mib/ipDefaultRouterTable/ipDefaultRouterTable.lo mi=
bgroup/ip-mib/inetNetToMediaTable/inetNetToMediaTable.lo mibgroup/ip-mib/in=
etNetToMediaTable/inetNetToMediaTable_interface.lo mibgroup/ip-mib/inetNetT=
oMediaTable/inetNetToMediaTable_data_access.lo mibgroup/ip-mib/ipSystemStat=
sTable/ipSystemStatsTable.lo mibgroup/ip-mib/ipSystemStatsTable/ipSystemSta=
tsTable_interface.lo mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_=
data_access.lo mibgroup/ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTa=
ble.lo mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable.lo mibgroup/ip-mib/ipI=
fStatsTable/ipIfStatsTable_interface.lo mibgroup/ip-mib/ipIfStatsTable/ipIf=
StatsTable_data_access.lo mibgroup/ip-forward-mib/ipCidrRouteTable/ipCidrRo=
uteTable.lo mibgroup/ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable.l=
o mibgroup/tcp-mib/tcpConnectionTable/tcpConnectionTable.lo mibgroup/tcp-mi=
b/tcpListenerTable/tcpListenerTable.lo mibgroup/udp-mib/udpEndpointTable/ud=
pEndpointTable.lo mibgroup/hardware/fsys/hw_fsys.lo mibgroup/hardware/fsys/=
fsys_mntent.lo mibgroup/hardware/memory/hw_mem.lo mibgroup/hardware/memory/=
memory_linux.lo mibgroup/hardware/cpu/cpu.lo mibgroup/hardware/cpu/cpu_linu=
x.lo mibgroup/snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFilterT=
able_interface.lo mibgroup/snmp-notification-mib/snmpNotifyFilterTable/snmp=
NotifyFilterTable_data_access.lo mibgroup/host/data_access/swinst_pkginfo.l=
o mibgroup/host/data_access/swrun_procfs_status.lo mibgroup/if-mib/data_acc=
ess/interface.lo mibgroup/if-mib/ifTable/ifTable_interface.lo mibgroup/if-m=
ib/ifTable/ifTable_data_access.lo mibgroup/if-mib/ifXTable/ifXTable_interfa=
ce.lo mibgroup/if-mib/ifXTable/ifXTable_data_access.lo mibgroup/ip-mib/ipAd=
dressTable/ipAddressTable_interface.lo mibgroup/ip-mib/ipAddressTable/ipAdd=
ressTable_data_access.lo mibgroup/ip-mib/ipAddressPrefixTable/ipAddressPref=
ixTable_interface.lo mibgroup/ip-mib/ipAddressPrefixTable/ipAddressPrefixTa=
ble_data_access.lo mibgroup/ip-mib/ipDefaultRouterTable/ipDefaultRouterTabl=
e_interface.lo mibgroup/ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_da=
ta_access.lo mibgroup/ip-mib/ipDefaultRouterTable/ipDefaultRouterTable_data=
_get.lo mibgroup/ip-mib/data_access/arp_common.lo mibgroup/ip-mib/data_acce=
ss/arp_netlink.lo mibgroup/ip-mib/data_access/systemstats_common.lo mibgrou=
p/ip-mib/data_access/systemstats_linux.lo mibgroup/ip-mib/data_access/scala=
rs_linux.lo mibgroup/ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable=
_interface.lo mibgroup/ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTab=
le_data_access.lo mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_get.lo=
 mibgroup/ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_interface.lo mib=
group/ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_data_access.lo mibgr=
oup/ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_interface.lo mibgr=
oup/ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_data_access.lo mib=
group/tcp-mib/data_access/tcpConn_common.lo mibgroup/tcp-mib/data_access/tc=
pConn_linux.lo mibgroup/util_funcs/get_pid_from_inode.lo mibgroup/tcp-mib/t=
cpConnectionTable/tcpConnectionTable_interface.lo mibgroup/tcp-mib/tcpConne=
ctionTable/tcpConnectionTable_data_access.lo mibgroup/tcp-mib/tcpListenerTa=
ble/tcpListenerTable_interface.lo mibgroup/tcp-mib/tcpListenerTable/tcpList=
enerTable_data_access.lo mibgroup/udp-mib/udpEndpointTable/udpEndpointTable=
_interface.lo mibgroup/udp-mib/udpEndpointTable/udpEndpointTable_data_acces=
s.lo mibgroup/if-mib/data_access/interface_linux.lo mibgroup/if-mib/data_ac=
cess/interface_ioctl.lo mibgroup/ip-mib/data_access/ipaddress_common.lo mib=
group/ip-mib/data_access/ipaddress_linux.lo mibgroup/ip-mib/data_access/def=
aultrouter_common.lo mibgroup/ip-mib/data_access/defaultrouter_linux.lo mib=
group/ip-mib/data_access/ipv6scopezone_common.lo mibgroup/ip-mib/data_acces=
s/ipv6scopezone_linux.lo mibgroup/ip-forward-mib/data_access/route_common.l=
o mibgroup/ip-forward-mib/data_access/route_linux.lo mibgroup/ip-forward-mi=
b/data_access/route_ioctl.lo mibgroup/udp-mib/data_access/udp_endpoint_comm=
on.lo mibgroup/udp-mib/data_access/udp_endpoint_linux.lo mibgroup/ip-mib/da=
ta_access/ipaddress_ioctl.lo mib_modules.lo auto_nlist.lo libnetsnmpagent.l=
a ../snmplib/libnetsnmp.la  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
 -lnl -lpci -ldl    -lm=20
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc  -march=3D=
armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfp=
u=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
--sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beag=
lebone -shared  -fPIC -DPIC  mibgroup/snmpv3/.libs/snmpMPDStats_5_5.o mibgr=
oup/snmpv3/.libs/usmStats_5_5.o mibgroup/snmpv3/.libs/snmpEngine.o mibgroup=
/snmpv3/.libs/usmUser.o mibgroup/mibII/.libs/snmp_mib_5_5.o mibgroup/mibII/=
.libs/system_mib.o mibgroup/mibII/.libs/sysORTable.o mibgroup/mibII/.libs/a=
t.o mibgroup/mibII/.libs/ip.o mibgroup/mibII/.libs/tcp.o mibgroup/mibII/.li=
bs/icmp.o mibgroup/mibII/.libs/udp.o mibgroup/mibII/.libs/vacm_vars.o mibgr=
oup/mibII/.libs/setSerialNo.o mibgroup/ucd-snmp/.libs/disk_hw.o mibgroup/uc=
d-snmp/.libs/proc.o mibgroup/ucd-snmp/.libs/versioninfo.o mibgroup/ucd-snmp=
/.libs/pass.o mibgroup/ucd-snmp/.libs/pass_persist.o mibgroup/ucd-snmp/.lib=
s/loadave.o mibgroup/agent/.libs/extend.o mibgroup/ucd-snmp/.libs/errormib.=
o mibgroup/ucd-snmp/.libs/file.o mibgroup/ucd-snmp/.libs/dlmod.o mibgroup/u=
cd-snmp/.libs/proxy.o mibgroup/ucd-snmp/.libs/logmatch.o mibgroup/ucd-snmp/=
.libs/memory.o mibgroup/ucd-snmp/.libs/vmstat.o mibgroup/notification/.libs=
/snmpNotifyTable.o mibgroup/notification/.libs/snmpNotifyFilterProfileTable=
.o mibgroup/notification-log-mib/.libs/notification_log.o mibgroup/target/.=
libs/target_counters_5_5.o mibgroup/target/.libs/snmpTargetAddrEntry.o mibg=
roup/target/.libs/snmpTargetParamsEntry.o mibgroup/target/.libs/target.o mi=
bgroup/agent/.libs/nsTransactionTable.o mibgroup/agent/.libs/nsModuleTable.=
o mibgroup/agent/.libs/nsDebug.o mibgroup/agent/.libs/nsCache.o mibgroup/ag=
ent/.libs/nsLogging.o mibgroup/agent/.libs/nsVacmAccessTable.o mibgroup/dis=
man/event/.libs/mteScalars.o mibgroup/disman/event/.libs/mteTrigger.o mibgr=
oup/disman/event/.libs/mteTriggerTable.o mibgroup/disman/event/.libs/mteTri=
ggerDeltaTable.o mibgroup/disman/event/.libs/mteTriggerExistenceTable.o mib=
group/disman/event/.libs/mteTriggerBooleanTable.o mibgroup/disman/event/.li=
bs/mteTriggerThresholdTable.o mibgroup/disman/event/.libs/mteTriggerConf.o =
mibgroup/disman/event/.libs/mteEvent.o mibgroup/disman/event/.libs/mteEvent=
Table.o mibgroup/disman/event/.libs/mteEventSetTable.o mibgroup/disman/even=
t/.libs/mteEventNotificationTable.o mibgroup/disman/event/.libs/mteEventCon=
f.o mibgroup/disman/event/.libs/mteObjects.o mibgroup/disman/event/.libs/mt=
eObjectsTable.o mibgroup/disman/event/.libs/mteObjectsConf.o mibgroup/disma=
n/schedule/.libs/schedCore.o mibgroup/disman/schedule/.libs/schedConf.o mib=
group/disman/schedule/.libs/schedTable.o mibgroup/utilities/.libs/override.=
o mibgroup/host/.libs/hrh_storage.o mibgroup/host/.libs/hrh_filesys.o mibgr=
oup/host/.libs/hrSWInstalledTable.o mibgroup/host/.libs/hrSWRunTable.o mibg=
roup/host/.libs/hr_system.o mibgroup/host/.libs/hr_device.o mibgroup/host/.=
libs/hr_other.o mibgroup/host/.libs/hr_proc.o mibgroup/host/.libs/hr_networ=
k.o mibgroup/host/.libs/hr_print.o mibgroup/host/.libs/hr_disk.o mibgroup/h=
ost/.libs/hr_partition.o mibgroup/util_funcs/.libs/header_generic.o mibgrou=
p/mibII/.libs/updates.o mibgroup/.libs/util_funcs.o mibgroup/mibII/.libs/ke=
rnel_linux.o mibgroup/mibII/.libs/ipAddr.o mibgroup/mibII/.libs/var_route.o=
 mibgroup/mibII/.libs/route_write.o mibgroup/mibII/.libs/tcpTable.o mibgrou=
p/mibII/.libs/udpTable.o mibgroup/mibII/.libs/vacm_context.o mibgroup/ip-mi=
b/.libs/ip_scalars.o mibgroup/util_funcs/.libs/header_simple_table.o mibgro=
up/util_funcs/.libs/restart.o mibgroup/ucd-snmp/.libs/pass_common.o mibgrou=
p/.libs/header_complex.o mibgroup/snmp-notification-mib/snmpNotifyFilterTab=
le/.libs/snmpNotifyFilterTable.o mibgroup/host/data_access/.libs/swinst.o m=
ibgroup/host/data_access/.libs/swrun.o mibgroup/host/.libs/hrSWRunPerfTable=
.o mibgroup/if-mib/ifTable/.libs/ifTable.o mibgroup/if-mib/ifXTable/.libs/i=
fXTable.o mibgroup/ip-mib/ipAddressTable/.libs/ipAddressTable.o mibgroup/ip=
-mib/ipAddressPrefixTable/.libs/ipAddressPrefixTable.o mibgroup/ip-mib/ipDe=
faultRouterTable/.libs/ipDefaultRouterTable.o mibgroup/ip-mib/inetNetToMedi=
aTable/.libs/inetNetToMediaTable.o mibgroup/ip-mib/inetNetToMediaTable/.lib=
s/inetNetToMediaTable_interface.o mibgroup/ip-mib/inetNetToMediaTable/.libs=
/inetNetToMediaTable_data_access.o mibgroup/ip-mib/ipSystemStatsTable/.libs=
/ipSystemStatsTable.o mibgroup/ip-mib/ipSystemStatsTable/.libs/ipSystemStat=
sTable_interface.o mibgroup/ip-mib/ipSystemStatsTable/.libs/ipSystemStatsTa=
ble_data_access.o mibgroup/ip-mib/ipv6ScopeZoneIndexTable/.libs/ipv6ScopeZo=
neIndexTable.o mibgroup/ip-mib/ipIfStatsTable/.libs/ipIfStatsTable.o mibgro=
up/ip-mib/ipIfStatsTable/.libs/ipIfStatsTable_interface.o mibgroup/ip-mib/i=
pIfStatsTable/.libs/ipIfStatsTable_data_access.o mibgroup/ip-forward-mib/ip=
CidrRouteTable/.libs/ipCidrRouteTable.o mibgroup/ip-forward-mib/inetCidrRou=
teTable/.libs/inetCidrRouteTable.o mibgroup/tcp-mib/tcpConnectionTable/.lib=
s/tcpConnectionTable.o mibgroup/tcp-mib/tcpListenerTable/.libs/tcpListenerT=
able.o mibgroup/udp-mib/udpEndpointTable/.libs/udpEndpointTable.o mibgroup/=
hardware/fsys/.libs/hw_fsys.o mibgroup/hardware/fsys/.libs/fsys_mntent.o mi=
bgroup/hardware/memory/.libs/hw_mem.o mibgroup/hardware/memory/.libs/memory=
_linux.o mibgroup/hardware/cpu/.libs/cpu.o mibgroup/hardware/cpu/.libs/cpu_=
linux.o mibgroup/snmp-notification-mib/snmpNotifyFilterTable/.libs/snmpNoti=
fyFilterTable_interface.o mibgroup/snmp-notification-mib/snmpNotifyFilterTa=
ble/.libs/snmpNotifyFilterTable_data_access.o mibgroup/host/data_access/.li=
bs/swinst_pkginfo.o mibgroup/host/data_access/.libs/swrun_procfs_status.o m=
ibgroup/if-mib/data_access/.libs/interface.o mibgroup/if-mib/ifTable/.libs/=
ifTable_interface.o mibgroup/if-mib/ifTable/.libs/ifTable_data_access.o mib=
group/if-mib/ifXTable/.libs/ifXTable_interface.o mibgroup/if-mib/ifXTable/.=
libs/ifXTable_data_access.o mibgroup/ip-mib/ipAddressTable/.libs/ipAddressT=
able_interface.o mibgroup/ip-mib/ipAddressTable/.libs/ipAddressTable_data_a=
ccess.o mibgroup/ip-mib/ipAddressPrefixTable/.libs/ipAddressPrefixTable_int=
erface.o mibgroup/ip-mib/ipAddressPrefixTable/.libs/ipAddressPrefixTable_da=
ta_access.o mibgroup/ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterTable=
_interface.o mibgroup/ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterTabl=
e_data_access.o mibgroup/ip-mib/ipDefaultRouterTable/.libs/ipDefaultRouterT=
able_data_get.o mibgroup/ip-mib/data_access/.libs/arp_common.o mibgroup/ip-=
mib/data_access/.libs/arp_netlink.o mibgroup/ip-mib/data_access/.libs/syste=
mstats_common.o mibgroup/ip-mib/data_access/.libs/systemstats_linux.o mibgr=
oup/ip-mib/data_access/.libs/scalars_linux.o mibgroup/ip-mib/ipv6ScopeZoneI=
ndexTable/.libs/ipv6ScopeZoneIndexTable_interface.o mibgroup/ip-mib/ipv6Sco=
peZoneIndexTable/.libs/ipv6ScopeZoneIndexTable_data_access.o mibgroup/ip-mi=
b/ipIfStatsTable/.libs/ipIfStatsTable_data_get.o mibgroup/ip-forward-mib/ip=
CidrRouteTable/.libs/ipCidrRouteTable_interface.o mibgroup/ip-forward-mib/i=
pCidrRouteTable/.libs/ipCidrRouteTable_data_access.o mibgroup/ip-forward-mi=
b/inetCidrRouteTable/.libs/inetCidrRouteTable_interface.o mibgroup/ip-forwa=
rd-mib/inetCidrRouteTable/.libs/inetCidrRouteTable_data_access.o mibgroup/t=
cp-mib/data_access/.libs/tcpConn_common.o mibgroup/tcp-mib/data_access/.lib=
s/tcpConn_linux.o mibgroup/util_funcs/.libs/get_pid_from_inode.o mibgroup/t=
cp-mib/tcpConnectionTable/.libs/tcpConnectionTable_interface.o mibgroup/tcp=
-mib/tcpConnectionTable/.libs/tcpConnectionTable_data_access.o mibgroup/tcp=
-mib/tcpListenerTable/.libs/tcpListenerTable_interface.o mibgroup/tcp-mib/t=
cpListenerTable/.libs/tcpListenerTable_data_access.o mibgroup/udp-mib/udpEn=
dpointTable/.libs/udpEndpointTable_interface.o mibgroup/udp-mib/udpEndpoint=
Table/.libs/udpEndpointTable_data_access.o mibgroup/if-mib/data_access/.lib=
s/interface_linux.o mibgroup/if-mib/data_access/.libs/interface_ioctl.o mib=
group/ip-mib/data_access/.libs/ipaddress_common.o mibgroup/ip-mib/data_acce=
ss/.libs/ipaddress_linux.o mibgroup/ip-mib/data_access/.libs/defaultrouter_=
common.o mibgroup/ip-mib/data_access/.libs/defaultrouter_linux.o mibgroup/i=
p-mib/data_access/.libs/ipv6scopezone_common.o mibgroup/ip-mib/data_access/=
.libs/ipv6scopezone_linux.o mibgroup/ip-forward-mib/data_access/.libs/route=
_common.o mibgroup/ip-forward-mib/data_access/.libs/route_linux.o mibgroup/=
ip-forward-mib/data_access/.libs/route_ioctl.o mibgroup/udp-mib/data_access=
/.libs/udp_endpoint_common.o mibgroup/udp-mib/data_access/.libs/udp_endpoin=
t_linux.o mibgroup/ip-mib/data_access/.libs/ipaddress_ioctl.o .libs/mib_mod=
ules.o .libs/auto_nlist.o   -L/home/jack/Projects/poky-denzil.git/r0005-new=
/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5=
.7.1/snmplib/.libs ./.libs/libnetsnmpagent.so /home/jack/Projects/poky-denz=
il.git/r0005-new/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1=
-r3.3/net-snmp-5.7.1/snmplib/.libs/libnetsnmp.so ../snmplib/.libs/libnetsnm=
p.so -lcrypto /home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/be=
aglebone/usr/lib/libnl.so -lpci -ldl -lm  -march=3Darmv7-a -mthumb-interwor=
k -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-s=
tyle=3Dgnu -Wl,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/=
r0005-new/tmp/sysroots/beaglebone -O2 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed   -Wl,-soname -Wl,libnetsnmpmibs.so.30 -o .libs/libnetsnmpmibs.so=
.30.0.1
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmpmibs.=
so.30" && ln -s "libnetsnmpmibs.so.30.0.1" "libnetsnmpmibs.so.30")
arm-poky-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libnetsnmpmibs.=
so" && ln -s "libnetsnmpmibs.so.30.0.1" "libnetsnmpmibs.so")
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ar cru .libs/l=
ibnetsnmpmibs.a  mibgroup/snmpv3/snmpMPDStats_5_5.o mibgroup/snmpv3/usmStat=
s_5_5.o mibgroup/snmpv3/snmpEngine.o mibgroup/snmpv3/usmUser.o mibgroup/mib=
II/snmp_mib_5_5.o mibgroup/mibII/system_mib.o mibgroup/mibII/sysORTable.o m=
ibgroup/mibII/at.o mibgroup/mibII/ip.o mibgroup/mibII/tcp.o mibgroup/mibII/=
icmp.o mibgroup/mibII/udp.o mibgroup/mibII/vacm_vars.o mibgroup/mibII/setSe=
rialNo.o mibgroup/ucd-snmp/disk_hw.o mibgroup/ucd-snmp/proc.o mibgroup/ucd-=
snmp/versioninfo.o mibgroup/ucd-snmp/pass.o mibgroup/ucd-snmp/pass_persist.=
o mibgroup/ucd-snmp/loadave.o mibgroup/agent/extend.o mibgroup/ucd-snmp/err=
ormib.o mibgroup/ucd-snmp/file.o mibgroup/ucd-snmp/dlmod.o mibgroup/ucd-snm=
p/proxy.o mibgroup/ucd-snmp/logmatch.o mibgroup/ucd-snmp/memory.o mibgroup/=
ucd-snmp/vmstat.o mibgroup/notification/snmpNotifyTable.o mibgroup/notifica=
tion/snmpNotifyFilterProfileTable.o mibgroup/notification-log-mib/notificat=
ion_log.o mibgroup/target/target_counters_5_5.o mibgroup/target/snmpTargetA=
ddrEntry.o mibgroup/target/snmpTargetParamsEntry.o mibgroup/target/target.o=
 mibgroup/agent/nsTransactionTable.o mibgroup/agent/nsModuleTable.o mibgrou=
p/agent/nsDebug.o mibgroup/agent/nsCache.o mibgroup/agent/nsLogging.o mibgr=
oup/agent/nsVacmAccessTable.o mibgroup/disman/event/mteScalars.o mibgroup/d=
isman/event/mteTrigger.o mibgroup/disman/event/mteTriggerTable.o mibgroup/d=
isman/event/mteTriggerDeltaTable.o mibgroup/disman/event/mteTriggerExistenc=
eTable.o mibgroup/disman/event/mteTriggerBooleanTable.o mibgroup/disman/eve=
nt/mteTriggerThresholdTable.o mibgroup/disman/event/mteTriggerConf.o mibgro=
up/disman/event/mteEvent.o mibgroup/disman/event/mteEventTable.o mibgroup/d=
isman/event/mteEventSetTable.o mibgroup/disman/event/mteEventNotificationTa=
ble.o mibgroup/disman/event/mteEventConf.o mibgroup/disman/event/mteObjects=
.o mibgroup/disman/event/mteObjectsTable.o mibgroup/disman/event/mteObjects=
Conf.o mibgroup/disman/schedule/schedCore.o mibgroup/disman/schedule/schedC=
onf.o mibgroup/disman/schedule/schedTable.o mibgroup/utilities/override.o m=
ibgroup/host/hrh_storage.o mibgroup/host/hrh_filesys.o mibgroup/host/hrSWIn=
stalledTable.o mibgroup/host/hrSWRunTable.o mibgroup/host/hr_system.o mibgr=
oup/host/hr_device.o mibgroup/host/hr_other.o mibgroup/host/hr_proc.o mibgr=
oup/host/hr_network.o mibgroup/host/hr_print.o mibgroup/host/hr_disk.o mibg=
roup/host/hr_partition.o mibgroup/util_funcs/header_generic.o mibgroup/mibI=
I/updates.o mibgroup/util_funcs.o mibgroup/mibII/kernel_linux.o mibgroup/mi=
bII/ipAddr.o mibgroup/mibII/var_route.o mibgroup/mibII/route_write.o mibgro=
up/mibII/tcpTable.o mibgroup/mibII/udpTable.o mibgroup/mibII/vacm_context.o=
 mibgroup/ip-mib/ip_scalars.o mibgroup/util_funcs/header_simple_table.o mib=
group/util_funcs/restart.o mibgroup/ucd-snmp/pass_common.o mibgroup/header_=
complex.o mibgroup/snmp-notification-mib/snmpNotifyFilterTable/snmpNotifyFi=
lterTable.o mibgroup/host/data_access/swinst.o mibgroup/host/data_access/sw=
run.o mibgroup/host/hrSWRunPerfTable.o mibgroup/if-mib/ifTable/ifTable.o mi=
bgroup/if-mib/ifXTable/ifXTable.o mibgroup/ip-mib/ipAddressTable/ipAddressT=
able.o mibgroup/ip-mib/ipAddressPrefixTable/ipAddressPrefixTable.o mibgroup=
/ip-mib/ipDefaultRouterTable/ipDefaultRouterTable.o mibgroup/ip-mib/inetNet=
ToMediaTable/inetNetToMediaTable.o mibgroup/ip-mib/inetNetToMediaTable/inet=
NetToMediaTable_interface.o mibgroup/ip-mib/inetNetToMediaTable/inetNetToMe=
diaTable_data_access.o mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTabl=
e.o mibgroup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_interface.o mibgr=
oup/ip-mib/ipSystemStatsTable/ipSystemStatsTable_data_access.o mibgroup/ip-=
mib/ipv6ScopeZoneIndexTable/ipv6ScopeZoneIndexTable.o mibgroup/ip-mib/ipIfS=
tatsTable/ipIfStatsTable.o mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_in=
terface.o mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_data_access.o mibgr=
oup/ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable.o mibgroup/ip-forward-=
mib/inetCidrRouteTable/inetCidrRouteTable.o mibgroup/tcp-mib/tcpConnectionT=
able/tcpConnectionTable.o mibgroup/tcp-mib/tcpListenerTable/tcpListenerTabl=
e.o mibgroup/udp-mib/udpEndpointTable/udpEndpointTable.o mibgroup/hardware/=
fsys/hw_fsys.o mibgroup/hardware/fsys/fsys_mntent.o mibgroup/hardware/memor=
y/hw_mem.o mibgroup/hardware/memory/memory_linux.o mibgroup/hardware/cpu/cp=
u.o mibgroup/hardware/cpu/cpu_linux.o mibgroup/snmp-notification-mib/snmpNo=
tifyFilterTable/snmpNotifyFilterTable_interface.o mibgroup/snmp-notificatio=
n-mib/snmpNotifyFilterTable/snmpNotifyFilterTable_data_access.o mibgroup/ho=
st/data_access/swinst_pkginfo.o mibgroup/host/data_access/swrun_procfs_stat=
us.o mibgroup/if-mib/data_access/interface.o mibgroup/if-mib/ifTable/ifTabl=
e_interface.o mibgroup/if-mib/ifTable/ifTable_data_access.o mibgroup/if-mib=
/ifXTable/ifXTable_interface.o mibgroup/if-mib/ifXTable/ifXTable_data_acces=
s.o mibgroup/ip-mib/ipAddressTable/ipAddressTable_interface.o mibgroup/ip-m=
ib/ipAddressTable/ipAddressTable_data_access.o mibgroup/ip-mib/ipAddressPre=
fixTable/ipAddressPrefixTable_interface.o mibgroup/ip-mib/ipAddressPrefixTa=
ble/ipAddressPrefixTable_data_access.o mibgroup/ip-mib/ipDefaultRouterTable=
/ipDefaultRouterTable_interface.o mibgroup/ip-mib/ipDefaultRouterTable/ipDe=
faultRouterTable_data_access.o mibgroup/ip-mib/ipDefaultRouterTable/ipDefau=
ltRouterTable_data_get.o mibgroup/ip-mib/data_access/arp_common.o mibgroup/=
ip-mib/data_access/arp_netlink.o mibgroup/ip-mib/data_access/systemstats_co=
mmon.o mibgroup/ip-mib/data_access/systemstats_linux.o mibgroup/ip-mib/data=
_access/scalars_linux.o mibgroup/ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZo=
neIndexTable_interface.o mibgroup/ip-mib/ipv6ScopeZoneIndexTable/ipv6ScopeZ=
oneIndexTable_data_access.o mibgroup/ip-mib/ipIfStatsTable/ipIfStatsTable_d=
ata_get.o mibgroup/ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_interfa=
ce.o mibgroup/ip-forward-mib/ipCidrRouteTable/ipCidrRouteTable_data_access.=
o mibgroup/ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_interface.o=
 mibgroup/ip-forward-mib/inetCidrRouteTable/inetCidrRouteTable_data_access.=
o mibgroup/tcp-mib/data_access/tcpConn_common.o mibgroup/tcp-mib/data_acces=
s/tcpConn_linux.o mibgroup/util_funcs/get_pid_from_inode.o mibgroup/tcp-mib=
/tcpConnectionTable/tcpConnectionTable_interface.o mibgroup/tcp-mib/tcpConn=
ectionTable/tcpConnectionTable_data_access.o mibgroup/tcp-mib/tcpListenerTa=
ble/tcpListenerTable_interface.o mibgroup/tcp-mib/tcpListenerTable/tcpListe=
nerTable_data_access.o mibgroup/udp-mib/udpEndpointTable/udpEndpointTable_i=
nterface.o mibgroup/udp-mib/udpEndpointTable/udpEndpointTable_data_access.o=
 mibgroup/if-mib/data_access/interface_linux.o mibgroup/if-mib/data_access/=
interface_ioctl.o mibgroup/ip-mib/data_access/ipaddress_common.o mibgroup/i=
p-mib/data_access/ipaddress_linux.o mibgroup/ip-mib/data_access/defaultrout=
er_common.o mibgroup/ip-mib/data_access/defaultrouter_linux.o mibgroup/ip-m=
ib/data_access/ipv6scopezone_common.o mibgroup/ip-mib/data_access/ipv6scope=
zone_linux.o mibgroup/ip-forward-mib/data_access/route_common.o mibgroup/ip=
-forward-mib/data_access/route_linux.o mibgroup/ip-forward-mib/data_access/=
route_ioctl.o mibgroup/udp-mib/data_access/udp_endpoint_common.o mibgroup/u=
dp-mib/data_access/udp_endpoint_linux.o mibgroup/ip-mib/data_access/ipaddre=
ss_ioctl.o mib_modules.o auto_nlist.o
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-ranlib .libs/l=
ibnetsnmpmibs.a
arm-poky-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libnetsnmpmibs=
.la" && ln -s "../libnetsnmpmibs.la" "libnetsnmpmibs.la" )
: libnetsnmpmibs.la
../arm-poky-linux-gnueabi-libtool  --mode=3Dcompile arm-poky-linux-gnueabi-=
gcc  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -W=
l,--as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp=
/sysroots/beaglebone -I../include -I. -I../agent -I../agent/mibgroup -I../s=
nmplib   -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -=
Ulinux -Dlinux=3Dlinux  -c -o snmpd.lo snmpd.c
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c snmpd.c  -fPIC -DPIC -o .libs/snmpd.o
arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
-sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beagl=
ebone -I../include -I. -I../agent -I../agent/mibgroup -I../snmplib -fno-str=
ict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux -Dlinux=3D=
linux -c snmpd.c -o snmpd.o >/dev/null 2>&1
../arm-poky-linux-gnueabi-libtool  --mode=3Dlink arm-poky-linux-gnueabi-gcc=
  -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3D=
softfp -mfpu=3Dneon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed --sysroot=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sy=
sroots/beaglebone -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debu=
g-types -Ulinux -Dlinux=3Dlinux  -o snmpd snmpd.lo  -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed  libnetsnmpagent.la libnetsnmpmibs.la ../snmplib/li=
bnetsnmp.la -lm   =20
arm-poky-linux-gnueabi-libtool: link: arm-poky-linux-gnueabi-gcc -march=3Da=
rmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dn=
eon -mtune=3Dcortex-a8 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sys=
root=3D/home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beaglebon=
e -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types -Ulinux =
-Dlinux=3Dlinux -o .libs/snmpd .libs/snmpd.o -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed  ./.libs/libnetsnmpagent.so ./.libs/libnetsnmpmibs.so /hom=
e/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a-vfp-neon-poky-lin=
ux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/agent/.libs/libnetsnmpagent.s=
o /home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a-vfp-neon-po=
ky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/snmplib/.libs/libnetsnm=
p.so /home/jack/Projects/poky-denzil.git/r0005-new/tmp/sysroots/beaglebone/=
usr/lib/libnl.so -lpci -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lm=20
.libs/snmpd.o: In function `main':
/home/jack/Projects/poky-denzil.git/r0005-new/tmp/work/armv7a-vfp-neERROR: =
Function failed: do_compile (see /home/jack/Projects/poky-denzil.git/r0005-=
new/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/temp/lo=
g.do_compile.18915 for further information)
on-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7.1/agent/snmpd.c:459:=
 undefined reference to `netsnmp_sd_listen_fds'
collect2: error: ld returned 1 exit status
make[1]: *** [snmpd] Error 1
make[1]: Leaving directory `/home/jack/Projects/poky-denzil.git/r0005-new/t=
mp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-snmp-5.7.1-r3.3/net-snmp-5.7=
.1/agent'
make: *** [subdirs] Error 1
ERROR: oe_runmake failed

--------------080906060602050406090300--
