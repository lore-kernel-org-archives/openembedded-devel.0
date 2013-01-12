Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Ttop3-0000vJ-BM
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jan 2013 01:19:58 +0100
Received: (qmail 8961 invoked by uid 1003); 12 Jan 2013 00:04:25 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Jan 2013 00:04:25 -0000
Message-ID: <50F0A887.3000106@balister.org>
Date: Fri, 11 Jan 2013 19:04:23 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1357936861-8245-1-git-send-email-philip@balister.org>
	<1357936861-8245-3-git-send-email-philip@balister.org>
	<20130111223053.GB13385@jama.palm1.palmone.com>
In-Reply-To: <20130111223053.GB13385@jama.palm1.palmone.com>
X-Enigmail-Version: 1.4.6
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH 3/3] gnuradio : Update to version 3.6.3.
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
X-List-Received-Date: Sat, 12 Jan 2013 00:19:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

You'd have to be crazy to run gnuradio on anything less than armv7a.
However, I thought someone gave us a patch to let it build for machine
without NEON. I'll look into this again.

Philip

On 01/11/2013 05:30 PM, Martin Jansa wrote:
> On Fri, Jan 11, 2013 at 03:41:01PM -0500, Philip Balister wrote:
>> Also fixes pakcaging issues for the examples package.
>> 
> 
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.3-r0/git/gnuradio-core/src/lib/filter/dotprod_fff_armv7_a.c:
> In function 'dotprod_fff_armv7_a': |
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.3-r0/git/gnuradio-core/src/lib/filter/dotprod_fff_armv7_a.c:67:5:
> error: inconsistent operand constraints in an 'asm' | make[2]: ***
> [gnuradio-core/src/lib/CMakeFiles/gnuradio-core.dir/filter/dotprod_fff_armv7_a.c.o]
> Error 1 | make[2]: *** Waiting for unfinished jobs.... |
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/cmake
> -E cmake_progress_report
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.3-r0/git/build/CMakeFiles
>
> 
|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/cmake
-E cmake_progress_report
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.3-r0/git/build/CMakeFiles
> | [ 37%] [ 37%] Generating gnuradio_core_general.pyc
> 
> For whole log see 
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130111_140417.log/
>
>  Cheers,
> 
>> Signed-off-by: Philip Balister <philip@balister.org> --- 
>> meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 16
>> +++++----------- 1 file changed, 5 insertions(+), 11
>> deletions(-)
>> 
>> diff --git
>> a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb index
>> aca2f97..f084149 100644 ---
>> a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb +++
>> b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb @@ -4,8
>> +4,6 @@ SECTION =  "apps" LICENSE = "GPLv3" LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> 
>> -PR = "r0" - DEPENDS = "uhd gsl fftwf python alsa-lib boost
>> cppunit \ swig-native python-numpy python-pygtk orc qt4-x11-free
>> qwt"
>> 
>> @@ -23,11 +21,6 @@ RDEPENDS_${PN} = "python-core python-audio
>> python-threading python-codecs \
>> 
>> C_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> 
>> -#do_configure_append() { -#	find ${S} -name Makefile | xargs sed
>> -i s:'-I${STAGING_INCDIR_NATIVE'::g -#	find ${S} -name Makefile |
>> xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE'::g -#} - 
>> do_configure_prepend() { ${BUILD_CC}
>> ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o
>> ${S}/gr-vocoder/lib/generate_codebook -lm echo
>> "ADD_EXECUTABLE(generate_codebook IMPORTED)"
>> >${S}/gr-vocoder/lib/generate_codebook.txt @@ -39,7 +32,7 @@
>> do_compile_prepend() { cp ${S}/gr-vocoder/lib/codec2/defines.h
>> ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2 }
>> 
>> -PACKAGES =+ "\ +PACKAGES += " \ ${PN}-examples \ ${PN}-grc \ " 
>> @@ -53,20 +46,21 @@ FILES_${PN} += "${prefix}/etc/gnuradio/*"
>> 
>> FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \ 
>> ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \ +
>> ${datadir}/gnuradio/examples/*/.debug \ " FILES_${PN}-examples =
>> "${datadir}/gnuradio/examples"
>> 
>> -PV = "3.5.3" +PV = "3.6.3"
>> 
>> FILESPATHPKG_prepend = "gnuradio-git:"
>> 
>> -SRCREV = "f621a52f779381cfe550b4278b83e701a747944c" +SRCREV =
>> "607a6fa3f80e08298ce7b3ee74ffca1590c05164"
>> 
>> # Make it easy to test against developer repos and branches 
>> GIT_REPO = "gnuradio.git" GIT_BRANCH = "master"
>> 
>> -SRC_URI =
>> "git://gnuradio.org/git/${GIT_REPO};branch=${GIT_BRANCH};protocol=http
>> \ +SRC_URI =
>> "git://gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git
>> \ "
>> 
>> S="${WORKDIR}/git" -- 1.7.11.7
>> 
>> 
>> _______________________________________________ 
>> Openembedded-devel mailing list 
>> Openembedded-devel@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>> 
> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


