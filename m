Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhJNT-0001NX-GI
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 10:33:40 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MhJ5d-0006Mt-Nq
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 09:15:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 29 Aug 2009 09:14:56 +0100
Message-Id: <1251533696.4215.623.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS =	linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 08:33:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-08-28 at 17:00 -0700, Khem Raj wrote:
> Target triplet powerpc-*-linux-gnuspe is chosen for machines with SPE
> which is e500 cores.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/include/sane-toolchain-eglibc.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
> index 88719f5..6b66679 100644
> --- a/conf/distro/include/sane-toolchain-eglibc.inc
> +++ b/conf/distro/include/sane-toolchain-eglibc.inc
> @@ -5,6 +5,8 @@
>  
>  TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
>  
> +TARGET_OS = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540']]}"
> +

This change looks like it will break the -gnueabi thing on ARM, which
presumably isn't intended.

Also, is this really specific to eglibc?  Per our conversation on IRC
the other day, I kind of feel that this sort of logic belongs somewhere
else; it seems somewhat inappropriate for sane-toolchain-xx.inc to be
frobbing fundamental variables like TARGET_OS in this way.

p.



