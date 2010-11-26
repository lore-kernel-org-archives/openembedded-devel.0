Received: from tone.orchestra.cse.unsw.edu.au ([129.94.242.59])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@cse.unsw.edu.au>) id 1PLlyD-0002Es-9T
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 01:15:25 +0100
Received: From [129.94.172.249] ([129.94.172.249] == tigger.cse.unsw.EDU.AU)
	(auth-user jayen) (cse-authentic-sender jayen)
	By tone With Smtp ; Fri, 26 Nov 2010 11:13:58 +1100 
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: Maksym Parkachov <lazy.gopher@gmail.com>
Date: Fri, 26 Nov 2010 11:16:31 +1100
Message-ID: <4CEEFC5F.9090703@cse.unsw.edu.au>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
References: <1290664003-17257-1-git-send-email-jayen@cse.unsw.edu.au>
	<AANLkTinV+PWoPR9DuTHskOcLWCMU_h+suGQt1HNc4cMf@mail.gmail.com>
In-Reply-To: <AANLkTinV+PWoPR9DuTHskOcLWCMU_h+suGQt1HNc4cMf@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 129.94.242.59
X-SA-Exim-Mail-From: jayen@cse.unsw.edu.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS, SPF_NEUTRAL,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] IceE: New program
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
X-List-Received-Date: Fri, 26 Nov 2010 00:15:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Maksym,

Thank you for the feedback.  I'll remove the patch from patchwork when I
see it there.  Could you send me your patch(es), and if I have time
before you, I'll try and bring it to a committable state and [re]submit it?

Thanks,
Jayen

P.S. To any admins on this list: is there an ETA on patchwork?  I'm
seeing the same issue that Paul Menzel mentioned a few days ago
(Message-ID: <1290433364.3703.22.camel@mattotaupa>).  Thanks.

