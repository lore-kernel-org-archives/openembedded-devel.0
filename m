Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1StHlz-0004Be-7u
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 14:30:03 +0200
Received: by wibhm11 with SMTP id hm11so2441995wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5ncmkUerHiCt8e0TWe9qJ9O8VaM3n18GnNf6/zs+2zM=;
	b=dnnIxMLZSM92xHp4FMqgTRc4pDyKv8LYop9o/sP6U/6+YkP+2gAnShSa9oPAazB7y8
	3+AnoNsdBBI8+MkyBkXhFQkCx8EhkEnYK+4YXnkrO15TrHsMpRNhFk8NCuFWanUma9lY
	4r3fxXeBgXKNujeupgmGcm3SqEvjQq16j3zJTViUsR6r6AognmFbeDQmDhLrW2vjZpRN
	wPJy2RmP24SV0QtdRknVd5+b/tJo27SgkoZBB0YnlnZ1C8Vef3Z07Wllnox32aPIzINP
	IyNvkP1kHVC1jyt4nJCwsl9/Mt9SxYGIPj+5nw/oiXpK8kix77cQ4ldAt9VKVdhjHs2B
	CW3A==
Received: by 10.217.2.133 with SMTP id p5mr8193513wes.143.1343045915664; Mon,
	23 Jul 2012 05:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.98.162 with HTTP; Mon, 23 Jul 2012 05:18:05 -0700 (PDT)
In-Reply-To: <1343037078-9760-1-git-send-email-fahad.usman@gmail.com>
References: <fahad.usman@gmail.com>
	<1343037078-9760-1-git-send-email-fahad.usman@gmail.com>
From: Fahad Usman <fahad.usman@gmail.com>
Date: Mon, 23 Jul 2012 17:18:05 +0500
Message-ID: <CAHVMiV8bJLdtcva2+sYA=aMjtoEdzQ=hO3Uw7dL16QMA0Nojig@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 23 Jul 2012 12:30:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

kindly ignore this patch, I was supposed to send it on openembedded-core

Sorry for inconvenience

--
Fahad


On Mon, Jul 23, 2012 at 2:51 PM, <fahad.usman@gmail.com> wrote:

> From: Fahad Usman <fahad_usman@mentor.com>
>
> some bash macros are missing from acinclude.m4 which are added up-stream.
> This
> wasn't actually breaking anything but but it was causing the configure
> script
> to not run all the tests it's intended to run. (by Christopher Larson)
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  meta/recipes-core/readline/files/acinclude.m4 |   56
> +++++++++++++++++++++++++
>  1 files changed, 56 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/readline/files/acinclude.m4
> b/meta/recipes-core/readline/files/acinclude.m4
> index 8a45f99..c30a7d3 100644
> --- a/meta/recipes-core/readline/files/acinclude.m4
> +++ b/meta/recipes-core/readline/files/acinclude.m4
> @@ -1813,3 +1813,59 @@ AC_MSG_RESULT($ac_cv_rl_version)
>
>  fi
>  ])
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
> +int    c;
> +char   *v[];
> +{
> +       char    *deflocale;
> +       unsigned char x;
> +       int     r1, r2;
> +
> +#ifdef HAVE_SETLOCALE
> +       /* We take a shot here.  If that locale is not known, try the
> +          system default.  We try this one because '\342' (226) is
> +          known to be a printable character in that locale. */
> +       deflocale = setlocale(LC_ALL, "en_US.ISO8859-1");
> +       if (deflocale == 0)
> +               deflocale = setlocale(LC_ALL, "");
> +#endif
> +
> +       x = '\342';
> +       r1 = isprint(x);
> +       x -= 128;
> +       r2 = isprint(x);
> +       exit (r1 == 0 || r2 == 0);
> +}
> +], bash_cv_func_ctype_nonascii=yes, bash_cv_func_ctype_nonascii=no,
> +   [AC_MSG_WARN(cannot check ctype macros if cross compiling --
> defaulting to no)
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
> --
> 1.7.1
>
>

