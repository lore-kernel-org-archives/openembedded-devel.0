Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1FED9733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:18 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id x13so12906331wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=6f1eTZQ4PX3gGu5LFChekzauG9Lb5qWRJlrm3tGPYVs=;
	b=iC4t8lfK+KZNMRJjHr6nq+DrYe6AkZCya7rX5jys6w+gYlFh91eOO5m8JfvacZIBJx
	oilcthxejKAObyzofXAn9cq3BQpZ7x+MfSVB522cTATMO637wruE1d1T6dtyICCJ0+pu
	QRcx4pdkDtVj736HPVgAjqE7ozojyA7RewhQntcVyqAN9my+YkLRT6PDTl9XjDeY9o4G
	2ODDfRzkm+a1jz46fGrae4u2S+SapmSpW7zsyfhkzauKlVvEKmZU8sNkgcXeSgO1x3Qk
	ltvBslGo0Sp0lp/n8wvY1xrksPLeiWaFT07fFQyOjI1tP1zRLUUcWFFIupdcoOD5gkCJ
	yHlw==
X-Received: by 10.194.108.162 with SMTP id hl2mr12097342wjb.134.1423776139774; 
	Thu, 12 Feb 2015 13:22:19 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:45 +0100
Message-Id: <1423776119-14981-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/19] initial add xmessage 1.0.4
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kde-plasma startscript uses xmessage

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
new file mode 100644
index 0000000..9960706
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
@@ -0,0 +1,10 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "Display a message or query in a window"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73c7f696a728de728d7446cbca814cc5"
+
+DEPENDS += "libxaw"
+
+SRC_URI[md5sum] = "2dd5ae46fa18abc9331bc26250a25005"
+SRC_URI[sha256sum] = "bcdf4b461c439bb3ade6e1e41c47d6218b912da8e9396b7ad70856db2f95ab68"
-- 
1.9.3


