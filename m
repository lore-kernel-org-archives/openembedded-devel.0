Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1StNYC-000684-8y
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 20:40:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jul 2012 11:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="170284943"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by orsmga001.jf.intel.com with ESMTP; 23 Jul 2012 11:28:43 -0700
Message-ID: <500D97DB.5050007@linux.intel.com>
Date: Mon, 23 Jul 2012 11:28:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <fahad.usman@gmail.com>
	<1343037078-9760-1-git-send-email-fahad.usman@gmail.com>
In-Reply-To: <1343037078-9760-1-git-send-email-fahad.usman@gmail.com>
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: Re: [OE-core] [PATCH] readline: add missing macros in acinclude.m4
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
X-List-Received-Date: Mon, 23 Jul 2012 18:40:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 02:51 AM, fahad.usman@gmail.com wrote:
> From: Fahad Usman <fahad_usman@mentor.com>
>
> some bash macros are missing from acinclude.m4 which are added up-stream. This
> wasn't actually breaking anything but but it was causing the configure script
> to not run all the tests it's intended to run. (by Christopher Larson)
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>   meta/recipes-core/readline/files/acinclude.m4 |   56 +++++++++++++++++++++++++
>   1 files changed, 56 insertions(+), 0 deletions(-)
>
You would need a PR bump in the readline .bb files, did you test this 
with the 5.2 version and the 6.2 version?

If this was pulled from the 6.2 version, then you will need to also 
modify the 5.2 bb file to use the older version of the macro file to not 
do any gplv3 contamination, please use caution here, we need to ensure 
correct separation.

Sau!
> diff --git a/meta/recipes-core/readline/files/acinclude.m4 b/meta/recipes-core/readline/files/acinclude.m4
> index 8a45f99..c30a7d3 100644
> --- a/meta/recipes-core/readline/files/acinclude.m4
> +++ b/meta/recipes-core/readline/files/acinclude.m4
> @@ -1813,3 +1813,59 @@ AC_MSG_RESULT($ac_cv_rl_version)
>
>   fi
>   ])
> +
> +AC_DEFUN(BASH_FUNC_CTYPE_NONASCII,
> +[
> +AC_MSG_CHECKING(whether the ctype macros accept non-ascii characters)
> +AC_CACHE_VAL(bash_cv_func_ctype_nonascii,
> +[AC_TRY_RUN([
> +#ifdef HAVE_LOCALE_H
> +#include <locale.h>
> +#endif
> +#include <stdio.h>
> +#include <ctype.h>
> +
> +main(c, v)
> +int	c;
> +char	*v[];
> +{
> +	char	*deflocale;
> +	unsigned char x;
> +	int	r1, r2;
> +
> +#ifdef HAVE_SETLOCALE
> +	/* We take a shot here.  If that locale is not known, try the
> +	   system default.  We try this one because '\342' (226) is
> +	   known to be a printable character in that locale. */
> +	deflocale = setlocale(LC_ALL, "en_US.ISO8859-1");
> +	if (deflocale == 0)
> +		deflocale = setlocale(LC_ALL, "");
> +#endif
> +
> +	x = '\342';
> +	r1 = isprint(x);
> +	x -= 128;
> +	r2 = isprint(x);
> +	exit (r1 == 0 || r2 == 0);
> +}
> +], bash_cv_func_ctype_nonascii=yes, bash_cv_func_ctype_nonascii=no,
> +   [AC_MSG_WARN(cannot check ctype macros if cross compiling -- defaulting to no)
> +    bash_cv_func_ctype_nonascii=no]
> +)])
> +AC_MSG_RESULT($bash_cv_func_ctype_nonascii)
> +if test $bash_cv_func_ctype_nonascii = yes; then
> +AC_DEFINE(CTYPE_NON_ASCII)
> +fi
> +])
> +
> +AC_DEFUN(BASH_TYPE_SIG_ATOMIC_T,
> +[AC_CACHE_CHECK([for sig_atomic_t in signal.h], ac_cv_have_sig_atomic_t,
> +[AC_TRY_LINK([
> +#include <signal.h>
> +],[ sig_atomic_t x; ],
> +ac_cv_have_sig_atomic_t=yes, ac_cv_have_sig_atomic_t=no)])
> +if test "$ac_cv_have_sig_atomic_t" = "no"
> +then
> +    AC_CHECK_TYPE(sig_atomic_t,int)
> +fi
> +])
>



