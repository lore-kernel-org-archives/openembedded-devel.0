Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 158E874A66
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:47 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id e7-v6so4216659plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L42SCWJBUyXw6p5NpE19eg6g+ur8t9o3WKuv6ZEgwrc=;
	b=JbFt7tt3rK0UtIl5xWQBRYcvIpzNOBtlmITJrHJFlI1Yl32XWoqc26txuUDymH/RwB
	Rpl9qegUQEIBkkFjtgqnOsOj2qOTlivcJWDn2JUcpdIa6FbqAL41RsM6/WvD17GgLT5O
	KtlRkKf7JqaXhz4yJVG2yFJCnf3fNlh1cza5trSDe8+zdC13/sCAF5l4nCTDwq7GbNWr
	6oYtQuUVepQfHgBNX+3jt5PlSYi/ONhVansXWvGTzijcbs7I8ceLbBdBMd1l3OlPtWQt
	EIR6nGlDyg8XJEaQMddUhbTEOcWZta1ZC9zFtIFaqUCZgadL60AxW5xGd9IVWSJl4+VA
	A0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L42SCWJBUyXw6p5NpE19eg6g+ur8t9o3WKuv6ZEgwrc=;
	b=HlScVLV0r64heanqijRTYlz1uio1OL+OnH1TPYhQ/YMmDhLYD4ci8A5202bir6xjUN
	E7mzEvW4n4rrh/r2UzTyGH8+l47L8txXEXzm60o7BkMqsjbo7BNLL+O41Y9gBITu4Qor
	uVxpFigxRc/SGdYIr2Jlqrnb9RtIjIGr0Pkj0XsKuw/s1YKfBWeKvyQiqs6FLkat6/5u
	6xo4wmjHmV5cutBvRrZKvvwRtJaD5rRh6vnLIJ75xWjbRfZiWZroj5V4+4JoePPruhqo
	HoJzmBRp+Mr156RSwgqsq+9UwggnLuJS7HJ13LSVKQUO8A2qZU/61JY74uOHEU/zpTaK
	ZUXw==
X-Gm-Message-State: AElRT7EI7v6RYwekl19DtfT8H5V2WGEdv0q93Uux8Mee4KVUE5hCSG0c
	QFXwJyfys6iTJvntkYS4716IDA==
X-Google-Smtp-Source: AIpwx48L8LFBHG/JZTJGutMj4Q1CwoLmiTLKC3ijLkqRXOTcb7bzIgoYvzZKDFwp3omB2gi32/XnvQ==
X-Received: by 2002:a17:902:d03:: with SMTP id
	3-v6mr41127674plu.245.1523319768146; 
	Mon, 09 Apr 2018 17:22:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:36 -0700
Message-Id: <1523319756-8431-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 10/10] usermode: also only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:47 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/usermode/usermode_1.111.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/usermode/usermode_1.111.bb b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
index 0f88040..3aea2e6 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.111.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.111.bb
@@ -27,4 +27,4 @@ inherit distro_features_check autotools gettext pkgconfig
 
 EXTRA_OEMAKE += "INSTALL='install -p'"
 
-REQUIRED_DISTRO_FEATURES = "pam"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
-- 
2.7.4


