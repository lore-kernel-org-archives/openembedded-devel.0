Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Md4KZ-0004am-N6
	for openembedded-devel@openembedded.org; Mon, 17 Aug 2009 17:41:08 +0200
Received: (qmail 9752 invoked from network); 17 Aug 2009 15:24:09 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 Aug 2009 08:24:09 -0700
Date: Mon, 17 Aug 2009 08:24:08 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090817152407.GA2227@smtp.west.cox.net>
References: <E1Md2kK-0008Uz-Fd@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1Md2kK-0008Uz-Fd@melo.openembedded.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Holger Hans Peter Freyther : site: Add ac value	for mipsel-linux and mipsel-linux-uclibc
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
X-List-Received-Date: Mon, 17 Aug 2009 15:41:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2009 at 01:59:36PM +0000, git version control wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 0907be2124ae3ca7b80dfc60d7632504339f00bd
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=0907be2124ae3ca7b80dfc60d7632504339f00bd
> 
> Author: Holger Hans Peter Freyther <zecke@selfish.org>
> Date:   Thu Aug 13 06:55:59 2009 +0200
> 
> site: Add ac value for mipsel-linux and mipsel-linux-uclibc
> 
> The results were found using google and applying
> common sense.
> 
> ---
> 
>  site/mipsel-linux        |    4 ++++
>  site/mipsel-linux-uclibc |    4 ++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/site/mipsel-linux b/site/mipsel-linux
> index 06602ca..ef7612b 100644
> --- a/site/mipsel-linux
> +++ b/site/mipsel-linux
> @@ -6,6 +6,10 @@ ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
>  # tslib, others
>  ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
>  
> +# mysql
> +ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
> +ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
> +
>  # bash
>  ac_cv_c_long_double=${ac_cv_c_long_double=no}
>  bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
> diff --git a/site/mipsel-linux-uclibc b/site/mipsel-linux-uclibc
> index 9545fea..9fdfe3a 100644
> --- a/site/mipsel-linux-uclibc
> +++ b/site/mipsel-linux-uclibc
> @@ -6,6 +6,10 @@ ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
>  # tslib, others
>  ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
>  
> +# mysql
> +ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
> +ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
> +
>  # bash
>  ac_cv_c_long_double=${ac_cv_c_long_double=no}
>  bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}

Given that the answer is the same for mipsel-linux and
mipsel-linux-uclibc, this is probably the wrong place.  The right place
is either a mips common one or a linux common one (if it's also the same
for every other linux platform).

-- 
Tom Rini


