Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OWH28-0006BZ-7i
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 00:54:33 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OWGxQ-0004Kw-J0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 15:49:40 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 6 Jul 2010 15:49:40 -0700
Received: from [172.30.80.199] ([172.30.80.199]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 6 Jul 2010 16:49:39 -0600
Message-ID: <4C33B301.7010006@mentor.com>
Date: Tue, 06 Jul 2010 15:49:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i108p5$hd$1@dough.gmane.org>
In-Reply-To: <i108p5$hd$1@dough.gmane.org>
X-OriginalArrivalTime: 06 Jul 2010 22:49:39.0426 (UTC)
	FILETIME=[8404C420:01CB1D5D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Tue, 06 Jul 2010 22:54:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> +PREFERRED_VERSION_gcc-cross = "4.1.2"
> +PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
> +PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
> +PREFERRED_VERSION_binutils = "2.17.50.0.12"
> +PREFERRED_VERSION_binutils-cross = "2.17.50.0.12"
[snip]
> do NOT belong in a machine.conf (or machine include). Those belong in
> the distro (or local.conf), not in the machine.

Just putting this out there (and it's indeed _not_ how things are 
today).  Why would we not want to move towards having this kind of stuff 
be in the tune-ARCH.inc file, when a specific version is really needed 
(more avr32 or new'ish core on an existing overall arch) ?  Yes, it 
should be up to the distro to say "we want 4.4.x + 2.20.x" or whatever, 
but then we also get the downside of "special case, XXXX only works well 
with 4.3.4 + 2.19.x" or what have you, and those special cases get 
introduced in one place and copy/pasted elsewhere.

-- 
Tom Rini
Mentor Graphics Corporation


