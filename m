Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HKCMS-0001yo-1e
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 12:43:44 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1HKCIs-0006u5-Vx
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 12:40:03 +0100
Received: from cm74.kappa84.maxonline.com.sg ([58.182.84.74])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 12:40:02 +0100
Received: from robk by cm74.kappa84.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 12:40:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Thu, 22 Feb 2007 19:36:31 +0800
Message-ID: <erjv8a$sm8$2@sea.gmane.org>
References: <erf8tc$c5d$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm74.kappa84.maxonline.com.sg
User-Agent: KNode/0.10.4
Sender: news <news@sea.gmane.org>
Subject: Re: Image problem.
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
X-List-Received-Date: Thu, 22 Feb 2007 11:43:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Just to record, in case somebody else googles for this problem: I had to add
PACKAGES = "${PN}", so that bb doesn't muck around with -dbg etc. suffixes
for my image.


Rob Kramer wrote:
> I'm converting my image to the new-style metadata (*_FEATURES, etc), and
> I'm having trouble figuring out where the error below originates. It can't
> find a -dbg install directory, or something. I have the feeling I've
> forgotten to convert something, or neglected to add a new variable.

> OSError: [Errno 2] No such file or
> directory:
> '/bulk/home/rob/oe/dev/build-epia/tmp/work/display-image-1.0-r0/install/display-image-dbg'




