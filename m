Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2fvD-0007ld-FZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 09:57:20 +0200
Received: by iwn2 with SMTP id 2so6564277iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=/3zEPuoqYu8DNfcEkncKbdkc9qIch4/HOYISfkyUVr8=;
	b=BBwe68sn2FjLxot029A8sCCv65UgX0pkz1kJVLM5EtWDVncJLp6f2lOIZqxvkxvb/n
	fNq5aPBFMUePTUyzcaoelzL7HFIAxFVGNW6jEo39CZQN7WkPg56CJcm/lpAg26azbMuM
	i2yNUY7oS74fe3sZr8ttwcws2lIUi3EqqVeLw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=eU3tKbufWK/7xcqwJOy9Cxw02Hf5VI6dpIxpNY65EDab3+iGZGQkZTCFEnG917MEo6
	MEmRNoUPHMdGjFCulxOyvT5rgjujFBvsqm68IqeAFxDOhkleQj3+jofBUyFlriNPHoNH
	nUMEj138qYHLH0yDD0rpD+EoB0x7E4QLsfe4I=
MIME-Version: 1.0
Received: by 10.42.6.135 with SMTP id a7mr11425650ica.53.1286179022521; Mon,
	04 Oct 2010 00:57:02 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 00:57:02 -0700 (PDT)
Date: Mon, 4 Oct 2010 00:57:02 -0700
Message-ID: <AANLkTimrGS29_H2YRjyQRmkwj2W2OkeNMTHt0pyF3U12@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: strace 4.5.14 troubles compiling
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
X-List-Received-Date: Mon, 04 Oct 2010 07:57:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

I cant get strace to build since I moved to angstrom 2010.x with gcc
4.5, does any one have any hints? Here is the error message:

NOTE: Running task 782 of 795 (ID: 15,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strace_4.5.14.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.5.14-r9/temp/log.do_compile.881)
| NOTE: make
| make  all-am
| make[1]: Entering directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.5.14-r9/strace-4.5.14'
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
-DHAVE_CONFIG_H -I. -Ilinux/arm -I./linux/arm -Ilinux -I./linux
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-Wall -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-ggdb2 -Os -MT net.o -MD -MP -MF .deps/net.Tpo -c -o net.o net.c
| net.c: In function 'printsock':
| net.c:957:22: error: field 'nl' has incomplete type
| make[1]: *** [net.o] Error 1
| make[1]: Leaving directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.5.14-r9/strace-4.5.14'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/strace-4.5.14-r9/temp/log.do_compile.881
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strace_4.5.14.bb
do_compile failed
ERROR: Task 15 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strace_4.5.14.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 781 tasks of which 781 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/strace/strace_4.5.14.bb'
failed


