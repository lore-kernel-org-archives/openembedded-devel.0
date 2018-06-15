Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C6195750D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:59:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2018 01:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,226,1526367600"; d="scan'208";a="50118525"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga006.jf.intel.com with ESMTP; 15 Jun 2018 01:59:00 -0700
Date: Fri, 15 Jun 2018 11:58:55 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: prvs=6977bbb5e=Richard.Leitner@skidata.com
Message-ID: <20180615085854.GA35551@mbabyjoh-desk.ger.corp.intel.com>
References: <3463e929-53ce-df98-355c-11de357fc5ae@skidata.com>
	<69df7e62-bd10-ba0e-7441-1bb4f76940f3@skidata.com>
MIME-Version: 1.0
In-Reply-To: <69df7e62-bd10-ba0e-7441-1bb4f76940f3@skidata.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [yocto] [meta-java][PATCH 3/3] openjdk-8: use ca-certificates-java
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 08:59:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Richard,

On Fri, Jun 15, 2018 at 10:19:06AM +0200, prvs=6977bbb5e=Richard.Leitner@skidata.com wrote:
> fyi, as this was posted on yocto@yoctoproject.org
> 
> @Otavio/Maxin/Henning: is it OK to just force-push to
> master-next without this commit? Or should I push a
> "revert" commit?

I think it is ok to force-push to the master-next branch 
(obviously not ok to force push to other branches).

> regards;Richard.L

Best Regards,
Maxin

> 
> -------- Forwarded Message --------
> Subject: Re: [yocto] [meta-java][PATCH 3/3] openjdk-8: use ca-certificates-java
> Date: Fri, 15 Jun 2018 10:00:38 +0200
> From: Richard Leitner <richard.leitner@skidata.com>
> To: André Draszik <git@andred.net>, yocto@yoctoproject.org
> CC: Richard Leitner <Richard.Leitner@skidata.com>
> 
> Hi,
> this commit of yours breaks the build on meta-java's current
> mater-next branch (when building an image containing openjre-8
> or openjdk-8) with following message:
> 
> ERROR: openjre-8-test-image-1.0-r0 do_rootfs: [log_check] openjre-8-test-image: found 1 error message in the logfile:
> [log_check] E: /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-certificates/update.d/ca-certificates-java-hook exited with code 1.
> 
> ERROR: openjre-8-test-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-test-image/1.0-r0/temp/log.do_rootfs.19892
> ERROR: Task (/yocto/meta-java-test/meta-java/recipes-images/images/openjre-8-test-image.bb:do_rootfs) failed with exit code '1'
> 
> 
> The logfile contains following error:
> 
> Running hooks in /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-certificates/update.d...
> /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-certificates/update.d/ca-certificates-java-hook: no JVM_LIBDIR specified
> E: /yocto/meta-java-test/build/tmp/work/qemuarm-poky-linux-gnueabi/openjre-8-test-image/1.0-r0/rootfs/etc/ca-certificates/update.d/ca-certificates-java-hook exited with code 1.
> done.
> 
> 
> Therefore it will be removed from master-next.
> 
> It would be great if you could send an fixed version.
> 
> Thank you!
> 
> regards;Richard.L
> 
> 
> On 03/30/2018 10:40 AM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > The OpenJDK-8 package currently comes with a trustStore
> > that was generated at OpenJDK-8-native build time from
> > *all* certificates available in the system, not just from
> > those that are marked as trusted.
> > 
> > This isn't right...
> > 
> > openjdk-8 and openjre-8 now RDEPENDS on (and use) the CA
> > certificates as provided by the ca-certificates-java
> > package just added.
> > 
> > This makes sure that Java now uses the same trusted CA
> > certificates as the rest of the system.
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  recipes-core/openjdk/openjdk-8-common.inc |  2 ++
> >  recipes-core/openjdk/openjdk-8-cross.inc  | 12 +++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> > index b2020c3..c8d157e 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -254,3 +254,5 @@ def version_specific_cflags(d):
> >  CFLAGS_append = " ${@version_specific_cflags(d)}"
> >  CXXFLAGS_append = " ${@version_specific_cflags(d)}"
> >  CXX_append = " -std=gnu++98"
> > +
> > +RDEPENDS_${PN} = "ca-certificates-java"
> > diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
> > index d70c946..6795c92 100644
> > --- a/recipes-core/openjdk/openjdk-8-cross.inc
> > +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> > @@ -57,7 +57,6 @@ EXTRA_OECONF_append = "\
> >      --with-sys-root=${STAGING_DIR_HOST} \
> >      --with-tools-dir=${STAGING_DIR_NATIVE} \
> >      --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
> > -    --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/jre/lib/security/cacerts \
> >      \
> >      --disable-precompiled-headers \
> >      --disable-zip-debug-info \
> > @@ -88,6 +87,17 @@ do_install_append() {
> >                pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
> >        fi
> >      fi
> > +
> > +    if [ -d ${D}${JDK_HOME} ] ; then
> > +      rm ${D}${JDK_HOME}/jre/lib/security/cacerts
> > +      ln -s ${@os.path.relpath("${sysconfdir}/ssl/certs/java/cacerts", "${JDK_HOME}/jre/lib/security/cacerts")} \
> > +            ${D}${JDK_HOME}/jre/lib/security/cacerts
> > +    fi
> > +    if [ -d ${D}${JRE_HOME} ] ; then
> > +      rm ${D}${JRE_HOME}/lib/security/cacerts
> > +      ln -s ${@os.path.relpath("${sysconfdir}/ssl/certs/java/cacerts", "${JRE_HOME}/lib/security/cacerts")} \
> > +            ${D}${JRE_HOME}/lib/security/cacerts
> > +    fi
> >  }
> >  
> >  export MAKE_VERBOSE = "y"
> > 

