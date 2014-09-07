Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 493 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 07 Sep 2014 18:52:17 UTC
Received: from qmta15.westchester.pa.mail.comcast.net
	(qmta15.westchester.pa.mail.comcast.net [76.96.59.228])
	by mail.openembedded.org (Postfix) with ESMTP id 98E8E70F06
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Sep 2014 18:52:17 +0000 (UTC)
Received: from omta05.westchester.pa.mail.comcast.net ([76.96.62.43])
	by qmta15.westchester.pa.mail.comcast.net with comcast
	id oJeT1o0010vyq2s5FJk5rM; Sun, 07 Sep 2014 18:44:05 +0000
Received: from [192.168.1.10] ([68.38.40.177])
	by omta05.westchester.pa.mail.comcast.net with comcast
	id oJk51o0033pLAh83RJk5Sb; Sun, 07 Sep 2014 18:44:05 +0000
Message-ID: <540CA774.4060908@mindchasers.com>
Date: Sun, 07 Sep 2014 14:44:04 -0400
From: Bob Cochran <openembedded@mindchasers.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1410115445;
	bh=OiGllkXonorfKVEi9/91JSsgE0AvxCm+taRY07WKLRk=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type;
	b=lhpG4vV68i05wu88v/OFqZhQ40u7bEzafoBEvjYEwXAOs5+OsZcZpEtRMr+pjWJj4
	YHgzHldj4DCvWzRp5Eoymk6g606hcU6whjDB+OCIQgXPlT6w471RM9hZHEqOgwQrJw
	FVYsvQp+WBNdy3m9LRJuNztOa4udcRKT8TyZKk/niP1kAfb0s7cq9CN9rZrOr5uw5/
	zqdEx81U6mGO2mqDb/kj8lu8FyuLeKmDnij3453+9+Y5uJhOFP4g6V7/KAWfr4f/+N
	4lKy2BzYrip38nzhv7pXm9U8DqkBGM08V6DdmnAJotlc1hWn9+eDXcY+kz4MvUi+lu
	ngnIlliEZ6aMw==
Subject: issue about git and XDL_FAST_HASH on big endian (powerpc) machines
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
X-List-Received-Date: Sun, 07 Sep 2014 18:52:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On my ppc64 e5500, 'git commit' fails with

git: xdiff/xutils.c:358: xdl_hash_record: Assertion `*ptr == '\n'' failed.

I built git with git_2.0.1 on poky / meta master branch: 669c07d60221

I found a related patch on OpenWRT that tracked the bug assertion on big 
endian machines to the inclusion of XDL_FAST_HASH in config.mak.uname. 
They state that XDL_FAST_HASH won't work on big endian machines.

https://dev.openwrt.org/changeset/37239

For my cross compile build, I patched out XDL_FAST_HASH to verify that 
the bug would go away on my target,  which it did.

Would anyone care to comment on how to best create a patch for this?

A quick search showed that there has been activity on patching 
XDL_FAST_HASH for big endian machines, so maybe just patching it out of 
the make file isn't the best course of action for building a big endian 
target.

Thanks,

Bob

