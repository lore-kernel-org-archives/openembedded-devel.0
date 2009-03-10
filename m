Received: from [63.245.244.68] (helo=mail.emacinc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1Lh44X-0007Yc-7b
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 16:40:56 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50)
	id 1Lh43y-0006pw-De; Tue, 10 Mar 2009 10:40:23 -0500
From: Travis Stratman <tstratman@emacinc.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
Date: Tue, 10 Mar 2009 10:40:01 -0500
Message-Id: <1236699601.29394.99.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.67
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-Spam-Checker-Version: SpamAssassin 3.1.4 (2006-07-26) on mail.emacinc.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	GREYLIST_ISWHITE autolearn=ham version=3.1.4
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Tue, 10 Mar 2009 15:41:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Khem.

On Mon, 2009-03-09 at 15:35 -0700, Khem Raj wrote:
> On Mon, Mar 9, 2009 at 3:18 PM, Travis Stratman <tstratman@emacinc.com> wrote:

> snip
> 
> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> > PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
> 
> Can you try by removing above three
> 
> Rest of the changes seems like should not have effect.

This doesn't seem to change anything. I made the changes, cleaned all
glibc and gcc packages, then tried to build and I still get the same
issue.

Any other ideas?

Thanks,

Travis



