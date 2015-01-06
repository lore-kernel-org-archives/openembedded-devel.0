Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DC4E0727B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 12:00:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2015 04:00:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="437039519"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.68])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2015 03:47:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 06 Jan 2015 11:59:55 +0000
Message-ID: <7107163.Fin9r0pktx@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20150106112502.GE19402@jama>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
	<2344737.AuP89X4c5h@peggleto-mobl5.ger.corp.intel.com>
	<20150106112502.GE19402@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 03/10] ddrescue: update to 1.19
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
X-List-Received-Date: Tue, 06 Jan 2015 12:00:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 January 2015 12:25:02 Martin Jansa wrote:
> On Mon, Jan 05, 2015 at 01:31:15PM +0000, Paul Eggleton wrote:
> > On Monday 05 January 2015 13:35:52 Martin Jansa wrote:
> > > On Mon, Jan 05, 2015 at 11:00:47AM +0000, Paul Eggleton wrote:
> > > > * License changed to GPLv2+
> > > > * Upstream now only releases .lz files for new releases
> > > 
> > > Is .lz working correctly now with current bitbake+oe-core (it didn't
> > > last time I've re-tried)? Shouldn't we wait for base.bbclass change to
> > > be merged as you mention above do_unpack?
> > 
> > Well, it worked for me, but you do need the lzip recipe which we do have
> > in
> > meta-oe. We don't necessarily have to wait since even when base.bbclass
> > has
> > been updated the line I added won't cause any issues.
> > 
> > > Duplicates http://patchwork.openembedded.org/patch/82165/
> > > can you send incremental patch on top of this if needed?
> > 
> > Ah, I missed that. As it happens, the only difference is the
> > aforementioned depends line.
> 
> Rebasing your change on top of Koen's shows bigger diff:
> 
> diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
> b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb index a605249..dc485b3
> 100644
> --- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
> +++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
> @@ -13,30 +13,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
>  SRC_URI[md5sum] = "ed6b5b82d74cbd925db2b829350e74b1"
>  SRC_URI[sha256sum] =
> "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a62ca4eb140f4747b8"
> 
> -CONFIGUREOPTS = "\
> -    '--srcdir=${S}' \
> -    '--prefix=${prefix}' \
> -    '--exec-prefix=${exec_prefix}' \
> -    '--bindir=${bindir}' \
> -    '--datadir=${datadir}' \
> -    '--infodir=${infodir}' \
> -    '--sysconfdir=${sysconfdir}' \
> -    'CXX=${CXX}' \
> -    'CPPFLAGS=${CPPFLAGS}' \
> -    'CXXFLAGS=${CXXFLAGS}' \
> -    'LDFLAGS=${LDFLAGS}' \
> -"
> -EXTRA_OEMAKE = ""
> +# This isn't already added by base.bbclass
> +do_unpack[depends] += "lzip-native:do_populate_sysroot"
> 
> -do_configure () {
> -    ${S}/configure ${CONFIGUREOPTS}
> -}
> -
> -do_install () {
> -    oe_runmake 'DESTDIR=${D}' install
> -    # Info dir listing isn't interesting at this point so remove it if it
> exists. -    if [ -e "${D}${infodir}/dir" ]; then
> -        rm -f ${D}${infodir}/dir
> -    fi
> -}
> +inherit autotools
> 
> +EXTRA_OECONF = "'CXX=${CXX}' 'CPPFLAGS=${CPPFLAGS}' 'CXXFLAGS=${CXXFLAGS}'
> 'LDFLAGS=${LDFLAGS}'"

OK, perhaps I wasn't clear - I meant that that was the only addition that my 
change made that his did not.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

