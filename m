Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C631E60703
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 05:43:37 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so1169634wgg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 22:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N0H94x1Ek95/FdalBu/jYgsBbTLRTv3JKMoodn0yBbw=;
	b=J20sgtJMjddZhYdLO0/T73IdENa1d9uk6P9SGh4t9sGIgp5vUlN4VjBmf5Ql3jyPQT
	OtDAAfIYbL30RNtMyOEaxFeGxEQf4W1so6MSaeFoFPWR2oR/8/kDjZTdThVxuX8GdGIw
	NHsdDonYkRy9rU6ftmR2ok3wpJYpKrCDeOLeTl2r0bZzp+ixYUQa5DsErHBeaJLFAN0M
	t68wTS1h6vVlal20tJdky6PF2vrI2PltmD7Kq9hnkzvH4QL3FaeS1+ajaDCdBg2UbC+U
	iSOnAcZ6ROvHh8bgttu+eqcLt08Nb9D7MNKLrHmUgGxk/IGBZNorr1DDjtN56DCMMSAY
	GHFg==
X-Gm-Message-State: ALoCoQkBl3BseaDVBP6KqJvpbsflfWYtjfOssCSFr/xQGGo4gxsbKpNVzSk7qf1TiSmmmsamPslp
X-Received: by 10.180.77.165 with SMTP id t5mr1853603wiw.38.1398836616142;
	Tue, 29 Apr 2014 22:43:36 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	cv4sm34451893wjc.34.2014.04.29.22.43.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 22:43:35 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 07:43:32 +0200
Message-Id: <1398836612-24774-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] libmcrypt: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 30 Apr 2014 05:43:40 -0000

do_configure fails without it.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
index 2e5f07f..2a133c6 100644
--- a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
@@ -9,4 +9,4 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.
 SRC_URI[md5sum] = "0821830d930a86a5c69110837c55b7da"
 SRC_URI[sha256sum] = "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e"
 
-inherit autotools gettext binconfig
+inherit autotools-brokensep gettext binconfig
-- 
1.9.0


