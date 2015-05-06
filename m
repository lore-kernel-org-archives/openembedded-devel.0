Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2548C73EED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:24 +0000 (UTC)
Received: by wiun10 with SMTP id n10so28426171wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=szJmT2UvzXimxInQo7LJ6KQM0f1Sl9As8cPUL8RYDdk=;
	b=xlnDFhhhT5/ksrFQUc3Kz++2Zvhs/JaBsFV6GJMW2tV7YCrOWWpqw7ZtVUzVoddc+D
	laJXJQBFkWbjak/ZN7DQsOT2wg69/tfTz52f2rY0qM8RFHmUH24/PCWxLtqBy4Te9fvX
	z2lHjJQLdgG5wcfDvwL9xbY9mr34Ye8qbWN8HZ3N3uTILWYh0XPmby1M0Msc9b71s07U
	yevLtBLdnIk4c9tAC3x8I3C0ZD6tqLSvI+9Omk57wt+akwAdiIT2u9IRGWA1JIT9SBuy
	WzXmLKLNqLa+SOYsWERv5JU3gfA6iKMxfFvkItjMlK450/y5/rqWube7TZUsMFieYl7w
	T5RQ==
X-Received: by 10.180.99.42 with SMTP id en10mr6428490wib.83.1430928685647;
	Wed, 06 May 2015 09:11:25 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:43 +0200
Message-Id: <1430928646-2007-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] xfce4-smartbookmark-plugin: initial add 0.4.6
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
X-List-Received-Date: Wed, 06 May 2015 16:11:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb            | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb
new file mode 100644
index 0000000..3f47f06
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.4.6.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Panel plugin allowing to send requests directly to browser"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "01b7735d4d9ab0150d4ddd3becb94d5f"
+SRC_URI[sha256sum] = "3bed2b322cd39ce5845d6da07938c702260f3f1a9700b690ef377fba752ba24f"
-- 
1.9.3


