Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3EB66078E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:53 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id s29so694466lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=J5D0PxyzGG8iRncQef8rVK9rI/zJZDIf4dWWfGmSvpE=;
	b=rKgQc1vcvfEkXiSlPR5JTxtsTTf1Mh1GB7pFfv5lyD7E3WPeES2lGDqSaVpESkPdGK
	YnRZiAyftu+0YotWD3RCNpJ5SRPyioIXRRxTNJNIH8a9GAALH1hbUiYt9nDXamvDkmsG
	uhnpbeyAfOJpH+aR0fQqr8YZcjcrIlmeh8aAbnweuz8nMQlxr18MwJFsQS/Tp/vK+PMc
	9pW4fNlh56li9p/VJjVqMsQ/ojODkuKny0yG4ulLf9ZmEgx6WjG9QtW7U5pc23N4Zuwf
	wslObDNUOHQPrXC93DPRa7wb1otr4pHxfJAzd9sEKn5OOR0obUxWrTrwRqwWOqmLqfMw
	Cf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J5D0PxyzGG8iRncQef8rVK9rI/zJZDIf4dWWfGmSvpE=;
	b=KD4ztf7km7n+dHUnO/XBpFulyEIbte+/FAyMs08Jpi6FZvOIQAvhF+yUuprgcaNopA
	9BPKKH9G0dvjyZ/hP9+sddM6PtL609kNxffrQvJ3D9taSuDjHFM291r9ZTT/rkhRXmsx
	WjG+g0heW36XwGED32ijBKlz0R7p7VM3s+l87wnwTd8myonUFFlre0sBSCZL+zdikYyL
	ddpRSZbK2iFQORWPb4oRZtu+uSqAAVBg8D8JfiPdgVlr93RJTCzBNMFtinUHsxB2SKgh
	jMsPUa54C5saN+W/ekKNOsS2XpaD6C4xOd7TsdiTjtvHhxMbZ0bR0QLlkcL4aRuSEr7e
	GRvA==
X-Gm-Message-State: AE9vXwPBehKSLUwY379Fo57FCY3gpbvJiW9mc/Tk9K+F1PN2uWSazOx1+XP3cJ2BEtYIOg==
X-Received: by 10.194.109.229 with SMTP id hv5mr24959563wjb.131.1474955753961; 
	Mon, 26 Sep 2016 22:55:53 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:29 +0200
Message-Id: <1474955733-30185-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] xfce4-calculator-plugin: update to 0.6.0
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* License checksum change was caused by FSF address change
* add gtk-icon-cache to inherit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../calculator/xfce4-calculator-plugin_0.5.1.bb                  | 9 ---------
 .../calculator/xfce4-calculator-plugin_0.6.0.bb                  | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb
deleted file mode 100644
index cb1fa5e..0000000
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "A calculator plugin for the Xfce panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-calculator-plugin"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-SRC_URI[md5sum] = "8d7bf07a669a2884a409a7b03f89be5c"
-SRC_URI[sha256sum] = "7dcb04a3da7b85cb1f35f546c366fe8529f1c15f1c8c290edb91d16c07f5fd6d"
diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb
new file mode 100644
index 0000000..de0d0a0
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A calculator plugin for the Xfce panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-calculator-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
+
+inherit xfce-panel-plugin gtk-icon-cache
+
+SRC_URI[md5sum] = "1b956a89693d039a61b4725cefb23a4d"
+SRC_URI[sha256sum] = "eb51765580ea4650f9cf062382a820fb6483ee5dbe003aeb6f063929e299f9c2"
-- 
2.5.5


