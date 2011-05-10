Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QJnVb-0005lR-N2 for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:01:55 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx04.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QJnQ2-0006TR-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 15:56:10 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id 1BBCB81A74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 15:56:10 +0200 (CEST)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 15:55:50 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-9-generic; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201105101555.50984.sgh@sgh.dk>
Subject: acpid-1.0.10-r5.1 fails compilation
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
X-List-Received-Date: Tue, 10 May 2011 14:01:55 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

Current master fails during acpid-compilation.

ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/wo=
rk/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235
Log data follows:
| ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/=
tmp/work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235 fo=
r further information)
| + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/acpid-1=
=2E0.10-r5.1/acpid-1.0.10
| + do_compile
| + oe_runmake 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=
=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=
=3Di686-angstrom-linux-
| + oenote make -j 8 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sy=
sroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' C=
ROSS=3Di686-angstrom-linux-
| + echo NOTE: 'make -j 8 CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro =
=2D-sysroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-li=
nux CROSS=3Di686-angstrom-linux-'
| NOTE: make -j 8 CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroo=
t=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux CROSS=
=3Di686-angstrom-linux-
| + make -j 8 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=
=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=
=3Di686-angstrom-linux-
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
acpid.o acpid.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
acpi_ids.o acpi_ids.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
connection_list.o connection_list.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
event.o event.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
input_layer.o input_layer.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
libnetlink.o libnetlink.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
netlink.o netlink.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
proc.o proc.c
| i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-new-=
oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef -W=
shadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
sock.o sock.c
| cc1: warnings being treated as errors
| libnetlink.c: In function 'addraw_l':
| libnetlink.c:521:56: error: comparison between signed and unsigned intege=
r expressions
| make: *** [libnetlink.o] Error 1
| make: *** Waiting for unfinished jobs....
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package acpid-1.0.10-r5.1: task do_compile: Failed

=2D-=20
S=F8ren Holm


