Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8YFl-0004L4-A8
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 12:54:20 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8YET-0004GX-T5
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 11:52:58 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1N8YES-0006jd-FM
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 11:52:56 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hdfdoe$kj7$1@ger.gmane.org>
References: <hdfdoe$kj7$1@ger.gmane.org>
Date: Thu, 12 Nov 2009 11:52:52 +0000
Message-Id: <1258026772.1484.358.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Blackfin toolchain question
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
X-List-Received-Date: Thu, 12 Nov 2009 11:54:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 22:27 +0000, Dmitry Eremin-Solenikov wrote:
> I'm currently trying to restore/update blackfin toolchain. One of the major problems I've stumbled upon
> are versioned scripts/export symbols. Basically there are lot's of software starting from g++ itself
> that have symbol versioning scripts. The problem is that blackfin arch prepends all symbols with underscore,
> thus breaking all that scripts.
> 
> My first intention was to follow the alsa-libs approach: handle all prefixing on package-per-package basis.
> However that would be a nigtmare.
> 
> My current intention (that at least partially works) is to make libtool (when it's used) generate correct
> versioning scripts and resort to package-per-package updating after that.
> 
> The problem comes from C++ world, where versioning script can contain unmangled name, but it's demangled
> name that should be prefixed with underscore.
> 
> So I have a bit hackish idea: maybe it's better to hack ld to accept scripts w/o underscores and prefix all
> symbols with it? This will eliminate most of changes. The question is if this patch is acceptable for OE?
> Does this approach sound too hackish?

How do other Blackfin folks deal with this issue?  It doesn't sound like
there is anything OE-specific about the problem you are facing, and I
would have thought that it is something that should be solved upstream
rather than with a local hack in OE.

Linker version scripts operate on symbol names, not on function names,
so I don't think that having the underscores automatically added here
would be appropriate.  

It is a little bit unfortunate that the Blackfin folks have decided to
put these underscores in their symbols.  The ELF gABI calls for symbol
names to be the same as C function names (i.e. no prefix) and, although
I guess the psABI is permitted to countermand that, the vast majority of
architectures do follow the gABI convention.  Underscore-prefixed symbol
names are fairly common in the a.out and COFF worlds but of course there
are no version scripts there so this issue does not arise.

p.




