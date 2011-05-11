Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QKCzd-00087m-5B
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 19:14:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QKCYm-0000xR-IO
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 18:46:52 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305062085.9982.62.camel@mattotaupa>
References: <1305062085.9982.62.camel@mattotaupa>
Date: Wed, 11 May 2011 18:11:51 +0100
Message-ID: <1305133911.2421.29.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: minimal-uclibc: systemd fails with `src/manager.c:257:42: error: 'EPOLL_CLOEXEC' undeclared (first use in this function)`
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
X-List-Received-Date: Wed, 11 May 2011 17:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 23:14 +0200, Paul Menzel wrote:
> I am no uClibc expert, but do you know if uClibc will provide
> `EPOLL_CLOEXEC` in the near future? How should systemd fix that?

It's not just EPOLL_CLOEXEC: uClibc seems to be missing epoll_create1()
entirely.  As far as I know there's nothing complex about that, though:
it's just a standard syscall wrapper, so I don't know why it would have
been deliberately left out.  I guess you'd have to ask the uClibc h4x0rs
about that.

There probably is no trivial workaround available to systemd.  If you
wanted a quick hack to make it work then you could call
syscall(SYS_epoll_create1, O_CLOEXEC) manually.  Or you could perhaps
eliminate the usage of EPOLL_CLOEXEC in favour of a separate fcntl()
call, but that may not be safe if systemd is multithreaded.

p.




