Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Stwv5-00032d-Gz
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 10:26:11 +0200
Received: by ggnp4 with SMTP id p4so369313ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 01:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=kd4cwyGiKsjcHag+u4HpkIjB8RjmZDuRikvEyTfsPuw=;
	b=ehV4sHBJRGUXvzWMV3LDdr609WtolWP3b2Jm8sMcyCqxRtJnnLeiRQtI8gZcHX2wkW
	KMmzBhQK6OEGA/ea7T+sJGDXFe6gFpIh6DGyGix/B2eyvuBQ2YEcb5mHzWQoLa961u6J
	9J0JccECv87caDn9JM2KtSOCL6q3AgVlZuHPSflbfiZixmeAcuPICnT8lSgpzK/ojOv2
	uIFGFba4D5wWyPCrNrJ8FGBu8J7JA0sWbp66IXy/fjs7pvG0OC6LDvX/yausjStTeURV
	64s6BdFAaWrXdv8lvpYLlVNVvDImfox4Ht8zybJ2HZTWWYGFwZM65Q4qBiZwiBrSaySL
	zkhA==
Received: by 10.42.154.199 with SMTP id r7mr22477024icw.55.1343204081567; Wed,
	25 Jul 2012 01:14:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Wed, 25 Jul 2012 01:14:21 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1343203641-3292-1-git-send-email-mertsas@cisco.com>
References: <1343203641-3292-1-git-send-email-mertsas@cisco.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 25 Jul 2012 11:14:21 +0300
Message-ID: <CAK18fxE_paXfFO8Wf4y-hz46nqs+yk847fPGyAKZLa21p179zg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmZOHgs4qcaau7t/p3v6RfgHcb11BSZAZt4EpgqOGfGW2JdQy81lcj02yrushy54zET6Anm
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Use CC, LD etc that comes from OE.
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
X-List-Received-Date: Wed, 25 Jul 2012 08:26:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 25, 2012 at 11:07 AM, Martin Ertsaas <mertsas@cisco.com> wrote:

> Problem with just setting CROSS, is that it will unset all the flags that
> OE sets in CC, like float-abi=hard.
>
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  .../cpufrequtils/0001-dont-unset-cflags.patch      |   30
> ++++++++++++++++++++
>  .../cpufrequtils/cpufrequtils_008.bb               |    1 +
>  2 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
>
> So this on cpufrequtils. Please state it in your subject.


> diff --git
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
> new file mode 100644
> index 0000000..fb2f07f
> --- /dev/null
> +++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
> @@ -0,0 +1,30 @@
> +--- git.old/Makefile   2012-04-17 13:29:46.280435340 +0200
> ++++ git/Makefile       2012-04-17 13:31:13.664433470 +0200
> +@@ -77,17 +77,7 @@ INSTALL_PROGRAM = ${INSTALL}
> + INSTALL_DATA  = ${INSTALL} -m 644
> + INSTALL_SCRIPT = ${INSTALL_PROGRAM}
> +
> +-# If you are running a cross compiler, you may want to set this
> +-# to something more interesting, like "arm-linux-".  If you want
> +-# to compile vs uClibc, that can be done here as well.
> +-CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
> +-CC = $(CROSS)gcc
> +-LD = $(CROSS)gcc
> +-AR = $(CROSS)ar
> +-STRIP = $(CROSS)strip
> +-RANLIB = $(CROSS)ranlib
> +-HOSTCC = gcc
> +-
> ++HOSTCC = $(BUILD_CC)
> +
> + # Now we set up the build system
> + #
> +@@ -95,7 +85,7 @@ HOSTCC = gcc
> + # set up PWD so that older versions of make will work with our build.
> + PWD = $(shell pwd)
> +
> +-export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS
> ++export CFLAGS LDFLAGS LIB_OBJS
> +
> + # check if compiler option is supported
> + cc-supports = ${shell if $(CC) ${1} -S -o /dev/null -xc /dev/null >
> /dev/null 2>&1; then echo "$(1)"; fi;}
> diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bbb/meta-oe/recipes-support/cpufrequtils/
> cpufrequtils_008.bb
> index 0cc3725..a7a48a8 100644
> --- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
> +++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
> @@ -9,6 +9,7 @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
>  # SRC_URI = "git://
> git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
>
>  SRC_URI = "git://github.com/emagii/cpufrequtils.git \
> +           file://0001-dont-unset-cflags.patch \
>            "
>
>  CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' ==
> 'no']} "
> --
> 1.7.8.6
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

