Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhfWT-0000V1-Dv
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 10:12:26 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MhfEW-0001Qo-EB
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 08:53:54 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251594596-4738-1-git-send-email-raj.khem@gmail.com>
References: <1251594596-4738-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 30 Aug 2009 08:53:33 +0100
Message-Id: <1251618813.4215.650.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] micro-uclibc, minimal-uclibc: Reorder including	the base distro config.
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
X-List-Received-Date: Sun, 30 Aug 2009 08:12:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-29 at 18:09 -0700, Khem Raj wrote:
> A lot of stuff in these conf's are already set and
> is duplicated. This is removed. The base conf file
> should be included at the end after assigning LIBC
> so that correct toolchain configuration is picked.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/micro-uclibc.conf   |   30 ++++--------------------------
>  conf/distro/minimal-uclibc.conf |   20 ++------------------
>  2 files changed, 6 insertions(+), 44 deletions(-)

The micro part of this looks OK to me, assuming you've tested that the
distro does actually build after this change.  I don't feel very
qualified to comment on the minimal part so I will leave that for
someone else to review.

p.




