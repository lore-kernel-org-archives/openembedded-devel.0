Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HKDdJ-0004qp-7B
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 14:05:13 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1HKDd8-0002Zx-7D
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 14:05:02 +0100
Received: from cm74.kappa84.maxonline.com.sg ([58.182.84.74])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 14:05:02 +0100
Received: from robk by cm74.kappa84.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 14:05:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Thu, 22 Feb 2007 21:00:28 +0800
Message-ID: <erk45o$eha$2@sea.gmane.org>
References: <erf8tc$c5d$1@sea.gmane.org>
	<200702221302.17384.openembedded@hrw.one.pl>
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
X-List-Received-Date: Thu, 22 Feb 2007 13:05:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hi Marcin,

Marcin Juszkiewicz wrote:
>> I'm converting my image to the new-style metadata (*_FEATURES, etc),
>> and I'm having trouble figuring out where the error below originates.
>> It can't find a -dbg install directory, or something. I have the
>> feeling I've forgotten to convert something, or neglected to add a new
>> variable.
> 
> Change "inherit image_ipk" to "inherit image" in display-image recipe.
> IIRC it should be all.

Hmm, I did that, but I still have to put a PACKAGES="${PN}" after
the 'inherit image', or it won't work. I'm not using a nice task-xx file
yet, but all is chucked in the image recipe. I noticed openmoto etc. tasks
are a more elegant way of doing things.

Reading image.bbclass next..

Cheers,

    Rob



