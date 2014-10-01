Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3527165F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:34 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so436198wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=FXgzXeyoBrq/iVgaXdhPaUDioNe/UPe/I8SrV5vRpcQ=;
	b=hUJZXPt6A+TuAbx3XSPddppMXP1EcPqKrU9TOqQcITp19QyHKko8pZNBvIvsCwqAai
	6p2K0WAN1fYslrT/SCsB2CixLLBoY7lOGB/tJIGDPSEapp9q9y18t85SCKVFalREoXWB
	z9ivk/7GqytkEb+jWokPJwiQVMBZx8j+6dIn61xDk8qocsX59m+oTGdJXH5J4EdMUS3W
	V5Ep25djhh7DhPiY7yWR74aBEx/hEc0X2XHH4s6Esy8rZEHT7JEPeLHCZeuME0mX5iU0
	+xGxiab9FkATTZxIII92jZpGRIB5FfNBGwU11850FVSl5huD8Stk7J/BzfV+b6C1Opwc
	oPdw==
X-Received: by 10.180.19.230 with SMTP id i6mr12254122wie.48.1412151575624;
	Wed, 01 Oct 2014 01:19:35 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:12 +0200
Message-Id: <1412151555-19865-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 12/15] poppler: update to 0.26.5
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../poppler/{poppler_0.22.4.bb => poppler_0.26.5.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.22.4.bb => poppler_0.26.5.bb} (85%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb b/meta-oe/recipes-support/poppler/poppler_0.26.5.bb
similarity index 85%
rename from meta-oe/recipes-support/poppler/poppler_0.22.4.bb
rename to meta-oe/recipes-support/poppler/poppler_0.26.5.bb
index cfe9582..d119639 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.26.5.bb
@@ -3,10 +3,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = " \
-    http://poppler.freedesktop.org/${BP}.tar.gz \
+    http://poppler.freedesktop.org/${BP}.tar.xz \
 "
-SRC_URI[md5sum] = "49d55921ce795778c7231fe9f2fe923b"
-SRC_URI[sha256sum] = "4f438f34e63265e2da8427f3423f940ff41c26088922a9f5d976f795c1dce13b"
+SRC_URI[md5sum] = "786c943eee550e3a977c181e7778b1c8"
+SRC_URI[sha256sum] = "de7de5fa337431e5d1f372e8577b3707322f1dbc1dc28a70f2927476f134d1ee"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
1.8.3.1


