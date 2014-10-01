Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 33C027162B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:24 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so624122wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=kv+FGkfp5fapj1jK0Ga5puDU5cGAUrGUIaE8cw8Dr18=;
	b=USJnoZRpOhul8/jtFzZpCcCZ2JBcEIN3IfcTZV/ml/duuTfWoidxRFVmH9BXSZBJlW
	928omOnEygpzatcUDCT8/HrziTuwOw9kQLPLTH4CcsMpuY3B3KQUSKbTJSl444IEWIEy
	rvxROdhClCklgFlNivLtQGon+3LsV8it38gyzfroDqG1cczDyLUnQYlC7U1Vaj2s3mFf
	/XdLzQc8rKiGguTSLqp2Tp8Dx2ViMiJsdOM+XBcxvyybGBX31dymKZTS32vXDobiQ/qH
	/WtutnlJT2bcsSbeoC3ZhQqc0U9kk+aNhQis/kuykm64SqspuJVsPK4EuRKzmPU+IEYY
	+wrw==
X-Received: by 10.180.79.34 with SMTP id g2mr12056056wix.10.1412151565306;
	Wed, 01 Oct 2014 01:19:25 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:02 +0200
Message-Id: <1412151555-19865-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 02/15] libsecret: initial add 0.18
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb

diff --git a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
new file mode 100644
index 0000000..dca3350
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
@@ -0,0 +1,14 @@
+SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
+
+inherit gnomebase gtk-doc
+
+DEPENDS = "glib-2.0 libgcrypt"
+
+GNOME_COMPRESS_TYPE = "xz"
+
+EXTRA_OECONF += "--disable-manpages"
+
+SRC_URI[archive.md5sum] = "279d723cd005e80d1d304f74a3488acc"
+SRC_URI[archive.sha256sum] = "0c73aa762dbd1e38ba7b03de350e23ce818cb810b0784375e95ef61e004b02e3"
-- 
1.8.3.1


