Received: from [194.158.229.40] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IURTR-0002ne-41
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 20:25:33 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB831A0032E467 for openembedded-devel@openembedded.org;
	Sun, 9 Sep 2007 20:22:41 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l89IPsR32386;
	Sun, 9 Sep 2007 20:25:54 +0200
Sender: dv@vollmann.ch
Message-ID: <46E43AB1.4808813@vollmann.ch>
Date: Sun, 09 Sep 2007 20:25:53 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46E3264C.39BD31A5@vollmann.ch>
	<74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
	<46E3E02B.22CEE170@vollmann.ch>
	<65784821.20070909143237@vanille-media.de>
Subject: PREFERRED_PROVIDER (was: Conditional Expressions in Python)
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
X-List-Received-Date: Sun, 09 Sep 2007 18:25:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dr. Michael Lauer wrote:
> DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial','virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']}"
> 
> Since Python 2.5, this can be written as:
> 
> DEPENDS = "${@'virtual/${TARGET_PREFIX}gcc' if 'nptl' in '${GLIBC_ADDONS}' else 'virtual/${TARGET_PREFIX}gcc-initial'}
Thanks for explaining these lines.
So, in my case (no NPTL), glibc is a provider of libc-for-gcc,
and I decided to put it as preferred provider into my local.conf
(actually it should go into my distro.conf, but that comes later...):
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"

But what surprise, it still tried to build glibc-intermediate.
Looking into the log file, I found the following lines:
> DEBUG: providers for virtual/powerpc-angstrom-linux-libc-for-gcc are: ['glibc', 'glibc-intermediate', 'eglibc-intermediate']
> DEBUG: update_data()
> DEBUG: selecting /oe/own/packages/glibc/glibc_2.3.6.bb as PREFERRED_VERSION 2.3.6 of package glibc (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> DEBUG: update_data()
> DEBUG: selecting /oe/rep/org.openembedded.dev/packages/glibc/glibc-intermediate_2.5.bb as PREFERRED_VERSION 2.5 of package glibc-intermediate (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> DEBUG: update_data()
> NOTE: selecting glibc-intermediate to satisfy virtual/powerpc-angstrom-linux-libc-for-gcc due to PREFERRED_PROVIDERS
This last line is simply wrong:  I've searched the whole repository
and my overlay for respective lines, and the only file with such a
preferred provider would be openprotium.conf, and that file isn't read.

My first guess was that the version number 2.5 for glibc-intermediate
is higher than the 2.3.6 for glibc and it was preferred for that.
So I put back another line into my local.conf:
PREFERRED_VERSION_glibc-intermediate = "2.3.6"

But this didn't help.  The relevant lines from the log are now:
> DEBUG: Added dependency virtual/powerpc-angstrom-linux-libc-for-gcc for /oe/own/packages/gcc/gcc-cross_4.1.1.bb
> DEBUG: providers for virtual/powerpc-angstrom-linux-libc-for-gcc are: ['glibc', 'glibc-intermediate', 'eglibc-intermediate']
> DEBUG: update_data()
> DEBUG: selecting /oe/own/packages/glibc/glibc_2.3.6.bb as PREFERRED_VERSION 2.3.6 of package glibc (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> DEBUG: update_data()
> DEBUG: selecting /oe/own/packages/glibc/glibc-intermediate_2.3.6.bb as PREFERRED_VERSION 2.3.6 of package glibc-intermediate (for item virtual/powerpc-angstrom-linux-libc-for-gcc)
> DEBUG: update_data()
> NOTE: selecting glibc-intermediate to satisfy virtual/powerpc-angstrom-linux-libc-for-gcc due to PREFERRED_PROVIDERS
> DEBUG: adding /oe/own/packages/glibc/glibc-intermediate_2.3.6.bb to satisfy virtual/powerpc-angstrom-linux-libc-for-gcc

Does anybody have any idea why bitbake still believes that it
should use glibc-intermediate for libc-for-gcc?

  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


