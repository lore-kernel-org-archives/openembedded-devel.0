Received: from [194.158.229.41] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IZhbq-00068w-Ej
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 08:39:58 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB871F00629CD8 for openembedded-devel@openembedded.org;
	Mon, 24 Sep 2007 08:35:41 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l8O6cTA23054;
	Mon, 24 Sep 2007 08:38:29 +0200
Sender: dv@vollmann.ch
Message-ID: <46F75B64.1C3AE60B@vollmann.ch>
Date: Mon, 24 Sep 2007 08:38:28 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.31 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1190191062.7630.17.camel@localhost.localdomain>
Subject: Re: cross and staging directories
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
X-List-Received-Date: Mon, 24 Sep 2007 06:39:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

Richard Purdie wrote:
> 
> I've been experimenting a bit in Poky to find out exactly why we need
> the cross directory.
> 
> The motivation for this is the load of files we duplicate in both,
> particularly linux-libc-headers, headers from glibc-initial, glibc and
> glibc-intermediate and libs from glibc and glibc-intermediate.
So your idea is to omit the cross directory and install the
cross compiler inside staging?
Or to keep the cross compiler in cross, but install the libraries
in staging only?

> Just not staging the files to cross gives some interesting errors.
> Whenever anything tries to link to glibc, you see errors about not being
> able to find crti.o and friends. The files are in STAGING_LIBDIR, gcc
> just refuses to see them. Poky also demonstrated you also occasionally
> see errors about missing header files despite the header files being in
> STAGING_INCDIR.
> 
> Why does this happen?
Some files are linked in directly from fix places relative to the
gcc binary.  So if gcc is in cross and you call it with
'/path-to-cross/bin/powerpc-angstrom-linux-gcc -v hello.c'
you'll see something like
/path-to-cross/bin/../libexec/gcc/powerpc-angstrom-linux/4.1.1/collect2 ... \
 /path-to-cross/bin/../lib/gcc/powerpc-angstrom-linux/4.1.1/crtend.o \
 /path-to-cross/bin/../lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib/crtn.o

If you move the compiler somewhere else, only 'path-to-cross' changes,
but the rest keeps the same.

So, files like crtsavres.o and crtend.o are taken from
'path-to-cross/lib/gcc/powerpc-angstrom-linux/4.1.1'
while crti.o is taken from
'path-to-cross/powerpc-angstrom-linux/lib'

So, if you install the cross-gcc into staging/bin, everything is fine.
But if you install the cross-gcc into staging/i686-linux/bin,
crti.o isn't found anymore.

Just some more thoughts,
  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


