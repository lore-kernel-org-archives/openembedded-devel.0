Return-Path: <gizero@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4433660053
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:41:20 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so64721301wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mt4m4EHTw7QTsDNq5PjWDPyLK+wFkkKEfhazRQ0nPv4=;
	b=YDir+7wAYYsKk5cxeXq8r2mjAAzSg6vuIjIkWkLh92IIlgqW9/NFVQky1ceLxme/bB
	Rg5fGydD1CDEXtNekFkYK/hBIUnbKZpUjv0YKPs+x4NyqweW5CeBN+hKMWNCRU04NKrq
	PqbX4KmuCgXgXNDTskyiXGf/j+IEgr7LG5DR8BqOXzFAWdlM2+KpZMGIRzlgh8ZYZeWV
	wM8DC8cDeqOL0nHxzjOzbFZnE8cUNwz1tAI8xgbehowpwnK6z3IibDtU9m4A0uk4nEPe
	d6Q4vwnLnXvkjkgpnE68v+dNXPTuddHBwLc0aMC+G5S28Z0p5IWv9Nc2I+QTWsT1Tg9l
	LBwQ==
X-Received: by 10.180.23.193 with SMTP id o1mr4600330wif.71.1441978880473;
	Fri, 11 Sep 2015 06:41:20 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	nb10sm621368wic.11.2015.09.11.06.41.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Sep 2015 06:41:19 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Sep 2015 15:41:04 +0200
Message-Id: <1441978867-24237-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 0/3] redis: improve conf file install and stylize
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 13:41:22 -0000

This set fixes file permissions used to install the default configuration
file. It also mark it as configuration file for packaging by adding to
CONFFILES. Some recipe restyling was also applied.

Feel free to squash individual patches if more appropriate or just let me
know and I will respin.

Andrea Galbusera (3):
  redis: fix configuration file permissions
  redis: add redis.conf to CONFFILES
  redis: stylize

 meta-oe/recipes-extended/redis/redis_3.0.2.bb | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

-- 
1.9.1


