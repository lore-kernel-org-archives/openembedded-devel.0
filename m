Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD3B78055
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 23:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A192320AF3;
	Mon,  5 Feb 2018 23:36:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SAdK2aeIpPxj; Mon,  5 Feb 2018 23:36:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 781C020A3E;
	Mon,  5 Feb 2018 23:36:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E71A9163284; Mon,  5 Feb 2018 18:36:00 -0500 (EST)
Date: Mon, 5 Feb 2018 18:36:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180205233600.GH2786@denix.org>
References: <20150818095451.0B5435036F@opal.openembedded.org>
	<CA+chaQeSwgn=YjGCifcokcB7eAe4Ygr-Y9c7_--urFd-2=3QVA@mail.gmail.com>
	<cfa2831f-e6ee-6916-342f-d9f4a94ef1d3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cfa2831f-e6ee-6916-342f-d9f4a94ef1d3@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Li xin : tiptop: upgrade 2.2 -> 2.3
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
X-List-Received-Date: Mon, 05 Feb 2018 23:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 30, 2018 at 12:50:59PM -0800, Khem Raj wrote:
> On 1/30/18 6:27 AM, Martin Jansa wrote:
> > Anyone else seeing random failures with this one?
> > 
> > /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/utils-expression.c:191: error:
> > undefined reference to 'yyparse'
> > /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:75: error: undefined
> > reference to 'yylval'
> > /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:75: error: undefined
> > reference to 'yylval'
> > /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:65: error: undefined
> > reference to 'yylval'
> > /usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:65: error: undefined
> > reference to 'yylval'
> > collect2: error: ld returned 1 exit status
> > make[1]: *** [tiptop] Error 1
> > 
> 
> wonder if its missing dep on bison

bison-native dependency is implicit via toolchain - should probably be 
specified explicitly to avoid such random failures. I've discussed with RP 
and sent bunch of similar patches earlier to oe-core and even to meta-oe...


> > On Tue, Aug 18, 2015 at 11:54 AM, <git@git.openembedded.org> wrote:
> > 
> >> Module: meta-openembedded.git
> >> Branch: master
> >> Commit: 4638d7223aa48639238c35b019e1ca86151a0b65
> >> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=
> >> 4638d7223aa48639238c35b019e1ca86151a0b65
> >>
> >> Author: Li xin <lixin.fnst@cn.fujitsu.com>
> >> Date:   Wed Jul 29 17:54:11 2015 +0800
> >>
> >> tiptop: upgrade 2.2 -> 2.3
> >>
> >> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>
> >> ---
> >>
> >>  meta-oe/recipes-extended/tiptop/{tiptop_2.2.bb => tiptop_2.3.bb} | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> >> b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
> >> similarity index 87%
> >> rename from meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> >> rename to meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
> >> index a803e26..5a98116 100644
> >> --- a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> >> +++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
> >> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> >> b234ee4d69f5fce4486a80fdaf4a4263"
> >>  DEPENDS = "ncurses libxml2"
> >>
> >>  SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
> >> -SRC_URI[md5sum] = "74255a29acf44569db021b080ad3e3f7"
> >> -SRC_URI[sha256sum] = "965cb99b16cb59df78363d83b62877
> >> ce8501b0aac1116a86bed8a16aa96b171d"
> >> +SRC_URI[md5sum] = "f1fba1e90465b0e5a3865b19133fa19d"
> >> +SRC_URI[sha256sum] = "3f07e958b40acaeab98e9eb1326c9f
> >> 91b0be0a782c1cc2bd7a9e18d31fab18ca"
> >>
> >>  inherit autotools-brokensep
> >>  EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >>
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

