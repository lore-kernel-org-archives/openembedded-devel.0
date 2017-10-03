Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3D3A600EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 02:04:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 19:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,472,1500966000"; d="scan'208";a="155929808"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by orsmga005.jf.intel.com with ESMTP; 02 Oct 2017 19:04:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 03 Oct 2017 15:03:59 +1300
Message-ID: <2042040.KWICL2DpS3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAMKF1soN=5DqaviTuLXY5==aLd5AfCJq94Y3bsYU7zSHPc34Qw@mail.gmail.com>
References: <cover.1506973045.git.paul.eggleton@linux.intel.com>
	<2184b0a74f70b5b5e4fc628ed4e48e9282b555a6.1506973045.git.paul.eggleton@linux.intel.com>
	<CAMKF1soN=5DqaviTuLXY5==aLd5AfCJq94Y3bsYU7zSHPc34Qw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 Oct 2017 02:04:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 3 October 2017 2:45:35 PM NZDT Khem Raj wrote:
> On Mon, Oct 2, 2017 at 12:40 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > +# CMakeLists.txt checks the architecture, only x86 and ARM supported for now
> > +COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> 
> May be it should be "linux*" at the end so musl is covered too.

I just borrowed this from another recipe in OE-Core - AFAIK though the regex
isn't anchored so that shouldn't be necessary. Did you try it? (I'll admit
that I haven't).

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

