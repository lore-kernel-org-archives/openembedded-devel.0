Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OdepL-0000uV-VT
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:43:53 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 575DD43CFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:43:36 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 575DD43CFA
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280216616; i=@fjfi.cvut.cz; bh=xX2n68aOG+FvZ6FedM74xYI38Jo=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	MIME-Version:Content-Type;
	b=s5URTaGcWbhjVBojpI6sroFkgYijdpfS57RhhlOHTSkhpYxJZdSjvV2N+YhvKWEg6
	aX1a34u+IQJPp6d5TMPRA==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id VtAUPwtl+327
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:43:34 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id DC09643CF3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:43:33 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz DC09643CF3
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz DC09643CF3
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id D028A46774; Tue, 27 Jul 2010 09:43:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by linux.fjfi.cvut.cz (Postfix) with ESMTP id C370D46773
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 09:43:33 +0200 (CEST)
Date: Tue, 27 Jul 2010 09:43:33 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100727071827.GA3397@rhein.zuhause.netz>
Message-ID: <alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
	<20100727071827.GA3397@rhein.zuhause.netz>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 27 Jul 2010 07:43:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Tue, 27 Jul 2010, Henning Heinold wrote:

> Eduardo Lima sends in patches for cmake 2.8 too. So please coordinate with him.
> I would like to see a fine recipe with which uses the latest features
> available in OE like BBCLASSEXTENDED and so on.

I missed it. It even seems he's been working on webkit-efl too. I'll try 
to contact him.

As for the cmake - I tried and failed. My problem is:

* cmake is built using cmake-native, and it uses inherit cmake

* I can't have inherit cmake in the native recipe, as it would be a 
circular dependency

* I got stuck on: can I somehow "inherit cmake" only for the non-native 
case?

I think that's not possible and so I see only two options:

* hack the non-native recipe to not inherit cmake, yet still use the 
native cmake (this would probably mean some ugly copypasting - so that 
doesn't sound good)

* build cmake non-native the same way cmake-native is built: bootstrap it, 
don't use native to build non-native (and thus no "inherit cmake")

The second option looks more reasonable to me, but I didn't want to break 
what was working and building non-native with native seemed nice.

Any thoughts on how to solve this?

Regards,

David


