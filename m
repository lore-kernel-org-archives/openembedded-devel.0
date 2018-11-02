Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10B8279F19
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 03:06:44 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id y73-v6so1423575itc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tt/UkXw8GIWyBsuBvEEsDjPBnxejNexJHmYxTYE2LSw=;
	b=O0pnfSpxNMsRsEfRrb+qBK8b3X8/tWk8FR7aZPIeJGCCxDsmyeHM2p8LOv9g5onpmT
	c/1U5b6t4SvHhq4q3oVp2PPphxLYqVkmndfCIfIKAPNzD8IYMx/c9+v6YGWSiP96fLfz
	PJ5xAebvBTLqZdXnvg/CRfgS/k5aO0XSlxQlP+tZQk4rGmaPX1mB+zd+6L0N+2odVSnA
	WX0n6Z+MugHqVHJ1OnB42g1aIINobXdIYFJFGtN6KDdbegQo/5xoLQXOdkC5tOpC8BI+
	Ix8z8e9dYcEJ5WZda148XnR1ACIpz4/ZMmNlMTwGOGXUS+i3VsdHU+IkpwhhRDOuf4rZ
	gDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tt/UkXw8GIWyBsuBvEEsDjPBnxejNexJHmYxTYE2LSw=;
	b=AM6iznutN5lJWXt9JOj3io2XheVPCHCB4bIxp6FAcIoD3fNRzR8UPivGPKn7TIkUXG
	qzivbGPdIydprguI2/cu989SQhN7ibAR2zQkWfEaJiN7vkJO6CiaN8/IhXdA9NKjremi
	5Hx3bp9D7yGsRY0sPb+xM2hyffxLmZYkaU3d6toRhPq/+n9RxoMTMvI9mD5KAve/l7y0
	VumqxNwqYOGLiQ6+q5yIAfmETHn5kVLwiN9M65AfVKnnxiYIg1ydkFDtdyhxxTjGciRu
	bBaJnxBAu5A8rXbDYgvLmq0SqaQIaNvpYqzvC4iSrNxlFyuneejBqijYnutVnFaITz0o
	NKpw==
X-Gm-Message-State: AGRZ1gIWtv9SzSEbsei7tiq0c5eNqPV3QHHhZMlsuE0mwR8+ZEAqeFmJ
	qslXM15nD4ypOGrSXV97weKqgXTm
X-Google-Smtp-Source: AJdET5e48Jp7MsiZpLwkzVg445k41W5MXNq4RgplFilVUIFiBgTH0tBqfJjCU27AvEQkNAL7I5Rf7g==
X-Received: by 2002:a24:e906:: with SMTP id f6-v6mr3540563ith.50.1541128005581;
	Thu, 01 Nov 2018 20:06:45 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	y22-v6sm10984012iob.79.2018.11.01.20.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 20:06:44 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Nov 2018 22:06:28 -0500
Message-Id: <20181102030628.8755-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181023160510.19604-1-JPEWhacker@gmail.com>
References: <20181023160510.19604-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][master][sumo][PATCH v2] rapidjson: Allow empty package
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
X-List-Received-Date: Fri, 02 Nov 2018 03:06:45 -0000
Content-Transfer-Encoding: 8bit

Causes the empty base package to be created so that RapidJSON can be
sanely included in an SDK via IMAGE_INSTALL, RDEPENDS, and the like.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index cd18149504..c90eab043b 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -18,6 +18,6 @@ EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJ
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-RDEPENDS_${PN}-dev = ""
+ALLOW_EMPTY_${PN} = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


