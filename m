Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5E93265CED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 07:14:23 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so7704701wiv.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 23:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=oOfXxouH1BTgy4fTvxuBuyP3RpmLbFhgOPpbR465spE=;
	b=bo8kGFt7QhZIohkYogYgkKG/3qRbCi23Ras/YA8XQhz5pQiEUWf7vf01HxLdMBUyGv
	zoWf16aqJregWRGmEx0WtqZ06fAbDQnoeosos0w5Oh3dT/0i00mZoosIBuCxbyuUEp7J
	VV/B1U0nn/Xo9sjSc/pXDX6anokJZDNGCd1foEHpRbKY1pSstAbmM/rInS7sOHFiULkC
	4FQwxuvucWbzRODlLVp7QB2BvzWFFdS/lI6Rb0K3yXHhI9PIxHsq+sKl+OGNQG+esBzS
	7Tj1IX6exfq28CJ0x34/4H3mt5rY4y4/HinWW5Wy8FfzD8/YfQGLZq49q0ZE9B+BJC0U
	6btA==
X-Gm-Message-State: ALoCoQm4laKhx+nfICjas6usL5Y9cvKc1Uu77lReI41dIXEtUghsO7e7fprxU2+pf0zhmz3yOd9k
X-Received: by 10.180.218.133 with SMTP id pg5mr20352406wic.70.1416467663988; 
	Wed, 19 Nov 2014 23:14:23 -0800 (PST)
Received: from ?IPv6:2001:610:612::f133:8748:b6b5:999?
	([2001:610:612:0:f133:8748:b6b5:999])
	by mx.google.com with ESMTPSA id mw7sm2749561wib.14.2014.11.19.23.14.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Nov 2014 23:14:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20141119155118.GQ3315@jama>
