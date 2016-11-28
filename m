Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD30719CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:59:50 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a197so211677089wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XXPeUVAOL2/8Uz5kKIEfHF7tWMrkYwRyOzbvKw6hSNI=;
	b=TfPy0zqeW/i/6Iy8YLW8vUgRzltS1sQhmlhs4OZWOY97pLpEDWjJJnc9ldNj9FXc8m
	xoBMrJGfuFfdg0ankb29bI7fzpExmF1CnbZTWQqQ+RpqpOIZP0Njq7o+Vnfo3uxzsdpx
	7uKKxcBlHoTJwIL11iAecPJKks3we6yD9xza1T0kjl/iZ+vxhbQjMYAgqk0qS1/HhBhg
	+fB5VHu29Wu8h0hWw7ejmWp/HSTAOBkBSN/pYPJScdSBWsEPf+WPejGjKT/JTI3rmQ+9
	6DHTJojjCXokcMzcNZ9WISovp3j7xsmSO2IDwT0gLWhgE4xTBOR49+zLHca6GP5CTw/e
	DuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XXPeUVAOL2/8Uz5kKIEfHF7tWMrkYwRyOzbvKw6hSNI=;
	b=mc5eFFtdwdgkBcDd4OtPN0TrxFy6t1jvoEx1W6gmo/vMbUixW6JjEnH9fEeClaxA+r
	BDzyl75ABC9aGeHH1ndiTq9o3YHKGkZyQgDU0S9peuIaL0E1op3ujNQq+3eTe9i58CST
	E4amKQXwUNS4Dv5PpzYeMAz+JWBK5G2+WEdQju73kyYYP3OAqARJq6JGCwK+1DfY9y4O
	HcjYCKk50EeBkMl865Q/nUtyMC9aNmCA+t2W96OUbamaM9R5YHzeHVSp4u3uN6Utos7L
	7fowtTqEmwKQF5zXDEVwdk/xbSums7ewO9Ds8k4YenUsD2x3MXGMT6nQ4tDj5vb8zdng
	gGog==
X-Gm-Message-State: AKaTC00O3qOncQxNoKEQo3hSqGapBgZkN13V7uMlOsXN4Z7WnLe+BNagogLbKMrVm3Y4gA==
X-Received: by 10.28.143.20 with SMTP id r20mr19418012wmd.2.1480352391428;
	Mon, 28 Nov 2016 08:59:51 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF27C90038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef27:c900:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	k11sm29756805wmb.18.2016.11.28.08.59.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:59:50 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 17:59:43 +0100
Message-Id: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH 0/5] Improve the redis recipe with a focus on systemd support
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
X-List-Received-Date: Mon, 28 Nov 2016 16:59:53 -0000

Improve the redis recipe with a focus on systemd support.

Frank Meerkoetter (5):
  Add a systemd service file for redis
  Do not expose the redis service to the network by default
  Log to syslog
  Do not run redis as root
  Increase the max number of fds to match the concfig in redis.conf

 meta-oe/recipes-extended/redis/redis/redis.conf    |  8 ++++----
 meta-oe/recipes-extended/redis/redis/redis.service | 15 +++++++++++++++
 meta-oe/recipes-extended/redis/redis_3.0.2.bb      | 21 ++++++++++++++++++++-
 3 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/redis.service

-- 
2.7.4


