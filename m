Return-Path: <max.oss.09@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDB97210E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:57:44 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v8so10329339qal.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LomStBrMLQmRhFQWVplukEGvLlhKOYi8TXXam60g3Xg=;
	b=cGCVc1w35i9icaBiueIoZNCi4+RvvwzTR+nnd+inlG8NneWPJ/tKx3JqdQTRqPQ7lE
	xpzcqDbtUSQ6XXokJv14Ewz8Ek6Q/OFq0HU/IivG7lXxvARCE4JL/MnIvYwh4BAf2/sq
	wxZidh7T8s3hbWq9en0uLYSEPl6MIj6dG9gC8EfiFGb0GJApoGkl+7ZNYVnCativwkCw
	GSCcPBKR9stERTpQWa/8JhIEOaSoM6bWMnH/TM3Igjc8njuhtfOAvLq/wDdcV2jQhDsy
	7g72R7wMI/PHagD+LE3Ic//3CRsdZRW2yghRmBxAuyGERqq1blLNAg7nd7EUPVnXHFUL
	7KOw==
MIME-Version: 1.0
X-Received: by 10.140.51.77 with SMTP id t71mr3441912qga.88.1421315865389;
	Thu, 15 Jan 2015 01:57:45 -0800 (PST)
Received: by 10.140.30.229 with HTTP; Thu, 15 Jan 2015 01:57:45 -0800 (PST)
In-Reply-To: <D0DC62E4.8BDA%csmiley@icontrol.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<D0DC62E4.8BDA%csmiley@icontrol.com>
Date: Thu, 15 Jan 2015 10:57:45 +0100
Message-ID: <CAEHkU3WTndrNzyyvGDB20TcX4rRD4dUfvdOHN-LhhzbnbA6SGg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Colin Smiley <csmiley@icontrol.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Thu, 15 Jan 2015 09:57:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Colin

> Is the problem I'm seeing the same as what you're describing below?
Probably not.
The GCC cross compiler in my setup produces executables which
Segmentation Fault immediately when linked with --static.
So when qemu-arm is run you get an immediate seg fault.

You could test your gcc / qemu run as follows:
Change the paths/crosscompiler name to your setup, Compile a
helloworld program and run it under qemu.
If the binary compiled with -static fails then you might have the same
or related issue, if not it probably is unrelated.

--- hello.c ---
#include <stdio.h>
int main (void) {
        printf("Hi\n");
        return 0;
}
---------------

$ export SYSROOTS=/build/krm/oe-core_V2.3/build/out-eglibc/sysroots/
$ export PATH=$PATH:${SYSROOTS}/x86_64-linux/usr/bin/
$ export PATH=$PATH:${SYSROOTS}/x86_64-linux/usr/bin/armv7at2hf-vfp-angstrom-linux-gnueabi/
$ STAGING_DIR_TARGET=${SYSROOTS}/colibri-t20/

$ arm-angstrom-linux-gnueabi-gcc -static hello.c -o hello
$ qemu-arm -L ${STAGING_DIR_TARGET} -E
LD_LIBRARY_PATH=${STAGING_DIR_TARGET}/lib hello
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault (core dumped)

[krm@linuxdev ~]$ qemu-arm -L ${STAGING_DIR_TARGET} -E
LD_LIBRARY_PATH=${STAGING_DIR_TARGET}/lib hello

> Also, is there an update to meta-java to fix the CurrencyData problem?
For me this is fixed with:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=a7461bf7393c516c63c49a4b099d659ee467e93e
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=c600dd3ab5a6308c513f5fbf7243de1799d9ce62

Regards
Max

