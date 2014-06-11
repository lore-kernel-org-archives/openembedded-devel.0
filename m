Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 08DAB65CD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 13:20:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jun 2014 06:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,458,1400050800"; d="scan'208";a="553811338"
Received: from sbeaulie-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.164])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2014 06:19:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, Eduardo Silva <eduardo@monkey.io>
Date: Wed, 11 Jun 2014 14:19:18 +0100
Message-ID: <1767793.gX9fSKelVL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.5-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <5397D858.8020408@windriver.com>
References: <1401987607-32495-1-git-send-email-eduardo@monkey.io>
	<5397D858.8020408@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Wed, 11 Jun 2014 13:20:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 June 2014 12:17:28 Robert Yang wrote:
> On 06/06/2014 01:00 AM, Eduardo Silva wrote:
> > This patch adds the Monkey HTTP Server v1.5.0 recipes. The content
> > on this patch includes the modifications suggested by people in the
> > Maling List.
> > 
> > Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> > ---
> > 
> >   .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36
> >   ++++++++++++++++++++++ 1 file changed, 36 insertions(+)
> >   create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> > 
> > diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> > b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb new file mode
> > 100644
> > index 0000000..07a202f
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY = "Fast and Lightweight HTTP Server for Linux"
> > +HOMEPAGE = "http://monkey-project.com"
> > +BUGTRACKER = "https://github.com/monkey/monkey/issues"
> > +
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> > +
> > +SECTION = "net"
> > +
> > +SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> > +SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
> > +SRC_URI[sha256sum] =
> > "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7" +
> > +EXTRA_OECONF = " \
> > +             --plugdir=${libdir}/monkey/ \
> > +             --logdir=${localstatedir}/log/monkey/ \
> > +             --pidfile=${localstatedir}/run/monkey.pid \
> > +             --default-user=www-data \
> > +             --datadir= ${localstatedir}/www/monkey/ \
> 
> Here is an extra space, perhaps a typo, please ?

Yes, also I just tried building it with that fixed and with the change in 
master to use separate build directories for autotools the build fails:

----------------- snip ------------------
ERROR: Function failed: do_compile (log file is located at 
/media/large/tmp/work/core2-64-poky-linux/monkey/1.5.0-
r0/temp/log.do_compile.22474)
ERROR: Logfile of failure stored in: /media/large/tmp/work/core2-64-poky-
linux/monkey/1.5.0-r0/temp/log.do_compile.22474
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 
'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
| sed: can't read monkey.pc.in: No such file or directory
| make: *** [monkey.pc] Error 2
| ERROR: oe_runmake failed
| WARNING: /media/large/tmp/work/core2-64-poky-linux/monkey/1.5.0-
r0/temp/run.do_compile.22474:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at 
/media/large/tmp/work/core2-64-poky-linux/monkey/1.5.0-
r0/temp/log.do_compile.22474)
ERROR: Task 6 (/home/paul/poky/meta-oe/meta-webserver/recipes-
httpd/monkey/monkey_1.5.0.bb, do_compile) failed with exit code '1'
----------------- snip ------------------

The quick fix for this is to inherit autotools-brokensep; a more desirable 
long-term fix would be to fix monkey to allow building it in a separate build 
directory.

Eduardo, could you please send patches for these?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

