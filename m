Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eH3-0001or-75
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:27:23 +0200
Received: by ewy3 with SMTP id 3so220949ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=9Iw7E+i3zsdUMvKN+IdxH3m9aCzyZ63qCEHe5Y8DVaQ=;
	b=t8GioxeXQYwc5z46DgSq6K4vpCu5XSWHSKLLfGVz64X2nqkIiGJgmheqtiP2YJf37b
	pY8zKJXo5rfhomXbCA+jk3P15WXTVNFJC/MBLE1iXm2E6G5L6i5SaXNosVh4FuOMgwxm
	holV0pQpyvJTCkF4oLmPhf6Q3K3sXQxsLjvtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=oQsidckEaAcHxi75mUnLuZK00rwFLOt/3UTwlgOHkpVaZUVQyMnlgZxZl+/FALQEod
	Dg06cyGRL88h+P4aqBcDUkegemWScmAn8q3pDrVooY8qUBv6VYP3VKjHMkgPT5pchtFU
	taTFPVa9Mx/E4WDVqSDyMpFezOpeJrPJgy8A0=
Received: by 10.103.84.1 with SMTP id m1mr3052579mul.26.1271157833626;
	Tue, 13 Apr 2010 04:23:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j2sm22643828mue.53.2010.04.13.04.23.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:23:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:49 +0200
Message-Id: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Partial merge of SRCPV
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
X-List-Received-Date: Tue, 13 Apr 2010 11:27:23 -0000

Please consider applying this patch series.

Proposed and discussed in [1], the main reason for NACK (multiple builders
uploading to shared feeds) was resolved with bitbake patch [2] and it's 
enabled by default in PATCH 1/6. It needs bitbake 1.10 or master, but Koen
confirmed yesterday that he is using 1.10 already.

People not using multiple builders or any of changed recipes don't need to 
upgrade their bitbake, just keep your tmp/cache dir even for rebuilds from
scratch (as you already should, if you have ever used AUTOREV).

I'll keep SRCPV changes for other recipes in shr/unstable branch so maintainers
of other recipes can move to SRCPV easily too.

WARNING: don't use BB_LOCALCOUNT_OVERRIDE with AUTOREV, it will make revision
counter in PV constant and chaning SRCREV is not enough to ensure increasing PV.

[1] : http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01325.html
[2] : http://git.openembedded.org/cgit.cgi/bitbake/commit/?h=1.10&id=2f32735463159e9e42e03819d6b505dba49c7f17



