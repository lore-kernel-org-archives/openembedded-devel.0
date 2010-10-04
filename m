Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2hmq-0004gu-4w
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 11:57:42 +0200
Received: by pwj1 with SMTP id 1so1032347pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oQmw9vlEdSBRmmmex/UG2x+H2yhtqFehM1gDHt3x6E8=;
	b=FZ01vlJlz2AOdI2zJ5l/+UV+zUhwpoMjl8zWkuSI5LNo8ss+5jds3Ah/cW2WyoL4Uq
	LjQjrSus3rhBW/whRH2Eyi6543hF1dVfd8CApE7gaScHrFYMFl9qQknbZFC/T3oiKa7r
	4NyGr8b790BdbH7qIycmaucO7s2mFomxBbTWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=smnJEPmHM5jIVVVn83o6d7mybx1Y8jQ4m0WnBPRibMruMdtNcb9zlW9vZ80D1Ye015
	tSdJ6e1qM9Agf6DY8kuvx2fBw+Ig++9rFmdwzgUiC2lrZ3g91QmsDPB1rmPl0kxggwkG
	3sbUCnJQ+EXzGQ82ptfX2gn67SzuT1n28tFxU=
MIME-Version: 1.0
Received: by 10.143.30.19 with SMTP id h19mr4934745wfj.310.1286186181734; Mon,
	04 Oct 2010 02:56:21 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 02:56:21 -0700 (PDT)
In-Reply-To: <AANLkTimrGS29_H2YRjyQRmkwj2W2OkeNMTHt0pyF3U12@mail.gmail.com>
References: <AANLkTimrGS29_H2YRjyQRmkwj2W2OkeNMTHt0pyF3U12@mail.gmail.com>
Date: Mon, 4 Oct 2010 02:56:21 -0700
Message-ID: <AANLkTikHLmiw=NyFPm=SjaNitrygpWvE-MTETWLoEZn=@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: strace 4.5.14 troubles compiling
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
X-List-Received-Date: Mon, 04 Oct 2010 09:59:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 12:57 AM, J. L. <vwyodapink@gmail.com> wrote:
> I cant get strace to build since I moved to angstrom 2010.x with gcc
> 4.5, does any one have any hints? Here is the error message:
>
> NOTE: Running task 782 of 795 (ID: 15,
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strace_4.5.14=
.bb,
> do_compile)
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.=
5.14-r9/temp/log.do_compile.881)
> | NOTE: make
> | make =A0all-am
> | make[1]: Entering directory
> `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.=
5.14-r9/strace-4.5.14'
> | arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb
> -DHAVE_CONFIG_H -I. -Ilinux/arm -I./linux/arm -Ilinux -I./linux
> -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include
> -Wall -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-=
gnueabi/usr/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
> -ggdb2 -Os -MT net.o -MD -MP -MF .deps/net.Tpo -c -o net.o net.c
> | net.c: In function 'printsock':
> | net.c:957:22: error: field 'nl' has incomplete type
> | make[1]: *** [net.o] Error 1
> | make[1]: Leaving directory
> `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.=
5.14-r9/strace-4.5.14'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.5=
.14-r9/temp/log.do_compile.881
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strace_4.5.14=
.bb
> do_compile failed
> ERROR: Task 15 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/stra=
ce/strace_4.5.14.bb,
> do_compile) failed
> NOTE: Tasks Summary: Attempted 781 tasks of which 781 didn't need to
> be rerun and 1 failed.
> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strac=
e_4.5.14.bb'
> failed
>

was able to get 4.5.20 to build with no issues so will stick with that
since its the most current version on there..


