Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id D6F917CFEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 02:19:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y6so865770pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8pXOfoz8/dUZrHK46M3w9S4zpRFT6QQDL2FnfhYQa6k=;
	b=JK3DUMBRGid3IYlcTVNHpBvk7ob9qzCoKD5QsgQ4mCjlFaWsbpwPBoEIcKCTXAIsMN
	Q+Mj0xcOIqcYFy0PV1lb/mStUEbh2HDaUKBge3/SAAbYRtUMVyMMJ/QAE8g+O7KfNhkc
	Vdi52qFVKOPpXfzTlKuH7Nr3LoQbqEqte4p962a+unqa0AU5nHOw2DIUS63bSW6JmaQk
	SDQCqzKBNP9VMmh5CfRrVB6ooihAz58WF7a5hhA4FopApwszGbMqkVsZRGIEZPbpJqSP
	FoQn+Cn4BTDEgJWAuoeUyGDq42FqkNGggawOX+sNu7Y4AUXzfoEgR+LyZEEBfTc6dY0e
	vngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8pXOfoz8/dUZrHK46M3w9S4zpRFT6QQDL2FnfhYQa6k=;
	b=h0/MyFlkW6y2IN5qMupMIysd+qGYChMD/miCEWX4EbRM6vEjw0d8VOPs0N+0HSGcyJ
	e3tds6LXG9gvoqmG4ndrYGJQzrRVrDSyI9cLjA9OaQe+1Uh8w8AFkhFJwOTgxZ3LjIl8
	hceuE6kNLVBK3Xyf2W7XxnAJuqNreWpeSF3CrdMvFG2JfgNrGsCYNos1FtZi9D8eS+oU
	NmmjbxFDIBqe9rnY4ONZSgJmv19UqUbUcyqTPU5fKe3SQlLle+5miaqmv74ngsnp5Utn
	LXXvnD7pR3Urh1blQfbXGbWWoflsbazrUq2VJScUQW9PFaMUQXFULVDdCtJZsGrz6bkP
	owmw==
X-Gm-Message-State: APjAAAWaLd3bxmMjV955Bkoxr3lPN+ANfuakJX1CLKmnrDHPADc8DSzL
	yJVA5NSam1rP2G/45BzYlTm80eY5
X-Google-Smtp-Source: APXvYqw6z9TCPIvqhvuJZIVztkMtKbg3FW3Ga6qe3qdm1JednHHWR7zZFMR5DPSaWfUbiy9Eoda+9A==
X-Received: by 2002:a17:902:1002:: with SMTP id
	b2mr27738267pla.248.1553566776869; 
	Mon, 25 Mar 2019 19:19:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id
	j4sm25931896pfn.132.2019.03.25.19.19.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 19:19:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Mar 2019 19:19:34 -0700
Message-Id: <1553566774-8056-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553566774-8056-1-git-send-email-akuster808@gmail.com>
References: <1553566774-8056-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] libforms: has a depends on mesa so add DISTRO_CHECK
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
X-List-Received-Date: Tue, 26 Mar 2019 02:19:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
index 8a214d1..f86d7c1 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.
 SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
 SRC_URI[sha256sum] = "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c2def61"
 
-inherit autotools
+inherit autotools distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 S = "${WORKDIR}/xforms-${PV}"
 
-- 
2.7.4


