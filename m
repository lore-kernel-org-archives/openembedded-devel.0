Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GSy8C-0006uv-74 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 17:49:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id D8CA7B13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 17:43:59 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 14049-03 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 17:43:55 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id D6582B0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 17:43:55 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20060928132713.GA32288@twibble.org>
References: <E1GStq9-0003dN-FU@linuxtogo.org>
	<20060928132713.GA32288@twibble.org>
Organization: VanilleMedia
Date: Thu, 28 Sep 2006 17:43:55 +0200
Message-Id: <1159458235.6791.27.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev glibc 2.4: Apply recently added	patches only fo x86.
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
X-List-Received-Date: Thu, 28 Sep 2006 15:49:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 28.09.2006, 23:27 +1000 schrieb Jamie Lenehan:
> On Thu, Sep 28, 2006 at 01:14:05PM +0200, "pfalcon commit" wrote:
> > glibc 2.4: Apply recently added patches only fo x86.
> > * Fixes breakage on ARM.
> > * Don't bump PR (previous commit neither did), to save long rebuilds.
> > Few people affected should use "bitbake glibc -c rebuild".
> > * Fixes #1443.
> > * Approved by Michael 'Mickey' Lauer <mickey at tm.informatik.uni-frankfurt de>.
> 
> I've tested here and those two patches break glibc 2.4 for my main
> targets which are sh4 (titan), i486 (wrap) and i586 (epia), building
> on an x86_64 host. The breakage basically exactly the same as in
> #1443.
> 
> I'm not sure what "x86" problem is that they are meant to fix (look
> like they are just wiring up syscalls to use in place of glibc equivs
> for the *at calls), but at least for me they actually break things on
> i486 and i586.

1. patch fixes problem:
| ../sysdeps/unix/sysv/linux/openat.c: In function '__OPENAT':
| ../sysdeps/unix/sysv/linux/openat.c:156: error: 'va_start' used in
function with fixed args

This is glibc bug #3130, see
http://sourceware.com/7bugzilla/show_bug.cgi?id=03170

2. patch fixes problem:

| /local/pkg/oe/x86/tmp/work/i486-angstrom-linux/glibc-intermediate-2.4-r10/build-i486-angstrom-linux/libc_pic.os: In function `fchownat':
| (.text+0x78cc6): undefined reference to `__atfct_seterrno'
| collect2: ld returned 1 exit status

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




