Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.61)
	(envelope-from <DecemberSoul@gmx.de>) id 1GYMXT-0005X0-Rv
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 14:53:23 +0200
Received: (qmail 17656 invoked by uid 0); 13 Oct 2006 12:46:55 -0000
Received: from 213.238.49.68 by www033.gmx.net with HTTP;
	Fri, 13 Oct 2006 14:46:56 +0200 (CEST)
Date: Fri, 13 Oct 2006 14:46:55 +0200
From: DecemberSoul@gmx.de
Message-ID: <20061013124655.282560@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #1735141
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
Subject: distcc for bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 12:53:24 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hello
It is my first post on this list, so please be considerately.
I would like to use distcc for my bitbake.
On my local copy, with some hacks, it works fine. (until the next update)

Here is my way:

distccd was installed (apt-get install distcc) and started on Host1, Host2 and Host3
All hosts have the cross compiler mipsel-linux-gcc in the global PATH (or a symlink from /usr/local/bin/mipsel-linux-gcc to the cross compiler)

I have created a directory:
/bla/distcc/bin
   mipsel-linux-c++ -> /usr/bin/distcc
   mipsel-linux-cc -> /usr/bin/distcc
   mipsel-linux-g++ -> /usr/bin/distcc
   mipsel-linux-gcc -> /usr/bin/distcc

If I compile a Project by calling make(without bitbake) I can use
export PATH=/bla/distcc/bin:$PATH
make -j6 CC=mipsel-linux-gcc

make will call mipsel-linux-gcc from my path which points to distcc.
distcc will schedule the tasks to all known hosts.
-j6 will create 6 instances of make.
It works fine.

But now I want to use distcc with bitbake.
I know how to use -j6 with bitbake.
Just use "export PARALLEL_MAKE=-j6"

But how to use export PATH=/bla/distcc/bin:$PATH with bitbake.
The "distcc/bin" MUST stand in front of the PATH.
But bitbake will place the $PATH_prepend (placed in org.openembedded.dev/conf/bitbake.conf) in front of the $PATH. My hack is now to include "/bla/distcc/bin" in front of $PATH_prepend.
It works, but it is not nice.

So please tell me where can I put it.

Best regards
Patrick
-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal für Modem und ISDN: http://www.gmx.net/de/go/smartsurfer


