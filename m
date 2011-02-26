Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PtP4k-0008Pt-Au
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 19:41:06 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PtP3R-0000CI-Hb
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 19:39:45 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1298742255-23389-1-git-send-email-ynezz@true.cz>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
Date: Sat, 26 Feb 2011 18:39:38 +0000
Message-ID: <1298745578.3818.7.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 18:41:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-02-26 at 18:44 +0100, Petr =C5=A0tetiar wrote:
> cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory

Are you really using POSIX.1e caps on micro?  If yes then I guess this
is fine, though it would be interesting to know what the code size
impact is.

p.




