Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2E9E731ED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:20:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 26 Apr 2016 14:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,538,1455004800"; d="scan'208";a="692742875"
Received: from wlee9-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.75])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2016 14:20:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2016 09:20:36 +1200
Message-ID: <3674906.352tKuzgEq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.7-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CEC3C9D8-666A-4041-91D5-5BBD1ECECC1B@gmail.com>
References: <CAJTo0LYJ=9m9z4-4pE6dD2mRZNGVzGte5ktCYEWP4Bw58qAd6w@mail.gmail.com>
	<1461660218-2313-1-git-send-email-daicy.fnst@cn.fujitsu.com>
	<CEC3C9D8-666A-4041-91D5-5BBD1ECECC1B@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] hwdata: add new recipe
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
X-List-Received-Date: Tue, 26 Apr 2016 21:20:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 26 Apr 2016 09:50:54 Khem Raj wrote:
> > On Apr 26, 2016, at 1:43 AM, Dai Caiyun <daicy.fnst@cn.fujitsu.com> wrote:
> > 
> > Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> > ---
> > meta-oe/recipes-support/hwdata/hwdata_0.288.bb | 21 +++++++++++++++++++++
> > 1 file changed, 21 insertions(+)
> > create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.288.bb
> > 
> > diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
> > b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb new file mode 100644
> > index 0000000..67199e9
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION = "Hardware identification and configuration data"
> > +HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
> > +SECTION = "System/Base"
> > +
> > +LICENSE = "GPL-2.0+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
> > +SRC_URI =
> > "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz" +
> > +SRC_URI[md5sum] = "f3fa1c5edb66ce5b376d95e772b2d303"
> > +SRC_URI[sha256sum] =
> > "56fc26275b102e538fcfcf9c1093a09f476a1ea8d4e0c733d3c578442923693d" +
> > +do_configure() {
> > +    ${S}/configure --datadir=${datadir} --libdir=${libdir}
> > +}
> 
> is it using autotools ? if so then inherit autotools might be a good options
> and remove the do_ functions here.

We established earlier in the thread that it's not using autotools:

  https://git.fedorahosted.org/cgit/hwdata.git/tree/configure

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