Date: Thu, 20 Nov 2014 08:14:21 +0100
Message-Id: <68C425C6-14C9-4C9E-AA9B-AA2624C735D1@dominion.thruhere.net>
References: <1412064513-15996-1-git-send-email-fathi.boudra@linaro.org>
	<20141119155118.GQ3315@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] acpitests: update to 20140828 release
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
X-List-Received-Date: Thu, 20 Nov 2014 07:14:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 19 nov. 2014, om 16:51 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>=20
> On Tue, Sep 30, 2014 at 11:08:33AM +0300, Fathi Boudra wrote:
>> update md5sums and refresh patches
>>=20
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>> v2 changes: rebased on top of Khem changes (add0ba4)
>>=20
>> .../acpica/acpitests/aapits-linux.patch            |  4 +--
>> .../acpica/acpitests/aapits-makefile.patch         | 36 =
+++++++++++++---------
>> ...acpitests_20140424.bb =3D> acpitests_20140828.bb} | 10 +++---
>> 3 files changed, 29 insertions(+), 21 deletions(-)
>> rename meta-oe/recipes-extended/acpica/{acpitests_20140424.bb =3D> =
acpitests_20140828.bb} (74%)
>>=20
>> diff --git =
a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch =
b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
>> index 116761d..7c5d6b0 100644
>> --- a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
>> +++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
>> @@ -326,8 +326,8 @@ diff -urN =
acpica-unix2-20130626/tests/aapits/Makefile acpica-unix2-20130626-aapi
>> --- acpica-unix2-20130626/tests/aapits/Makefile	2013-01-17 =
12:48:29.000000000 -0700
>> +++ acpica-unix2-20130626-aapits/tests/aapits/Makefile	=
2013-07-25 15:17:09.309236422 -0600
>> @@ -194,7 +194,7 @@
>> - CFLAGS+=3D -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_EXEC_APP =
-D_MULTI_THREADED -Wstrict-prototypes -I../../source/include=20
>> -=20
>> + CFLAGS+=3D -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_APITS =
-DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes =
-I../../source/include
>> +
>>=20
>> -acpiexec : $(patsubst %.c,%.o, $(SRCS))
>> +$(PROG) : $(patsubst %.c,%.o, $(SRCS))
>> diff --git =
a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch =
b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
>> index d38501b..4d9e997 100644
>> --- a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
>> +++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
>> @@ -8,19 +8,27 @@ Upstream-status: Unknown
>> diff -urN acpica-unix2-20140325/tests/aapits/Makefile =
acpica-unix2-20140325/tests/aapits/Makefile
>> --- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 =
14:23:14.683636794 -0600
>> +++ acpica-unix2-20140325-aapits/tests/aapits/Makefile	=
2014-04-05 15:10:57.879184598 -0600
>> -@@ -20,6 +20,7 @@
>> - 	../../source/components/hardware/hwxface.c \
>> +@@ -16,6 +16,7 @@
>> + 	atosxfwrap.c \
>> + 	osunixxf.c \
>> + 	../../source/common/ahids.c \
>> ++	../../source/common/ahuuids.c \
>>  	../../source/common/cmfsize.c \
>>  	../../source/common/getopt.c \
>> -+	../../source/common/ahids.c \
>> - 	../../source/components/debugger/dbcmds.c \
>> - 	../../source/components/debugger/dbconvert.c \
>> - 	../../source/components/debugger/dbdisply.c \
>> -@@ -154,6 +155,7 @@
>> - 	../../source/components/tables/tbfadt.c \
>> - 	../../source/components/tables/tbfind.c \
>> - 	../../source/components/tables/tbinstal.c \
>> -+	../../source/components/tables/tbdata.c \
>> - 	../../source/components/tables/tbprint.c \
>> - 	../../source/components/tables/tbutils.c \
>> - 	../../source/components/tables/tbxface.c \
>> + 	../../source/components/hardware/hwtimer.c \
>> +@@ -174,6 +175,7 @@
>> + 	../../source/components/utilities/utexcep.c \
>> + 	../../source/components/utilities/utfileio.c \
>> + 	../../source/components/utilities/utglobal.c \
>> ++	../../source/components/utilities/uthex.c \
>> + 	../../source/components/utilities/utids.c \
>> + 	../../source/components/utilities/utinit.c \
>> + 	../../source/components/utilities/utlock.c \
>> +@@ -189,6 +191,7 @@
>> + 	../../source/components/utilities/utstate.c \
>> + 	../../source/components/utilities/utstring.c \
>> + 	../../source/components/utilities/uttrack.c \
>> ++	../../source/components/utilities/utuuid.c \
>> + 	../../source/components/utilities/utxface.c \
>> + 	../../source/components/utilities/utxferror.c \
>> + 	../../source/components/utilities/utxfinit.c \
>> diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb =
b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
>> similarity index 69%
>> rename from meta-oe/recipes-extended/acpica/acpitests_20140424.bb
>> rename to meta-oe/recipes-extended/acpica/acpitests_20140828.bb
>> index 7e145bb..889c00b 100644
>> --- a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
>> +++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
>> @@ -11,10 +11,10 @@ SRC_URI =3D =
"https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;nam
>>            file://aapits-linux.patch \
>>            file://aapits-makefile.patch \
>>     "
>> -SRC_URI[acpitests.md5sum] =3D "bfc399cecb21e9491d362d8e480b2689"
>> -SRC_URI[acpitests.sha256sum] =3D =
"e7d7ff638872543909b38c2498e88958251ee6ce4d22bc13d4e3925771212c0e"
>> -SRC_URI[acpica.md5sum] =3D "733532f005fba5d1c5344440651b13d1"
>> -SRC_URI[acpica.sha256sum] =3D =
"72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19d702cdf751bbc"
>> +SRC_URI[acpitests.md5sum] =3D "db9d6fdaa8e3eb101d700ee5ba4938ed"
>> +SRC_URI[acpitests.sha256sum] =3D =
"e576c74bf1bf1c9f7348bf9419e05c8acfece7105abcdc052e66670c7af2cf00"
>> +SRC_URI[acpica.md5sum] =3D "6f05f0d10166a1b1ff6107f3d1cdf1e5"
>> +SRC_URI[acpica.sha256sum] =3D =
"01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
>>=20
>> S =3D "${WORKDIR}/acpitests-unix-${PV}"
>=20
> Please check why it fails in world builds with:
>=20
> ERROR: Function failed: do_compile (log file is located at =
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/ac=
pitests/20140828-r0/temp/log.do_compile.13998)
> ERROR: Logfile of failure stored in: =
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/ac=
pitests/20140828-r0/temp/log.do_compile.13998
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8 CC=3Darm-oe-linux-gnueabi-gcc  -march=3Darmv5te =
-marm -mthumb-interwork OPT_CFLAGS=3D-Wall
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o atexec.o atexec.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o atmain.o atmain.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o atinit.o atinit.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o atmemory.o atmemory.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o athardware.o =
athardware.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o attable.o attable.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o atnamespace.o =
atnamespace.c
> | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork  =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -g -D_LINUX -DNDEBUG =
-D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED =
-Wstrict-prototypes -I../../source/include   -c -o atresource.o =
atresource.c
> | In file included from ../../source/include/platform/acenv.h:172:0,
> |                  from ../../source/include/acpi.h:56,
> |                  from atcommon.h:119,
> |                  from atmain.c:118:
> | ../../source/include/platform/aclinux.h:166:20: fatal error: =
string.h: No such file or directory
> |  #include <string.h>
> |                     ^
> | compilation terminated.
> | In file included from ../../source/include/platform/acenv.h:172:0,
> |                  from ../../source/include/acpi.h:56,
> |                  from atcommon.h:119,
> |                  from atnamespace.c:116:
> | ../../source/include/platform/aclinux.h:166:20: fatal error: =
string.h: No such file or directory
> |  #include <string.h>


That looks the sysroot poisoning/TOOLCHAIN_OPTIONS problem.=

