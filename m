Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 737B6716D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:49 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so319964wid.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=U6U41PKiRw/JzkPnFTH5fluPF/bglUZV7E0EbavTzRo=;
	b=EUk/4sVnjpjX6UbDqyyiCD0OewvD+HtV4GP1bM2/BJn52x1sS0m2Q7dzsS5QN79qM/
	ijOcQ/YAgRBpMA7LdCPhlhArwzI+jlDgJGBYu3NGleIxf8q6eMfuTvoSH9OlFqos6O74
	oQOFc5KK2YB33PLb8/jlv4Hyqx8TVEDKxVcMMd9QFt28amg7ylM7hSwji7OHzLLjpZR6
	s41lwinHY/B3OHLakhMimlqB1nan6dJ679hseCyecna8arR6kKXv7W81/Zw68uKpFn1d
	NzLdi1Wt0xyCUaO8zTembXU9r1OZhjRGAaN/KVX9TIvqEhyJTOFuOWqBZygES3RCCZjz
	WoAQ==
X-Received: by 10.194.110.104 with SMTP id hz8mr7938453wjb.62.1413324889985;
	Tue, 14 Oct 2014 15:14:49 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:23 +0200
Message-Id: <1413324868-11856-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/15] xfce4-mailwatch-plugin: initial add 1.2.0
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mailwatch/xfce4-mailwatch-plugin_1.2.0.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
new file mode 100644
index 0000000..00859a1
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "gnutls libgcrypt"
+
+SRC_URI[md5sum] = "7263114ec0f2987a3aff15afeeb45577"
+SRC_URI[sha256sum] = "624acc8229a8593c0dfeb28f883f4958119a715cc81cecdbaf29efc8ab1edcad"
-- 
1.8.3.1


