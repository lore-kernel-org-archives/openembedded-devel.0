Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T0VvS-0001es-Gc
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 12 Aug 2012 13:01:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2012 03:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,754,1336374000"; d="scan'208";a="185219371"
Received: from unknown (HELO [10.255.12.230]) ([10.255.12.230])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2012 03:48:43 -0700
Message-ID: <50278A0A.2030001@linux.intel.com>
Date: Sun, 12 Aug 2012 13:48:42 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1344761452-10965-1-git-send-email-marc@cpdesign.com.au>
In-Reply-To: <1344761452-10965-1-git-send-email-marc@cpdesign.com.au>
Cc: openembedded-devel@lists.linuxtogo.org
Subject: Re: [oe-core] qwt: fix link error when linking with ld-gold.
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
X-List-Received-Date: Sun, 12 Aug 2012 11:01:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2012 11:50 AM, Marc Reilly wrote:
> ld-gold doesn't implicitly link with librt, this fixes an unresolved
> symbol error when compiling qwt examples.
>
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>   .../recipes-qt/qwt/files/fix-ld-gold-linking.patch |   14 ++++++++++++++
>   meta-oe/recipes-qt/qwt/qwt.inc                     |    1 +
>   2 files changed, 15 insertions(+), 0 deletions(-)
>   create mode 100644 meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
>
> diff --git a/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch b/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
> new file mode 100644
> index 0000000..a00aba4
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
> @@ -0,0 +1,14 @@
> +- fix link of unresolved symbols: clock_getres and clock_gettime
> +---
Patch needs Signed-off-by and Upstream-Status Tags please

Thanks

Sau!
> +diff --git a/src/src.pro b/src/src.pro
> +index beb7125..ebf8ea6 100644
> +--- a/src/src.pro
> ++++ b/src/src.pro
> +@@ -94,6 +102,7 @@ SOURCES += \
> +     qwt_symbol.cpp \
> +     qwt_system_clock.cpp
> +
> ++linux*:LIBS += -lrt
> +
> + contains(QWT_CONFIG, QwtPlot) {
> +
> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
> index a299ac8..94231b4 100644
> --- a/meta-oe/recipes-qt/qwt/qwt.inc
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
>   	file://qwt6.patch \
> +        file://fix-ld-gold-linking.patch \
>   	"
>
>   S = "${WORKDIR}/qwt-${PV}"
>


