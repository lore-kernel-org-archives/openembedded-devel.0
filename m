Received: from mis07.de ([93.186.196.80])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mailings@hardware-datenbank.de>) id 1PtOWH-0007aP-Mw
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 19:05:30 +0100
Received: by mis07.de (Postfix, from userid 65534)
	id 36735144E002; Sat, 26 Feb 2011 18:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on mis07.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=ALL_TRUSTED,AWL,
	MIME_QP_LONG_LINE autolearn=disabled version=3.2.5
Received: from PcVirus (p5DC8FC01.dip.t-dialin.net [93.200.252.1])
	by mis07.de (Postfix) with ESMTPA id 2A13B144E001
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 18:54:13 +0100 (CET)
Message-ID: <ED44615554D1473B9DB23F44CFFDE60C@PcVirus>
From: "Rath" <mailings@hardware-datenbank.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Feb 2011 18:54:03 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3508.1109
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3508.1109
Subject: Release-2011.03 NGW100 build issues
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
X-List-Received-Date: Sat, 26 Feb 2011 18:05:30 -0000
X-Groupsio-MsgNum: 29729
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0087_01CBD5E6.8935CD30"

------=_NextPart_000_0087_01CBD5E6.8935CD30
Content-Type: text/plain;
	format=flowed;
	charset="utf-8";
	reply-type=original
Content-Transfer-Encoding: quoted-printable

Hi,

I have tried to build the console-image and qt4-embedded for the NGW100 a=
nd=20
got some build errors.
=E2=80=9CuClibc-0.9.30.2=E2=80=9D and =E2=80=9Cstrace-4.5.18=E2=80=9D are=
 broken for bitbaking=20
console-image. You can find the (shortened) compile logs attached.

For fixing strace, =E2=80=9C#include <linux/socket.h>=E2=80=9D needs to b=
e changed to=20
=E2=80=9C#include <sys/socket.h>=E2=80=9D in the patched configure.ac and
uClibc compiles successful after removing the definition of =E2=80=9Csa_f=
amily_t=E2=80=9D in=20
=E2=80=9Clinux/socket.h=E2=80=9D

Furthermore, postgresql-8.4.7 fails because of a missing EXTRA_OECONF_avr=
32=3D=20
=E2=80=9C=E2=80=94disable-spinlocks=E2=80=9D and qt4-embedded fails to li=
nk.

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "testing-release-2011.03"
METADATA_REVISION =3D "5dbd8d6"
TARGET_ARCH       =3D "avr32"
TARGET_OS         =3D "linux-uclibc"
MACHINE           =3D "atngw100"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v20110225"

Regards, Joern=20

------=_NextPart_000_0087_01CBD5E6.8935CD30
Content-Type: application/octet-stream;
	name="postgresql-8.4.7.do_compile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="postgresql-8.4.7.do_compile"

NOTE: make
make -C doc all
make[1]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/doc'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/doc'
make -C src all
make[1]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src'
make -C port all
make[2]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/port'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/port'
make -C timezone all
make[2]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/timezone'
make -C ../../src/port all
make[3]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/port'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/port'
make[2]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/timezone'
make -C backend all
make[2]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend'
make -C ../../src/port all
make[3]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/port'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/port'
make -C access all
make[3]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access'
make -C common all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/common'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/common'
make -C gist all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/gist'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/gist'
make -C hash all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/hash'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/hash'
make -C heap all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/heap'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/heap'
make -C index all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/index'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/index'
make -C nbtree all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/nbtree'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/nbtree'
make -C transam all
make[4]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgre=
sql-8.4.7/src/backend/access/transam'
avr32-angstrom-linux-uclibc-gcc -march=3Dap -Os -fomit-frame-pointer -Wall =
-Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-=
labels -fno-strict-aliasing -fwrapv -I../../../../src/include -D_GNU_SOURCE=
   -c -o xlog.o xlog.c
In file included from ../../../../src/include/storage/spin.h:59,
                 from xlog.c:49:
../../../../src/include/storage/s_lock.h:824:2: error: #error PostgreSQL do=
es not have native spinlock support on this platform. To continue the compi=
lation, rerun configure using --disable-spinlocks. However, performance wil=
l be poor. Please report this to pgsql-bugs@postgresql.org.
In file included from ../../../../src/include/storage/spin.h:59,
                 from xlog.c:49:
../../../../src/include/storage/s_lock.h:881: warning: type defaults to 'in=
t' in declaration of 'slock_t'
../../../../src/include/storage/s_lock.h:881: error: expected ';', ',' or '=
)' before '*' token
../../../../src/include/storage/s_lock.h:891: warning: type defaults to 'in=
t' in declaration of 'slock_t'
../../../../src/include/storage/s_lock.h:891: error: expected ';', ',' or '=
)' before '*' token
xlog.c:363: error: expected specifier-qualifier-list before 'slock_t'
xlog.c: In function 'XLogInsert':
xlog.c:1034: warning: implicit declaration of function 'tas'
xlog.c:1034: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1034: warning: implicit declaration of function 's_lock'
xlog.c:1034: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1040: error: expected ')' before 'slock_t'
xlog.c:1040: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1040: warning: type defaults to 'int' in declaration of 'type name'
xlog.c:1074: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1074: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1080: error: expected ')' before 'slock_t'
xlog.c:1080: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1080: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'AdvanceXLInsertBuffer':
xlog.c:1362: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1362: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1366: error: expected ')' before 'slock_t'
xlog.c:1366: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1366: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLogWrite':
xlog.c:1763: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1763: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1769: error: expected ')' before 'slock_t'
xlog.c:1769: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1769: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLogSetAsyncCommitLSN':
xlog.c:1785: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1785: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1788: error: expected ')' before 'slock_t'
xlog.c:1788: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1788: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'UpdateMinRecoveryPoint':
xlog.c:1838: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1838: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1840: error: expected ')' before 'slock_t'
xlog.c:1840: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1840: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLogFlush':
xlog.c:1918: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1918: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1922: error: expected ')' before 'slock_t'
xlog.c:1922: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:1922: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLogBackgroundFlush':
xlog.c:2020: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2020: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2023: error: expected ')' before 'slock_t'
xlog.c:2023: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2023: warning: type defaults to 'int' in declaration of 'type name'
xlog.c:2035: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2035: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2037: error: expected ')' before 'slock_t'
xlog.c:2037: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2037: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLogAsyncCommitFlush':
xlog.c:2102: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2102: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2104: error: expected ')' before 'slock_t'
xlog.c:2104: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2104: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLogNeedsFlush':
xlog.c:2131: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2131: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2133: error: expected ')' before 'slock_t'
xlog.c:2133: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:2133: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'XLOGShmemInit':
xlog.c:4618: error: expected ')' before 'slock_t'
xlog.c:4618: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:4618: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'StartupXLOG':
xlog.c:5540: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5540: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5542: error: expected ')' before 'slock_t'
xlog.c:5542: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5542: warning: type defaults to 'int' in declaration of 'type name'
xlog.c:5661: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5661: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5663: error: expected ')' before 'slock_t'
xlog.c:5663: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5663: warning: type defaults to 'int' in declaration of 'type name'
xlog.c:5928: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5928: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5930: error: expected ')' before 'slock_t'
xlog.c:5930: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5930: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'RecoveryInProgress':
xlog.c:5959: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5959: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5961: error: expected ')' before 'slock_t'
xlog.c:5961: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:5961: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'GetRedoRecPtr':
xlog.c:6169: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6169: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6172: error: expected ')' before 'slock_t'
xlog.c:6172: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6172: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'GetInsertRecPtr':
xlog.c:6193: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6193: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6195: error: expected ')' before 'slock_t'
xlog.c:6195: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6195: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'GetNextXidAndEpoch':
xlog.c:6236: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6236: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6239: error: expected ')' before 'slock_t'
xlog.c:6239: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6239: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'CreateCheckPoint':
xlog.c:6535: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6535: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6537: error: expected ')' before 'slock_t'
xlog.c:6537: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6537: warning: type defaults to 'int' in declaration of 'type name'
xlog.c:6689: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6689: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6692: error: expected ')' before 'slock_t'
xlog.c:6692: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6692: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'RecoveryRestartPoint':
xlog.c:6804: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6804: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6807: error: expected ')' before 'slock_t'
xlog.c:6807: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6807: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'CreateRestartPoint':
xlog.c:6837: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6837: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6840: error: expected ')' before 'slock_t'
xlog.c:6840: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:6840: warning: type defaults to 'int' in declaration of 'type name'
xlog.c: In function 'pg_current_xlog_location':
xlog.c:7676: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:7676: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:7678: error: expected ')' before 'slock_t'
xlog.c:7678: error: 'XLogCtlData' has no member named 'info_lck'
xlog.c:7678: warning: type defaults to 'int' in declaration of 'type name'
make[4]: *** [xlog.o] Error 1
make[4]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access/transam'
make[3]: *** [transam-recursive] Error 2
make[3]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend/access'
make[2]: *** [access-recursive] Error 2
make[2]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src/backend'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/postgresql-8.4.7-r5.0/postgres=
ql-8.4.7/src'
make: *** [all] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

