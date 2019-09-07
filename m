Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2AAD37F4AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 17:31:26 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id s12so6588814pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l6prEJY7RU/CgnMZl6P+AqyL0+bK4FvubpGP+t8xqJo=;
	b=RtA7s084RVRqI43YZOraSO9/h4zht/fcPJUfkwairnfb3JeJxNh48exTZkvxcVDxHr
	6nQT1sL0QR2ncAmfUZk743LHrFnHaQFblJivBKQRHzpLLHjP6VMJ7yUE+WAgh/PYz8eF
	FthHNpxxHnpO2nHAvaH1bX+5tph2mRgXb1qi6wWyCWA/a0ZNZeJMR2UtVdDqnQ1ube41
	R0+PQq3LYBMCLxxBRRFspmVLDnkz5AgrOmcYGdSTPu7csAUBA0BKgpWj/EbSoelJBHxV
	dygLcRqkydCCqaZocb/lbc/6P5vzs6+LsLSbMnGyuZeLy/y7vaagq1UmXvAM4bHdVe+u
	uCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l6prEJY7RU/CgnMZl6P+AqyL0+bK4FvubpGP+t8xqJo=;
	b=MgU6DP5VbpLTM7lclgRSqBwMqmbSokuEL0Sx4/iQ9nGTZR+xF4QU+dN0NerasXsv/c
	YmeLOZFGEFzP/crh8H37B9U2yBJfcGQyQhc6v0EoBq9W21YnfgzVgaYye6JQx6kCD8GM
	jOr9p3fcv2PNupyGUTS8SenbDzZdTnfXh4QHGzXURuRZwpMgwCSCEmtvFzOIajFvv815
	A0/DaO0gURGdwsq08hqN8mXu3tvAhg8734ulLRUBWTzrHgXe6zo1FpuC/zNsrWLf/QbF
	Gn1VgobKPUb/+ToqZQN52WZcLYTi4uYZhlzGUno3fz6MtI4yVpr/5XLUqY7Ft5IWI3U5
	8kIQ==
X-Gm-Message-State: APjAAAVvmJWYHR3S2eq/4vKL58UiS8MpfKJqgtsQLUILKIFMEJuz4OAi
	0zS2ZHGz4JEYW9+83nYziyZEhkJ+b6A=
X-Google-Smtp-Source: APXvYqy2xqMXf9nBHw2sE/6L5JgJxd6wJsdb5wStHLRzmZFeX8BopmNLC2Wmh/jYxtqkd8QWIaPjKA==
X-Received: by 2002:a62:198b:: with SMTP id 133mr15635984pfz.257.1567877486802;
	Sat, 07 Sep 2019 10:31:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d10sm10812474pfh.8.2019.09.07.10.31.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 10:31:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 10:31:02 -0700
Message-Id: <20190907173102.35561-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907173102.35561-1-raj.khem@gmail.com>
References: <20190907173102.35561-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python3-cmd2: Add to blacklist
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
X-List-Received-Date: Sat, 07 Sep 2019 17:31:26 -0000
Content-Transfer-Encoding: 8bit

Its missing a rdep(python3-colorama), unless that recipe is added to
meta-python, its in blacklist and eventually it will be deleted before
zeus release if the rdep is still not submitted

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
index f5c5c7e1a3..594e93dcad 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
@@ -7,3 +7,4 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-wcwidth \
     "
+PNBLACKLIST[python3-cmd2] = "Nothing RPROVIDES 'python3-colorama' (but python3-cmd2_0.9.16.bb RDEPENDS on or otherwise requires it)"
-- 
2.23.0


