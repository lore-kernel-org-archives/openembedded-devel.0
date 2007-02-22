Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HKDVB-0004ge-LS
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 13:56:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HKDV5-0001WO-SU
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 13:56:43 +0100
Received: from cm74.kappa84.maxonline.com.sg ([58.182.84.74])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 13:56:43 +0100
Received: from robk by cm74.kappa84.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 13:56:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Thu, 22 Feb 2007 20:56:16 +0800
Message-ID: <erk3tt$eha$1@sea.gmane.org>
References: <erjv1k$sm8$1@sea.gmane.org> <109483350.20070222141407@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm74.kappa84.maxonline.com.sg
User-Agent: KNode/0.10.4
Sender: news <news@sea.gmane.org>
Subject: Re: How to specify RDEPENDS properly?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2007 12:56:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hi Paul,

Paul Sokolovsky wrote:
>   So, libreadline4 must work.
> 
>   General hint: if you have any weird problems with packaging images,
> first dumb thing you can try is to remove Packages* files and retry.
> 
>   That's because ipkg and ipkg-utils have bugs tracking actual state
> of package. For example, each  time you do "bitbake -c rebuild", and
> then create image with that package(s), you *must* kill Packages*.

Thanks for the elaborate explanation! Killing Packages* did the trick,
though I had to do a 'rebuild package-index' as well, to get them back.

Cheers!

    Rob



