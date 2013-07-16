Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B82D56B20F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 17:07:03 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Jul 2013 10:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,678,1367996400"; d="scan'208";a="269077197"
Received: from unknown (HELO helios.localnet) ([10.252.122.80])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jul 2013 10:07:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>,
	David =?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Date: Tue, 16 Jul 2013 18:07:01 +0100
Message-ID: <2169768.F21dFWYplB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAGiJk9cSOsY4Lb1-KKJrtLAX05J680diw4HSFfg7LW56ga7Hrg@mail.gmail.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<f70cc47eb65740d7307194b9a4e3414f78180348.1373726565.git.paul.eggleton@linux.intel.com>
	<CAGiJk9cSOsY4Lb1-KKJrtLAX05J680diw4HSFfg7LW56ga7Hrg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] protobuf: add recipe from meta-virtualization and tweak
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
X-List-Received-Date: Tue, 16 Jul 2013 17:07:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 July 2013 17:36:08 Samuel Stirtzel wrote:
> 2013/7/13 Paul Eggleton <paul.eggleton@linux.intel.com>:
> > * Add proper SUMMARY
> > * Break long DESCRIPTION onto multiple lines
> > * Reorder some lines
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb | 20
> >  ++++++++++++++++++++ 1 file changed, 20 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
> > 
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
> > b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb new file mode
> > 100644
> > index 0000000..c4ed5e6
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
> > +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in
> > an \ +efficient yet extensible format. Google uses Protocol Buffers for
> > almost \ +all of its internal RPC protocols and file formats."
> > +HOMEPAGE = "http://code.google.com/p/protobuf/"
> > +SECTION = "console/tools"
> > +LICENSE = "BSD-3-Clause"
> > +
> > +LIC_FILES_CHKSUM =
> > "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514" +
> > +SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
> > +SRC_URI[sha256sum] =
> > "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567" +
> > +EXTRA_OECONF += " --with-protoc=echo"
> 
> Hi,
> 
> do you know why it doesn't use:
> 
> EXTRA_OECONF += "--with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> 
> in combination with DEPENDS += "protobuf-native" in protobuf?
> Instead the recipe that uses protobuf/protoc depends on protobuf and
> protobuf-native.
> 
> My assumption is, that the result would the same, and it is currently
> skipping tests for the cross compiled protobuf.
> Or does it archive anything else?

I'm not sure, this bit came from the original protobuf recipe in meta-
virtualization. David, you seem to have written this recipe originally, do you 
have any insight into the above?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

