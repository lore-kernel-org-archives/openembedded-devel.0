Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MbzD9-0000o4-Pu
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 18:00:59 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Mbyx2-00036O-Go
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:44:20 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Mbyx2-0001DC-8a
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:44:20 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908141710.43549.u.luckas@road.de>
References: <200908141710.43549.u.luckas@road.de>
Date: Fri, 14 Aug 2009 16:44:16 +0100
Message-Id: <1250264656.12282.1273.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: coreutils-native race
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
X-List-Received-Date: Fri, 14 Aug 2009 16:01:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-08-14 at 17:10 +0200, Uli Luckas wrote:
> What happens (once in a while) is that some build process uses commands from 
> coreutils-native while coreutils-native is being staged.
> Let's say the command is 'rm' - so coreutils-native stages 'rm' while another 
> build process trys to delete some file. This leads to "rm: text file busy" 
> because rm is still open for writing.
> 
> Has anyone seen this? And is there a known fix or workaround?

I guess the fix would be to make coreutils-native install its binaries
atomically (i.e. install them to ${STAGING_BINDIR}/rm.new and then mv
them into place) rather than installing them directly into their final
location.  Alternatively you could probably patch it to just not install
things like rm at all: if your host system doesn't have a functioning
"rm" then you're probably hosed anyway.

p.




