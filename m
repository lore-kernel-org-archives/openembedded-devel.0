Return-Path: <rich@noir.com>
Received: from sendai.noir.com (m209-5.dsl.rawbw.com [198.144.209.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9E86AA18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2013 01:10:06 +0000 (UTC)
Received: from ono.noir.com (ono.noir.com [192.168.1.11])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by sendai.noir.com (Postfix) with ESMTPS id 409ADE0888;
	Fri, 14 Jun 2013 18:10:06 -0700 (PDT)
Message-ID: <51BBBEEE.5080705@noir.com>
Date: Fri, 14 Jun 2013 18:10:06 -0700
From: "K. Richard Pixley" <rich@noir.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:23.0) Gecko/20100101 Thunderbird/23.0a2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: pseudo fails to compile on rhel-4.7
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
X-List-Received-Date: Sat, 15 Jun 2013 01:10:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I know rhel-4.7 is ancient, but the code is broken.

Looks like the call and the decl don't match.  Droping the last param on 
the call gets me built.

--rich

cc -fno-strict-aliasing  -pipe -std=gnu99 -Wall -W -Wextra -fPIC 
-D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE 
-DPSEUDO_PREFIX='"/home/ericpix/gnu/rhel-4.7"' -DPSEUDO_SUFFIX='""' 
-DPSEUDO_BINDIR='"bin"' -DPSEUDO_LIBDIR='"lib"' 
-DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.5.1"' 
-DUSE_MEMORY_DB  -O2 -g -L/home/ericpix/gnu/rhel-4.7/lib 
-I/home/ericpix/gnu/rhel-4.7/include 
-Wl,-R/home/ericpix/gnu/rhel-4.7/lib -D_GNU_SOURCE -c -o 
pseudo_wrappers.o pseudo_wrappers.c
In file included from ports/linux/oldclone/pseudo_wrappers.c:61,
                  from port_wrappers.c:23,
                  from pseudo_wrappers.c:255:
ports/linux/oldclone/guts/clone.c: In function `clone':
ports/linux/oldclone/guts/clone.c:22: error: too many arguments to function
In file included from port_wrappers.c:23,
                  from pseudo_wrappers.c:255:
ports/linux/oldclone/pseudo_wrappers.c:39: warning: unused variable `tls'
ports/linux/oldclone/pseudo_wrappers.c:40: warning: unused variable `ctid'
pseudo_wrappers.c: At top level:
ports/linux/oldclone/pseudo_wrappers.c:2: warning: unused parameter 'fn'
ports/linux/oldclone/pseudo_wrappers.c:2: warning: unused parameter 
'child_stack'
ports/linux/oldclone/pseudo_wrappers.c:2: warning: unused parameter 'flags'
ports/linux/oldclone/pseudo_wrappers.c:2: warning: unused parameter 'arg'
make: *** [pseudo_wrappers.o] Error 1

real    0m0.607s
user    0m0.366s
sys     0m0.103s
ericpix@lx-dev6> lsb_release -a
LSB Version: 
:core-3.0-ia32:core-3.0-noarch:graphics-3.0-ia32:graphics-3.0-noarch
Distributor ID: RedHatEnterpriseAS
Description:    Red Hat Enterprise Linux AS release 4 (Nahant Update 7)
Release:        4
Codename:       NahantUpdate7
ericpix@lx-dev6> uname -a
Linux lx-dev6 2.6.9-78.ELsmp #1 SMP Wed Jul 9 15:39:47 EDT 2008 i686 
athlon i386 GNU/Linux

diff --git a/ports/linux/oldclone/guts/clone.c 
b/ports/linux/oldclone/guts/clone.c
index 5240bb3..4efe4d8 100644
--- a/ports/linux/oldclone/guts/clone.c
+++ b/ports/linux/oldclone/guts/clone.c
@@ -19,7 +19,7 @@
         myargs->arg = arg;

         /* call the real syscall */
-       rc = (*real_clone)(wrap_clone_child, child_stack, flags, myargs, 
pid);
+       rc = (*real_clone)(wrap_clone_child, child_stack, flags, 
myargs/* , pid */);

         /* If we're not sharing memory, we need to free myargs in the 
parent */
         if (!(flags & CLONE_VM))