On 25/11/10 22:15, Maksym Parkachov wrote:
> Hi Jayen,
> 
> I'm sorry to say, but your patch has a several issue, first and
> foremost is that it will not compile on the system without slice2cppe
> installed. You could use the slice2cppe binary supplied in the
> sources, but it will not work even on x86-64 without 32-bit libraries
> installed, not even mentioning, if your host is not x86. So, you
> package should first provide native slice2cppe in order to compile
> library.
> 
> Second issue, related, that you don't provide all dependencies. As far
> as I remember, it depends on mcpp and bzip2 at least. And as I
> mentioned on the native version of the package itself. I did commit
> the mcpp couple of weeks ago in oe, but it still needs to be patched
> to address one of the bug (see zeroc forums)
> 
> Third, you install way too much on the embedded system. Why do you
> need all the tools on the target, you probably need just libice.so. It
> needs splitting into multiple packages, probably the debian way is
> good. And I did't check, but you probably install slice2cppe x86
> version on the target, don't you ?
> 
> The good news, that I have in my local tree the version which
> addresses all above-mentioned problems, but unfortunately, I didn't
> have a time to bring it to commitable state. If you could wait week or
> so, I will submit new version, or you could implement all the things
> yourself and submit new version.
> 
> I'm not core developer but, NACK.
> 
> Regards,
> Maksym Parkachov.
> 
> 
> On Thu, Nov 25, 2010 at 6:46 AM, Jayen Ashar <jayen@cse.unsw.edu.au> wrote:
>> * Starting with 1.3.0
>> * ZeroC Ice is a CORBA-like middleware solution. IceE is a subset of Ice used in
>> *  embedded systems.
>>
>> Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
>> ---
>>  recipes/zeroc-ice-e/zeroc-ice-e.inc             |   24 ++++++++
>>  recipes/zeroc-ice-e/zeroc-ice-e/configure.patch |   11 ++++
>>  recipes/zeroc-ice-e/zeroc-ice-e/cross.patch     |   68 +++++++++++++++++++++++
>>  recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb        |    3 +
>>  4 files changed, 106 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e.inc
>>  create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
>>  create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
>>  create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
>>
>> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e.inc b/recipes/zeroc-ice-e/zeroc-ice-e.inc
>> new file mode 100644
>> index 0000000..654747a
>> --- /dev/null
>> +++ b/recipes/zeroc-ice-e/zeroc-ice-e.inc
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION = "Embedded edition of the ZeroC Ice\
>> +ZeroC Ice is a CORBA-like middleware solution. IceE is a subset of Ice used in embedded systems. This is a dummy package that depends on the full set of IceE packages."
>> +HOMEPAGE = "http://www.zeroc.com/icee/index.html"
>> +SECTION = "devel"
>> +PRIORITY = "optional"
>> +LICENSE = "GPL"
>> +DEPENDS = ""
>> +
>> +INC_PR = "r0"
>> +
>> +SRC_URI = "http://www.zeroc.com/download/IceE/1.3/IceE-${PV}-linux.tar.gz \
>> +           file://cross.patch;patch=1"
>> +
>> +S = "${WORKDIR}/IceE-${PV}"
>> +
>> +do_configure() {
>> +  oe_runmake configure
>> +}
>> +
>> +do_install() {
>> +  oe_runmake install prefix=${D}/${prefix} install_slicedir=${D}/${datadir}/IceE-${PV}/slice
>> +}
>> +
>> +FILES_${PN} += " ${datadir}/IceE-${PV}"
>> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch b/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
>> new file mode 100644
>> index 0000000..cfb7e3a
>> --- /dev/null
>> +++ b/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
>> @@ -0,0 +1,11 @@
>> +--- cppe/config/Make.rules~    2010-11-14 17:54:54.000000000 +1100
>> ++++ cppe/config/Make.rules     2010-11-14 17:55:39.861202351 +1100
>> +@@ -41,7 +41,7 @@
>> + # Define LP64 as yes or no if you want force a 32 or 64 bit. The default
>> + # is platform-dependent
>> + #
>> +-#LP64                 := yes
>> ++LP64                  := no
>> +
>> + # ----------------------------------------------------------------------
>> + # Ice-E supports a number of optional features that are enabled via
>> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch b/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
>> new file mode 100644
>> index 0000000..3e15d93
>> --- /dev/null
>> +++ b/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
>> @@ -0,0 +1,68 @@
>> +--- a/cppe/config/Make.rules   2008-12-18 19:17:40.000000000 +1100
>> ++++ b/cppe/config/Make.rules   2010-11-14 17:47:23.331363971 +1100
>> +@@ -12,7 +12,7 @@
>> + # if it does not exist.
>> + #
>> +
>> +-prefix                        = /opt/IceE-$(VERSION)
>> ++prefix                        ?= /opt/IceE-$(VERSION)
>> +
>> + #
>> + # Define OPTIMIZE_SIZE as yes if you want to build with minimal size.
>> +@@ -22,7 +22,7 @@
>> + #
>> +
>> + #OPTIMIZE_SIZE                = yes
>> +-#OPTIMIZE_SPEED               = yes
>> ++OPTIMIZE_SPEED                = yes
>> +
>> + #
>> + # Define STATICLIBS as yes if you want to build with static libraries.
>> +@@ -35,13 +35,13 @@
>> + # Define GUMSTIX as yes if building for gumstix target.
>> + #
>> +
>> +-#GUMSTIX              = yes
>> ++GUMSTIX               = yes
>> +
>> + #
>> + # Define LP64 as yes or no if you want force a 32 or 64 bit. The default
>> + # is platform-dependent
>> + #
>> +-#LP64                 := yes
>> ++LP64                  := no
>> +
>> + # ----------------------------------------------------------------------
>> + # Ice-E supports a number of optional features that are enabled via
>> +--- a/cppe/include/IceE/Time.h 2008-12-18 19:17:40.000000000 +1100
>> ++++ b/cppe/include/IceE/Time.h 2010-11-14 18:21:46.304480446 +1100
>> +@@ -12,6 +12,9 @@
>> +
>> + #include <IceE/Config.h>
>> + #include <ostream>
>> ++#ifndef _WIN32
>> ++#   include <sys/time.h>
>> ++#endif
>> +
>> + namespace IceUtil
>> + {
>> +--- a/config/Make.common.rules.icee    2008-12-18 19:17:40.000000000 +1100
>> ++++ b/config/Make.common.rules.icee    2010-11-14 19:35:26.270825893 +1100
>> +@@ -155,7 +155,7 @@
>> +     slicedir = $(ice_dir)/slice
>> + endif
>> +
>> +-install_slicedir      = $(prefix)/slice
>> ++install_slicedir      ?= $(prefix)/slice
>> +
>> + #
>> + # Set environment variables for the Slice translator.
>> +@@ -232,7 +232,7 @@
>> + endif
>> +
>> + ifeq ($(mkdir),)
>> +-    mkdir             = mkdir $(1) ; \
>> ++    mkdir             = mkdir -p $(1) ; \
>> +                         chmod a+rx $(1)
>> + endif
>> +
>> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb b/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
>> new file mode 100644
>> index 0000000..dcf5080
>> --- /dev/null
>> +++ b/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
>> @@ -0,0 +1,3 @@
>> +require zeroc-ice-e.inc
>> +
>> +PR = "${INC_PR}.0"
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 

- -- 
jayen                                  http://jayen.web.cse.unsw.edu.au/
phd student                               unsw-k17-301-08 (02 9385 5514)
rUNSWift 2011                        http://robocup.web.cse.unsw.edu.au/
j-club web admin                       http://jclub.web.cse.unsw.edu.au/
cricos provider code: 00098G
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkzu/BcACgkQGplE/Ggo/I7V5QCfRfSP1NrQOnEMpoBNznbetP1Z
LTMAoI8rAEzHOfyj2WMlPQ+7mkmcFJfh
=IABr
-----END PGP SIGNATURE-----


