Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1ds-00067K-Ff
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:28 +0200
Received: by fxm6 with SMTP id 6so3100953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=i1n75YnQWLpLFsrr3npZQ+GNW8QpRpMApqxZPkYl9aw=;
	b=pkohWZdS0shfOIL58/ScplJOfnWcMCVgWU7KyZ3Q8kMCTziCpG2tdCzHXtIu/UqmdH
	C4hwxTaYtgnLj187E2lQpQi0R26gK2ghLdCcjMvhqMPHvJcD6oYrqmpJwBwd3dyadWVh
	oEQAJDZo9FvTL2qzkMC5S2rh/XoQ3aiwJXuUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=G/xwWxCuUZTADRgZDRYOkgInjUeQqMUiHufkFpnLQwEZyKj8WFgxVht/8e55TzZuFg
	qdo0OxVqYLkv3I1I8MO8GpUrDs/0HjdOez8+bF8inGzo/RjOUL1pwWOl0ds/QzO2Gu0c
	4NQO1brdWnNuJlvRt4cNqGPEMH6l5OKQoVuLg=
Received: by 10.223.126.14 with SMTP id a14mr5328754fas.44.1281972611451;
	Mon, 16 Aug 2010 08:30:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r10sm2501199faq.5.2010.08.16.08.30.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:11 +0200
Message-Id: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xorg recipes cleanup
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:29 -0000

Hi,

all distributions are now using 
preferred-xorg-versions-X11R7.5.inc or
preferred-xorg-versions-live.inc or
no preferred-xorg-versions*.inc at all

So we can remove some older versions not pinned in those 2 
to make future maintanance of xorg-* dirs a bit easier.

As this is really easy to test (if you apply all 9 and build your 
favourite target again, no xorg package should be rebuilt - version changed),
please test and ACK or don't scream later that you had some strange version
preferred from local.conf.

Thanks,



