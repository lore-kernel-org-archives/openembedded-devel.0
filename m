Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U8DD9-0000E9-H9
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 18:12:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2013 08:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,702,1355126400"; d="scan'208";a="289676863"
Received: from unknown (HELO helios.localnet) ([10.252.120.134])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2013 08:55:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 16:55:49 +0000
Message-ID: <5676087.MgqTuTql2e@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <5124FC05.40403@windriver.com>
References: <1360707747-8128-1-git-send-email-jeffrey.honig@windriver.com>
	<511B6EA1.5020806@communistcode.co.uk>
	<5124FC05.40403@windriver.com>
MIME-Version: 1.0
Cc: Jeffrey C Honig <Jeffrey.Honig@windriver.com>
Subject: Re: [PATCH] hiawatha: ennsure C flags are passed to builds.
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
X-List-Received-Date: Wed, 20 Feb 2013 17:12:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 February 2013 10:38:29 Mark Hatle wrote:
> On 2/13/13 4:44 AM, Jack Mitchell wrote:
> > On 12/02/13 22:22, Jeffrey C Honig wrote:
> >> [ CQID: WIND00403568 ]
> >> 
> >> Hiawatha was overriding existing C flags instead of prepending warning
> >> flags. This caused build failures on multilibs because the C compiler
> >> could not find the proper sysroot.
> >> 
> >> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
> >> ---
> >> 
> >>    recipes-httpd/hiawatha/files/cmake.patch |   16 ++++++++++++++++
> >>    recipes-httpd/hiawatha/hiawatha_8.6.bb   |    3 +++
> >>    2 files changed, 19 insertions(+)
> >>    create mode 100644 recipes-httpd/hiawatha/files/cmake.patch
> >> 
> >> diff --git a/recipes-httpd/hiawatha/files/cmake.patch
> >> b/recipes-httpd/hiawatha/files/cmake.patch new file mode 100644
> >> index 0000000..f597781
> >> --- /dev/null
> >> +++ b/recipes-httpd/hiawatha/files/cmake.patch
> >> @@ -0,0 +1,16 @@
> >> +It is necessary to include the original CMAKE_C_FLAGS to insure that
> >> +the sysroot is passed to the compiler, instead of just setting warning
> >> +options.  Otherwise we'll get problem croos compiling in some
> >> +circumstances.
> >> +
> >> +--- a/CMakeLists.txt	2012-10-31 14:16:45.000000000 -0400
> >> ++++ b/CMakeLists.txt	2013-02-12 14:07:04.297058345 -0500
> >> +@@ -2,7 +2,7 @@
> >> + project(Hiawatha C)
> >> +
> >> + # Compiler
> >> +-set(CMAKE_C_FLAGS "-Wall -Wextra")
> >> ++set(CMAKE_C_FLAGS "-Wall -Wextra ${CMAKE_C_FLAGS}")
> >> + set(CMAKE_BUILD_TYPE "RelWithDebInfo")
> >> +
> >> + # Options
> >> diff --git a/recipes-httpd/hiawatha/hiawatha_8.6.bb
> >> b/recipes-httpd/hiawatha/hiawatha_8.6.bb index 837354b..d46a525 100644
> >> --- a/recipes-httpd/hiawatha/hiawatha_8.6.bb
> >> +++ b/recipes-httpd/hiawatha/hiawatha_8.6.bb
> >> @@ -4,9 +4,12 @@ LICENSE = "GPLv2"
> >> 
> >>    LIC_FILES_CHKSUM =
> >>    "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> >>    DEPENDS = "libxml2 libxslt"
> >> 
> >> +PR = "r1"
> >> +
> >> 
> >>    SECTION = "net"
> >>    
> >>    SRC_URI = "http://hiawatha-webserver.org/files/${BPN}-${PV}.tar.gz \
> >> 
> >> +           file://cmake.patch \
> >> 
> >>               file://hiawatha-init"
> >>    
> >>    SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
> > 
> > What's the upstream status on this? If you email Hugo (the developer)
> > directly he usually responds within a few hours and will pull the
> > changes into the next release.
> 
> I'm following up for Jeff.  He has contacted Hugo and the above patch has
> been included upstream.

Great. Should I still apply this to meta-webserver then or do we wait for a 
new upstream release?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


