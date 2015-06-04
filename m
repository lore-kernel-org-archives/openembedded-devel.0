Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 25EB675829
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:38 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so47040702igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EASY5y3Sp10a0VnX3ZA8Jln1AJjzzqkEHE3/lzrkIiw=;
	b=pmtJPjWD7UleGIQkhKV8W5onK6BqcthVSPtLgLGNDm4B0wl0jTgTHEPluBRb3A1Vs8
	tDMzmYc6jAVg1XR3MGVHh2p4YAQZU7du8r0sjNsxAnBEvXCjd4FMJVFrmvEXxq02ThLS
	y8Ma2+IpEYekb/x4GnepowJx8E55CbeeIOltIuSerR4yxsv8v3s9zL7iv6wYZRj/KcWZ
	y9TN5Udsr0K2jiQ0JJLu5zcGTrmF0sRkqyKtZ+dW1dAIb1ZBlqNM6MDI7CbMpM4A0mEp
	uWKD1bHZ+ZJznOECs0t4SXXsUmjxQAACOXrDuuPb2U3cLAvg60YFPGlyi6/1SIHX+aH+
	Cx6w==
X-Received: by 10.50.30.197 with SMTP id u5mr36681701igh.9.1433445699371;
	Thu, 04 Jun 2015 12:21:39 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:04 -0700
Message-Id: <1433445666-7207-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 5/7] luajit: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:21:38 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index 48137e3..a11b771 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -25,8 +25,8 @@ EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
                 TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
                 TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
 EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
+EXTRA_OEMAKE_append_x86 = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
-EXTRA_OEMAKE_append_i586 = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_powerpc64 = ' HOST_CC="${BUILD_CC}"'
 EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
-- 
1.9.1


