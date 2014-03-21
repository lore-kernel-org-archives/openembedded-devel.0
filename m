Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0606F9FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:11:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WQyHz-0004rF-Qj for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2014 13:11:07 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:11:07 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:11:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Mar 2014 13:10:56 +0100
Message-ID: <lgha81$67v$1@ger.gmane.org>
References: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>	<lggvj4$7g6$1@ger.gmane.org>
	<7D46E86EC0A8354091174257B2FED1015CF48FAA@DLEE11.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CF48FAA@DLEE11.ent.ti.com>
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
X-List-Received-Date: Fri, 21 Mar 2014 12:11:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Maupin, Chase schreef op 21-03-14 13:07:

>> -----Original Message----- From:
>> openembedded-devel-bounces@lists.openembedded.org 
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Koen Kooi Sent: Friday, March 21, 2014 4:10 AM To:
>> openembedded-devel@lists.openembedded.org Subject: Re: [oe] [PATCH]
>> pm-qa-utils: Add power management test utils
>> 
> Chase Maupin schreef op 20-03-14 15:47:
>>>> * The power management test utilities from Linaro can be used to
> test
>>>> multiple PM features such as cpufreq, cpuidle, thermal control
> and
>>>> suspend operations. * These utilities are not platform specific
> and can
>>>> be used by a broader base of users.
>>>> 
>>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> 
> Everything refers to this as 'pm-qa', not 'pm-qa-utils'
> 
>> I assume you are saying you would rather see this recipe as pm-qa
>> instead of pm-qa-utils?

Exactly!

> 
> 
>>>> --- .../pm-qa-utils/pm-qa-utils_git.bb                 |   63 
>>>> ++++++++++++++++++++ 1 file changed, 63 insertions(+) create
> mode 100644
>>>> meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
>>>> 
>>>> diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-
> utils_git.bb
>>>> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb new
> file mode
>>>> 100644 index 0000000..610f3a7 --- /dev/null +++ 
>>>> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb @@ -
> 0,0 +1,63
>>>> @@ +DESCRIPTION = "Utilities from Linaro for testing Power
> Management"
>>>> +HOMEPAGE =
>>>> 
> "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/T 
> estSuite/PmQa"
>>>> 
>>>> 
> +
>>>> +LICENSE = "GPLv2" +LIC_FILES_CHKSUM = 
>>>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" + +PV =
> "0.4.4" +
>>>> +BRANCH ?= "master" +SRCREV =
> "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
>>>> + +SRC_URI = "git://git.linaro.org/tools/pm-
> qa.git;protocol=git;branch=${BRANCH}" + +S
>>>> = "${WORKDIR}/git" + +CFLAGS += "-pthread" + +do_compile () { +
> # Find
>>>> all the .c files in this project and build them. +    for x in
> `find .
>>>> -name "*.c"` +    do +        util=`echo ${x} | sed s/.c$//` + 
>>>> oe_runmake ${util} +    done +} + +do_install () { +    install
> -d
>>>> ${D}${bindir} +    install -d ${D}${bindir}/linaro-pm-qa-include
> 
> Please don't use subdirs in $bindir, that's what $libdir and $libexecdir
> are for.
> 
>> Good point.  I did this because the script going into that directory
>> was named "functions.sh" in the original sources.  I thought this was a
>> bit generic and could possibly conflict.
> 
>> What are your thoughts on a subdirectory under $libdir or $libexecdir?
>> Any preference?

Right it will amount to the basically the same due to the misguided
libexecdir change oe-core did last year. If it's only used 'internally'
$libdir/PN would be OK, otherwise use libexecdir (which currently is
libdir/PN, but might change again)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTLCxQMkyGM64RGpERAi53AJ9bjuFeJfliwQV9hzHnqd+28zkH0ACeLS9r
VXYU8eXR2dQcBS74EnzVBd4=
=DHAP
-----END PGP SIGNATURE-----


