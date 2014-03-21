Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1054B6F9CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:09:16 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WQvS0-0007T0-Jk for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2014 10:09:16 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 10:09:16 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 10:09:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Mar 2014 10:09:47 +0100
Message-ID: <lggvj4$7g6$1@ger.gmane.org>
References: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
X-Enigmail-Version: 1.6
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
X-List-Received-Date: Fri, 21 Mar 2014 09:09:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chase Maupin schreef op 20-03-14 15:47:
> * The power management test utilities from Linaro can be used to test
> multiple PM features such as cpufreq, cpuidle, thermal control and
> suspend operations. * These utilities are not platform specific and can
> be used by a broader base of users.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Everything refers to this as 'pm-qa', not 'pm-qa-utils'

> --- .../pm-qa-utils/pm-qa-utils_git.bb                 |   63
> ++++++++++++++++++++ 1 file changed, 63 insertions(+) create mode 100644
> meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
> 
> diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb new file mode
> 100644 index 0000000..610f3a7 --- /dev/null +++
> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb @@ -0,0 +1,63
> @@ +DESCRIPTION = "Utilities from Linaro for testing Power Management" 
> +HOMEPAGE =
> "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
>
> 
+
> +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" + +PV = "0.4.4" + 
> +BRANCH ?= "master" +SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4" 
> + +SRC_URI =
> "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}" + +S
> = "${WORKDIR}/git" + +CFLAGS += "-pthread" + +do_compile () { +    # Find
> all the .c files in this project and build them. +    for x in `find .
> -name "*.c"` +    do +        util=`echo ${x} | sed s/.c$//` +
> oe_runmake ${util} +    done +} + +do_install () { +    install -d
> ${D}${bindir} +    install -d ${D}${bindir}/linaro-pm-qa-include

Please don't use subdirs in $bindir, that's what $libdir and $libexecdir are
for.

> + +    # Install the compiled binaries the were built in the previous
> step +    for x in `find . -name "*.c"` +    do +        util=`echo ${x}
> | sed s/.c$//` +        util_basename=`basename ${util}` +        install
> -m 0755 ${util} ${D}${bindir}/${util_basename} +    done + +    # Install
> the helper scripts in the include directory +    for script in `find .
> -name "*.sh" | grep include` +    do +        # Remove hardcoded relative
> paths +        sed -i -e 's#..\/utils\/##' ${script} + +
> script_basename=`basename ${script}` +        install -m 0755 $script
> ${D}${bindir}/linaro-pm-qa-include/${script_basename} +    done + +    #
> Install the shell scripts NOT in the include directory since those +    #
> will be installed elsewhere +    for script in `find . -name "*.sh" |
> grep -v include` +    do +        # if the script includes any helper
> scripts from the include +        # directory then change the include
> path to the absolute path +        # to reflect the install location of
> the helper scripts. +        sed -i -e "s#source ../include#source
> ${bindir}/linaro-pm-qa-include#g" ${script} +        # Remove hardcoded
> relative paths +        sed -i -e 's#..\/utils\/##' ${script} + +
> script_basename=`basename ${script}` +        install -m 0755 $script
> ${D}${bindir}/${script_basename} +    done +}
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTLAHbMkyGM64RGpERAp4tAKCqvpUtLAnW+JmNPFue3devsMkfEgCfSBG8
sTfb/tlOntd8/Hs/1JvXqQ4=
=674M
-----END PGP SIGNATURE-----


