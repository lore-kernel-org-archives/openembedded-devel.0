Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 02EFF727F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:35 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so7477916qge.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=TkYsFug50gHIzLWpa6NA0a1v0NLGCY+7IluL7jg14bA=;
	b=LwyCyegmhbPzmmYUl9PpRtlgHEg31vOa/ano9ANWLcffLB+DtwgREtZ/QYWH92KZZA
	tvdfMutLyahOeX8xVAw0RTo/8WuS5sLCa4+tTlf4WAB9rqZKJY+cQpb7s6v/TqJfCF3H
	rQ3S8Rt1FOAHxnNPhG+Pe9CNnOJP70AAiI5ySXZUhHZu4EwKNzlMDrtQmck9mjH75gm9
	DrXFaV11b6CauU7cj9q8JgS9tqwO6jKWecURuVc4og652F6Btjbbyl72+9LoPjzuL1L6
	c9gv3EUi/z0MBpavxJ9pIxz9A2IbcLtqVJCRohhjjOwx/GkdiHFrJ1Y5xuvzqnMTPmcH
	kCQg==
X-Received: by 10.140.37.115 with SMTP id q106mr10332809qgq.38.1419621696211; 
	Fri, 26 Dec 2014 11:21:36 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:32 -0200
Message-Id: <1419621700-1102-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 04/12] soft66: Fix license format QA error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Dec 2014 19:21:39 -0000

Fix the following QA error:

,----
| WARNING: Recipe soft66, LICENSE (GPLv3 LGPLv3+) has invalid format,
|     LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/soft66/soft66_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
index 33ca2b5..b649526 100644
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library and tools for Soft66ADD and related SDR radio receivers"
-LICENSE = "GPLv3 LGPLv3+"
+LICENSE = "GPLv3 & LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 "
 
-- 
2.1.3


