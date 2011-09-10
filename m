Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1R2Ucw-00067z-6f
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Sep 2011 22:58:14 +0200
Received: by gyg8 with SMTP id 8so2192582gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Sep 2011 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2SrdJ2Ajia+gOxCjjMM4agmF57hz/5nFZqO6FZCITbg=;
	b=FTKAXka4+jD03Kxa9wx2kGgS/Z4sXv3aPvb9aCXCcBr2snNre+OTjBVcAx1BxHZAA7
	7kqKEWf/FuRmbGYLoUC4zRvRp0EmlqQRobewCs0GftxV23b8vfugv6UxiNAEuSw9xDFn
	jk3hCxKi1gS554Iz/CIgVqJC7wI/AoSlgzCrM=
MIME-Version: 1.0
Received: by 10.236.191.103 with SMTP id f67mr19073406yhn.16.1315687986157;
	Sat, 10 Sep 2011 13:53:06 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.236.111.35 with HTTP; Sat, 10 Sep 2011 13:53:06 -0700 (PDT)
In-Reply-To: <1315074378-3291-2-git-send-email-dbaryshkov@gmail.com>
References: <1315074378-3291-1-git-send-email-dbaryshkov@gmail.com>
	<1315074378-3291-2-git-send-email-dbaryshkov@gmail.com>
Date: Sat, 10 Sep 2011 22:53:06 +0200
X-Google-Sender-Auth: -BleTrnrCbjrzHLXzzYMD137BCE
Message-ID: <CA+2YH7u=iyjzX9OuTM4KTkxPGZgrUKSxJUH3mRixaN7T1P0RTQ@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 2/2] tcp-wrappers: fix parallel builds
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
X-List-Received-Date: Sat, 10 Sep 2011 20:58:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Sep 3, 2011 at 8:26 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Inparallel builds make can try to rebuild a object file while cflags
> file is not yet built. Fix that by providing an explicit cflags
> dependency on config-check.

Hi,

making a build with today snapshot i got this:


ERROR: Function 'do_compile' failed (see
/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/tcp-wrappers-7.6-r6/temp/log.do_compile.10521
for further information)
ERROR: Logfile of failure stored in:
/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/tcp-wrappers-7.6-r6/temp/log.do_compile.10521
Log data follows:
| + cd /mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/tcp-wrappers-7.6-r6/tcp_wrappers_7.6
| + do_compile
| + oe_runmake 'TABLES=-DHOSTS_DENY=\"/etc/hosts.deny\"
-DHOSTS_ALLOW=\"/etc/hosts.allow\"' all
| + '[' xmake = x ']'
| + bbnote make -j2 'CC=arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
-mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb
--sysroot=/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/igep0020'
AR=arm-angstrom-linux-gnueabi-ar
RANLIB=arm-angstrom-linux-gnueabi-ranlib REAL_DAEMON_DIR=/usr/sbin
STYLE=-DPROCESS_OPTIONS FACILITY=LOG_DAEMON SEVERITY=LOG_INFO BUGS=
VSYSLOG= RFC931_TIMEOUT=10 ACCESS=-DHOSTS_ACCESS
KILL_OPT=-DKILL_IP_OPTIONS UMASK=-DDAEMON_UMASK=022
NETGROUP=-DNETGROUP LIBS=-lnsl ARFLAGS=rv AUX_OBJ=weak_symbols.o TLI=
COPTS= 'EXTRA_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT
-DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'
'TABLES=-DHOSTS_DENY=\"/etc/hosts.deny\"
-DHOSTS_ALLOW=\"/etc/hosts.allow\"' all
| + echo 'NOTE: make -j2 CC=arm-angstrom-linux-gnueabi-gcc
-march=armv7-a -fno-tree-vectorize      -mthumb-interwork
-mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork
-mno-thumb --sysroot=/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/igep0020
AR=arm-angstrom-linux-gnueabi-ar
RANLIB=arm-angstrom-linux-gnueabi-ranlib REAL_DAEMON_DIR=/usr/sbin
STYLE=-DPROCESS_OPTIONS FACILITY=LOG_DAEMON SEVERITY=LOG_INFO BUGS=
VSYSLOG= RFC931_TIMEOUT=10 ACCESS=-DHOSTS_ACCESS
KILL_OPT=-DKILL_IP_OPTIONS UMASK=-DDAEMON_UMASK=022
NETGROUP=-DNETGROUP LIBS=-lnsl ARFLAGS=rv AUX_OBJ=weak_symbols.o TLI=
COPTS= EXTRA_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT
-DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len
TABLES=-DHOSTS_DENY=\"/etc/hosts.deny\"
-DHOSTS_ALLOW=\"/etc/hosts.allow\" all'
| NOTE: make -j2 CC=arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
-mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb
--sysroot=/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/igep0020
AR=arm-angstrom-linux-gnueabi-ar
RANLIB=arm-angstrom-linux-gnueabi-ranlib REAL_DAEMON_DIR=/usr/sbin
STYLE=-DPROCESS_OPTIONS FACILITY=LOG_DAEMON SEVERITY=LOG_INFO BUGS=
VSYSLOG= RFC931_TIMEOUT=10 ACCESS=-DHOSTS_ACCESS
KILL_OPT=-DKILL_IP_OPTIONS UMASK=-DDAEMON_UMASK=022
NETGROUP=-DNETGROUP LIBS=-lnsl ARFLAGS=rv AUX_OBJ=weak_symbols.o TLI=
COPTS= EXTRA_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT
-DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len
TABLES=-DHOSTS_DENY=\"/etc/hosts.deny\"
-DHOSTS_ALLOW=\"/etc/hosts.allow\" all
| + make -j2 'CC=arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
-mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb
--sysroot=/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/igep0020'
AR=arm-angstrom-linux-gnueabi-ar
RANLIB=arm-angstrom-linux-gnueabi-ranlib REAL_DAEMON_DIR=/usr/sbin
STYLE=-DPROCESS_OPTIONS FACILITY=LOG_DAEMON SEVERITY=LOG_INFO BUGS=
VSYSLOG= RFC931_TIMEOUT=10 ACCESS=-DHOSTS_ACCESS
KILL_OPT=-DKILL_IP_OPTIONS UMASK=-DDAEMON_UMASK=022
NETGROUP=-DNETGROUP LIBS=-lnsl ARFLAGS=rv AUX_OBJ=weak_symbols.o TLI=
COPTS= 'EXTRA_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT
-DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'
'TABLES=-DHOSTS_DENY=\"/etc/hosts.deny\"
-DHOSTS_ALLOW=\"/etc/hosts.allow\"' all
| arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize
   -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
