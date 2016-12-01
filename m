Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A18E71B3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 18:45:46 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so35668487wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 10:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+cr6lsw3ovDfkTIuVxa7gS8AaCy9MhJlblzfj2R6qM0=;
	b=Tg/QRetSjVqxEtOmqT6056u5inv//+ZawpE0l4OjwSTzJYNDTkpMIBeXJH8xZVEWgm
	h3HaDJEtHx1TsTo6bMiIpwnYCX223dipkTloGuWYXABti8lWpZElKTYQmTOM9HjsfUJS
	mouUAE3FzwHM6tiaG+/UdPZ8Anow8vd4p34nHkbjxINJkgj0FaBR1FK5lxtdBEwYafKX
	CgqbytGsjcfo/ETtFGc/IKxOdG1KAgORcmvmQXJeAMbJ4dLw+c63Si9Xgmdy/JHhdvgu
	Xagax8sErClBMGlXsK7Z+QaSMH7cKCG0IsFXtXnssfeFLG8pORI1oxhrGF22bRT8U65w
	nZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+cr6lsw3ovDfkTIuVxa7gS8AaCy9MhJlblzfj2R6qM0=;
	b=lA8XTjdjziaWnkzPbR5YSQoQ4NUipJvF+cFRg4Yz+w5okKsxaITvmEI/eVmTrR01Yf
	Ieg4NMYcuzIPZqg2bT/SJm/Fzr7UrPE+jaKWiti5PgIHTqeinN7uwU+KPsW9UMcWTDl1
	DMnIGHWc+QhFlmq1cAIR6rgHVU3Pzab4fpNl2V4ng8XURtFk8PfKsjAoNeCzbqQSpJnY
	+1ZmYQ4dJ00h5YzkTlfuQQKS/Zu3ap0HgQW3KNzCtBoEeea0JEFbW+aa474KriS5nc5b
	2hZb297wrLhWjMxXhwhS4Kq/ldaZ5YqvKH45gCq8uS63kuvUMbwCVZBmFaRAPsl9iN6X
	Ideg==
X-Gm-Message-State: AKaTC02rk2B237aWR5NT2ZB8otKE18c4SU9tTmppy3b6Q9hCvQNom0Ql1w8Wo/PsVaXCyw==
X-Received: by 10.28.45.142 with SMTP id t136mr38301136wmt.110.1480617947843; 
	Thu, 01 Dec 2016 10:45:47 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF34510078AFC66E4F3A2DFD.dip0.t-ipconnect.de.
	[2003:71:ef34:5100:78af:c66e:4f3a:2dfd])
	by smtp.gmail.com with ESMTPSA id w79sm2284746wmw.0.2016.12.01.10.45.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 10:45:47 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 19:45:27 +0100
Message-Id: <1480617927-26478-6-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
References: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv3 5/5] redis: increase the max number of fds to actually match redis.conf
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
X-List-Received-Date: Thu, 01 Dec 2016 18:45:48 -0000

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


