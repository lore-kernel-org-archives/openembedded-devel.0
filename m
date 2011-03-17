Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q0DyR-0006xF-76
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:14:47 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E450611000BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:13:04 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 15B9A11000B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:13:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225146072.adsl.alicedsl.de
	[92.225.146.72]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:13:04 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 5CAB93C0BA; Thu, 17 Mar 2011 15:12:21 +0100 (CET)
Date: Thu, 17 Mar 2011 15:12:21 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110317141220.GA16796@rhein.zuhause.netz>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1300325100-29332-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 14:14:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I looked deeper into the problem.
Cairo looks first for:

return __sync_fetch_and_add
__sync_val_compare_and_swap

and defines it as cairo_cv_atomic_primitives="Intel".

According to http://gcc.gnu.org/wiki/Atomic
arm and sh3/4 should work too.

If the configure compile fails
cairo is looking for libatomic-ops
support.

The libatomic-ops in oe is very old and misses diffrent bug fixes and is only
needed for ppc and mips.

I will try to clean the stuff up this evening, which proably applies to
pulse-audio too.

Bye Henning


