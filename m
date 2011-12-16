Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rbfqa-0000N8-T9
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 23:01:45 +0100
Received: by iakh37 with SMTP id h37so1524948iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kE4JN3lSVe2AiLmPYPddzJmsy6fR826NLkY8BImG83s=;
	b=NF7i+TAklT9vNqpgXbSxoZjCky3GJMzH+hRcEXHxLg66zuTZGArl8+XN7cWKiWGaD5
	mRiUJCwAYJB8KrAmOv9wzqeigfPTI6LFnZEXo4LPvTs42WnemXo4kDsbU8XcDEm1qD5Y
	Li01wnID8TzNmGz/q+a8K1kceXMUV3kDYnato=
Received: by 10.50.202.65 with SMTP id kg1mr11021640igc.1.1324072480550;
	Fri, 16 Dec 2011 13:54:40 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id mb2sm4531077igc.0.2011.12.16.13.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 13:54:39 -0800 (PST)
Date: Fri, 16 Dec 2011 13:54:55 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111216215455.GC28832@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Luo Zhenhua-B19537 <B19537@freescale.com>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH meta-oe 5/9] nerperf: add
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
X-List-Received-Date: Fri, 16 Dec 2011 22:01:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/11 10:22), Koen Kooi wrote:
> 
> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende geschreven:
> 
> > Hello Koen, 
> > 
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-
> >> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> >> Sent: Friday, December 16, 2011 3:52 PM
> >> 
> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0 +1,47
> >>> @@ +DESCRIPTION="Network performance benchmark including tests for
> >>> TCP, UDP, sockets, ATM and more." +SECTION = "console/network"
> >>> +HOMEPAGE = "http://www.netperf.org/" +LICENSE = "netperf"
> >> 
> >> Can you include a comment on what type of license netperf is? MIT like, BSD like,
> >> GPL like?
> > [Luo Zhenhua-B19537] May I know which license type should be with following COPYING content?
> 
> That looks like a BSD or MIT derivative, maybe Beth can give us some guidance on what to use as LICENSE

it says "for non-commercial purposes only"

> 
> regards,
> 
> Koen
> 
> 
> > 
> >              Copyright (C) 1993 Hewlett-Packard Company
> >                         ALL RIGHTS RESERVED.
> > 
> >  The enclosed software and documentation includes copyrighted works
> >  of Hewlett-Packard Co. For as long as you comply with the following
> >  limitations, you are hereby authorized to (i) use, reproduce, and
> >  modify the software and documentation, and to (ii) distribute the
> >  software and documentation, including modifications, for
> >  non-commercial purposes only.
> > 
> >  1.  The enclosed software and documentation is made available at no
> >      charge in order to advance the general development of
> >      high-performance networking products.
> > 
> >  2.  You may not delete any copyright notices contained in the
> >      software or documentation. All hard copies, and copies in
> >      source code or object code form, of the software or
> >      documentation (including modifications) must contain at least
> >      one of the copyright notices.
> > 
> >  3.  The enclosed software and documentation has not been subjected
> >      to testing and quality control and is not a Hewlett-Packard Co.
> >      product. At a future time, Hewlett-Packard Co. may or may not
> >      offer a version of the software and documentation as a product.
> > 
> >  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> >      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> >      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
> >      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> >      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> >      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> >      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> >      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> >      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> > 
> >  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
> >      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> >      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> >      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
> > 
> > 
> > Best Regards,
> > 
> > Zhenhua
> > 
> 



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem


