Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 771D960990
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 08:18:44 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id eo20so2163212lab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 01:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=5WEAyK77UbNjYT+P5ER1TamNSqpCk1qay3R8xy0fa/A=;
	b=VY6dFP27EcH9kj1ALNhAAbVyi0SzXsGR7CNa3P0VeQ5Sozwst3h8HbBDEamr4c7QDc
	fkTvw7A0Qa+rFUFuonXLDIkLtDHcJLO3oM+8AcP2KtSYPkvSxx222DC1tUaNm0PeFg+d
	aCEkpvIT9HGF6wIlrqxjT9Si7c4Gd3E6mm7LUstqY6v4nlFj4byN5J/h09eBvjW734c4
	w5yHWBLCHyKjukAXG1zUIfPTN6JlyoWc1xgjc2jo88RuynsOOSCSCdn024nVW5jQDBWV
	qOTTrUaqMOVWBrtY2Vloc42WNUTzlxzVmFdeeiWJ1LyNzW6V9+m0P8rjjfz4yb3LIOHn
	vcjg==
X-Gm-Message-State: ALoCoQlHmQL9y5yIiAdMROCEXXQZpUBa3h7P6dj/dGh9pkaaPlQK2YNGOZbCvrwmQE+fwFkzkWBN
MIME-Version: 1.0
X-Received: by 10.112.158.225 with SMTP id wx1mr544403lbb.37.1377505123938;
	Mon, 26 Aug 2013 01:18:43 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Mon, 26 Aug 2013 01:18:43 -0700 (PDT)
In-Reply-To: <20130826070457.GK3544@jama>
References: <20130823215050.GE3544@jama>
	<CAFoFrHahfobkP_i-y0+nQpiB-YWoO2C8OXaviKuHbQTNjdgQ-A@mail.gmail.com>
	<20130826070457.GK3544@jama>
Date: Mon, 26 Aug 2013 11:18:43 +0300
Message-ID: <CAGNsrLD5nJT64J_Z=z4nmjK0UmXb6DkxF2FBworonLtSWTxtQA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Naresh Bhat <naresh.bhat@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: acpica failing to build
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
X-List-Received-Date: Mon, 26 Aug 2013 08:18:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On 26 August 2013 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Aug 26, 2013 at 11:53:39AM +0530, Naresh Bhat wrote:
>> Are you able to see the "prparser.y.h" under acpica source and recipe
>> is unable to locate it ?
>
> I can check later when it fails again on jenkins, but workspace is gone
> already.
>
>> On 24 August 2013 03:20, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Can you please check why it's sometimes failing like this:
>> >
>> > | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-c=
ore/tmp-eglibc/work/armv5te-oe-linux-gnueabi/acpica/20130626-r1/acpica-unix=
2-20130626/generate/unix/acpidump'
>> > | 64-bit version of acpidump:
>> > | -rwxr-xr-x 1 jenkins jenkins 121136 Aug 23 17:54 ../bin/acpidump
>> > |
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtpar=
serlex.o obj/dtparserlex.c
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbstats.=
o ../../../source/components/debugger/dbstats.c
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtpar=
serparse.o obj/dtparserparse.c
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/prpar=
serlex.o obj/prparserlex.c
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_NAMES_APP -I../../../source/tools/acpinames -Wall -o obj/excrea=
te.o ../../../source/components/executer/excreate.c
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbutils.=
o ../../../source/components/debugger/dbutils.c
>> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOU=
RCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/inc=
lude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbxface.=
o ../../../source/components/debugger/dbxface.c
>> > | ../../../source/compiler/prparser.l:46:24: fatal error: prparser.y.h=
: No such file or directory
>> > |  #include "prparser.y.h"
>> > |                         ^
>> > | compilation terminated.
>> > | make[1]: *** [obj/prparserlex.o] Error 1
>> > | make[1]: *** Waiting for unfinished jobs....

we have a patch to fix parallel builds:
https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dcommit;h=
=3Dc4eeb9d314440962c8d732468dfac2f9360918b1

There's a discussion to get the patch merged upstream:
https://lists.acpica.org/pipermail/devel/2013-August/000549.html

but upstream is going to propose a better approach.

Do you want to add our patch in the meantime?

