Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 044386FF23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 23:26:17 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so7624706wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kUmWi0yaQQ8fiLfyNuQ0kd06HruIouwrGATb/fhaJjY=;
	b=ZRr0iBs9n3paRB0RHAgNUQJ92E0Dhr6MuvQN3h+Ba/KaHIQfIlJfyqy0cV7lGVnglp
	OJ3n490LAVz+yn+zLCYQooJYnobmqdbhQTYrGkUPFv0xMbL0pULulYQNFHpcWU8aO10L
	jkyaZF3Y2u4p0zt1TQxyDtCN4GL+mHO687fo28wf4S6qnVIw8/QA3DWQhztGBLRRPwEK
	VOaQPvsqlBxE89e/+Mr0qHoS0cQWbyxbarqonb+ZlvDSPYaqrYLSUFA2yEcgrBw95qQo
	lKf5joL0doiATWjbSbIrzgxkt7bgB7LCzgXWPD534AizB+wDCKe1rQPlDhhlKlqux89I
	tkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kUmWi0yaQQ8fiLfyNuQ0kd06HruIouwrGATb/fhaJjY=;
	b=QSAaUrr/gRfrH7/r2ip2oseGS6m/dmCmZP9mBNikEndWllL862kOg6cjT+nuMoOEQB
	n8mvkUjOP8P7LrHWys58MXQQdGbgqj90coGB8026sHxhwxdWMVYTeGShNUbrtvacPnnT
	U0oVEGX8fDR2mn+OuSztxrFpHlU4nUNcWk3yRxS3wNGsvskL7QfeUOfj6y5vTexohbiL
	fXpEFwW74apsln8oLZr1Pp6Z3q1N0mEHzjP2EohbRL3A5dAScND3sHDDizcoawmYXAnq
	dNojq24S7r+JXJUWPbBawZhfDNSYsQ71CRhArylVoowsdRasnTM3ssXUG466ExcbwF7a
	NqCw==
X-Gm-Message-State: AD7BkJKAn3jlXmX7ppQyXtXDvmYkoKkh5aUS5wEoa+MDnMJtHrpvNrWNLLuoynGiiAsOFg==
X-Received: by 10.194.58.12 with SMTP id m12mr7103856wjq.22.1457652378294;
	Thu, 10 Mar 2016 15:26:18 -0800 (PST)
Received: from localhost.localdomain (p4FDF0B8D.dip0.t-ipconnect.de.
	[79.223.11.141]) by smtp.googlemail.com with ESMTPSA id
	e19sm390869wmd.1.2016.03.10.15.26.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 15:26:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2016 00:26:00 +0100
Message-Id: <1457652361-912-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] xfce4-verve-plugin: initial add 1.1.0
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
X-List-Received-Date: Thu, 10 Mar 2016 23:26:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
new file mode 100644
index 0000000..65503a4
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Verve panel plugin is a comfortable command line plugin for the Xfce panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-verve-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "ddd0190ae56f6117dbcf9ff2bf5a8cbf"
+SRC_URI[sha256sum] = "a3196f818c7ad57d19cd6581e168fd2b9f96de070246aea70c35ce2e5f9d9c84"
-- 
2.5.0


