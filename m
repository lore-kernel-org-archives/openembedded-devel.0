Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PARcC-0006pj-Ey
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 20:17:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 60D9966689E;
	Mon, 25 Oct 2010 14:17:06 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24138-09; Mon, 25 Oct 2010 14:17:06 -0400 (EDT)
Received: from [172.17.64.252] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 53A2A665735;
	Mon, 25 Oct 2010 14:17:05 -0400 (EDT)
Date: Mon, 25 Oct 2010 14:16:51 -0400
From: "Michael Smith" <msmith@cbnco.com>
To: raj.khem@gmail.com
MIME-Version: 1.0
X-Mailer: LCG ProfiMail
Message-ID: <8380468373.972483411@cbnco.com>
In-Reply-To: <AANLkTi=CQtr4Ubg2JothivG=GR99RkztCn8FHgOG6kYA@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: xdelta_3.0z.bb: `QA Issue with xdelta: No GNU_HASH in the	elf binary`
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
X-List-Received-Date: Mon, 25 Oct 2010 18:17:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed



------- Original message -------
> From: Khem Raj <raj.khem@gmail.com>
 
> easier fix is to add TARGET_CC_ARCH += "${LDFLAGS}" to the concerning .bb

I'm planning to patch the makefile as it's not only ignoring LDFLAGS but 
also hardcoding debug/optimization settings.

Thanks,
Mike 


