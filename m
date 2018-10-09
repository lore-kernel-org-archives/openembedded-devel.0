Return-Path: <yisooan@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 147DD7970B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 08:54:43 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id v133-v6so485963pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qLplYMmaTCzWLKhmczk+rnAgihLKyUXLFL2MoIN20Gc=;
	b=niBfVTdk+8qMN7qwSaSlu+Rs1hz8JkisBEK1XHE7hqPJWCxij1V56j5aOmIEbvA5aN
	bAolMCmCjWLSlrlXljmECgFLD2dmVLcks1HdmP0afpXgMvVIARnoyzsKQVpHe3fGivHZ
	kCpYsa53GkCOI+sVPc2uot0vPAl6ZCSSRRf87r9TwLntG3kxESIUkj6nPgXNJpOHOYwH
	+CGI0Qq64GmGOFpif79aiXwlVlMfvq/7s7HVv9en/vVbUtT2zLWg4NcTRr+IAPcV8cTE
	LBY1fpaP0QyHqA/fQavimYNUHNE1SwzjyBWmlYHyxnHyPNnj3C1JSv4tIdvvFM0YfhFM
	kskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qLplYMmaTCzWLKhmczk+rnAgihLKyUXLFL2MoIN20Gc=;
	b=JTPT9cEoAaidEickfz6zi0v+hnMyeaS2xjw/+bQ0Jnjp3vLLdizHEsQgan7vxCZfda
	LKURBHTIgIYFdeMQj9iL3kWqOe9WDVPl3wxiYnOeVruxagi9xQ6/9BtMgOrSWo+/Ewjc
	k5I9xa+ZHiQ5uhNNDaW4yiF0s6XHsijPlqXfyfplct422TxkEXhgh9dT8lFKUPoANSbL
	R6CEUgPh7icpe+voQzJoAmeh8DH0PD9YZ9LghQVH6ob1qVAZtNFoF8fdUA5HSv5NrfER
	jZxky3NeP3qfUK03YipcJGNZQOu7FU8dZ7gUdN4HjOVJyORBdxawP3pt469UZGXa9SLZ
	qkpA==
X-Gm-Message-State: ABuFfojZgQUrl35LqC8yl2mNzZINYWr4+0U1xTAz8JouKQTyJ3JBVrs+
	ISW6jG5vWBZ6q5OWJp36+1+jIvDD
X-Google-Smtp-Source: ACcGV603/WJofXnIi5qDd3nTR85ZQIDQqULUd+0Oy7Oj3kP10AiTIh3dwAutSQFbY1rjChBa+hGsVg==
X-Received: by 2002:a62:1b45:: with SMTP id
	b66-v6mr29026580pfb.94.1539075284694; 
	Tue, 09 Oct 2018 01:54:44 -0700 (PDT)
Received: from localhost.localdomain ([221.158.206.146])
	by smtp.gmail.com with ESMTPSA id
	n79-v6sm43298487pfk.19.2018.10.09.01.54.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Oct 2018 01:54:43 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 17:54:25 +0900
Message-Id: <20181009085425.18140-2-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181009085425.18140-1-yisooan@gmail.com>
References: <20181009085425.18140-1-yisooan@gmail.com>
Subject: [meta-networking][PATCH 2/2] babeld: Fix build fail on LICENCE
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
X-List-Received-Date: Tue, 09 Oct 2018 08:54:44 -0000

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 .../0001-Rename-LICENCE-to-LICENSE.patch      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch

diff --git a/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch b/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
new file mode 100644
index 000000000..de374ad69
--- /dev/null
+++ b/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
@@ -0,0 +1,24 @@
+From f58103fc6da9a96c11b653eafd4c2ea7eab7ee68 Mon Sep 17 00:00:00 2001
+From: Yi-Soo An <yisooan@gmail.com>
+Date: Tue, 9 Oct 2018 16:24:32 +0900
+Subject: [PATCH] Rename LICENCE to LICENSE
+
+Although LICENCE is grammatically correct, the recipe requires
+only LICENSE file. If the name does not match LICENSE, it fails
+to build.
+
+To fix it, it renames to LICENSE.
+
+Signed-off-by: Yi-Soo An <yisooan@gmail.com>
+---
+ LICENCE => LICENSE | 0
+ 1 file changed, 0 insertions(+), 0 deletions(-)
+ rename LICENCE => LICENSE (100%)
+
+diff --git a/LICENCE b/LICENSE
+similarity index 100%
+rename from LICENCE
+rename to LICENSE
+-- 
+2.17.1
+
-- 
2.17.1


