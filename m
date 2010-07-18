Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OabLr-0003va-8Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 23:24:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 0740443D00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 23:24:41 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 0740443D00
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279488281; i=@fjfi.cvut.cz; bh=54gk0i7KkFcTPvtLenU+RaEzx6k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=c5X5AX1FsduVoq3kE8T/D8YpPwAB/P5ftSvFDTtH9toO1gIiScLNbR5gBLPbGKMbw
	ARRKhO+V6aFcTICEzRY0w==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 1QrTXrXkRKTl
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 23:24:38 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id AE62D43CB7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 23:24:38 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz AE62D43CB7
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz AE62D43CB7
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 8243946774; Sun, 18 Jul 2010 23:24:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by linux.fjfi.cvut.cz (Postfix) with ESMTP id 6835E46773
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 23:24:38 +0200 (CEST)
Date: Sun, 18 Jul 2010 23:24:38 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LRH.2.00.1007182316140.8873@linux.fjfi.cvut.cz>
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
Subject: base_do_compile() and GNUmakefile
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
X-List-Received-Date: Sun, 18 Jul 2010 21:24:48 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hello,

there was a patch for base.bbclass that made it accept GNUmakefile as a 
makefile. That patch was supposedly applied:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06820.html

Yet I don't seem to see it committed:

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/base.bbclass#n351

What branch was it committed to? Code somebody commit/merge it into 
org.openembedded.dev branch please?

Best regards,

David


