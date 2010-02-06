Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NdlGL-0000ba-VG
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 15:03:58 +0100
Received: from localhost ([127.0.0.1])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NdlDw-0000LL-ER
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 14:01:24 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265402638.4267.384.camel@cheeto.emacinc.com>
References: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
	<4B6C0F0D.8030308@vollmann.ch>
	<19c1b8a91002051000r69e645bey7395aa912d38e172@mail.gmail.com>
	<1265402638.4267.384.camel@cheeto.emacinc.com>
Date: Sat, 06 Feb 2010 14:01:17 +0000
Message-ID: <1265464878.5019.25.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Sat, 06 Feb 2010 14:03:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-05 at 14:43 -0600, Travis Stratman wrote:
> >From my understanding of this issue he has an OABI rootfs and is trying
> to run an EABI executable on top of it. This just doesn't work period
> AFAIK; the kernel can boot either OABI or EABI with the compatibility
> flags config'd in, but all of the binaries on the filesystem must match.

I don't think this is strictly true: there shouldn't be any particular
reason why OABI and EABI binaries couldn't coexist on the same
filesystem.  Of course, you would need to have both sets of runtimes
installed (ld.so and libc at a mininum, plus whatever other libraries
are needed by your apps) so this would not be completely trivial to
arrange, but I can't think of anything that would impose a hard
requirement for everything on the system to be using the same ABI.

p.




