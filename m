Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1AAA37F45E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 07:44:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46p5p33x1Kz4S;
	Wed,  9 Oct 2019 09:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570607067;
	bh=N2nQQfRhZp7TGuMn9CByYkSeSVr81bqHeXs4rC5AdC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTcOdiLouIt6YAkr9ecTyKi51QfTzk02eeMFmIUwi3bkcauZ+n90uN6hQq28QlvTF
	ajbmUjiG2KR/024Fp0dij4Z5AuhD1pDx5Yuy7M/RmZwaurR+RobHsnVDBn+Edmdxah
	4ZIF6rQIr5BegTcc2t++nby/red+MMUicWXjbLTlAuRNAmX9LbQ5cBEhL4pEwbWMU8
	yOEIGFUpLItnW445z1Dj4Y4k7IX2nQ8d9qSX6iNVH6HrsZ8+zYrgZwmJNFofSyzsJ+
	3U7n1YUgAwfBrFzIJVV8gSBvskEi8E/wOjX7x1OimAeVat9N5i1u1wTMZJJXZgBKRv
	HfIIhQYw4N5Mp+Mi27v0ofXjZf/sdGu3bgx7aoJRdsnF/KDr0CFWkGkfN723dfQXm/
	u5dPeS7eOJDf0MAWXPu1M3+p372Cju28Qo0FlfoljelmM9E7GUyQlEuwbbNRHwYfEi
	aq/1eBSrLtFNyk6CRDfyWr9hj8tjmHtF1cVGX9la+nxNGbDxCsMnV5VAlyBpZEe9tE
	B565ee0SfWjixGZx3l9RrSxzZIAZLWcC2y279FV/XTdPiBp7WFGRe8QWxWWHyjQ8Zk
	Zdh0b43+rUZenEkOxHjo/jAEyD7jNmiZ2YIphF4w2Y7OgsjskO4Bi0SU9EWCmPPWil
	BXeOi3TxHLKczJLslqwxdRh0=
Date: Wed, 9 Oct 2019 10:44:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Peiran Hong <peiran.hong@windriver.com>
Message-ID: <20191009074425.GA26763@localhost>
References: <20191007134340.36555-1-peiran.hong@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191007134340.36555-1-peiran.hong@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] tcpdump: upgrade 4.9.2 -> 4.9.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 07:44:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 07, 2019 at 09:43:40AM -0400, Peiran Hong wrote:
>...
> Deleted patch "0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch"
> since the fix is included in the upgrade.
>...

The patch file is not deleted:

>  .../tcpdump/tcpdump/add-ptest.patch           |  9 +++++----
>  ...lute-path-when-searching-for-libdlpi.patch | 19 ++++++++++---------
>  .../recipes-support/tcpdump/tcpdump/run-ptest |  4 ++--
>  .../unnecessary-to-check-libpcap.patch        | 15 ++++++++-------
>  .../{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb}    | 12 +++++++++---
>  5 files changed, 34 insertions(+), 25 deletions(-)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} (74%)
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


