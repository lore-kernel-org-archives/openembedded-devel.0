Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE8F465D00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 18:45:41 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so27492513wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Jkmp5hVJJW4RvcDpRLOktWyOaBsOKNbjVVWSp/c2lhk=;
	b=yrJXVCWFLg3zcW1T7s/rV9KLJO8bHTEv5kFgvxUaR7OnrDP3rHt5nTAPmoOWo7D74J
	3jQpxE770a78ymq/ymkjA8H+JoPJ8JLxG+mE0bbpg52L0nfottc2696hG6N0V+HuZnBx
	NatOJWfTYPRgzZ+Ffj7qz47/OPmxojFWarJNihrhLZla9RvYQE4aRoMLoob0GXVs4uZb
	pbg+fWRQe3D+nbbnaqWOQwHk2Rwj4YN0SNC+CdrPbQco69Tws7JeBOdQNLOVho4HOp8c
	8vI7knKSH9w3DJmr03muwRWUVlNoNbARmMofM4We5EaKdLRIrATxbKeGaB2G8dwTLz0L
	SBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jkmp5hVJJW4RvcDpRLOktWyOaBsOKNbjVVWSp/c2lhk=;
	b=jEckTsJt9zsqnQ58Fkp/SWj0IuC0I1kpVjNdlI6Pwukg0XV9thGqXZeDXIxZaXlYT7
	zp6+zFoyRifpd1yuBftB3AjBpvzvr/eXQXvs7kH0PiXXwyUmUrw46B0W/GC5eDmFzjMC
	AdXdFyJ6VQoCAoMUnbRvxIwctBb1ChrwdpAySgH+8nGMra368THihrm4mpFxbI0KU8dL
	dlpqHo3bkzX/6lARG7gRyH1FqiS/pkWvb7NyKUf5YX4HnDKH62H20Do76CgjQpY/kSsG
	2w6fTqszChduSAKpWm0M+bTzywxyIk8QV3oZSLUEaxHFUDGWvFlmw1WVtBKTiyEjxFfl
	r+TA==
X-Gm-Message-State: AKaTC03koOFedkNC1PMWRLdzEKoLYBMADyg9I3TjgABRfAACgtr3/ugHf6nPCkflyDAMZg==
X-Received: by 10.194.81.233 with SMTP id d9mr42005883wjy.118.1480617942038;
	Thu, 01 Dec 2016 10:45:42 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF34510078AFC66E4F3A2DFD.dip0.t-ipconnect.de.
	[2003:71:ef34:5100:78af:c66e:4f3a:2dfd])
	by smtp.gmail.com with ESMTPSA id w79sm2284746wmw.0.2016.12.01.10.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 10:45:41 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 19:45:22 +0100
Message-Id: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv3 0/5] redis: improve the recipe with focus on systemd support
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
X-List-Received-Date: Thu, 01 Dec 2016 18:45:42 -0000

Improve the redis recipe with focus on systemd support.

V3 uses ${systemd_system_unitdir} instead of ${systemd_unitdir}/system

Frank Meerkoetter (5):
  redis: add a systemd service file
  redis: do not expose the service to the network by default
  redis: log to syslog
  redis: do not run as root
  redis: increase the max number of fds to actually match redis.conf

 meta-oe/recipes-extended/redis/redis/redis.conf    |  8 ++++----
 meta-oe/recipes-extended/redis/redis/redis.service | 15 +++++++++++++++
 meta-oe/recipes-extended/redis/redis_3.0.2.bb      | 21 ++++++++++++++++++++-
 3 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/redis.service

-- 
2.7.4


