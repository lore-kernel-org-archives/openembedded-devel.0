Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C3A287CF1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 12:55:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45KQcD2Khpz3L;
	Thu,  6 Jun 2019 14:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559825708;
	bh=yOsOlCXLvp0R8yYkaWf+95F1zV5+SV7cBz7+bhJNOv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2u0fudY7aY7UQsbvOVl/OQ2pYNByMSmONSOZ6DFkpm1PAZ//tbMiUpwkSnG7Vccw
	9cVtaaewD//NLPUFTQKf+tI3GT4vT1HmV3/WfpzBUEXO5Svt4bp40VOBVc6xXmBHfE
	ElkJh6x/D/x9Oosf5ewBg8OzezLSjbV1zhxtwkf5vhK4udQhvP3uac4cbx2IHvfV20
	D5ltoc7my/rXQ0F85gUL1S9rG2T3VPtye4X9WAu6eYYT8llR059kNdOYtbGtEvYC6U
	uFQDE26msmYyTARTN1x6ChNFFPgL9GiKMGu1RLaPFTIMANGu7VOnNfyFIeYblACr9L
	MaoUJsNdYySqlEcoEoVhfUbvamVjUZuFgHhOaSgwywYjmboX56GyyLVOOPCqdanSiX
	Ar9DCdNpWQZEVxYV4MrsdzAQwbegmsSSb5n9GY6BkAJjx6fUc+RdHGW6X3PuwQHImn
	Qb1tXNsK+morZgCWOQ+MpIYxG537xqjqT4Jnq9LOOHlgbS4FEqRnst58SMiuZ5G0qd
	JwRGB0qmkOvmkL+VU6ixOsTWmplVE7F+s8U8hCiZUCyhlkS+esNeVH6NMh3Krgv0Yw
	J78ETYrX+bMSzXtPmSKu2krBfiyEysNlZXK0Fh4vL+tQO1l/Hj7uY8F8ffqc1YGPta
	YL+Pdeqxl7JFV8gb7fAuuxaM=
Date: Thu, 6 Jun 2019 15:55:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Message-ID: <20190606125501.GA12025@localhost>
References: <20190605183523.32391-1-vernon.mauery@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190605183523.32391-1-vernon.mauery@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] Update ipmitool to use new active source
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
X-List-Received-Date: Thu, 06 Jun 2019 12:55:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 05, 2019 at 11:35:23AM -0700, Vernon Mauery wrote:
> The ipmitool project has moved from sourceforge to github and is under
> new management. This updates the source so that it pulls directly from
> git rather than a tarball. Eventually, once the next release is tagged,
> the new SRCREV can be updated to that. But for now, the project is under
> active development and could probably benefit from periodic updates
> anyway.
>...

This does not sound as if upgrading ipmitool right now would be a good 
idea - if you do not feel confident to make a release, then downstream
distributions should better not use unstable "active development" code.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


