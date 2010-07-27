Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1Odfe2-0003iJ-CR
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 10:36:16 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 24A6C43CFB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:35:59 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 24A6C43CFB
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280219759; i=@fjfi.cvut.cz; bh=KKgREwlHQxFqBrjZWyWybMytul8=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	MIME-Version:Content-Type;
	b=yZPauhHQ3dmgfp8zTkjc+ARfAFjG/I5Zc/7ALY3n3ziDo3cTwpYpzni32D5/boCgR
	R9Jt4MjXZzRq+9FwrxP8Q==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id LE2t4Er7XCL0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:35:56 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id C6DA743CFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:35:56 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz C6DA743CFA
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz C6DA743CFA
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id BD25346774; Tue, 27 Jul 2010 10:35:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by linux.fjfi.cvut.cz (Postfix) with ESMTP id B8EBC46773
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 10:35:56 +0200 (CEST)
Date: Tue, 27 Jul 2010 10:35:56 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100727083136.GB3397@rhein.zuhause.netz>
Message-ID: <alpine.LRH.2.00.1007271034440.16525@linux.fjfi.cvut.cz>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
	<20100727071827.GA3397@rhein.zuhause.netz>
	<alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
	<20100727083136.GB3397@rhein.zuhause.netz>
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
Subject: Re: [PATCH 1/3] cmake-native: add recipe for cmake 2.8.2.
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
X-List-Received-Date: Tue, 27 Jul 2010 08:36:17 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

> I am not sure the inherit cmake inside cmake is really necessary try it without it and
> see what may fail.

It's because the non-native cmake is built with native cmake.

Ok, I'll try building both cmakes the same way - with bootstrapping, w/o 
the help of any other cmake.


