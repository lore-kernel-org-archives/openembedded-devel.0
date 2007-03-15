Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HRnhi-0006jV-Jl
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2007 12:01:06 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id F05E41F7BF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2007 07:01:05 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Thu, 15 Mar 2007 07:01:05 -0400
X-Sasl-enc: eaenWKU/aBuDTO4DKr50yGT3WIJV4/ts2Zw50k85cXrC 1173956466
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id E36B922288
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2007 07:01:05 -0400 (EDT)
Message-ID: <45F92746.2020608@whitby.id.au>
Date: Thu, 15 Mar 2007 21:30:22 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Bad gcc packaging (libgcc-s1 instead of libgcc1)
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
X-List-Received-Date: Thu, 15 Mar 2007 11:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm getting a libgcc-s1 package emitted by gcc_4.1.1.bb instead of the
normal libgcc1.  This is poisoning all builds that depend on libgcc1,
and is polluting the slugos feeds with bad dependencies.

I believe it is caused by the patch in
http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-March/004007.html

I have tested reverting that patch locally, and the libgcc-s1 package
was not emitted.

So I wish to revert that patch.

I'm looking for confirmation that this problem is happening to others.
I will revert the patch locally on our autobuilder, and wait for
confirmation before committing that reversion.

-- Rod


