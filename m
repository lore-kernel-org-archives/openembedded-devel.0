Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 46DF46BE11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 15:45:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VFQsi-0005Fr-9D for openembedded-devel@lists.openembedded.org;
	Fri, 30 Aug 2013 17:45:06 +0200
Received: from adsl-69-211-97-123.dsl.chcgil.ameritech.net ([69.211.97.123])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:45:04 +0200
Received: from dales773 by adsl-69-211-97-123.dsl.chcgil.ameritech.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:45:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dale Schaafsma <dales773@hotmail.com>
Date: Fri, 30 Aug 2013 15:40:09 +0000 (UTC)
Message-ID: <loom.20130830T173615-388@post.gmane.org>
References: <SNT146-W6864849A2A4EBFC6A267A683340@phx.gbl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 69.211.97.123 (Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36
	(KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36)
Subject: Re: [meta-oe]recipes-devtools/cloud9/cloud9_0.6.bb,do_fetch fails
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
X-List-Received-Date: Fri, 30 Aug 2013 15:45:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dale Schaafsma <dales773 <at> hotmail.com> writes:

> 
> All, My apologies if this is not the correct place to send this...please let 
me know where it should be sent.
>  The cloud9 image for the BeagleBoneBlack doesn't currently build for me as 
the sass.js git repo no longer
> seems to exist. The following is the offending line in recipes-
devtools/cloud9/cloud9_0.6.bb:
> 
git://github.com/visionmedia/sass.js.git;destsuffix=git/support/connect/suppor
t/sass;name=sass \
>  Searching github found this repository, but I'm not sure if this is an 
appropriate replacement (I'm not
> familiar with sass).  https://github.com/stunti/sass.js
> Thanks,Dale 		 	   		  
> 


All,
 The stunti location won't work (doesn't contain required commit). The 
following repository seems to work:
 git://github.com/matehat/sass.js.git

 I'll try to pull together a proper patch request, but it'll be a bit (due to 
unfamiliarity and other commitments).

Thanks,
Dale



