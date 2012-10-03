Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJNKV-0006Lb-9i
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:41:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2012 04:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="229397655"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 04:28:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 12:28:29 +0100
Message-ID: <1913726.eYu8z7U0Ds@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <k4h3jt$n4q$3@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<00be8d19fe238a3ef1df3371ab354b9122b56d2c.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3jt$n4q$3@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 6/6] xdebug: add new recipe
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
X-List-Received-Date: Wed, 03 Oct 2012 11:41:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 12:21:51 Koen Kooi wrote:
> Op 01-10-12 18:14, Paul Eggleton schreef:
> > Add new recipe for the Xdebug PHP debugger/profiler.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
> > meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb |   29
> > +++++++++++++++++++++ 1 file changed, 29 insertions(+) create mode 100644
> > meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
> > 
> > diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
> > b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb new file mode 100644
> > index 0000000..5bd374c --- /dev/null +++
> > b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb @@ -0,0 +1,29 @@
> > +SUMMARY = "Debugging and profiling extension for PHP"
> 
> Missing DESCRIPTION

No, this is deliberate - presumably you're aware that the default value of 
DESCRIPTION is "${SUMMARY}" ? The opposite is not true, which leads to 
packages with useless summaries if you set DESCRIPTION and not SUMMARY; so if 
it's just one line the single variable to set is SUMMARY. I know we have a lot 
of recipes that have this issue; we should probably address that on a wider 
basis.

> > +LICENSE = "Xdebug" +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16" + +DEPENDS =
> > "modphp" + +PR = "r0"
> 
> default....

See reply to patch 2/6.

> > + +SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz" +
> > +SRC_URI[md5sum] = "5e5c467e920240c20f165687d7ac3709" +SRC_URI[sha256sum]
> > = "11d340eb7f87909a596bac054cc927df757dc2fc7c90b50a832c30e9bf84c9ad" +
> > +inherit autotools + +EXTRA_OECONF += "--enable-xdebug
> > -with-php-config=${STAGING_BINDIR_CROSS}/php-config" + +do_configure() {
> > +	${STAGING_BINDIR_CROSS}/phpize +	oe_runconf +}
> 
> Why not do autotools_do_configure?

Because AFAICT PHP modules are somewhat unusual when it comes to configure, and 
totally break if you try to autoreconf. IIRC this was the only way I could get 
the thing to build.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


