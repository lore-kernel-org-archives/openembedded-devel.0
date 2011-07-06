Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ozgungunay@gmail.com>) id 1QeTIZ-0003zh-4b
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 16:41:55 +0200
Received: by gyd12 with SMTP id 12so2870872gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=DomRuadfmlxaV/TA6JfcdwEdNhqqwHPjgc7zO/5P2f4=;
	b=q+Xxg4P/0PQOCzdkm6tXMa0yH8DF9w6la55saUqFEKkk3v787yCrkZez3237Qjujdx
	eu09Jb0nLJquY9N0UOwEnMThDE3Zc/HSpgbsUhuyqDlYz6pllB6qToeCX1uVrDornVda
	176KiwWZcpvulKVubQvJkfgPu4E80e+5tPoKQ=
MIME-Version: 1.0
Received: by 10.151.25.12 with SMTP id c12mr7554690ybj.417.1309963081970; Wed,
	06 Jul 2011 07:38:01 -0700 (PDT)
Sender: ozgungunay@gmail.com
Received: by 10.150.198.11 with HTTP; Wed, 6 Jul 2011 07:38:01 -0700 (PDT)
Date: Wed, 6 Jul 2011 17:38:01 +0300
X-Google-Sender-Auth: puDK1-xjrTP0maj88Z5ZFoX57YA
Message-ID: <CAPeX=+uCtwx_jTURr5juwsGE58ZJcC7v4xT9kb3b-F2xPbcjQw@mail.gmail.com>
From: Ozgun <ozgun.gunay@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gcc-cross-initial compile failure
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
X-List-Received-Date: Wed, 06 Jul 2011 14:41:55 -0000
Content-Type: text/plain; charset=UTF-8

The build is failing on gcc-cross-initial;
NOTE: package gcc-cross-initial-4.4.4-r8.1: task do_compile: Failed
ERROR: Function 'do_compile' failed (see
/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/temp/log.do_compile.18907
for further information)
ERROR: Task 3612 (/work/openembedded/recipes/gcc/gcc-cross-initial_4.4.4.bb,
do_compile) failed with exit code '1'
ERROR: '/work/openembedded/recipes/gcc/gcc-cross-initial_4.4.4.bb' failed



From log.do_compile.18907;
In file included from
/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/gcc-4.4.4/gcc/tree.h:30:0,
                 from
/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/gcc-4.4.4/gcc/c-lang.c:27:
/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/gcc-4.4.4/gcc/double-int.h:24:17:
fatal error: gmp.h: No such file or directory
compilation terminated.
make[3]: *** [c-lang.o] Error 1
make[3]: Leaving directory
`/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/gcc-4.4.4/build.i686-linux.i686-linux/gcc'
make[2]: *** [all-stage1-gcc] Error 2
make[2]: Leaving directory
`/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/gcc-4.4.4/build.i686-linux.i686-linux'
make[1]: *** [stage1-bubble] Error 2
make[1]: Leaving directory
`/home/ozgun/tmp/work/i686-linux/gcc-cross-initial-4.4.4-r8.1/gcc-4.4.4/build.i686-linux.i686-linux'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1



From gcc-4.4.4.inc;
DEPENDS = "mpfr gmp"
NATIVEDEPS = "mpfr-native gmp-native"

gcc depends mpfr gmp, therefore compiler needs mpfr.h gmp.h
But these files are located under their own folder
(/work/i686-linux/gmp-native-5.0.1-r1.1/gmp-5.0.1/gmp.h) ,not under gcc
folder.

Wondering how can you overcome this problem?

Thanks,

