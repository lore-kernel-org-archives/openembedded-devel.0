Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dothemango@gmail.com>) id 1Nsdee-000238-8F
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 15:58:46 +0100
Received: by wyb28 with SMTP id 28so1534583wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=cWrWn7JDFrPLoj7zS2542M5RUtAVCQ4BEZqsOAJBK2Q=;
	b=K5Q25Hf3GUsYB6ROt5mTM2i5RS1OOUA+UOK440E8UsWv4I7680Yxo+GnghZfOqGzAi
	YrN4++PAVY92sFEBW5W7mg8qd5AQs+eQTdIgH38IX6b3/EPC2q+aAjl4q5SBjIzCPTgt
	lUWqIKIlWQVXdeaznmZXaCz+cc59i51ytPKF0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=CXq6hynsqj0eDoG9OLZ94tWd6zWGFvDun1riDSDYTfxAVVZcTjctoJ/x48JBX7o/kC
	oY/U9PGG+GSmbJrwoVPh9RS/a5SCo/xnFmWou104yi7nSL7DTPmSIiYVTLlBFobp0v2x
	ZVtnsbD0A5hN4ajLK9XIkAhY8AWav84SPKBhM=
MIME-Version: 1.0
Sender: dothemango@gmail.com
Received: by 10.216.169.84 with SMTP id m62mr38650wel.130.1269010519734; Fri, 
	19 Mar 2010 07:55:19 -0700 (PDT)
Date: Fri, 19 Mar 2010 15:55:19 +0100
X-Google-Sender-Auth: b6086b7a71b2e102
Message-ID: <325d766d1003190755k4eb00bccve008b95f6071a3bd@mail.gmail.com>
From: martin mangard <martin@mangard.at>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: dothemango@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xfonts-xorg_6.8.bb flex-problem?
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
X-List-Received-Date: Fri, 19 Mar 2010 14:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello

I've got a problem compiling the   xfonts-xorg package. regarding to a
post in the gentoo mailing list this should be an issue with a wrong
flex version.
http://bugs.gentoo.org/133646 . They use flex version 2.5.33 .
I tried to compile this package with flex version 2.5.31 and 2.5.35.
Both  times the build failed with the same error message.


| gcc -O2 -fno-strength-reduce -ansi -pedantic -Wall -Wpointer-arith
-Wundef     -I../.. -I../../exports/include   -Dlinux -D__i386__
-D_POSIX_C_SOURCE=199309L
-D_POSIX_SOURCE -D_XOPEN_SOURCE
-D_BSD_SOURCE -D_SVID_SOURCE                             -D_GNU_SOURCE
                           -DFUNCPROTO=15 -DNARROWPROTO
-DXENVIRONMENT
-isystem/home/mmangard/mystuff/build_test/tmp/staging/i486-angstrom-linux/usr/include
 -c -o pswparser.o pswparser.c
| y.tab.c:230:6: warning: "YYENABLE_NLS" is not defined
| y.tab.c:734:6: warning: "YYLTYPE_IS_TRIVIAL" is not defined
| flex -l  -t lexer.l > lexer.c
| gcc -O2 -fno-strength-reduce -ansi -pedantic -Wall -Wpointer-arith
-Wundef     -I../.. -I../../exports/include   -Dlinux -D__i386__
-D_POSIX_C_SOURCE=199309L
-D_POSIX_SOURCE -D_XOPEN_SOURCE
-D_BSD_SOURCE -D_SVID_SOURCE                             -D_GNU_SOURCE
                           -DFUNCPROTO=15 -DNARROWPROTO
-DXENVIRONMENT
-isystem/home/mmangard/mystuff/build_test/tmp/staging/i486-angstrom-linux/usr/include
 -c -o lexer.o lexer.c
| lexer.l:44: error: non-static declaration of 'yy_prev_more_offset'
follows static declaration
| <stdout>:819: note: previous definition of 'yy_prev_more_offset' was here
| lexer.l: In function 'yylex':
| lexer.l:350: warning: format '%lo' expects type 'long unsigned int
*', but argument 3 has type 'long int *'
| lexer.l:359: warning: format '%lx' expects type 'long unsigned int
*', but argument 3 has type 'long int *'
| make[4]: *** [lexer.o] Error 1
| make[4]: Leaving directory
`/home/mmangard/mystuff/build_test/tmp/work/all-angstrom-linux/xfonts-xorg-6.8-r1/xc/config/pswrap'
| make[3]: *** [../../config/pswrap/pswrap] Error 2
| make[3]: Leaving directory
`/home/mmangard/mystuff/build_test/tmp/work/all-angstrom-linux/xfonts-xorg-6.8-r1/xc/lib/dps'
| make[2]: *** [includes] Error 2
| make[2]: Leaving directory
`/home/mmangard/mystuff/build_test/tmp/work/all-angstrom-linux/xfonts-xorg-6.8-r1/xc/lib'
| make[1]: *** [includes] Error 2
| make[1]: Leaving directory
`/home/mmangard/mystuff/build_test/tmp/work/all-angstrom-linux/xfonts-xorg-6.8-r1/xc'
| make: *** [includes] Error 2
NOTE: Task failed:
/home/mmangard/mystuff/build_test/tmp/work/all-angstrom-linux/xfonts-xorg-6.8-r1/temp/log.do_compile.9487


I tried to make a package for flex 2.5.33, but ran into problems. But
I also don't want to be stuck at a specific flex version, which has a
lot of dependencies.
How can I build the "x-fonts-xorg" package successfully?  Is it a
wrong version of flex or is there another problem?

Martin


