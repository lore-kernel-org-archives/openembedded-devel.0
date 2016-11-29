Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D205571AF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:04:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so23347141wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+cr6lsw3ovDfkTIuVxa7gS8AaCy9MhJlblzfj2R6qM0=;
	b=VRzvUTR+cfVEPtFNHlnIl3XslRix+9TEWuI7r9IT62ztLAdvxrn38j0wS86pi6FfKl
	F+WTkNbwyHV9vYGlevSPupd0mkykF9l4SvcldGafBO8zeK3Zd1DWh3BhzrfTYw+CrYwG
	m52BJ5UCVcsx04sLRCceMug7GZCkc1VltP2Y7YgnM/q3dM3Y/dwEr6EHccIQF18tYtvS
	ybZf/g05DTSttWXsP5L+xMZ1OOL80iBfrV5a4PVWhIkhM6ttQGPaA0L0EnlUzWreeZM/
	cVDOcsXJ9JFViFMQNfIcSbrHMshaPZPmujnveNUp3UuiPWxmBpElAEMG8Af44VY2t94S
	Mbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+cr6lsw3ovDfkTIuVxa7gS8AaCy9MhJlblzfj2R6qM0=;
	b=ghTz24SpTaf+qUEA2zOJfvQEYeTnMNOmBKLSg01cV0ZLhIEaphZWE9sLRnOsS08hxR
	XQZjgWWIHeVVGlb/GlWUBI0728vuFIL4XW0ZXnksECEtJ4VMhcFtu9jWA9N+iuI/kpgk
	G8fdj8JPDiCiN/cjiMaeIt6oB3y+DBNwKAnflOvr29q7orSsjEyRZ6l+JJ4aRQCM3KaV
	XPhWf7jVL3wOpG4PFCwrHGY3aRVe26WYDbW0pe5yI3DIl6sgzUZnQCBzlnLrxOrQf6Ps
	5SIASbp1hEpCWsRIOaOUqDXE+Ou0rYLnopJRmJhLw27IaJ6PRKuIjLyAkTsleChNT6E9
	viEA==
X-Gm-Message-State: AKaTC00QOUPKcMoJ24kx5sNxzZLmvD63JzkHt84Lb1iHJPKCma7cr3PY86cg3Kx9jO5Yng==
X-Received: by 10.28.29.23 with SMTP id d23mr4460217wmd.91.1480413878613;
	Tue, 29 Nov 2016 02:04:38 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF35F10038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef35:f100:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	e188sm1919656wma.21.2016.11.29.02.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 02:04:37 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:04:26 +0100
Message-Id: <1480413866-25885-6-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
References: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv2 5/5] redis: increase the max number of fds to actually match redis.conf
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
X-List-Received-Date: Tue, 29 Nov 2016 10:04:38 -0000

Now that the processes no longer runs as root, we need to increase
the limit for it.

This only affects systemd based systems.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/redis/redis/redis.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis/redis.service b/meta-oe/recipes-extended/redis/redis/redis.service
index 577bb14..36d2985 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.service
+++ b/meta-oe/recipes-extended/redis/redis/redis.service
@@ -8,6 +8,7 @@ Group=redis
 ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
 ExecStop=/usr/bin/redis-cli shutdown
 Restart=always
+LimitNOFILE=10032
 
 [Install]
 WantedBy=multi-user.target
-- 
2.7.4


