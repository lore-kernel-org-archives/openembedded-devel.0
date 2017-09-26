Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 240CD780BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 14:51:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 26 Sep 2017 07:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="904009735"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2017 07:51:40 -0700
Date: Tue, 26 Sep 2017 17:52:45 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20170926145245.GA35702@mbabyjoh-desk.ger.corp.intel.com>
References: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
	<20170907085136.20862-2-ricardo.ribalda@gmail.com>
	<CAPybu_08S-izqY3pUTisRRbX5MQSDcAskZpK209Kt5cC5jv48Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPybu_08S-izqY3pUTisRRbX5MQSDcAskZpK209Kt5cC5jv48Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 2/2] openjdk-8-native: Fix sigsegv with gcc7
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
X-List-Received-Date: Tue, 26 Sep 2017 14:51:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Sep 26, 2017 at 01:26:22PM +0200, Ricardo Ribalda Delgado wrote:
> Ping?

Pushed these 3 patches to master-next. Sorry for the delay.

Best Regards,
Maxin

> On Thu, Sep 7, 2017 at 10:51 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> > OpenJDK does not build properly with GCC7. Add the same workaround that
> > we have for GCC6.
> >
> > Without this patch:
> >
> > | #
> > | # A fatal error has been detected by the Java Runtime Environment:
> > | #
> > | #  SIGSEGV (0xb) at pc=0x00007fcad0efcd5b, pid=17206, tid=0x00007fcab264c700
> > | #
> > | # JRE version: OpenJDK Runtime Environment (8.0_102-b14) (build 1.8.0_102-internal-b14)
> > | # Java VM: OpenJDK 64-Bit Server VM (25.102-b14 mixed mode linux-amd64 compressed oops)
> > | # Problematic frame:
> > | # V  [libjvm.so+0x78bd5b]  Node::Node(unsigned int)+0x2b
> > | #
> > | # Failed to write core dump. Core dumps have been disabled. To enable core dumping, try "ulimit -c unlimited" before starting Java again
> > | #
> > | # An error report file with more information is saved as:
> > | # /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/build/hs_err_pid17206.log
> > | [thread 140508549912320 also had an error]
> > |
> > | [error occurred during error reporting , id 0xb]
> > |
> > | #
> > | # If you would like to submit a bug report, please visit:
> > | #   http://bugreport.java.com/bugreport/crash.jsp
> > | #
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  recipes-core/openjdk/openjdk-8-common.inc | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> > index def779db4d59..0c5c2c3e3d2f 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -218,10 +218,11 @@ EXTRA_OECONF_append = "\
> >          --with-update-version=${OPENJDK_UPDATE_VERSION} \
> >  "
> >
> > -# GCC 6 sets the default C++ standard to C++14 and introduces dead store
> > -# elimination by default. OpenJDK 8 is not ready for either of these
> > -# changes.
> > +# Since v6, GCC sets the default C++ standard to C++14 and introduces
> > +# dead store elimination by default. OpenJDK 8 is not ready for either
> > +# of these changes.
> >  FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > +FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> >
> >  # All supported cross compilers support the compiler flags that were
> >  # added to make compilation with gcc6 work. But the host compiler for
> > --
> > 2.14.1
> >
> 
> 
> 
> -- 
> Ricardo Ribalda
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