-mthumb-interwork -mno-thumb
--sysroot=/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/igep0020
 -DFACILITY=LOG_DAEMON -DHOSTS_ACCESS  -DNETGROUP
-DDAEMON_UMASK=022 -DREAL_DAEMON_DIR=\"/usr/sbin\" -DPROCESS_OPTIONS
-DKILL_IP_OPTIONS -DSEVERITY=LOG_INFO -DRFC931_TIMEOUT=10
-DHOSTS_DENY=\"/etc/hosts.deny\" -DHOSTS_ALLOW=\"/etc/hosts.allow\"
-O2 -pipe -g -feliminate-unused-debug-types -DSYS_ERRLIST_DEFINED
-DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1
-Dss_family=__ss_family -Dss_len=__ss_len    -fPIC -shared
-D_REENTRANT -c hosts_access.c -o shared/hosts_access.o
| Assembler messages:
| Fatal error: can't create shared/hosts_access.o: No such file or directory
| arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize
   -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
-mthumb-interwork -mno-thumb
--sysroot=/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/igep0020
 -DFACILITY=LOG_DAEMON -DHOSTS_ACCESS  -DNETGROUP
-DDAEMON_UMASK=022 -DREAL_DAEMON_DIR=\"/usr/sbin\" -DPROCESS_OPTIONS
-DKILL_IP_OPTIONS -DSEVERITY=LOG_INFO -DRFC931_TIMEOUT=10
-DHOSTS_DENY=\"/etc/hosts.deny\" -DHOSTS_ALLOW=\"/etc/hosts.allow\"
-O2 -pipe -g -feliminate-unused-debug-types -DSYS_ERRLIST_DEFINED
-DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1
-Dss_family=__ss_family -Dss_len=__ss_len    -fPIC -shared
-D_REENTRANT -c options.c -o shared/options.o
| options.c: In function 'twist_option':
| options.c:394:13: warning: incompatible implicit declaration of
built-in function 'execl'
| make: *** [shared/hosts_access.o] Error 2
| make: *** Waiting for unfinished jobs....
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| ERROR: Function 'do_compile' failed (see
/mnt/data100/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/tcp-wrappers-7.6-r6/temp/log.do_compile.10521
for further information)
| + echo 'ERROR: o
NOTE: package tcp-wrappers-7.6-r6: task do_compile: Failed
ERROR: Task 1368
(/mnt/data100/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb,
do_compile) failed with exit code '1'

Just restarting the build made it to continue with no errors.

Enrico


