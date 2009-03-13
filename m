Received: from [199.44.250.2] (helo=exchsrvr.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1Li9Kq-0005CP-4c
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 16:30:08 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Fri, 13 Mar 2009 11:34:16 -0400
Message-ID: <EC5EE493B6046F45A2DDEC4A828DE52E03B6B917@EXCHSRVR.syntech.org>
In-Reply-To: <19c1b8a90903121040g61964eaau82f4a08c3770d681@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] minimo: task do_configure failed
thread-index: AcmjPllSlewi2x+5SLypMOY7G3VpwwAquPpw
References: <EC5EE493B6046F45A2DDEC4A828DE52E03B6B838@EXCHSRVR.syntech.org>
	<19c1b8a90903121040g61964eaau82f4a08c3770d681@mail.gmail.com>
From: "Mark Butsch" <mbutsch@syntech-fuelmaster.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: minimo: task do_configure failed
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
X-List-Received-Date: Fri, 13 Mar 2009 15:30:08 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Khem Raj
Sent: Thursday, March 12, 2009 1:41 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] minimo: task do_configure failed

On Thu, Mar 12, 2009 at 8:02 AM, Mark Butsch
<mbutsch@syntech-fuelmaster.com> wrote:
> Hello,
>
>
>
> I am starting to work with OE again and am having trouble building
> minimo. I had had this working a year ago, but now it fails in
> do_configure:
>

post your config.log stuff somewhere may be a link to your build on
tinderbox

-----------

Here is the config.log :

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

configure:964: checking host system type
configure:985: checking target system type
configure:1003: checking build system type
configure:1078: checking for gawk
configure:1176: checking for nsinstall
configure:1245: checking for host c compiler
configure:1251: checking for gcc
configure:1286: checking for host c++ compiler
configure:1292: checking for c++
configure:1341: checking for ranlib
configure:1376: checking for ar
configure:1411: checking whether the host c compiler (gcc
-isystem/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-march=3Di486 -L/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/lib
-Wl,-rpath-link,/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/lib
-Wl,-O1 ) works
configure:1420: gcc -c
-isystem/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-march=3Di486
-isystem/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/include
conftest.c 1>&5
conftest.c:1: error: CPU you selected does not support x86-64
instruction set
conftest.c:1: error: CPU you selected does not support x86-64
instruction set
configure: failed program was:
#line 1413 "configure"
#include "confdefs.h"

int main() {
return(0);
; return 0; }

------------

I looked at the log.do_configure file and the invocation for the
configure is:

NOTE: make -f client.mk CONFIGURE_ARGS=3D --build=3Dx86_64-linux
--host=3Dx86_64-linux
 --target=3Di686-linux  configure

It looked strange to me that the 'build' and 'host' are the same. The
recipe for minimo_cvs has the line:

EXTRA_OECONF +=3D "--build=3D${BUILD_SYS} --host=3D${BUILD_SYS}
--target=3D${TARGET_SYS} "

And uses EXTRA_OECONF when invoking oe_runmake. It seems to me that
'--host' should specify ${HOST_SYS} and if I make that edit, it does
successfully build.


For my education, what are 'build', 'host' and 'target' referring to in
this case?

-	'target' should be the target that is being built for
-	'build' should be the machine that is doing the building
-	'host' not sure?

Mark


