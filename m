Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JjrYl-0004pL-6N for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 09:51:03 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 4F3CEEC5C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2008 03:51:00 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute2.internal (MEProxy); Thu, 10 Apr 2008 03:51:00 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id 289F32206C; Thu, 10 Apr 2008 03:51:00 -0400 (EDT)
Message-Id: <1207813860.21919.1247100073@webmail.messagingengine.com>
X-Sasl-Enc: kO6q0RDDhMzJybVBOSxqZbcJd43gdKIysNuoycMzjm1e 1207813860
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
Date: Thu, 10 Apr 2008 17:51:00 +1000
Subject: gcc-4.3.0 based toolchain (needed for ep93xx crunch)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2008 07:51:03 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"

Has anyone gotten a gcc 4.3.0 toolchain working on OE yet?

I need to go to gcc 4.3.0 to properly implement ep93xx crunch support,
since I need to call optab_libfunc from gcc/optabs.c.  Unfortunately,
this isn't in 4.2.3.

I get problems compiling glibc-intermediate 2.6.1 or 2.7:

| make[2]: *** Waiting for unfinished jobs....
| In file included from ../nptl/descr.h:23,
|                  from ../ports/sysdeps/arm/nptl/tls.h:63,
|                  from ../include/tls.h:6,
|                  from ../include/link.h:45,
|                  from ../include/dlfcn.h:3,
|                  from ../sysdeps/generic/ldsodefs.h:32,
|                  from ../ports/sysdeps/arm/ldsodefs.h:39,
|                  from ../sysdeps/unix/sysv/linux/ldsodefs.h:25,
|                  from <stdin>:2:
| ../include/limits.h:125:26: error: limits.h: No such file or directory
| make[2]: ***
[/home/hwilliams/openembedded-latest/build-dev/tmp/work/ep9312-angstrom-linux-gnueabi/glibc-intermediate-2.7-r1/build-arm-angstrom-linux-gnueabi/tcb-offsets.h]
Error 1

I saw Koen's E-mail titled "Adjusting staging for gcc >= 4.3.0", to do a
soft-link:

> ln -sf /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.3.0/
> include-fixed/* /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux-
> gnueabi/4.3.0/include/

Any chance someone can push a (temporary?) change into bb, so others do
this automatically, or are we going to go down the path suggested by
Sergey:

> C_SYSTEM_INCLUDE :=$(shell $(CC) -print-file-name=include || echo)
> CFLAGS+= -isystem $(C_SYSTEM_INCLUDE) -isystem $(C_SYSTEM_INCLUDE)-fixed

Thoughts?

I'm in the process of making changes to gcc and glibc so I'd rather not
have to do this every build.


