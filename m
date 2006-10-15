Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GYu5Y-0004AC-4q
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Oct 2006 02:42:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 9EE8D80DE1;
	Sun, 15 Oct 2006 10:36:10 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13522-02; Sun, 15 Oct 2006 10:36:08 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 91B3920B0E;
	Sun, 15 Oct 2006 10:36:08 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 87AC812914FA; Sun, 15 Oct 2006 10:36:08 +1000 (EST)
Date: Sun, 15 Oct 2006 10:36:08 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
Message-ID: <20061015003608.GA12679@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Koen Kooi <koen@dominion.kabel.utwente.nl>,
	openembedded-devel@lists.openembedded.org
References: <20061014063527.GA4522@twibble.org>
	<45309E2B.2020901@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <45309E2B.2020901@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bugzilla & word wrapped text
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
X-List-Received-Date: Sun, 15 Oct 2006 00:42:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 14, 2006 at 10:22:03AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Jamie Lenehan schreef:
> > Is there anyway to stop bugzilla from word wrapping the text that's
> > placed in bug reports? It makes any sort of command output and
> > code/patches etc pretty damn difficult to make sense of.
> 
> You can, by using the 'attach' feature, which is sadly only visible after creating the
> inition bugreport. It's like inline patches in email, the kernel dudes love'em, I hate
> them :). The ideal bugreport would be:

The entire attachement setup on bugzilla sucks, but I agree for
patches and logs it should be used. I wish it had some damn option to
view them inline instead of usually having to download the damn
attaches and then go and find and view them in some other program
though (and even better if it did it by default so I don't have to go
the attachments page to view it!)

But I was more talking about trying to discuss stuff, like this from
a recent bug of mine:

---
The headers for glibc now define PT_GETSIGINFO:

 %> find tmp/staging -name '*.h' -exec grep -H PT_GETSIGINFO {} \;
 tmp/staging/sh4-linux/include/sys/ptrace.h:#define PT_GETSIGINFO
PTRACE_GETSIGINFO

where as they didn't for glibc 2.4. This causes the code in strace.c to fail
since in enables code that uses PT_CR_IPSR and PT_CR_IIP which are only
definied for IA64.
---

This is a trivial example, since only 1 lione was wrapped, but it
should have looked like this which is far easy to read:

---
The headers for glibc now define PT_GETSIGINFO:

 %> find tmp/staging -name '*.h' -exec grep -H PT_GETSIGINFO {} \;
 tmp/staging/sh4-linux/include/sys/ptrace.h:#define PT_GETSIGINFO PTRACE_GETSIGINFO

where as they didn't for glibc 2.4. This causes the code in strace.c to fail
since in enables code that uses PT_CR_IPSR and PT_CR_IIP which are only
definied for IA64.
--

Especially when you have a lot to say in the bug.

-- 
 Jamie Lenehan <lenehan@twibble.org>


