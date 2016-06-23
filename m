Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 053936014F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 04:18:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2016 21:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1007895874"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2016 21:18:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Thu, 23 Jun 2016 16:17:58 +1200
Message-ID: <3397381.B6WPiHmTEs@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <576B32C7.6090209@gmail.com>
References: <1466025817-30091-1-git-send-email-akuster@mvista.com>
	<576B32C7.6090209@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2][PATCH] cpuset: add new python package
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
X-List-Received-Date: Thu, 23 Jun 2016 04:18:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin,

It didn't show up in the archives nor in my inbox, so I suspect it never made 
it to the list for some reason.

Cheers,
Paul

On Wed, 22 Jun 2016 17:52:23 akuster808 wrote:
> Ping.
> 
> I don't see this in the patch queue, was it removed, dropped or did I
> mess up the submittal? Did I miss a response ?
> 
> regards,
> Armin
> 
> On 06/15/2016 02:23 PM, Armin Kuster wrote:
> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> > 
> >  .../recipes-devtools/python/python-cpuset_1.5.7.bb | 23
> >  ++++++++++++++++++++++ 1 file changed, 23 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
> > 
> > diff --git a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
> > b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb new file mode
> > 100644
> > index 0000000..8f6532c
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY = "Cpuset is a Python application to make using the cpusets
> > facilities in the Linux kernel easier" +SECTION = "devel/python"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> > +
> > +SRCNAME = "cpuset"
> > +
> > +SRC_URI = "https://github.com/lpechacek/${SRCNAME}/archive/v${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "6ad79b26ba03f559604d74513cc34392"
> > +SRC_URI[sha256sum] =
> > "32334e164415ed5aec83c5ffc3dc01c418406eb02d96d881fdfd495587ff0c01" +
> > +S = "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit distutils
> > +
> > +RDEPENDS_${PN} = "\
> > +    python-core \
> > +    python-re \
> > +    python-logging \
> > +    python-textutils \
> > +    python-unixadmin \
> > +    "

-- 

Paul Eggleton
Intel Open Source Technology Centre

