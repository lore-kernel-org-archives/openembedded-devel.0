Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Owg3O-0003zs-4V
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 20:52:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 323838A1890
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 14:52:07 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04181-03 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 17 Sep 2010 14:52:07 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id ADD448A180F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 14:52:06 -0400 (EDT)
Message-ID: <4C93B8D6.7080604@cbnco.com>
Date: Fri, 17 Sep 2010 14:52:06 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: util-linux-ng 2.17 do_install fails (setarch manpage links)
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
X-List-Received-Date: Fri, 17 Sep 2010 18:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

util-linux-ng fails to build:

...tmp/sysroots/x86_64-linux/usr/bin/install -c -m 644 ctrlaltdel.8 
cytune.8 setarch.8 ldattach.8 tunelp.8 rtcwake.8 pivot_root.8 
switch_root.8 .8 linux32.8 linux64.8 i386.8 .8 
'...tmp/work/i486-oe-linux/util-linux-ng-2.17-r29.2/image/usr/share/man/man8'

.../install: will not overwrite just-created 
`...tmp/work/i486-oe-linux/util-linux-ng-2.17-r29.2/image/usr/share/man/man8/.8' 
with `.8'
make[2]: *** [install-man8] Error 1
make[2]: Leaving directory 
`...tmp/work/i486-oe-linux/util-linux-ng-2.17-r29.2/util-linux-ng-2.17/sys-utils'


In util-linux-ng-2.17/sys-utils/Makefile.am:

SETARCH_LINKS = linux32 linux64
if ARCH_I86
SETARCH_LINKS += i386
endif
...
SETARCH_MAN_LINKS = $(SETARCH_LINKS:=.8)

automake 1.11.1 expands this to:

SETARCH_LINKS = linux32 linux64 $(am__append_19) $(am__append_20) \
         $(am__append_21) $(am__append_22) $(am__append_23) \
         $(am__append_24) $(am__append_25) $(am__append_26)
SETARCH_MAN_LINKS = $(SETARCH_LINKS:=.8)

Since am__append_21..26 are empty, SETARCH_MAN_LINKS is set to:

linux-32.8 linux-64.8 i386.8 .8

RDEV_MAN_LINKS has the same problem, so there are two ".8" files being 
produced, and the makefile is passing both of them to "install" on the 
same command-line -> fail.

The fix is pretty simple, but I'm wondering if I have something grossly 
wrong if no other distro is running into this. I'm updating my tree 
after almost a year, but this seems like a straight automake bug, and 
I'm using the same version of automake as everyone else (and presumably 
the same version of util-linux-ng).

Mike


