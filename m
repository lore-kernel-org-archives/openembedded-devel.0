Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 098A76F759
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 00:35:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WNAet-0000WX-Gl for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2014 01:35:03 +0100
Received: from c-76-106-30-151.hsd1.md.comcast.net ([76.106.30.151])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 01:35:03 +0100
Received: from sam.nelson by c-76-106-30-151.hsd1.md.comcast.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 01:35:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Sam Nelson <sam.nelson@ti.com>
Date: Tue, 11 Mar 2014 00:31:47 +0000 (UTC)
Message-ID: <loom.20140311T013133-408@post.gmane.org>
References: <48D3D52125C49B43AE880038E2E5314BB5BFAB@SRV101.gdsys.de>
	<48D3D52125C49B43AE880038E2E5314BB5BFAF@SRV101.gdsys.de>
	<CAP9ODKq4YxX2EqTRd=wNOD=pWuQSTe+5h-gzBrMEAg96qFEucQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 76.106.30.151 (Mozilla/5.0 (Windows NT 5.1;
	rv:27.0) Gecko/20100101 Firefox/27.0)
Subject: Re: [meta-java] Compiling log4j1.2-native fails
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
X-List-Received-Date: Tue, 11 Mar 2014 00:35:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Otavio Salvador <otavio <at> ossystems.com.br> writes:

> 
> On Thu, Mar 8, 2012 at 11:19, Eibach, Dirk <Eibach <at> gdsys.de> wrote:
> > Rebuilding with a freshly checked out system without parallelization did
> > not show this bug. So maybe one of this nasty parallelization issues...
> 
> I've seen some build failures and I also believe it is parallelism related.
> 

I am seeing this problem as well (even with the PARALLEL_MAKE = "-j 1".)
Same build compiles fine on one particular linux machine.
But see failure on two other ubuntu machines all three running 12.04 Ubuntu.
Any clue on the failure will help.

"The type javax.mail.MessagingException cannot be resolved. It is
indirectly referenced from required .class files."
Is this related to mail related software not installed in the host machine?

Cheers,
Sam


