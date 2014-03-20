Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id DD3FA6F8CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:44:53 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id n15so800522lbi.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=JDk5L45SQ5UkZqiHpH3wFOa+7f9y/6OiS7MMUC2+sTs=;
	b=Ho2k1ztl1at4ZWmkP92g8gRJ5NnVWZliv8CzgZsco39/KEBNJ1F3hhax6q+CD+ajTq
	DpwPikKfRxi96c6JggOMTcAx5M++OxVM24pUOB7iPqZVIMsiZPdyzBAjwZo0q7tmDwC/
	xDt5vgoExTqNx/002UyKv7GHFBBqQJG+SvVIXHsgpg/codKIy57mMnfbHOrSK8ckb/qJ
	bw1liynz26zjQwr6Fp+1b1xTemfYt0lA5tc/8MtXxhP3AL3OTctfhIdnNLhXR5PxGKMS
	1wiZGa3eZOt2aVXo83a7QJ8BsosO32qLwxoQyCWdc6dScP4MFgq6yKq2qh+4ffqchLGl
	0USQ==
X-Gm-Message-State: ALoCoQmeSTzGqDmREusHiP92vGOmAz4T+Wqjzxm699ZPeuw0twRvqzbNE3IeLJgJUEQsMQObluFu
MIME-Version: 1.0
X-Received: by 10.112.52.104 with SMTP id s8mr29135070lbo.7.1395333893564;
	Thu, 20 Mar 2014 09:44:53 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Thu, 20 Mar 2014 09:44:53 -0700 (PDT)
In-Reply-To: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
References: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
Date: Thu, 20 Mar 2014 18:44:53 +0200
Message-ID: <CAGNsrLA0Y_MK7hT5_NLzkBz0vvq4cy7cGJq=59X8SnO99bV6SQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] pm-qa-utils: Add power management test utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2014 16:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 March 2014 16:47, Chase Maupin <Chase.Maupin@ti.com> wrote:

> * The power management test utilities from Linaro can be used
>   to test multiple PM features such as cpufreq, cpuidle, thermal
>   control and suspend operations.
> * These utilities are not platform specific and can be used by
>   a broader base of users.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../pm-qa-utils/pm-qa-utils_git.bb                 |   63
> ++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/pm-qa-utils/
> pm-qa-utils_git.bb
>
> diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bbb/meta-oe/recipes-devtools/pm-qa-utils/
> pm-qa-utils_git.bb
> new file mode 100644
> index 0000000..610f3a7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
> @@ -0,0 +1,63 @@
> +DESCRIPTION = "Utilities from Linaro for testing Power Management"
>

nitpick, I'll remove "from Linaro" :)


> +HOMEPAGE = "
> https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa
> "
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +PV = "0.4.4"
>
>
we released 0.4.8 today.


> +BRANCH ?= "master"
> +SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
> +
> +SRC_URI = "git://
> git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}<http://git.linaro.org/tools/pm-qa.git;protocol=git;branch=$%7BBRANCH%7D>
> "
> +
> +S = "${WORKDIR}/git"
> +
> +CFLAGS += "-pthread"
> +
> +do_compile () {
> +    # Find all the .c files in this project and build them.
> +    for x in `find . -name "*.c"`
> +    do
> +        util=`echo ${x} | sed s/.c$//`
> +        oe_runmake ${util}
> +    done
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}${bindir}/linaro-pm-qa-include
> +
> +    # Install the compiled binaries the were built in the previous step
> +    for x in `find . -name "*.c"`
> +    do
> +        util=`echo ${x} | sed s/.c$//`
> +        util_basename=`basename ${util}`
> +        install -m 0755 ${util} ${D}${bindir}/${util_basename}
> +    done
> +
> +    # Install the helper scripts in the include directory
> +    for script in `find . -name "*.sh" | grep include`
> +    do
> +        # Remove hardcoded relative paths
> +        sed -i -e 's#..\/utils\/##' ${script}
> +
> +        script_basename=`basename ${script}`
> +        install -m 0755 $script
> ${D}${bindir}/linaro-pm-qa-include/${script_basename}
> +    done
> +
> +    # Install the shell scripts NOT in the include directory since those
> +    # will be installed elsewhere
> +    for script in `find . -name "*.sh" | grep -v include`
> +    do
> +        # if the script includes any helper scripts from the include
> +        # directory then change the include path to the absolute path
> +        # to reflect the install location of the helper scripts.
> +        sed -i -e "s#source ../include#source
> ${bindir}/linaro-pm-qa-include#g" ${script}
> +        # Remove hardcoded relative paths
> +        sed -i -e 's#..\/utils\/##' ${script}
> +
> +        script_basename=`basename ${script}`
> +        install -m 0755 $script ${D}${bindir}/${script_basename}
> +    done
>

we probably need to fix that properly and avoid the LTP style mess
(software not meant to be installable).


> +}
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

FWIW, my comments aren't a blocker/nack. That's something we can address
later on.

Cheers,
Fathi

