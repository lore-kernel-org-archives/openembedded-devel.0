Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1P0CNv-0004xP-Si
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 14:00:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8928A8AEB5D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 08:00:30 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16957-02 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 27 Sep 2010 08:00:30 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 03BD089B28A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 08:00:30 -0400 (EDT)
Date: Mon, 27 Sep 2010 08:00:29 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CA05EBB.6080604@ge.com>
Message-ID: <Pine.LNX.4.64.1009270757000.5082@juice.ott.cti.com>
References: <4C9CD59D.30301@cbnco.com> <4CA05EBB.6080604@ge.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Minimum python version - 2.4 or 2.5?
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
X-List-Received-Date: Mon, 27 Sep 2010 12:00:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 27 Sep 2010, Martyn Welch wrote:

> Unless something has changed in he last few months, I think we wanted to
> support 2.4 for a little while longer:
> 
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06143.html

Hmm, so RHEL5 is still using Python 2.4.

SLES10 is in the same situation, but installing Python from source worked 
seamlessly for me. Maybe we could require RHEL5 users to upgrade Python. 
Bitbake 1.10 also requires Python 2.5 and runs about 30% faster than 1.8, 
so there's good reason for RHEL5 users to want to switch.

Mike

> On 24/09/10 17:45, Michael Smith wrote:
> > Hi,
> > 
> > What's the minimum Python version requirement for the dev branch? I'd
> > like to use shutil.copytree(), but the behaviour I want was only added
> > in Python 2.5.


