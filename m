Return-Path: <anatol.oe@belski.net>
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8797EF4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:59:44 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id 046F717A0316; Mon, 22 Jul 2019 02:59:44 +0200 (CEST)
Received: from fringe.fritz.box (i5387DFE8.versanet.de [83.135.223.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id 7985F17A0316; 
	Mon, 22 Jul 2019 02:59:42 +0200 (CEST)
Message-ID: <79a42ab135c11b37f3706056fed158e7add92a95.camel@belski.net>
From: Anatol Belski <anatol.oe@belski.net>
To: Khem Raj <raj.khem@gmail.com>, Anatol Belski <anbelski@microsoft.com>, 
	openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:59:39 +0200
In-Reply-To: <497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
References: <20190721013327.27634-1-anbelski@microsoft.com>
	<497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] Finer gperftools packaging
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
X-List-Received-Date: Mon, 22 Jul 2019 00:59:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

On Sat, 2019-07-20 at 19:17 -0700, Khem Raj wrote:

> > +FILES_${PN}-libs = "${libdir}/libprofiler*${SOLIBS}
> > ${libdir}/libprofiler*${SOLIBS}\
> > +		${libdir}/libtcmalloc${SOLIBS} \
> > +		${libdir}/libtcmalloc_debug${SOLIBS} \
> > +		${libdir}/libtcmalloc_and_profiler*${SOLIBS}"
> 
> do we need a separate libs package ? what does it give us ?
> 
I've submitted another patch

https://patchwork.openembedded.org/patch/163267/

which only cares about the libtcmalloc-minimal.

I've tried your suggestion and indeed an extra lib package simply
doesn't make sense, the only diff would be that the pprof script would
be packaged separately.

Please abandon this one, small steps having libtcmalloc-minimal is good
enough for C++ apps just using the allocator.

Thanks

Anatol



