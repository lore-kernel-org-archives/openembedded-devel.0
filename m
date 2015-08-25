Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE7376ABD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:04 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so3844014wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MuXyKzQQHgXrBDQo9j+JewWvybZEMRviKMcIewGw+xQ=;
	b=gUM3IkeLjOzQCPgrUAWa5+5VTq4UVh8bs7CFLM5uO4CUUKTMShGuXQEFMo5e3eAyi8
	Wdq/IR1s9bW4LbQAPshjn9WTunj3Gz8rD6HW7k/YR9LsULS3oY41SSDcW8g2cJ2Lg9gL
	rhd8XUzTdmeDiqo8j/D8NOWmw8ZcDj4y6j0mxYsv8tycr0ptBLCg3Pw5grBb0xNWBKXW
	lQc56e9QNQqHn3RnBqnaRkKRq4hFc9GaWKjfeYCbgSvCOrqIAlz1+I+iaLtthKG9Liu3
	xYMEwWHt57BuG15gly8io5MTmHWuGQWxrpzX2eQvyTmowr1bEz08BRVsm9HNNghA9y6t
	R0DQ==
X-Received: by 10.194.86.161 with SMTP id q1mr47494192wjz.18.1440481264586;
	Mon, 24 Aug 2015 22:41:04 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:48 +0200
Message-Id: <1440481251-22440-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] packagegroup-xfce-extended: add xfce-dusk-gtk3
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
X-List-Received-Date: Tue, 25 Aug 2015 05:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index fc8ac8d..04934eb 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -18,6 +18,8 @@ RRECOMMENDS_${PN} = " \
     xfwm4-theme-kokodi \
     xfwm4-theme-moheli \
     \
+    xfce-dusk-gtk3 \
+    \
     xfce4-cpufreq-plugin \
     xfce4-cpugraph-plugin \
     xfce4-datetime-plugin \
-- 
2.1.0


