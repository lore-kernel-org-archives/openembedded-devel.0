Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1Oekfw-00086W-GV
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:10:42 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id C328143D5C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:10:11 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz C328143D5C
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280477411; i=@fjfi.cvut.cz; bh=U1ilGbEsfnzJaGjjWZP8iVAMKJM=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	MIME-Version:Content-Type;
	b=DjYJA6gFaE+y1XX124IFlUxowo8+7etiI9llFT/P7WbqRXNI/UH3Q/8rN6rdnMP53
	11vOAxCRg0lzr4OoumnAA==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id fsU2+gGm3RuU
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:10:08 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 93A3D43D5A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:10:08 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 93A3D43D5A
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 93A3D43D5A
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 5FA2D46774; Fri, 30 Jul 2010 10:10:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by linux.fjfi.cvut.cz (Postfix) with ESMTP id 528DE46773
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:10:08 +0200 (CEST)
Date: Fri, 30 Jul 2010 10:10:08 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20100730075731.GD12277@mx.loc>
Message-ID: <alpine.LRH.2.00.1007301007020.21449@linux.fjfi.cvut.cz>
References: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
	<20100729205504.GE29814@mx.loc>
	<131E5DFBE7373E4C8D813795A6AA7F0802E9149617@dlee06.ent.ti.com>
	<20100730075731.GD12277@mx.loc>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Fri, 30 Jul 2010 08:10:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

>>>> +    set -f
>>>
>>> hush: set: -f: invalid option
>>
>> I thought bash was the standard shell for working with OE.  Is that wrong?
>
> You're right, it is (and -f is a mandatory flag so disregard this,
> sorry)

Just yesterday I was spanked on IRC for wanting to use bashisms. I was 
told OE should work with any reasonable posix-compliant shell.

Regards,

David


