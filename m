Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED3871B58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:59:56 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id jb2so14870603wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+cr6lsw3ovDfkTIuVxa7gS8AaCy9MhJlblzfj2R6qM0=;
	b=abTEndAm/Mme/FNoj2hJJG2YVRWTxh8S8Bz53zzWWjxg1D881SISh72o8AzrLywarE
	/jRXOkzuboEO+jDlbYkThsyvtzJBhtVRFFqeUae+KS2INcElk3QHkmd9F9Ahb/6qIB9L
	J3xea+tKtxmik6SR3oDecOCECM8p7DIW+FeZoOjDVvJeym/vo8I6HP56h7ktUQdSw9vI
	I4fP+RFMfDwgqbdPhHT2urcXWQPX3vsxuk5YnW+akcTBCPME4cX5MzwlFr5Obr+yxvXx
	e94L6dVNzWNdXYFkCytQL+boFDz0zQcko3sUqZPiom6ul+eMdc4ckxO62vUAI4ZmR27l
	e2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+cr6lsw3ovDfkTIuVxa7gS8AaCy9MhJlblzfj2R6qM0=;
	b=VvLCTa6rT2HbYP5aXDNMthF+n6D9wGcYD6g8DL+EPKjHhqd5+cFEv/QY6ESIsACKoP
	0vGEe0wyxc6NSemnY6q1GRN5lviHPBN+o7JOZowWCxLtcg+4DZzXMOnuNXShlFxhMxVB
	CUsQlyPF5IO5moOPknz83YDqLosWm6vtxev95tp1cr/KoL3GzNIg40nKMyq08J5S5uT6
	X+OM8/suWUkvQlVGg6YeWrLBWUrlPN/ZMctF9DLy9GVl+4UnTWFhKI/fmRXQ0z2UpJMc
	gv/tfyL4lOCITWiddge02xdrgkPqNmkOfDMYA65Hyu7rHk24WlREj3ffmexfU1jpQgVv
	DiyA==
X-Gm-Message-State: AKaTC0390vuWf8fqY+TlfARZV3EVqk6n379PPkasaQ8BntkBAK5hf1AXYvZH7O4YdxmtYw==
X-Received: by 10.194.71.69 with SMTP id s5mr19797881wju.197.1480352398080;
	Mon, 28 Nov 2016 08:59:58 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF27C90038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef27:c900:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	k11sm29756805wmb.18.2016.11.28.08.59.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:59:57 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 17:59:48 +0100
Message-Id: <1480352388-7733-6-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH 5/5] Increase the max number of fds to match the concfig in redis.conf
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
X-List-Received-Date: Mon, 28 Nov 2016 16:59:57 -0000

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


