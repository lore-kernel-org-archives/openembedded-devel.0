Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51D9F60155
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 10:20:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 02:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,695,1384329600"; d="scan'208";a="470015284"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.212])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 02:20:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2014 10:20:31 +0000
Message-ID: <22793453.L7LGLnMeBO@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <20140118120539.GT3742@jama>
References: <cover.1389979930.git.paul.eggleton@linux.intel.com>
	<d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
	<20140118120539.GT3742@jama>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH 1/1] aufs-util: add new recipe
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
X-List-Received-Date: Tue, 21 Jan 2014 10:20:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 18 January 2014 13:05:39 Martin Jansa wrote:
> On Fri, Jan 17, 2014 at 05:36:04PM +0000, Paul Eggleton wrote:
> > +SRC_URI =
> > "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.x-rcN \
> > +           file://aufs-util-don-t-strip-executables.patch \
> > +           file://include/linux/aufs_type.h \
> 
> Can please drop include/linux/ prefix and put it in right place just in
> do_compile_class-native?

OK.

> > +          
> > file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \ +"
> > +
> > +PV = "3.x-rcN+git${SRCPV}"
> 
> I have similar recipe (for 3.2 version) in one of our layers with following
> changes, can you please check if they are still valid for 3.x and latest
> linux-yocto? It looks like aufs_type.h in SRC_URI should solve this.
> 
> # Needs AUFS support in kernel headers (e.g. aufs_type.h isn't included
> # in default linux-yocto kernel)
> DEPENDS = "virtual/kernel"
> 
> # because it depends on kernel
> PACKAGE_ARCH = "${MACHINE_ARCH}"

I think that's why the header is included.

> > +do_configure_append () {
> > +	if [ "${PN}" != "aufs-util-native" ]; then
> > +		for i in ver c2sh c2tmac; do
> > +			cp ${STAGING_BINDIR_NATIVE}/aufs-util-${PV}/$i ./
> > +		done
> > +	fi
> > +}
> > +
> > +do_compile () {
> > +	oe_runmake CPPFLAGS="-I${WORKDIR}/include -I${S}/libau"
> > +}
> > +
> > +do_compile_class-native () {
> > +	oe_runmake tools CPPFLAGS="-I${WORKDIR}/include -I${S}/libau"
> > +}
> > +
> > +do_install () {
> > +	oe_runmake 'DESTDIR=${D}' install_sbin install_ubin install_etc
> > +}
> > +
> > +do_install_class-native () {
> > +	install -d ${D}${bindir}/aufs-util-${PV}
> > +	for i in ver c2sh c2tmac; do
> > +		install -m 755 $i ${D}${bindir}/aufs-util-${PV}/$i
> > +	done
> > +}
> 
> Use 4 spaces instead of tabs.

Sigh...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

