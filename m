Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ludovic.desroches@atmel.com>) id 1QQwJ1-0008J3-Ho
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 08:50:27 +0200
Received: from meyreuil.atmel.fr ([10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id p4U6iBbm002920
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 23:44:11 -0700 (PDT)
Received: from [127.0.0.1] ([10.159.245.147])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id p4U6l9a00546; 
	Mon, 30 May 2011 08:47:09 +0200 (MEST)
Message-ID: <4DE33D6A.9060206@atmel.com>
Date: Mon, 30 May 2011 08:47:06 +0200
From: Ludovic Desroches <ludovic.desroches@atmel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1306423519-31114-1-git-send-email-ludovic.desroches@atmel.com>
	<1306534870.4137.11.camel@mattotaupa>
In-Reply-To: <1306534870.4137.11.camel@mattotaupa>
Subject: Re: [PATCH] tiobench: add recipe
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
X-List-Received-Date: Mon, 30 May 2011 06:50:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 5/28/2011 12:21 AM, Paul Menzel wrote:
> Dear Ludovic,
>
>
> thank you for your contribution.
>
> Am Donnerstag, den 26.05.2011, 17:25 +0200 schrieb Ludovic Desroches:
>
> please add the version of the program you are adding to the commit
> summary next time.
>
> What build configuration did you use for testing?
I was using a simple task-base image with the tiobench package on atmel 
boards.

>> Signed-off-by: Ludovic Desroches<ludovic.desroches@atmel.com>
>> ---
>>   recipes/tiobench/files/tiobench-makefile.patch |   42 ++++++++++++++++++++++++
>>   recipes/tiobench/tiobench_0.3.3.bb             |   27 +++++++++++++++
>>   2 files changed, 69 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/tiobench/files/tiobench-makefile.patch
>>   create mode 100644 recipes/tiobench/tiobench_0.3.3.bb
>>
>> diff --git a/recipes/tiobench/files/tiobench-makefile.patch b/recipes/tiobench/files/tiobench-makefile.patch
>> new file mode 100644
>> index 0000000..23e7a43
>> --- /dev/null
>> +++ b/recipes/tiobench/files/tiobench-makefile.patch
> Please add a header to the patch, if it has been sent upstream.
Ok  I will do that.

>> @@ -0,0 +1,42 @@
>> +--- a/Makefile	2011-05-26 07:48:46.341400974 +0200
>> ++++ b/Makefile	2011-05-26 10:54:48.631400818 +0200
>> +@@ -1,8 +1,10 @@
>> + # Makefile for tiotest
>> +
>> +-CC=gcc
>> ++CROSS_COMPILE?=
>> ++CC=$(CROSS_COMPILE)gcc
> Would `CC?=gcc` not work too?
I will try.

>> + #CFLAGS=-O3 -fomit-frame-pointer -Wall
>> + CFLAGS=-O2 -Wall
>> ++LDFLAGS?=
>> +
>> + #DEFINES=-DUSE_MMAP
>> + #-DUSE_MADVISE
>> +@@ -14,16 +16,15 @@
>> +
>> + #DEFINES=
>> +
>> +-LINK=gcc
> Just use `LINK?=$(CC)`?
Same as previous one.

>> + EXE=tiotest
>> + PROJECT=tiobench
>> + # do it once instead of each time referenced
>> + VERSION=$(shell egrep "tiotest v[0-9]+.[0-9]+" tiotest.c | cut -d " " -f 7 | sed "s/v//g")
>> + DISTNAME=$(PROJECT)-$(VERSION)
>> + INSTALL=install
>> +-PREFIX=/usr/local
>> ++PREFIX?=/usr/local
>> + BINDIR=$(PREFIX)/bin
>> +-DOCDIR=/usr/local/doc/$(DISTNAME)
>> ++DOCDIR=$(PREFIX)/doc/$(DISTNAME)
>> +
>> + all: $(EXE)
>> +
>> +@@ -34,7 +35,7 @@
>> + 	$(CC) -c $(CFLAGS) $(DEFINES) tiotest.c -o tiotest.o
>> +
>> + $(EXE): tiotest.o crc32.o
>> +-	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread
>> ++	$(CC) -o $(EXE) tiotest.o crc32.o -lpthread $(LDFLAGS)
>> + 	@echo
>> + 	@echo "./tiobench.pl --help for usage options"
>> + 	@echo
>> diff --git a/recipes/tiobench/tiobench_0.3.3.bb b/recipes/tiobench/tiobench_0.3.3.bb
>> new file mode 100644
>> index 0000000..829373f
>> --- /dev/null
>> +++ b/recipes/tiobench/tiobench_0.3.3.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION = "Threaded I/O tester"
>> +HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
>> +PROVIDES = "tiobench"
>> +LICENSE = "GPL"
>> +RDEPENDS = "\
>> +    perl \
>> +    perl-module-strict \
>> +    perl-module-getopt-long \
>> +    perl-module-overload \
>> +    perl-module-exporter-heavy \
>> +    "		
> There is unneeded white space at the end. `git diff --check` is your
> friend before a commit.
>
> Please sort the above variable according to the style guide [1].
Ok.

>> +PR = "r0"
>> +
>> +SRC_URI = "\
>> +    http://sourceforge.net/projects/tiobench/files/tiobench/0.3.3/tiobench-0.3.3.tar.gz \
>> +    file://tiobench-makefile.patch \
>> +    "
>> +SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
>> +SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
>> +
>> +do_compile() {
>> +    make CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
>> +}
> Is `oe_runmake` and passing the  available?
>
>> +
>> +do_install() {
>> +    make install PREFIX=${D}
>> +}
> Is not that the default? If you need to pass options you can add those
> to `EXTRA_OEMAKE`. If this does not work, you should still try to use
> `oe_runmake` if it is available.
Thanks for these tips, I will try to apply all your advices and I will 
send you a new version.

Regards

Ludovic



