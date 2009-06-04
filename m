Received: from [85.33.3.5] (helo=smtp-OUT05A.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MCJWk-0007Ei-Rj
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 22:27:06 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 4 Jun 2009 22:18:00 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 4 Jun 2009 22:17:59 +0200
Received: from [192.168.1.166] ([80.117.37.182]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 4 Jun 2009 22:17:59 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090602224552.GH26065@smtp.west.cox.net>
References: <1243981798-11167-1-git-send-email-GNUtoo@no-log.org>
	<1243981798-11167-2-git-send-email-GNUtoo@no-log.org>
	<20090602224552.GH26065@smtp.west.cox.net>
Date: Thu, 04 Jun 2009 22:17:53 +0200
Message-Id: <1244146678.6678.5.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 04 Jun 2009 20:17:59.0759 (UTC)
	FILETIME=[8E3305F0:01C9E551]
Subject: Re: [PATCH] uclibc.inc : also exclude mips and mipsel from GNU hash.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2009 20:27:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-02 at 15:56 -0700, Tom Rini wrote:
> On Wed, Jun 03, 2009 at 12:29:58AM +0200, Denis 'Gnutoo' Carikli wrote:
> 
> Acked-by: Tom Rini <trini@embeddedalley.com>
> 
> > diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
> > index f2f3e9b..a967954 100644
> > --- a/recipes/uclibc/uclibc.inc
> > +++ b/recipes/uclibc/uclibc.inc
> > @@ -95,7 +95,7 @@ configmangle = 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE="${KERNEL_SOURCE}",g; \
> >  		s,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX="/lib",; \
> >  		s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
> >  		${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
> > -		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) == "avr32"]} \
> > +		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
> >                 '
> >  
> >  CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
> > -- 
> > 1.6.0.6
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > 
pushed
Thanks
Denis




