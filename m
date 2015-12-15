Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 596437319B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:37:58 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l126so8774325wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=M+nDPzX8W+qh/oLOgFkmyMjZphmgCeLWNKP01omtCyk=;
	b=NnuXEbJ5034WUJxzjuXCXf6Z6tcVBxBx4iEOBkbJHbCiEPtZgHC0Rl9Ah3rQDTDPqd
	SI95HxHVfm9IS6whb0dg/8qvKToqBi/Wsznsh/B9O8jMPTJ+fxx/Zm44t2CsMGY67dap
	sGzdE4aPSgP+kpudXZmRTw3gACBWKtwXQGy52hoWslx2ZhFrACuoweNsVxJcaWJrz2qP
	gVyX5Yb2cMvo6vrSyQuSpbU3TJX8xdZSRp9r5R670Wo40AOcyBVlYbEQbBzmhBRssnHJ
	iyrXFIBqPW5S+AFArpN4diILagcD16+MqiGuZjQDbLePKOcmXX4zbcaI0C6KEu9Yo9Zi
	azng==
X-Received: by 10.28.129.131 with SMTP id c125mr6634090wmd.21.1450208279403;
	Tue, 15 Dec 2015 11:37:59 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	a186sm4172944wmh.4.2015.12.15.11.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 11:37:57 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 12:37:45 -0700
Message-Id: <ddbd8a89999f2f5930d4486c38217246f22bb62c.1450208019.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
References: <cover.1450208019.git.chris_larson@mentor.com>
In-Reply-To: <cover.1450208019.git.chris_larson@mentor.com>
References: <cover.1450208019.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 1/3] oe: add python namespace package
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
X-List-Received-Date: Tue, 15 Dec 2015 19:37:59 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/lib/oe/__init__.py | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-oe/lib/oe/__init__.py

diff --git a/meta-oe/lib/oe/__init__.py b/meta-oe/lib/oe/__init__.py
new file mode 100644
index 0000000..3ad9513
--- /dev/null
+++ b/meta-oe/lib/oe/__init__.py
@@ -0,0 +1,2 @@
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
-- 
2.2.1


