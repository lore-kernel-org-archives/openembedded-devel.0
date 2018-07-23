Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id D921A74D49
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:49:45 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id 6-v6so265065plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1xO/OyySF1Q7CSxw1OuLgLpbm4Fi6seJR3N8jPY48jo=;
	b=KiOTy7JpG+ishMhCuoHZGrIi2jzdvrP7PqHoITNUh8Dtf0RrWDeRRWueUc4hLugbve
	WpVLE7iKHhGBOrHof3iUdTnir/uvFhpAup6UEr7Nim4lLsk5eCmFDeatu2W+Fl0PXxKU
	YqOt+jPf5Bqzo+ZuX6CI4ImXsQ3YBHxkrLEqhzmrrpcyZpNofqMDkc9sFQxPwDacB63y
	xcM9iWGgAUKvChRnmsZ67C4kJZCdoNaDsdZolnmoQbL7soLol5/AW1lkWy9RbFKsoEqG
	IXNpnLS1oXfoo7a+FGEbvrgWyIAZn8+Pu8G6zTkBOAqf6xPBf3vAzLVxv4ZGDlrzugrw
	/KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1xO/OyySF1Q7CSxw1OuLgLpbm4Fi6seJR3N8jPY48jo=;
	b=shNlxuLd1CAzkP3RMUi3nyM6Rm42+meBTku7f+zwMAdD3W+O0Saor7K0wPJJDOf4O8
	wlWP90ryRe18yecT8FaV8X6tEGl9NFmVU+BwQOOGByhwBwcJbQjCPKwEMVhxnTt8bYsO
	gqyAWZs1sYUtfl/g/m8JqSoLyt26Xu9E5acyOW4dUmzCAvjKB6uLn28rIikhJZQV1M+g
	y4LG3TzZqD63U++SDDwrRO+XJaAwlZyQ2nbjfHgNAIh3FrFOgnUq/rVfQnlmHknNaolr
	TcvSmvFQSQxyUnWl313fjMrQTrElrHjE7yuiYC4yL1p3P08fCtWxdvvfqfwIWs53xkAD
	EfGw==
X-Gm-Message-State: AOUpUlFmQhl2cdxrHpUoMtOzP80xdtzB9zOXEZW145Nwwj+CpGg1hKYh
	8hbLDygacjmxInXEFGJFcQfxwSti3teK
X-Google-Smtp-Source: AAOMgpc/P1hFwWbaivwW1stBGHl5KCef3tl16qXVRA7qCaKziAVI7DLC98QY/5idavpNZ5yaOTwt7Q==
X-Received: by 2002:a17:902:76c2:: with SMTP id
	j2-v6mr12885413plt.19.1532353786613; 
	Mon, 23 Jul 2018 06:49:46 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm4182356pfm.80.2018.07.23.06.49.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:49:45 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:29:45 +0800
Message-Id: <20180723132950.4543-2-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723132950.4543-1-freebendy@gmail.com>
References: <20180723132950.4543-1-freebendy@gmail.com>
Subject: [meta-oe] [PATCH 2/7] python-mccabe: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:49:46 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
index a86d15800..6b63cd780 100644
--- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += " \
     python-prettytable \
     python-cmd2 \
     python-pyparsing"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


