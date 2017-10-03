Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF4E779F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 02:21:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 19:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,472,1500966000"; d="scan'208";a="134535404"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by orsmga004.jf.intel.com with ESMTP; 02 Oct 2017 19:21:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 03 Oct 2017 15:21:29 +1300
Message-ID: <19831714.58pvmM1ExM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <2042040.KWICL2DpS3@peggleto-mobl.ger.corp.intel.com>
References: <cover.1506973045.git.paul.eggleton@linux.intel.com>
	<CAMKF1soN=5DqaviTuLXY5==aLd5AfCJq94Y3bsYU7zSHPc34Qw@mail.gmail.com>
	<2042040.KWICL2DpS3@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/2] mraa: move recipe from meta-refkit-core
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
X-List-Received-Date: Tue, 03 Oct 2017 02:21:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 3 October 2017 3:03:59 PM NZDT Paul Eggleton wrote:
> On Tuesday, 3 October 2017 2:45:35 PM NZDT Khem Raj wrote:
> > On Mon, Oct 2, 2017 at 12:40 PM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> > > +# CMakeLists.txt checks the architecture, only x86 and ARM supported for now
> > > +COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> > 
> > May be it should be "linux*" at the end so musl is covered too.
> 
> I just borrowed this from another recipe in OE-Core - AFAIK though the regex
> isn't anchored so that shouldn't be necessary. Did you try it? (I'll admit
> that I haven't).

OK, I did just try with TCLIBC = "musl" and it seems to pass the
COMPATIBLE_HOST check so the regex is indeed not anchored.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

