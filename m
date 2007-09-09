Received: from [194.158.229.25] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IULRc-0006ho-Of
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 13:59:18 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB85480031E325 for openembedded-devel@openembedded.org;
	Sun, 9 Sep 2007 13:56:26 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l89BxdR01652;
	Sun, 9 Sep 2007 13:59:39 +0200
Sender: dv@vollmann.ch
Message-ID: <46E3E02B.22CEE170@vollmann.ch>
Date: Sun, 09 Sep 2007 13:59:39 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46E3264C.39BD31A5@vollmann.ch>
	<74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
Subject: Re: What is glibc-intermediate for?
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
X-List-Received-Date: Sun, 09 Sep 2007 11:59:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> glibc-initial is needed to build gcc-cross-initial, which is needed to
> build glibc-intermediate, which is needed to build gcc-cross, which is
> needed to build glibc.
Yes, this is what I expected as well, but what I don't see...

> Look at the package recipes, including
> glibc.inc to see what's going on.
Yes, I looked at all (well, most) of them.
The relevant lines are in glibc.inc:
> DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial', 'virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']} linux-libc-headers"
I have to admit that this is some magic for me (Python?), but
I interpret this that the dependency on virtual/gcc is somehow dependent
on NPTL.

> PROVIDES = "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc', '']['nptl' in '${GLIBC_ADDONS}']}"
And this looks like glibc provides libc-for-gcc (again somehow dependent
on NPTL), which means it's built first.

> The seemingly different build order you noticed is probably due to
> bitbake's fine-grained task dependencies. Maybe glibc was unpacked
> before gcc-cross, but it most certainly wasn't compiled before
> gcc-cross was staged.
In my case I don't have NPTL but linuxthreads, and interestingly
glibc is compiled before gcc-cross is compiled, but only staged after
gcc-cross is compiled, which is a strange order anyway...

Right now I still have problems with my glibc package, and I'll try
to fix those and then do a clean complete bootstrap again.
Let's see what comes out of that...

  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


