Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NMn6e-0006GZ-23
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 19:35:47 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NMn4q-0002Ae-FL
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 18:33:52 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90912201813i54c9e5d9r6e1545a3a9106f74@mail.gmail.com>
References: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
	<1261081378.6896.472.camel@lenovo.internal.reciva.com>
	<hglsfj$2vi$1@ger.gmane.org>
	<19c1b8a90912201813i54c9e5d9r6e1545a3a9106f74@mail.gmail.com>
Date: Mon, 21 Dec 2009 18:33:50 +0000
Message-ID: <1261420430.28755.188.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Mon, 21 Dec 2009 18:35:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2009-12-20 at 18:13 -0800, Khem Raj wrote:
> I was thinking of using amd64 but ARCH has to be
> x86_64 at least for gcc so I think we can not avoid
> it. may be we should make bitbake ignore certain
> overrides like x86_64 if thats possible at all.

I guess the primary variable that gcc actually cares about is
${TARGET_SYS} (which isn't, itself, an OVERRIDE).  It isn't strictly
necessary for the first part of ${TARGET_SYS} to match ${TARGET_ARCH}:
you could, in theory, set TARGET_SYS to "x86_64-unknown-linux-gnu" while
having TARGET_ARCH = "x86-64" or some other, non-underscore-containing,
value.

All that said, I'm not sure that TARGET_ARCH=x86_64 will be much of an
issue in practice.  The only situation where I can immediately think
that it would be problematic would be if both "x86" and "64" were
individually to appear in OVERRIDES for some other reason, and this
doesn't sound especially likely.  There are already plenty of situations
where you can, at least in theory, run into namespace collisions and it
isn't obvious to me that the x86_64 one is especially egregious.

p.




