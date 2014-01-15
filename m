Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 910586E720
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:37:21 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so1654018wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BmIgepbqA83UQccvRNKCJy1HtiEEYFgxkKjxf1XpR7I=;
	b=lzV3IAUn2PDA/WswK4MrnKjVhju/X4PxdCDD4/rkytOSMCqKkkPc49Wyxe1tJ3VRUK
	NeQuIN39iWjCKrhT31a9mGXL51AAfC626buJsS+JCFA+WRv1RtICi6GHSNV85VIxJm20
	JiOgsK3wDZivKzJRP0REZjPSu9zPkSPnlaY4jg7hw/qWoFTpieMFV74erqUpJT9HC/ew
	1CuFpTkVBOa1OcYhBU6GNv0auYj2dP7CivOjBDgditDxbokHOvpJCLZTmCMgAkZb17en
	mxeBfo1IK9fWScxzUFy4ymIMgaf5wB9jhphfmEwkYtJKtX80IxL14zl4l8gPIFPzdQbH
	ap1g==
X-Gm-Message-State: ALoCoQmhMEftVOoaZmPvrvMLLz2BGRGCMC57kB9Abfi11OGq1/rYoAUBn1lxy2Is8a6GzLaM4jyl
X-Received: by 10.194.142.174 with SMTP id rx14mr1711412wjb.45.1389785842310; 
	Wed, 15 Jan 2014 03:37:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ea4sm9087026wib.7.2014.01.15.03.37.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 03:37:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:37:12 +0000
Message-Id: <1389785832-3120-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
Subject: [meta-oe][PATCH 5/5] libsyncml: move build dependencies from RRECOMMENDS to DEPENDS
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
X-List-Received-Date: Wed, 15 Jan 2014 11:37:22 -0000

Putting build dependencies into RRECOMMENDS isn't going to work, so move them to
DEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
index 9cf9243..8053eda 100644
--- a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
+++ b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
@@ -4,8 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 
-DEPENDS = "libxml2 glib-2.0"
-RRECOMMENDS_${PN} = "wbxml2 openobex libsoup-2.4"
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4 openobex wbxml2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libsyncml/libsyncml-${PV}.tar.gz"
 SRC_URI[md5sum] = "84879ed7cb94618530fbcb801a1a4f95"
-- 
1.7.10.4


