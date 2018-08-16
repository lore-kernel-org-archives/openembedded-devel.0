Return-Path: <ashie@clear-code.com>
X-Greylist: delayed 459 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Aug 2018 05:21:19 UTC
Received: from mail.clear-code.com (mail.clear-code.com [153.126.206.245])
	by mail.openembedded.org (Postfix) with ESMTP id 53BB378FD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 05:21:19 +0000 (UTC)
Received: from skull.flets-east.jp (212.42.138.58.dy.bbexcite.jp
	[58.138.42.212])
	by mail.clear-code.com (Postfix) with ESMTPSA id 1E767D519B;
	Thu, 16 Aug 2018 14:13:40 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.clear-code.com 1E767D519B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clear-code.com;
	s=default; t=1534396420;
	bh=sTJsGt2U3iW5X3dJ+kdLcoS+rYQXD6TYEdcluuxKvs8=;
	h=From:To:Cc:Subject:Date:From;
	b=v+AHNUlHbYbMX7QmxdtkNHVQGf/MWPxiXoRf3gArFYhb+hOOSi/K+yMk4X8V/C+Sv
	Lj1hYLDUBxuYl+4txMMB4ZDJumH62DEn05cuwZhUxDDH1RktW2UhPsWVkcRcRCvkro
	eSL7y+apDIa2GPrFIzn0BgBmw+a6OEtd60Z27+Kc=
From: Takuro Ashie <ashie@clear-code.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 14:12:57 +0900
Message-Id: <20180816051257.4465-1-ashie@clear-code.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] uim: Fix SRC_URI
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
X-List-Received-Date: Thu, 16 Aug 2018 05:21:19 -0000

The place of uim archives has been moved to
https://github.com/uim/uim/releases

Signed-off-by: Takuro Ashie <ashie@clear-code.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index af28895ee..1c58d40b1 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
 SECTION = "inputmethods"
 
-SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2"
+SRC_URI = "https://github.com/uim/uim/releases/download/uim-${PV}/uim-${PV}.tar.bz2"
 
 SRC_URI_append_class-target = " file://uim-module-manager.patch \
     file://0001-fix-bug-for-cross-compile.patch \
-- 
2.17.1