------=_NextPart_000_0087_01CBD5E6.8935CD30
Content-Type: application/octet-stream;
	name="strace-4.5.18.do_compile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="strace-4.5.18.do_compile"

NOTE: make
make  all-am
make[1]: Entering directory `/home/administrator/openembedded/build/tmp-ang=
strom_2010_x/work/avr32-angstrom-linux-uclibc/strace-4.5.18-r2/strace-4.5.1=
8'
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT s=
trace.o -MD -MP -MF .deps/strace.Tpo -c -o strace.o strace.c
mv -f .deps/strace.Tpo .deps/strace.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT s=
yscall.o -MD -MP -MF .deps/syscall.Tpo -c -o syscall.o syscall.c
syscall.c: In function 'syscall_fixup':
syscall.c:1358: warning: unused variable 'pid'
syscall.c: In function 'syscall_enter':
syscall.c:1971: warning: unused variable 'pid'
mv -f .deps/syscall.Tpo .deps/syscall.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT c=
ount.o -MD -MP -MF .deps/count.Tpo -c -o count.o count.c
mv -f .deps/count.Tpo .deps/count.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT u=
til.o -MD -MP -MF .deps/util.Tpo -c -o util.o util.c
mv -f .deps/util.Tpo .deps/util.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT d=
esc.o -MD -MP -MF .deps/desc.Tpo -c -o desc.o desc.c
mv -f .deps/desc.Tpo .deps/desc.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT f=
ile.o -MD -MP -MF .deps/file.Tpo -c -o file.o file.c
mv -f .deps/file.Tpo .deps/file.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT i=
pc.o -MD -MP -MF .deps/ipc.Tpo -c -o ipc.o ipc.c
mv -f .deps/ipc.Tpo .deps/ipc.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT i=
o.o -MD -MP -MF .deps/io.Tpo -c -o io.o io.c
mv -f .deps/io.Tpo .deps/io.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT i=
octl.o -MD -MP -MF .deps/ioctl.Tpo -c -o ioctl.o ioctl.c
mv -f .deps/ioctl.Tpo .deps/ioctl.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT m=
em.o -MD -MP -MF .deps/mem.Tpo -c -o mem.o mem.c
mv -f .deps/mem.Tpo .deps/mem.Po
avr32-angstrom-linux-uclibc-gcc -march=3Dap -DHAVE_CONFIG_H -I. -Ilinux/avr=
32 -I./linux/avr32 -Ilinux -I./linux   -Wall -Os -fomit-frame-pointer -MT n=
et.o -MD -MP -MF .deps/net.Tpo -c -o net.o net.c
net.c: In function 'printsock':
net.c:961: error: field 'nl' has incomplete type
make[1]: *** [net.o] Error 1
make[1]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/strace-4.5.18-r2/strace-4.5.18=
'
make: *** [all] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

------=_NextPart_000_0087_01CBD5E6.8935CD30
Content-Type: application/octet-stream;
	name="uClibc-0.9.30.2.do_compile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="uClibc-0.9.30.2.do_compile"


avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/rpc/xdr_mem.c -o l=
ibc/inet/rpc/xdr_mem.os -include ./include/libc-symbols.h -Wall -Wstrict-pr=
ototypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin=
 -nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit=
-frame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -f=
no-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old=
/sysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr3=
2 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/li=
nuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthre=
ad -I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/av=
r32-angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openemb=
edded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32=
-angstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/ope=
nembedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/a=
vr32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -fno-strict-aliasin=
g -MT libc/inet/rpc/xdr_mem.os -MD -MP -MF libc/inet/rpc/.xdr_mem.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/rpc/xdr_rec.c -o l=
ibc/inet/rpc/xdr_rec.os -include ./include/libc-symbols.h -Wall -Wstrict-pr=
ototypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin=
 -nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit=
-frame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -f=
no-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old=
/sysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr3=
2 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/li=
nuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthre=
ad -I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/av=
r32-angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openemb=
edded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32=
-angstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/ope=
nembedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/a=
vr32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -fno-strict-aliasin=
g -MT libc/inet/rpc/xdr_rec.os -MD -MP -MF libc/inet/rpc/.xdr_rec.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/rpc/xdr_reference.=
c -o libc/inet/rpc/xdr_reference.os -include ./include/libc-symbols.h -Wall=
 -Wstrict-prototypes -fno-strict-aliasing -march=3Dap -fno-stack-protector =
-fno-builtin -nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-as=
m -Os -fomit-frame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop=
-optimize -fno-tree-dominator-opts -fno-strength-reduce -I./libpthread/linu=
xthreads.old/sysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/=
sysdeps/avr32 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./l=
ibpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old =
-I./libpthread -I/home/administrator/openembedded/build/tmp-angstrom_2010_x=
/sysroots/avr32-angstrom-linux-uclibc/usr/include/ -isystem /home/administr=
ator/openembedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/l=
ib/gcc/avr32-angstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/admin=
istrator/openembedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr=
32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -fno-st=
rict-aliasing -MT libc/inet/rpc/xdr_reference.os -MD -MP -MF libc/inet/rpc/=
.xdr_reference.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/rpc/xdr_stdio.c -o=
 libc/inet/rpc/xdr_stdio.os -include ./include/libc-symbols.h -Wall -Wstric=
t-prototypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-bui=
ltin -nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -f=
omit-frame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimiz=
e -fno-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads=
.old/sysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/=
avr32 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthrea=
d/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libp=
thread -I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroot=
s/avr32-angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/ope=
nembedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/a=
vr32-angstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator=
/openembedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/g=
cc/avr32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -fno-strict-ali=
asing -MT libc/inet/rpc/xdr_stdio.os -MD -MP -MF libc/inet/rpc/.xdr_stdio.o=
s.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/ntohl.c -o libc/in=
et/ntohl.os -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -fn=
o-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -nostdinc -=
I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-frame-point=
er -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tree-domi=
nator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/uni=
x/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./libpth=
read/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.o=
ld/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/home/a=
dministrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-angstrom=
-linux-uclibc/usr/include/ -isystem /home/administrator/openembedded/build/=
tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angstrom-li=
nux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openembedded/bu=
ild/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angstro=
m-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/ntohl.os -MD -MP =
-MF libc/inet/.ntohl.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/getservice.c -o li=
bc/inet/getservice.os -include ./include/libc-symbols.h -Wall -Wstrict-prot=
otypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -=
nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-f=
rame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno=
-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/s=
ysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 =
-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linu=
xthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread=
 -I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembed=
ded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-a=
ngstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/opene=
mbedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr=
32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/getserv=
ice.os -MD -MP -MF libc/inet/.getservice.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/getproto.c -o libc=
/inet/getproto.os -include ./include/libc-symbols.h -Wall -Wstrict-prototyp=
es -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -nost=
dinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-frame=
-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tre=
e-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysde=
ps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./=
libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthr=
eads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/=
home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-an=
gstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembedded/=
build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angst=
rom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openembed=
ded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-a=
ngstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/getproto.os=
 -MD -MP -MF libc/inet/.getproto.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/hostid.c -o libc/i=
net/hostid.os -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -=
fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -nostdinc=
 -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-frame-poi=
nter -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tree-do=
minator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/u=
nix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./libp=
thread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads=
.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/home=
/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-angstr=
om-linux-uclibc/usr/include/ -isystem /home/administrator/openembedded/buil=
d/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angstrom-=
linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openembedded/=
build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angst=
rom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/hostid.os -MD -=
MP -MF libc/inet/.hostid.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/getnetent.c -o lib=
c/inet/getnetent.os -include ./include/libc-symbols.h -Wall -Wstrict-protot=
ypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -no=
stdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-fra=
me-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-t=
ree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sys=
deps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I=
./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxt=
hreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -=
I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-=
angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembedde=
d/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-ang=
strom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openemb=
edded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32=
-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/getnetent=
.os -MD -MP -MF libc/inet/.getnetent.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/getnetbynm.c -o li=
bc/inet/getnetbynm.os -include ./include/libc-symbols.h -Wall -Wstrict-prot=
otypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -=
nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-f=
rame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno=
-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/s=
ysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 =
-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linu=
xthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread=
 -I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembed=
ded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-a=
ngstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/opene=
mbedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr=
32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/getnetb=
ynm.os -MD -MP -MF libc/inet/.getnetbynm.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/getnetbyad.c -o li=
bc/inet/getnetbyad.os -include ./include/libc-symbols.h -Wall -Wstrict-prot=
otypes -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -=
nostdinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-f=
rame-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno=
-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/s=
ysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 =
-I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linu=
xthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread=
 -I/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembed=
ded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-a=
ngstrom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/opene=
mbedded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr=
32-angstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/getnetb=
yad.os -MD -MP -MF libc/inet/.getnetbyad.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/inet_net.c -o libc=
/inet/inet_net.os -include ./include/libc-symbols.h -Wall -Wstrict-prototyp=
es -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -nost=
dinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-frame=
-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tre=
e-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysde=
ps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./=
libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthr=
eads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/=
home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-an=
gstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembedded/=
build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angst=
rom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openembed=
ded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-a=
ngstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/inet_net.os=
 -MD -MP -MF libc/inet/.inet_net.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/herror.c -o libc/i=
net/herror.os -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -=
fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -nostdinc=
 -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-frame-poi=
nter -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tree-do=
minator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/u=
nix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./libp=
thread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads=
.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/home=
/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-angstr=
om-linux-uclibc/usr/include/ -isystem /home/administrator/openembedded/buil=
d/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angstrom-=
linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openembedded/=
build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angst=
rom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/herror.os -MD -=
MP -MF libc/inet/.herror.os.dep
avr32-angstrom-linux-uclibc-gcc -march=3Dap -c libc/inet/if_index.c -o libc=
/inet/if_index.os -include ./include/libc-symbols.h -Wall -Wstrict-prototyp=
es -fno-strict-aliasing -march=3Dap -fno-stack-protector -fno-builtin -nost=
dinc -I./include -I. -I./libc/sysdeps/linux/avr32 -fno-asm -Os -fomit-frame=
-pointer -std=3Dgnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tre=
e-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysde=
ps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./=
libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthr=
eads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/=
home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-an=
gstrom-linux-uclibc/usr/include/ -isystem /home/administrator/openembedded/=
build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-angst=
rom-linux-uclibc/4.2.2/include-fixed -isystem /home/administrator/openembed=
ded/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-a=
ngstrom-linux-uclibc/4.2.2/include -DNDEBUG -fPIC -MT libc/inet/if_index.os=
 -MD -MP -MF libc/inet/.if_index.os.dep
In file included from ./include/linux/netlink.h:4,
                 from ./include/linux/rtnetlink.h:5,
                 from libc/inet/netlinkaccess.h:34,
                 from libc/inet/if_index.c:36:
./include/linux/socket.h:19: error: redefinition of typedef 'sa_family_t'
./include/bits/sockaddr.h:29: error: previous declaration of 'sa_family_t' =
was here
make: *** [libc/inet/if_index.os] Error 1
FATAL: oe_runmake failed
ERROR: Function do_compile failed

------=_NextPart_000_0087_01CBD5E6.8935CD30
Content-Type: application/octet-stream;
	name="qt4-embedded-4.7.1.do_compile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="qt4-embedded-4.7.1.do_compile"


avr32-angstrom-linux-uclibc-g++ -march=3Dap -Wl,-rpath-link,/home/administr=
ator/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-angstrom-linux-u=
clibc/usr/lib -Wl,-O1 -Wl,--no-undefined -Wl,-rpath-link,/home/administrato=
r/openembedded/build/tmp-angstrom_2010_x/work/avr32-angstrom-linux-uclibc/q=
t4-embedded-4.7.1-r27.0/qt-everywhere-opensource-src-4.7.1/lib -Wl,-rpath-l=
ink,/home/administrator/openembedded/build/tmp-angstrom_2010_x/work/avr32-a=
ngstrom-linux-uclibc/qt4-embedded-4.7.1-r27.0/qt-everywhere-opensource-src-=
4.7.1/lib -shared -Wl,-soname,libQtGuiE.so.4 -o libQtGuiE.so.4.7.1 .obj/rel=
ease-shared-emb-avr32/qsoundqss_qws.o .obj/release-shared-emb-avr32/qcopcha=
nnel_qws.o .obj/release-shared-emb-avr32/qdecoration_qws.o .obj/release-sha=
red-emb-avr32/qdecorationfactory_qws.o .obj/release-shared-emb-avr32/qdecor=
ationplugin_qws.o .obj/release-shared-emb-avr32/qdirectpainter_qws.o .obj/r=
elease-shared-emb-avr32/qlock.o .obj/release-shared-emb-avr32/qscreen_qws.o=
 .obj/release-shared-emb-avr32/qscreenmulti_qws.o .obj/release-shared-emb-a=
vr32/qscreenproxy_qws.o .obj/release-shared-emb-avr32/qwindowsystem_qws.o .=
obj/release-shared-emb-avr32/qwscommand_qws.o .obj/release-shared-emb-avr32=
/qwscursor_qws.o .obj/release-shared-emb-avr32/qwsevent_qws.o .obj/release-=
shared-emb-avr32/qwsmanager_qws.o .obj/release-shared-emb-avr32/qwsproperty=
_qws.o .obj/release-shared-emb-avr32/qtransportauth_qws.o .obj/release-shar=
ed-emb-avr32/qwslock.o .obj/release-shared-emb-avr32/qwssharedmemory.o .obj=
/release-shared-emb-avr32/qwssocket_qws.o .obj/release-shared-emb-avr32/qws=
signalhandler.o .obj/release-shared-emb-avr32/qwsembedwidget.o .obj/release=
-shared-emb-avr32/qdecorationdefault_qws.o .obj/release-shared-emb-avr32/qd=
ecorationstyled_qws.o .obj/release-shared-emb-avr32/qdecorationwindows_qws.=
o .obj/release-shared-emb-avr32/qscreendriverplugin_qws.o .obj/release-shar=
ed-emb-avr32/qscreendriverfactory_qws.o .obj/release-shared-emb-avr32/qkbd_=
qws.o .obj/release-shared-emb-avr32/qkbddriverplugin_qws.o .obj/release-sha=
red-emb-avr32/qkbddriverfactory_qws.o .obj/release-shared-emb-avr32/qmouse_=
qws.o .obj/release-shared-emb-avr32/qmousedriverplugin_qws.o .obj/release-s=
hared-emb-avr32/qmousedriverfactory_qws.o .obj/release-shared-emb-avr32/qsc=
reenlinuxfb_qws.o .obj/release-shared-emb-avr32/qkbdtty_qws.o .obj/release-=
shared-emb-avr32/qmousevfb_qws.o .obj/release-shared-emb-avr32/qmousepc_qws=
.o .obj/release-shared-emb-avr32/qmouselinuxtp_qws.o .obj/release-shared-em=
b-avr32/qmouselinuxinput_qws.o .obj/release-shared-emb-avr32/qguivariantani=
mation.o .obj/release-shared-emb-avr32/qaction.o .obj/release-shared-emb-av=
r32/qactiongroup.o .obj/release-shared-emb-avr32/qapplication.o .obj/releas=
e-shared-emb-avr32/qboxlayout.o .obj/release-shared-emb-avr32/qclipboard.o =
.obj/release-shared-emb-avr32/qcursor.o .obj/release-shared-emb-avr32/qdrag=
.o .obj/release-shared-emb-avr32/qdnd.o .obj/release-shared-emb-avr32/qeven=
t.o .obj/release-shared-emb-avr32/qformlayout.o .obj/release-shared-emb-avr=
32/qgridlayout.o .obj/release-shared-emb-avr32/qkeysequence.o .obj/release-=
shared-emb-avr32/qlayout.o .obj/release-shared-emb-avr32/qlayoutengine.o .o=
bj/release-shared-emb-avr32/qlayoutitem.o .obj/release-shared-emb-avr32/qmi=
me.o .obj/release-shared-emb-avr32/qpalette.o .obj/release-shared-emb-avr32=
/qshortcut.o .obj/release-shared-emb-avr32/qshortcutmap.o .obj/release-shar=
ed-emb-avr32/qsound.o .obj/release-shared-emb-avr32/qstackedlayout.o .obj/r=
elease-shared-emb-avr32/qtooltip.o .obj/release-shared-emb-avr32/qguivarian=
t.o .obj/release-shared-emb-avr32/qwhatsthis.o .obj/release-shared-emb-avr3=
2/qwidget.o .obj/release-shared-emb-avr32/qwidgetaction.o .obj/release-shar=
ed-emb-avr32/qkeymapper.o .obj/release-shared-emb-avr32/qgesture.o .obj/rel=
ease-shared-emb-avr32/qstandardgestures.o .obj/release-shared-emb-avr32/qge=
sturerecognizer.o .obj/release-shared-emb-avr32/qgesturemanager.o .obj/rele=
ase-shared-emb-avr32/qsoftkeymanager.o .obj/release-shared-emb-avr32/qdeskt=
opwidget.o .obj/release-shared-emb-avr32/qguiplatformplugin.o .obj/release-=
shared-emb-avr32/qapplication_qws.o .obj/release-shared-emb-avr32/qclipboar=
d_qws.o .obj/release-shared-emb-avr32/qcursor_qws.o .obj/release-shared-emb=
-avr32/qdesktopwidget_qws.o .obj/release-shared-emb-avr32/qdnd_qws.o .obj/r=
elease-shared-emb-avr32/qeventdispatcher_qws.o .obj/release-shared-emb-avr3=
2/qsound_qws.o .obj/release-shared-emb-avr32/qwidget_qws.o .obj/release-sha=
red-emb-avr32/qkeymapper_qws.o .obj/release-shared-emb-avr32/qsessionmanage=
r_qws.o .obj/release-shared-emb-avr32/qeventdispatcher_glib_qws.o .obj/rele=
ase-shared-emb-avr32/qbitmap.o .obj/release-shared-emb-avr32/qicon.o .obj/r=
elease-shared-emb-avr32/qiconloader.o .obj/release-shared-emb-avr32/qimage.=
o .obj/release-shared-emb-avr32/qimageiohandler.o .obj/release-shared-emb-a=
vr32/qimagereader.o .obj/release-shared-emb-avr32/qimagewriter.o .obj/relea=
se-shared-emb-avr32/qpaintengine_pic.o .obj/release-shared-emb-avr32/qpictu=
re.o .obj/release-shared-emb-avr32/qpictureformatplugin.o .obj/release-shar=
ed-emb-avr32/qpixmap.o .obj/release-shared-emb-avr32/qpixmapcache.o .obj/re=
lease-shared-emb-avr32/qpixmapdata.o .obj/release-shared-emb-avr32/qpixmapd=
atafactory.o .obj/release-shared-emb-avr32/qpixmapfilter.o .obj/release-sha=
red-emb-avr32/qiconengine.o .obj/release-shared-emb-avr32/qiconengineplugin=
.o .obj/release-shared-emb-avr32/qmovie.o .obj/release-shared-emb-avr32/qpi=
xmap_raster.o .obj/release-shared-emb-avr32/qnativeimage.o .obj/release-sha=
red-emb-avr32/qimagepixmapcleanuphooks.o .obj/release-shared-emb-avr32/qpix=
map_qws.o .obj/release-shared-emb-avr32/qbmphandler.o .obj/release-shared-e=
mb-avr32/qppmhandler.o .obj/release-shared-emb-avr32/qxbmhandler.o .obj/rel=
ease-shared-emb-avr32/qxpmhandler.o .obj/release-shared-emb-avr32/qpnghandl=
er.o .obj/release-shared-emb-avr32/qbezier.o .obj/release-shared-emb-avr32/=
qblendfunctions.o .obj/release-shared-emb-avr32/qbrush.o .obj/release-share=
d-emb-avr32/qcolor.o .obj/release-shared-emb-avr32/qcolor_p.o .obj/release-=
shared-emb-avr32/qcssutil.o .obj/release-shared-emb-avr32/qdrawutil.o .obj/=
release-shared-emb-avr32/qemulationpaintengine.o .obj/release-shared-emb-av=
r32/qgraphicssystem.o .obj/release-shared-emb-avr32/qmatrix.o .obj/release-=
shared-emb-avr32/qmemrotate.o .obj/release-shared-emb-avr32/qoutlinemapper.=
o .obj/release-shared-emb-avr32/qpaintdevice.o .obj/release-shared-emb-avr3=
2/qpaintengine.o .obj/release-shared-emb-avr32/qpaintengine_alpha.o .obj/re=
lease-shared-emb-avr32/qpaintengine_preview.o .obj/release-shared-emb-avr32=
/qpaintengineex.o .obj/release-shared-emb-avr32/qpainter.o .obj/release-sha=
red-emb-avr32/qpainterpath.o .obj/release-shared-emb-avr32/qpathclipper.o .=
obj/release-shared-emb-avr32/qpdf.o .obj/release-shared-emb-avr32/qpen.o .o=
bj/release-shared-emb-avr32/qpolygon.o .obj/release-shared-emb-avr32/qprint=
engine_pdf.o .obj/release-shared-emb-avr32/qprintengine_ps.o .obj/release-s=
hared-emb-avr32/qprinter.o .obj/release-shared-emb-avr32/qrasterizer.o .obj=
/release-shared-emb-avr32/qregion.o .obj/release-shared-emb-avr32/qstroker.=
o .obj/release-shared-emb-avr32/qstylepainter.o .obj/release-shared-emb-avr=
32/qtessellator.o .obj/release-shared-emb-avr32/qtextureglyphcache.o .obj/r=
elease-shared-emb-avr32/qtransform.o .obj/release-shared-emb-avr32/qwindows=
urface.o .obj/release-shared-emb-avr32/qpaintbuffer.o .obj/release-shared-e=
mb-avr32/qpaintengine_raster.o .obj/release-shared-emb-avr32/qdrawhelper.o =
.obj/release-shared-emb-avr32/qimagescale.o .obj/release-shared-emb-avr32/q=
grayraster.o .obj/release-shared-emb-avr32/qgraphicssystem_qws.o .obj/relea=
se-shared-emb-avr32/qprinterinfo_unix.o .obj/release-shared-emb-avr32/qback=
ingstore.o .obj/release-shared-emb-avr32/qcolormap_qws.o .obj/release-share=
d-emb-avr32/qpaintdevice_qws.o .obj/release-shared-emb-avr32/qcups.o .obj/r=
elease-shared-emb-avr32/qwindowsurface_qws.o .obj/release-shared-emb-avr32/=
qfont.o .obj/release-shared-emb-avr32/qfontengine.o .obj/release-shared-emb=
-avr32/qfontsubset.o .obj/release-shared-emb-avr32/qfontmetrics.o .obj/rele=
ase-shared-emb-avr32/qfontdatabase.o .obj/release-shared-emb-avr32/qtextcon=
trol.o .obj/release-shared-emb-avr32/qtextengine.o .obj/release-shared-emb-=
avr32/qtextlayout.o .obj/release-shared-emb-avr32/qtextformat.o .obj/releas=
e-shared-emb-avr32/qtextobject.o .obj/release-shared-emb-avr32/qtextoption.=
o .obj/release-shared-emb-avr32/qfragmentmap.o .obj/release-shared-emb-avr3=
2/qtextdocument.o .obj/release-shared-emb-avr32/qtextdocument_p.o .obj/rele=
ase-shared-emb-avr32/qtexthtmlparser.o .obj/release-shared-emb-avr32/qabstr=
acttextdocumentlayout.o .obj/release-shared-emb-avr32/qtextdocumentlayout.o=
 .obj/release-shared-emb-avr32/qtextcursor.o .obj/release-shared-emb-avr32/=
qtextdocumentfragment.o .obj/release-shared-emb-avr32/qtextimagehandler.o .=
obj/release-shared-emb-avr32/qtexttable.o .obj/release-shared-emb-avr32/qte=
xtlist.o .obj/release-shared-emb-avr32/qtextdocumentwriter.o .obj/release-s=
hared-emb-avr32/qsyntaxhighlighter.o .obj/release-shared-emb-avr32/qcsspars=
er.o .obj/release-shared-emb-avr32/qzip.o .obj/release-shared-emb-avr32/qte=
xtodfwriter.o .obj/release-shared-emb-avr32/qstatictext.o .obj/release-shar=
ed-emb-avr32/qfont_qws.o .obj/release-shared-emb-avr32/qfontengine_qws.o .o=
bj/release-shared-emb-avr32/qfontengine_ft.o .obj/release-shared-emb-avr32/=
qfontengine_qpf.o .obj/release-shared-emb-avr32/qabstractfontengine_qws.o .=
obj/release-shared-emb-avr32/qstyle.o .obj/release-shared-emb-avr32/qstylef=
actory.o .obj/release-shared-emb-avr32/qstyleoption.o .obj/release-shared-e=
mb-avr32/qstyleplugin.o .obj/release-shared-emb-avr32/qstylehelper.o .obj/r=
elease-shared-emb-avr32/qcommonstyle.o .obj/release-shared-emb-avr32/qproxy=
style.o .obj/release-shared-emb-avr32/qstylesheetstyle.o .obj/release-share=
d-emb-avr32/qstylesheetstyle_default.o .obj/release-shared-emb-avr32/qcdest=
yle.o .obj/release-shared-emb-avr32/qplastiquestyle.o .obj/release-shared-e=
mb-avr32/qcleanlooksstyle.o .obj/release-shared-emb-avr32/qwindowsstyle.o .=
obj/release-shared-emb-avr32/qmotifstyle.o .obj/release-shared-emb-avr32/qa=
bstractbutton.o .obj/release-shared-emb-avr32/qabstractslider.o .obj/releas=
e-shared-emb-avr32/qabstractspinbox.o .obj/release-shared-emb-avr32/qcalend=
arwidget.o .obj/release-shared-emb-avr32/qcheckbox.o .obj/release-shared-em=
b-avr32/qcombobox.o .obj/release-shared-emb-avr32/qcommandlinkbutton.o .obj=
/release-shared-emb-avr32/qdatetimeedit.o .obj/release-shared-emb-avr32/qdi=
al.o .obj/release-shared-emb-avr32/qdialogbuttonbox.o .obj/release-shared-e=
mb-avr32/qdockwidget.o .obj/release-shared-emb-avr32/qdockarealayout.o .obj=
/release-shared-emb-avr32/qeffects.o .obj/release-shared-emb-avr32/qfontcom=
bobox.o .obj/release-shared-emb-avr32/qframe.o .obj/release-shared-emb-avr3=
2/qgroupbox.o .obj/release-shared-emb-avr32/qlabel.o .obj/release-shared-em=
b-avr32/qlcdnumber.o .obj/release-shared-emb-avr32/qlineedit_p.o .obj/relea=
se-shared-emb-avr32/qlineedit.o .obj/release-shared-emb-avr32/qlinecontrol.=
o .obj/release-shared-emb-avr32/qmainwindow.o .obj/release-shared-emb-avr32=
/qmainwindowlayout.o .obj/release-shared-emb-avr32/qmdiarea.o .obj/release-=
shared-emb-avr32/qmdisubwindow.o .obj/release-shared-emb-avr32/qmenu.o .obj=
/release-shared-emb-avr32/qmenubar.o .obj/release-shared-emb-avr32/qmenudat=
a.o .obj/release-shared-emb-avr32/qprogressbar.o .obj/release-shared-emb-av=
r32/qpushbutton.o .obj/release-shared-emb-avr32/qradiobutton.o .obj/release=
-shared-emb-avr32/qrubberband.o .obj/release-shared-emb-avr32/qscrollbar.o =
.obj/release-shared-emb-avr32/qsizegrip.o .obj/release-shared-emb-avr32/qsl=
ider.o .obj/release-shared-emb-avr32/qspinbox.o .obj/release-shared-emb-avr=
32/qsplashscreen.o .obj/release-shared-emb-avr32/qsplitter.o .obj/release-s=
hared-emb-avr32/qstackedwidget.o .obj/release-shared-emb-avr32/qstatusbar.o=
 .obj/release-shared-emb-avr32/qtabbar.o .obj/release-shared-emb-avr32/qtab=
widget.o .obj/release-shared-emb-avr32/qtextedit.o .obj/release-shared-emb-=
avr32/qtextbrowser.o .obj/release-shared-emb-avr32/qtoolbar.o .obj/release-=
shared-emb-avr32/qtoolbarlayout.o .obj/release-shared-emb-avr32/qtoolbarext=
ension.o .obj/release-shared-emb-avr32/qtoolbarseparator.o .obj/release-sha=
red-emb-avr32/qtoolbox.o .obj/release-shared-emb-avr32/qtoolbutton.o .obj/r=
elease-shared-emb-avr32/qvalidator.o .obj/release-shared-emb-avr32/qabstrac=
tscrollarea.o .obj/release-shared-emb-avr32/qwidgetresizehandler.o .obj/rel=
ease-shared-emb-avr32/qfocusframe.o .obj/release-shared-emb-avr32/qscrollar=
ea.o .obj/release-shared-emb-avr32/qworkspace.o .obj/release-shared-emb-avr=
32/qwidgetanimator.o .obj/release-shared-emb-avr32/qtoolbararealayout.o .ob=
j/release-shared-emb-avr32/qplaintextedit.o .obj/release-shared-emb-avr32/q=
printpreviewwidget.o .obj/release-shared-emb-avr32/qprintdialog_unix.o .obj=
/release-shared-emb-avr32/qpagesetupdialog_unix.o .obj/release-shared-emb-a=
vr32/qabstractprintdialog.o .obj/release-shared-emb-avr32/qabstractpagesetu=
pdialog.o .obj/release-shared-emb-avr32/qcolordialog.o .obj/release-shared-=
emb-avr32/qdialog.o .obj/release-shared-emb-avr32/qerrormessage.o .obj/rele=
ase-shared-emb-avr32/qfiledialog.o .obj/release-shared-emb-avr32/qfontdialo=
g.o .obj/release-shared-emb-avr32/qinputdialog.o .obj/release-shared-emb-av=
r32/qmessagebox.o .obj/release-shared-emb-avr32/qprogressdialog.o .obj/rele=
ase-shared-emb-avr32/qsidebar.o .obj/release-shared-emb-avr32/qfilesystemmo=
del.o .obj/release-shared-emb-avr32/qfileinfogatherer.o .obj/release-shared=
-emb-avr32/qpagesetupdialog.o .obj/release-shared-emb-avr32/qwizard.o .obj/=
release-shared-emb-avr32/qprintpreviewdialog.o .obj/release-shared-emb-avr3=
2/qabstractitemview.o .obj/release-shared-emb-avr32/qheaderview.o .obj/rele=
ase-shared-emb-avr32/qlistview.o .obj/release-shared-emb-avr32/qbsptree.o .=
obj/release-shared-emb-avr32/qtableview.o .obj/release-shared-emb-avr32/qtr=
eeview.o .obj/release-shared-emb-avr32/qabstractitemdelegate.o .obj/release=
-shared-emb-avr32/qitemdelegate.o .obj/release-shared-emb-avr32/qitemselect=
ionmodel.o .obj/release-shared-emb-avr32/qdirmodel.o .obj/release-shared-em=
b-avr32/qlistwidget.o .obj/release-shared-emb-avr32/qtablewidget.o .obj/rel=
ease-shared-emb-avr32/qtreewidget.o .obj/release-shared-emb-avr32/qproxymod=
el.o .obj/release-shared-emb-avr32/qabstractproxymodel.o .obj/release-share=
d-emb-avr32/qsortfilterproxymodel.o .obj/release-shared-emb-avr32/qitemedit=
orfactory.o .obj/release-shared-emb-avr32/qstandarditemmodel.o .obj/release=
-shared-emb-avr32/qstringlistmodel.o .obj/release-shared-emb-avr32/qtreewid=
getitemiterator.o .obj/release-shared-emb-avr32/qdatawidgetmapper.o .obj/re=
lease-shared-emb-avr32/qfileiconprovider.o .obj/release-shared-emb-avr32/qc=
olumnview.o .obj/release-shared-emb-avr32/qcolumnviewgrip.o .obj/release-sh=
ared-emb-avr32/qstyleditemdelegate.o .obj/release-shared-emb-avr32/qinputco=
ntextfactory.o .obj/release-shared-emb-avr32/qinputcontextplugin.o .obj/rel=
ease-shared-emb-avr32/qinputcontext.o .obj/release-shared-emb-avr32/qwsinpu=
tcontext_qws.o .obj/release-shared-emb-avr32/qgraphicsgridlayout.o .obj/rel=
ease-shared-emb-avr32/qgraphicsitem.o .obj/release-shared-emb-avr32/qgraphi=
csitemanimation.o .obj/release-shared-emb-avr32/qgraphicslayout.o .obj/rele=
ase-shared-emb-avr32/qgraphicslayout_p.o .obj/release-shared-emb-avr32/qgra=
phicslayoutitem.o .obj/release-shared-emb-avr32/qgraphicslinearlayout.o .ob=
j/release-shared-emb-avr32/qgraphicsproxywidget.o .obj/release-shared-emb-a=
vr32/qgraphicsscene.o .obj/release-shared-emb-avr32/qgraphicsscene_bsp.o .o=
bj/release-shared-emb-avr32/qgraphicsscenebsptreeindex.o .obj/release-share=
d-emb-avr32/qgraphicssceneevent.o .obj/release-shared-emb-avr32/qgraphicssc=
eneindex.o .obj/release-shared-emb-avr32/qgraphicsscenelinearindex.o .obj/r=
elease-shared-emb-avr32/qgraphicstransform.o .obj/release-shared-emb-avr32/=
qgraphicsview.o .obj/release-shared-emb-avr32/qgraphicswidget.o .obj/releas=
e-shared-emb-avr32/qgraphicswidget_p.o .obj/release-shared-emb-avr32/qgridl=
ayoutengine.o .obj/release-shared-emb-avr32/qsimplex_p.o .obj/release-share=
d-emb-avr32/qgraphicsanchorlayout_p.o .obj/release-shared-emb-avr32/qgraphi=
csanchorlayout.o .obj/release-shared-emb-avr32/qsystemtrayicon.o .obj/relea=
se-shared-emb-avr32/qcompleter.o .obj/release-shared-emb-avr32/qdesktopserv=
ices.o .obj/release-shared-emb-avr32/qundogroup.o .obj/release-shared-emb-a=
vr32/qundostack.o .obj/release-shared-emb-avr32/qundoview.o .obj/release-sh=
ared-emb-avr32/qsystemtrayicon_qws.o .obj/release-shared-emb-avr32/qguistat=
emachine.o .obj/release-shared-emb-avr32/qkeyeventtransition.o .obj/release=
-shared-emb-avr32/qmouseeventtransition.o .obj/release-shared-emb-avr32/qba=
sickeyeventtransition.o .obj/release-shared-emb-avr32/qbasicmouseeventtrans=
ition.o .obj/release-shared-emb-avr32/qgenericmatrix.o .obj/release-shared-=
emb-avr32/qmatrix4x4.o .obj/release-shared-emb-avr32/qquaternion.o .obj/rel=
ease-shared-emb-avr32/qvector2d.o .obj/release-shared-emb-avr32/qvector3d.o=
 .obj/release-shared-emb-avr32/qvector4d.o .obj/release-shared-emb-avr32/qg=
raphicseffect.o .obj/release-shared-emb-avr32/moc_qsoundqss_qws.o .obj/rele=
ase-shared-emb-avr32/moc_qcopchannel_qws.o .obj/release-shared-emb-avr32/mo=
c_qdecorationplugin_qws.o .obj/release-shared-emb-avr32/moc_qdirectpainter_=
qws.o .obj/release-shared-emb-avr32/moc_qwsmanager_qws.o .obj/release-share=
d-emb-avr32/moc_qtransportauth_qws.o .obj/release-shared-emb-avr32/moc_qwss=
ocket_qws.o .obj/release-shared-emb-avr32/moc_qwsembedwidget.o .obj/release=
-shared-emb-avr32/moc_qscreendriverplugin_qws.o .obj/release-shared-emb-avr=
32/moc_qkbddriverplugin_qws.o .obj/release-shared-emb-avr32/moc_qmousedrive=
rplugin_qws.o .obj/release-shared-emb-avr32/moc_qmousevfb_qws.o .obj/releas=
e-shared-emb-avr32/moc_qboxlayout.o .obj/release-shared-emb-avr32/moc_qclip=
board.o .obj/release-shared-emb-avr32/moc_qdesktopwidget.o .obj/release-sha=
red-emb-avr32/moc_qdrag.o .obj/release-shared-emb-avr32/moc_qdnd_p.o .obj/r=
elease-shared-emb-avr32/moc_qformlayout.o .obj/release-shared-emb-avr32/moc=
_qgridlayout.o .obj/release-shared-emb-avr32/moc_qlayout.o .obj/release-sha=
red-emb-avr32/moc_qsessionmanager.o .obj/release-shared-emb-avr32/moc_qshor=
tcut.o .obj/release-shared-emb-avr32/moc_qsizepolicy.o .obj/release-shared-=
emb-avr32/moc_qpalette.o .obj/release-shared-emb-avr32/moc_qsound.o .obj/re=
lease-shared-emb-avr32/moc_qsound_p.o .obj/release-shared-emb-avr32/moc_qst=
ackedlayout.o .obj/release-shared-emb-avr32/moc_qkeymapper_p.o .obj/release=
-shared-emb-avr32/moc_qsoftkeymanager_p.o .obj/release-shared-emb-avr32/moc=
_qguiplatformplugin_p.o .obj/release-shared-emb-avr32/moc_qeventdispatcher_=
qws_p.o .obj/release-shared-emb-avr32/moc_qeventdispatcher_glib_qws_p.o .ob=
j/release-shared-emb-avr32/moc_qiconengineplugin.o .obj/release-shared-emb-=
avr32/moc_qimageiohandler.o .obj/release-shared-emb-avr32/moc_qpictureforma=
tplugin.o .obj/release-shared-emb-avr32/moc_qpixmapfilter_p.o .obj/release-=
shared-emb-avr32/moc_qbrush.o .obj/release-shared-emb-avr32/moc_qpainter.o =
.obj/release-shared-emb-avr32/moc_qpaintbuffer_p.o .obj/release-shared-emb-=
avr32/moc_qfont.o .obj/release-shared-emb-avr32/moc_qfontdatabase.o .obj/re=
lease-shared-emb-avr32/moc_qfont_p.o .obj/release-shared-emb-avr32/moc_qtex=
tformat.o .obj/release-shared-emb-avr32/moc_qtextobject.o .obj/release-shar=
ed-emb-avr32/moc_qtextdocument.o .obj/release-shared-emb-avr32/moc_qtextima=
gehandler_p.o .obj/release-shared-emb-avr32/moc_qtexttable.o .obj/release-s=
hared-emb-avr32/moc_qtextlist.o .obj/release-shared-emb-avr32/moc_qabstract=
fontengine_qws.o .obj/release-shared-emb-avr32/moc_qabstractfontengine_p.o =
.obj/release-shared-emb-avr32/moc_qstyle.o .obj/release-shared-emb-avr32/mo=
c_qstyleplugin.o .obj/release-shared-emb-avr32/moc_qcommonstyle.o .obj/rele=
ase-shared-emb-avr32/moc_qproxystyle.o .obj/release-shared-emb-avr32/moc_qc=
destyle.o .obj/release-shared-emb-avr32/moc_qplastiquestyle.o .obj/release-=
shared-emb-avr32/moc_qcleanlooksstyle.o .obj/release-shared-emb-avr32/moc_q=
windowsstyle.o .obj/release-shared-emb-avr32/moc_qmotifstyle.o .obj/release=
-shared-emb-avr32/moc_qbuttongroup.o .obj/release-shared-emb-avr32/moc_qabs=
tractbutton.o .obj/release-shared-emb-avr32/moc_qabstractslider.o .obj/rele=
ase-shared-emb-avr32/moc_qcalendartextnavigator_p.o .obj/release-shared-emb=
-avr32/moc_qcheckbox.o .obj/release-shared-emb-avr32/moc_qcombobox_p.o .obj=
/release-shared-emb-avr32/moc_qcommandlinkbutton.o .obj/release-shared-emb-=
avr32/moc_qdatetimeedit_p.o .obj/release-shared-emb-avr32/moc_qdial.o .obj/=
release-shared-emb-avr32/moc_qdockwidget_p.o .obj/release-shared-emb-avr32/=
moc_qframe.o .obj/release-shared-emb-avr32/moc_qlcdnumber.o .obj/release-sh=
ared-emb-avr32/moc_qlinecontrol_p.o .obj/release-shared-emb-avr32/moc_qmain=
window.o .obj/release-shared-emb-avr32/moc_qmainwindowlayout_p.o .obj/relea=
se-shared-emb-avr32/moc_qmenudata.o .obj/release-shared-emb-avr32/moc_qprog=
ressbar.o .obj/release-shared-emb-avr32/moc_qradiobutton.o .obj/release-sha=
red-emb-avr32/moc_qrubberband.o .obj/release-shared-emb-avr32/moc_qscrollba=
r.o .obj/release-shared-emb-avr32/moc_qslider.o .obj/release-shared-emb-avr=
32/moc_qspinbox.o .obj/release-shared-emb-avr32/moc_qsplashscreen.o .obj/re=
lease-shared-emb-avr32/moc_qsplitter.o .obj/release-shared-emb-avr32/moc_qs=
tackedwidget.o .obj/release-shared-emb-avr32/moc_qstatusbar.o .obj/release-=
shared-emb-avr32/moc_qtabbar_p.o .obj/release-shared-emb-avr32/moc_qtoolbar=
layout_p.o .obj/release-shared-emb-avr32/moc_qtoolbarextension_p.o .obj/rel=
ease-shared-emb-avr32/moc_qtoolbarseparator_p.o .obj/release-shared-emb-avr=
32/moc_qvalidator.o .obj/release-shared-emb-avr32/moc_qwidgetresizehandler_=
p.o .obj/release-shared-emb-avr32/moc_qfocusframe.o .obj/release-shared-emb=
-avr32/moc_qscrollarea.o .obj/release-shared-emb-avr32/moc_qwidgetanimator_=
p.o .obj/release-shared-emb-avr32/moc_qabstractprintdialog.o .obj/release-s=
hared-emb-avr32/moc_qabstractpagesetupdialog.o .obj/release-shared-emb-avr3=
2/moc_qerrormessage.o .obj/release-shared-emb-avr32/moc_qsidebar_p.o .obj/r=
elease-shared-emb-avr32/moc_qfileinfogatherer_p.o .obj/release-shared-emb-a=
vr32/moc_qpagesetupdialog_unix_p.o .obj/release-shared-emb-avr32/moc_qlistv=
iew.o .obj/release-shared-emb-avr32/moc_qabstractitemdelegate.o .obj/releas=
e-shared-emb-avr32/moc_qlistwidget_p.o .obj/release-shared-emb-avr32/moc_qt=
ablewidget_p.o .obj/release-shared-emb-avr32/moc_qtreewidget_p.o .obj/relea=
se-shared-emb-avr32/moc_qitemeditorfactory_p.o .obj/release-shared-emb-avr3=
2/moc_qstringlistmodel.o .obj/release-shared-emb-avr32/moc_qcolumnviewgrip_=
p.o .obj/release-shared-emb-avr32/moc_qinputcontextplugin.o .obj/release-sh=
ared-emb-avr32/moc_qinputcontext.o .obj/release-shared-emb-avr32/moc_qwsinp=
utcontext_p.o .obj/release-shared-emb-avr32/moc_qgraphicsitemanimation.o .o=
bj/release-shared-emb-avr32/moc_qgraphicsscenelinearindex_p.o .obj/release-=
shared-emb-avr32/moc_qgraphicswidget.o .obj/release-shared-emb-avr32/moc_qg=
raphicsanchorlayout.o .obj/release-shared-emb-avr32/moc_qsystemtrayicon.o .=
obj/release-shared-emb-avr32/moc_qcompleter_p.o .obj/release-shared-emb-avr=
32/moc_qsystemtrayicon_p.o .obj/release-shared-emb-avr32/moc_qundogroup.o .=
obj/release-shared-emb-avr32/moc_qundostack.o .obj/release-shared-emb-avr32=
/moc_qundostack_p.o .obj/release-shared-emb-avr32/moc_qundoview.o .obj/rele=
ase-shared-emb-avr32/moc_qkeyeventtransition.o .obj/release-shared-emb-avr3=
2/moc_qmouseeventtransition.o .obj/release-shared-emb-avr32/moc_qbasickeyev=
enttransition_p.o .obj/release-shared-emb-avr32/moc_qbasicmouseeventtransit=
ion_p.o .obj/release-shared-emb-avr32/moc_qgraphicseffect.o .obj/release-sh=
ared-emb-avr32/moc_qgraphicseffect_p.o .obj/release-shared-emb-avr32/qrc_qs=
tyle.o .obj/release-shared-emb-avr32/qrc_qmessagebox.o   -L/home/administra=
tor/openembedded/build/tmp-angstrom_2010_x/sysroots/avr32-angstrom-linux-uc=
libc/usr/lib -L/home/administrator/openembedded/build/tmp-angstrom_2010_x/w=
ork/avr32-angstrom-linux-uclibc/qt4-embedded-4.7.1-r27.0/qt-everywhere-open=
source-src-4.7.1/lib -L/home/administrator/openembedded/build/tmp-angstrom_=
2010_x/sysroots/avr32-angstrom-linux-uclibc/usr/lib -lQtNetworkE -L/home/ad=
ministrator/openembedded/build/tmp-angstrom_2010_x/work/avr32-angstrom-linu=
x-uclibc/qt4-embedded-4.7.1-r27.0/qt-everywhere-opensource-src-4.7.1/lib -l=
QtCoreE -lpthread -pthread -lgthread-2.0 -lglib-2.0 -lintl -lpng -lz -lfree=
type=20
/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/i686-li=
nux/usr/avr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/crtbeginS.o:(.fini+=
0x0): relocation truncated to fit: R_AVR32_GOT18SW against `__do_global_dto=
rs_aux'
/home/administrator/openembedded/build/tmp-angstrom_2010_x/sysroots/i686-li=
nux/usr/avr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/crtbeginS.o:(.init+=
0x0): relocation truncated to fit: R_AVR32_GOT18SW against `frame_dummy'
collect2: ld returned 1 exit status
make[1]: *** [../../lib/libQtGuiE.so.4.7.1] Error 1
make[1]: Leaving directory `/home/administrator/openembedded/build/tmp-angs=
trom_2010_x/work/avr32-angstrom-linux-uclibc/qt4-embedded-4.7.1-r27.0/qt-ev=
erywhere-opensource-src-4.7.1/src/gui'
make: *** [sub-gui-make_default-ordered] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

------=_NextPart_000_0087_01CBD5E6.8935CD30--
