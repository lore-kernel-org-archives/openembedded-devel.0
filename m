Received: from [131.111.8.131] (helo=ppsw-1.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1MdOyb-0000Zl-HP
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 15:43:49 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:58114)
	by ppsw-1.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.151]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1MdOi5-0001Kr-69 (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Tue, 18 Aug 2009 14:26:46 +0100
Message-ID: <4A8AAC1F.10604@cam.ac.uk>
Date: Tue, 18 Aug 2009 14:26:55 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.22 (X11/20090803)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8960BC.4000603@cam.ac.uk>
	<200908171606.57153.holger+oe@freyther.de>
In-Reply-To: <200908171606.57153.holger+oe@freyther.de>
X-Enigmail-Version: 0.95.7
Subject: Re: [PATCH] glibc 2.7 and 2.9 (arm): Remove unnecessary	asm/page.h include
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
X-List-Received-Date: Tue, 18 Aug 2009 13:43:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Monday 17 August 2009 15:53:00 you wrote:
>> Fix compile bug for arm with recent kernel headers
>> ../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No
>> such file or directory
>>
>> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
> 
> Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
> 
> One note worthy comment. Normally we only bump the PR when the packaged 
> content is changing. In one way we had a build error so the packaging didn't 
> change at all, in another way we do have existing glibc packages...
Cool, hadn't realized that. 
> 
> To be honest I wonder why you are triggering this area, and why other builds 
> don't do that... it is  a bit frightening.
My guess is the majority of distros haven't bumped up either one of the kernel
header or glibc. Either that or I'm just unlucky in picking combinations!

Quick browse of those in the repository:  (headers will cause trouble form 2.6.25
onwards, I think).

angstrom-2008.1.conf headers = 2.6.23
chinook-compat.conf headers = 2.6.20
jlime2-2009.1 headers headers = 2.6.18
jlime-donkey.conf  glibc 2.6.1 (the fixed version) headers 2.6.23 (so don't need it)
jlime-henchman.conf headers = 2.6.23
jlime-mongo.conf headers = 2.6.18
kaeilos.conf glibc = 2.6.1 (fixed) headers =2.6.23 (fine anyway)
mamona.conf headers 2.6.22
nylon.conf headers 2.6.18
openprotium headers 2.6.11.1
oplinux.conf headers 2.6.18

Normally people don't care about kernel header versions, but I need some netlink stuff
that only just went in.

Thanks,

Jonathan







> 
> 
> 
>> ---
>> Update to previous posting under
>> [PATCH] glibc 2.9: Remove unnecessary asm/page.h include, not present in
>> recent headers
>>
>> This patch is already included by the 2.6.1 recipe (thanks Khem)
>> Prevents the following error with recent kernel headers
>> ../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No
>> such file or directory
>>
>> Fixes problem with 2.6.29 headers against both glibc 2.7 and 2.9
>>
>> Related bug reports (with equivalent solutions)
>> http://www.mail-archive.com/debian-glibc@lists.debian.org/msg38393.html
>> http://sourceware.org/ml/crossgcc/2008-05/msg00014.html
>> http://sourceware.org/ml/libc-ports/2008-04/msg00005.html
>>
>> Bug no longer exists at head of glibc ports tree. May effect other
>> versions.
>>
>>  recipes/glibc/glibc_2.7.bb |    3 ++-
>>  recipes/glibc/glibc_2.9.bb |    3 ++-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
>> index f152756..dcea69c 100644
>> --- a/recipes/glibc/glibc_2.7.bb
>> +++ b/recipes/glibc/glibc_2.7.bb
>> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
>>  PACKAGES_DYNAMIC = "libc6*"
>>  RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>>
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>
>>  # the -isystem in bitbake.conf screws up glibc do_stage
>>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
>> @@ -68,6 +68,7 @@ SRC_URI =
>> "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
>> file://etc/ld.so.conf \
>>             file://generate-supported.mk \
>>             file://march-i686.patch;patch=1;pnum=0 \
>> +	   file://glibc-arm-no-asm-page.patch;patch=1 \
>>             "
>>
>>
>> diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
>> index 6e323aa..9849c0a 100644
>> --- a/recipes/glibc/glibc_2.9.bb
>> +++ b/recipes/glibc/glibc_2.9.bb
>> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
>>  PACKAGES_DYNAMIC = "libc6*"
>>  RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>>
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>
>>  # the -isystem in bitbake.conf screws up glibc do_stage
>>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
>> @@ -65,6 +65,7 @@ SRC_URI =
>> "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
>> file://generate-supported.mk \
>>             file://march-i686.patch;patch=1;pnum=0 \
>>  	   file://tls_i486.patch;patch=1 \
>> +	   file://glibc-arm-no-asm-page.patch;patch=1 \
>>             "
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



