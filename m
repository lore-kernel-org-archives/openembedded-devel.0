Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id A09C5732DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:11 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k48so14714791wev.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=y8LoJuEx9VjfIMtjwQ99Er9GzRqAr2en8fD5hots40I=;
	b=p2dVaPsBu9wrwvA2MydP6+nNaMAKCZyU9S+y9jlhnqUjIc0F1ZjMydOksTdkwG1o4C
	7Z/BFmrdPVCPo0u7RdrDIw6h8NNI/ZIIqkeZjTmzR3G3yvx/HMJwIFBVF1LQO8U/BCdo
	fOjy9L59yHGI/SlerCXU3tCKpfQxc9VkpqESMRxzPYC3jONO4z/rFSCVCvl9Ix6j1+Sj
	y7/XnCfnhGbJfmA0dFxtAvIMkq7CLutf7fgquMIDCUj181vzZFjF6qFlZn2Lx9Hbwnv9
	ynbVipErSH4uTZcShIUoi9ibCJG/6eb8dbhTdZpd8ouLwM9UhEfkxEPMV6Dgxwfmudy9
	zmeA==
X-Received: by 10.194.118.198 with SMTP id ko6mr14784642wjb.47.1423810932091; 
	Thu, 12 Feb 2015 23:02:12 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:41 +0100
Message-Id: <1423810919-9857-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 01/19] libmbim: initial add 1.12.2
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
new file mode 100644
index 0000000..4364bb0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "libmbim is library for talking to WWAN devices by MBIM protocol"
+DESCRIPTION = "libmbim is a glib-based library for talking to WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol"
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


