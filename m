Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8051B6AD3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:49 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so3400519eaf.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=pwpkqflVQZ3wRC7hAjDA4ZDbzNeCrjFKgkJwrV1tyn0=;
	b=XZnCHuBUNYMUCi6mGSZqO/QHmwldqkVPXPwgzWkyXFV4W1AvKitUHimU3IHKh3Yi6x
	irmH9m08qlCfexR1JKKKQfDPFr7oLL0mFMnbd7vj1CwfeaUKZCGKtUK9+3VwGoCvcbI2
	tRbIhMUlkaaZysko2YMX8M/qyVMS8GjPYonzuXrCVbqJDU7aNnQPIfTuR+rDycMRfY9V
	8fj+0icIPJNNjg1L5xsvGdXP2AvTuP2O3tVRegVc1vuvEp08JtmtROpFSk6vu8cc9NJD
	kpSVba2vmKdZ9fDdJkE3I05PcfrRZ43pNW52tFwqyuucVCM/OY8Kx2jIZar7hQzXtkmt
	2pUA==
X-Received: by 10.14.111.7 with SMTP id v7mr3629340eeg.84.1371662989353;
	Wed, 19 Jun 2013 10:29:49 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:13 +0200
Message-Id: <1371662967-31734-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 06/20] atkmm: add glibmm to DEPENDS
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error was:
| configure:15671: error: Package requirements (atk >= 1.12 glibmm-2.4 >= 2.36) were not met:
|
| No package 'glibmm-2.4' found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
index 35ba589..12522f2 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "atk"
+DEPENDS = "atk glibmm"
 
 inherit gnome autotools pkgconfig
 
-- 
1.7.4.4


