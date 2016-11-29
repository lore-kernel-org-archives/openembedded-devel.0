Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f170.google.com (mail-wj0-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 46603719F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:04:32 +0000 (UTC)
Received: by mail-wj0-f170.google.com with SMTP id xy5so140271286wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8QYcnImZ3jft2/nswY2CHuy/Xjw2VySqKHVqtmhQeTg=;
	b=a/eSPoqcXLhpM7RZVjhR9rj0PHj7A7txAFYs2tIiF01I3viwgiPVluWoVJfEuBLt/l
	3UNcw5JqWMyDQtT8LFsWea0g+cImpImqMK4GJJSLRWcWJGZkRupCv9evUCIlDmvMuDtN
	W99iRj/19OL5Sz+XW29fVUmG/ApZjVTgLtZv9vYKPCgFmcScOhEScAtsJGtsEVWqABbC
	PwL/sIDLCjVYQvBJYM4Y8Uv1LgzejY6VMhzCducYueSBFTmJ+gJEGQYGx3sKARTzL4VZ
	AatoxjpLiP6RL6vXm/jwDAnHt+BFAX5UQMQHE2OG/+b4CHVxUHrm6TX7EOLn+2GL4VAD
	Ttcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8QYcnImZ3jft2/nswY2CHuy/Xjw2VySqKHVqtmhQeTg=;
	b=NVbP0XmU7AhD4XcqqUgHy/LB6i7+jEVxWcWA4AXjNkPvJ4SREiCRaIboJcyaJCr3as
	n1DXnOcdKpzN1xDz75VKQgdPkjp8cqzyte35zRErNoOvsSTYiqx28sNvnzJvzkaAnKvh
	VMDGpVB0j10SxjZ7BUflqtrvDd1MqnH0nkp+rPVLwLgU5XN4u+BHVobUGhJvXD2f5tB1
	13aNxYiRAp6kFWo+4RORQHsEeXlqdzwhOMwROukDYmTFS0Cvfsr6GDSW0E+jnzi71P2e
	z0yWvBH58gD7f+Pzmy5wMoGTVp/eOcow3ZnZUnO7xEemw7bJosb39h2Ifwahb+lqnbIX
	hSOQ==
X-Gm-Message-State: AKaTC00gMdqqVDc1+hQtyI+j6/O0LQGSGljDF1HTVjvQi8tXXDbvW97CoKKAKzFQs8hcLw==
X-Received: by 10.194.127.104 with SMTP id nf8mr22784148wjb.39.1480413873679; 
	Tue, 29 Nov 2016 02:04:33 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF35F10038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef35:f100:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	e188sm1919656wma.21.2016.11.29.02.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 02:04:32 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:04:21 +0100
Message-Id: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv2 0/5] redis: improve the recipe with focus on systemd support
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
X-List-Received-Date: Tue, 29 Nov 2016 10:04:33 -0000

Improve the redis recipe with focus on systemd support.

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


