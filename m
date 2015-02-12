Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 68ED7733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:12 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so7579673wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=3ib3AwWrCPcmfgsn5n70kclvK+kzLMwIgvHUhbbXmrM=;
	b=bb57eAktc1Yuj2EmvVeb4JhhXGaICgrO9/IcoBUNscaeBQzzAOAI9sYkblnNtM2MWG
	srk37YoUrLb9NZTdXgydJKwfcSL0l3hdMWken0oljnIujbIcEplUKcgdusnDFKPy4bm9
	Ub1nWA6ziU5n8yW/yfxfBI18xz2wLfIgCNqDzMvBs2VdSiRv5pPF7TLKPSc3hDa2wr5t
	m8/75nY99VdB6C+wPtJ9nUGNnt0NHDLoAPOOe3em8TiOUznzGMPgjRub9/CGFjyONgu/
	nKtSJkNw3f+RP0SirBWfnLfyvPtOhMelt3QnKFvP0EUj43sVGHOnEchllUO8eG4PAYCx
	PT9A==
X-Received: by 10.194.58.174 with SMTP id s14mr12298401wjq.54.1423776133541;
	Thu, 12 Feb 2015 13:22:13 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:41 +0100
Message-Id: <1423776119-14981-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/19] libmbim: initial add 1.12.2
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
new file mode 100644
index 0000000..17cfba2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "libmbim is a glib-based library for talking to WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libmbim/"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+DEPENDS = "glib-2.0 udev"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "921fb5ab3f13f1e00833e009d8f3b4f6"
+SRC_URI[sha256sum] = "949351d3e3d69b81e40a49f1d187944c26149e0647a415f0227ccdc112047b29"
-- 
1.9.3


