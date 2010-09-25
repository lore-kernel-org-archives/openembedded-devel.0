Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvM-0006vQ-QO
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:12:58 +0200
Received: by pzk37 with SMTP id 37so936443pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=EkgDUGhNQ3xMLa2OBt5vYK5e4MUdjmkShXks4gO4xaw=;
	b=jVF3rEycBcMzpKmdfoo8pA8kRS3dY+YRwPUKeoX10Alb5iLgomUQPdWWOdl9FN0Hj5
	1MW0mRHCV8WgvMoIv61yP/LbN7pza4ksSX7CIE5BmIkgS67bKdx4SFlT02BaARzYHLnQ
	i/HgMql6UZLwT+DpEYdRA7tdsHdtKR+7WdYV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=f1R7nhQySQ4pYM7FTuPhrb5AwDTY+6poJmQZQFv2X2TTf4BINgdjqyX6GzEQf2Waiz
	kDQPP0AI3Al0rbBCfFTdbxi6txP0QBSduPZ/R94w/wVktUpG+DyNuhMs7Yih+l5qVSja
	LzXrqXzlpVS5bboSRtkVOjR6jEqcmKEc0/oGE=
Received: by 10.114.108.14 with SMTP id g14mr5898322wac.185.1285456367424;
	Sat, 25 Sep 2010 16:12:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:21 -0700
Message-Id: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 00/12] Add support for mips64 target architecture and qemumips64 machine
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
X-List-Received-Date: Sat, 25 Sep 2010 23:12:59 -0000

Hi

Following 12 patches add support for mips64 architecture into
OpenEmbedded. 

Machine qemumips64 is added to use the implementation.

As we do not support multilib the default is N64 ABI fudged into
default root file system structure.

Please review and all feedback is welcome.

Enjoy

-Khem



