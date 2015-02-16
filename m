Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id BA80C73572
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:55 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id l15so28327068wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nJ9bh8TprEJ01D20B7cEF77juZSRwm6RN+oPKNoABZ8=;
	b=l350Q0FgnbLkzCazgMGCPLsgI5Zddtg6xJXN4XSp13JvmjfPO0KKUprSUh5sSC3GbQ
	kM4mbqUaETzo3sxp0qJufz6hBw142IQBWclo7R51JhgoCSMFQ+j2iY/XdwmyYX1Z49+/
	jN9wSuD9d+pJRHDJ1cTgnrWxTHjkh89JghvnC0FF6FNf2Y/hTWkRInoQTgFnMn5q7e0C
	CEKWds2WCU/0PHwXmUBiLHh5N966AlUBhWt755j2S84vM+LqAuEtfzs6H4UQnY2t/8PG
	acL4TPX4+un91AuSVHRb1ALVR23k708jQZJKHu6pudhx7PlZWbkZlBJLev8R1gNW2eA0
	h0YQ==
X-Received: by 10.194.142.205 with SMTP id ry13mr56103888wjb.73.1424123756413; 
	Mon, 16 Feb 2015 13:55:56 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:54 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:33 +0100
Message-Id: <1424123733-16696-7-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 6/7] adding a README.nonworking
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
X-List-Received-Date: Mon, 16 Feb 2015 21:55:56 -0000

While testing commit 'java-library: inherit allarch' I found some recipes
throwing errors in do_compile.
Document this in README.nonworking.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 README.nonworking | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 README.nonworking

diff --git a/README.nonworking b/README.nonworking
new file mode 100644
index 0000000..11ecaeb
--- /dev/null
+++ b/README.nonworking
@@ -0,0 +1,6 @@
+At least the following recipes are currently not working:
+
+The recipes jaxme and xom currently don't build with compiler errors.
+
+jaxen, dom4j, commons-jxpath, jdom, commons-configuration depend directly
+or indirectly on jaxme and/or xom and thus are unbildable.
-- 
1.9.3


