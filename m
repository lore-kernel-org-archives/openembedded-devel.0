Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D11C879A31
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 15:37:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 23-v6so7989746pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y/9LsmTjyESPRlFHjZ/G0gYCPgezjY4+mxlIDpE006E=;
	b=RRvFDjVXuz4BEMDUq2OQguTLW8s5e3v3rxGfdR27ONDIVAvAEcA9wrT1PjMLnMBcFf
	WZ+SLyNshmoo+so0I30Gwgco6RVQXci+9821jZUToSM4eMVwLUtmoBPgt97K0wyRSQWB
	rij4hE4Q3XBlWZ63ZBKcPeelDMnlRzKzvhTBfcRWx6RhkrgHpfWzbV4UqeHkuyPedXoV
	pyFCHBJMNPoQK8V50jVf1fP1XBuLIauBVZwXyg0eORghcuhKhtX5DusPD5VvCxteCM3K
	LSIC6t5CS9WhJq962BNRRVlA7w4dXcOp9LtyJrrpbse5vaknoKdTSsYlAN9Os4yllBzI
	kseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y/9LsmTjyESPRlFHjZ/G0gYCPgezjY4+mxlIDpE006E=;
	b=RapdPBpm0W/vHT4BszfGzGJtxPLjWmP8cUsW+0QS3m1A1Yexd53ORb1rg0TufxNUCT
	EmWfv+LYhv94DZPFJhtFLRou3wKMgpSzz/v1VHpGRyZVxRYIqlvWohng1bZVJJld2lC8
	phR9wVdCzBn4nTuR27CaUqwcgausdpgpusdm5HHP7dS9T+As6VnB7ANKNBbY0bIfa+C5
	1oA4XMVKz2CbebvSYEKXJc7WZh7Og8Y7MEPAuaDwe7rc5tY+wuKj8wY8YttYFo3S+0RZ
	Y6P1ixceB52DyAjjHH35Y99Lq4IiBgIOPS4KOt/yJGYZPFNNOfvyyVsG/C0W3T0SJsAK
	AZJw==
X-Gm-Message-State: ABuFfoj5idy6WmkxxPv5nwJZnuzjSgiYJykgavRLaSx+BXXsHIprLrYV
	qF0Jto/0XrA/tNMIB6zFcjmZNW4O
X-Google-Smtp-Source: ACcGV62/KVsrLsBvurLzOIG65oewl+dAFVRIKgqKTgX4xHgobZlsSrImVelX5o8aW2LB6+WxCzoclA==
X-Received: by 2002:a62:4301:: with SMTP id
	q1-v6mr24401768pfa.163.1539013077118; 
	Mon, 08 Oct 2018 08:37:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	q127-v6sm18014598pgq.19.2018.10.08.08.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 08:37:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Oct 2018 08:37:40 -0700
Message-Id: <20181008153740.30400-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: Revert unintended changes (not ready yet)
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
X-List-Received-Date: Mon, 08 Oct 2018 15:37:57 -0000
Content-Transfer-Encoding: 8bit

We need to enable icu with intl support but this was accidentally
committed with last umip move patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
index d0645007c5..e3b46bc2c8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
@@ -44,7 +44,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --with-intl=small-icu --without-snapshot --shared-openssl --shared-zlib \
+   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
-- 
2.19.1


