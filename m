Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id B9A6174E47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:36 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id g3-v6so682065pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xWcnSV3nedrAtKYP/3mPM10fAB64LUZP2HyPQE6/1HI=;
	b=Za90AOVLQ0g6lEpqBK98mpK1+tcId2I/eup5hKB1i04j1ynJf6DK/oinisB0fnFgTw
	G+MWs5EbIPGeq+kP0+rxVxRVQRIm2G+2b1djlhMZzjWIes8FYZ2RvgkXiEAfNkdZ6880
	BGOI5aSYJwXouQPlrFpVuY7XkydW5Z2K0zMe5CulVBmAxmVSilNm2F4Uow+BQ9S/7L3o
	Aufy22fEy5aDNjGtUiceKGqTKhR/qN6vF+O852h2rH3JQ0WCkPKM1XnuFi4gsIvXYsvP
	yRzNo0gO/s3wRngwFBEpkPW6MqZG3bjsYH7yOA5cdPD6VYKC/UpZN9Y9c9BvTH3XyBOY
	sPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xWcnSV3nedrAtKYP/3mPM10fAB64LUZP2HyPQE6/1HI=;
	b=hZFXVbYc7hSbMOaprqSwwjgrL7e/zZoffiMQDJ2DYvjb2uJPBL+3czGPwvoyielHFk
	YXhT5PxMCP2jmmBH6v1OlR/1JUvjdVyupG3/6bOvw9H8a9uUvmqB802ddYHe/MbUivyy
	FtV8IZAL/iTyi3NldVciXC75O0h94ZvrmkrwUyJIWj2/kdkrEDKLmiRoMvaW6mMnuAnm
	Gr38Q9M+kcKRUDR9cKrMKLK1bHaX8Wo37oMt5UnacUyrkPmPKhLflYBZ/4dcYlw3hPMa
	YJHTHM4sXJTQf/IhHzjQbGjQz7oqxiQZj/VZ3FYVof9gqp3EJJO8yJAgvaFH+wOssAd6
	j1KA==
X-Gm-Message-State: APt69E02VymtkxnD7+sGPAIXlaHAnEiHNUIFFG9l3flyQZw9AYYF0mL6
	mvwXyHYRkzIY8isU9vpzW7cyXA==
X-Google-Smtp-Source: ADUXVKLG0OFzAxrbceir2SV9idDKdfJaHPkJcYRysDN995MeijjdUocZypXF/jxWP0Irqx6skm/nVw==
X-Received: by 2002:a65:6008:: with SMTP id
	m8-v6mr8371357pgu.134.1529867977409; 
	Sun, 24 Jun 2018 12:19:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:33 -0700
Message-Id: <20180624191845.31082-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/20] corosync: Upgrade to 2.4.4
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../corosync/{corosync_2.4.3.bb => corosync_2.4.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-extended/corosync/{corosync_2.4.3.bb => corosync_2.4.4.bb} (95%)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
similarity index 95%
rename from meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
rename to meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
index dc2f01b0fb..b760c117cf 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
@@ -9,8 +9,8 @@ inherit autotools pkgconfig systemd useradd
 
 SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "bf0ede13018aadc8a046183bc593b0e0"
-SRC_URI[sha256sum] = "b1e7e422e8d2f7af8e5315fa329b1dbd1175fff32efaa55e8054584c80a2c597"
+SRC_URI[md5sum] = "69db29ff4bc035936946be44fc8be5cd"
+SRC_URI[sha256sum] = "9bd4707bb271df16f8d543ec782eb4c35ec0330b7be696b797da4bd8f058a25d"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
 
-- 
2.18.0


