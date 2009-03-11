Received: from [63.245.244.68] (helo=mail.emacinc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1LhX6b-0007nH-9R
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 23:40:53 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50)
	id 1LhQU7-0008HO-Jm; Wed, 11 Mar 2009 10:36:50 -0500
From: Travis Stratman <tstratman@emacinc.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
	<1236699601.29394.99.camel@cheeto.emacinc.com>
	<19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
Date: Wed, 11 Mar 2009 10:36:07 -0500
Message-Id: <1236785767.29394.156.camel@cheeto.emacinc.com>
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
X-List-Received-Date: Wed, 11 Mar 2009 22:40:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Khem.

On Tue, 2009-03-10 at 10:35 -0700, Khem Raj wrote:

> 
> Hmm looking closely it seems that your cross compiler is from
> i686-linux -> i686-linux which is native configuration and intl
> configury  is then trying to use
> your freshly built CC instead of the BUILD_CC. In short its not really
> thinking if it is cross compiling. I have a x86_64 box thats why it
> worked for me because I am cross'ing from x86_64-linux to i686-linux
> I will give it a shot on x86 box too. Meanwhile can you also define
> TARGET_VENDOR = "something" for your distr and rebuild

I had suspected that it might be something like this. Making this change
fixed the gcc-initial compile problem. Now, it fails on glibc 2.6.1...
something to do with undefined references in libc_pic.os.

I don't have too much time to look into it now, but I'll post more
information later.

Thanks,

Travis




