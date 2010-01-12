Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NUhaB-0001Kf-LG
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 15:18:58 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NUhY8-0008Ly-1o
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 14:16:48 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NUhY7-0001LE-He
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 14:16:47 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <727203316.1263292376.164699196.97945@mcgi41.rambler.ru>
References: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>
	<1263288966.457.153.camel@lenovo.internal.reciva.com>
	<728686868.1263292036.179341680.5053@mcgi53.rambler.ru>
	<727203316.1263292376.164699196.97945@mcgi41.rambler.ru>
Date: Tue, 12 Jan 2010 14:16:44 +0000
Message-ID: <1263305804.3675.396.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Gnu/stubs-32.h not found
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
X-List-Received-Date: Tue, 12 Jan 2010 14:18:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-01-12 at 13:32 +0300, Perepelica Alexander wrote:
> He is log

Ah, I see.  So, you were right: it is in fact a multilibs problem.  What
has happened here is that gcc is trying to build a 32-bit version of
libgcc2, but you haven't compiled a 32-bit version of glibc yet.

There are two possible fixes:

- write a variant .bb file to build a 32 bit glibc, and arrange for
gcc-cross to DEPEND on that; or

- patch t-linux64, and/or the gcc configury, to stop it trying to build
the 32-bit multilib.

Which of those is appropriate obviously depends on what you are trying
to achieve, and I guess it would be sensible to provide a switch that
the DISTRO can use to enable or disable 32-bit multilibs.

p.




