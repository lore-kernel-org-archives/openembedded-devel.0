Return-Path: <jsbronder@cold-front.org>
X-Greylist: delayed 397 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Feb 2018 20:22:46 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id DCF527871C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:22:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BE6D220F5F;
	Mon, 26 Feb 2018 15:16:12 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Mon, 26 Feb 2018 15:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=PlugUNc0lZie1I
	21zjBg4Uc5q3AEYkllrMxGM5Oo22k=; b=WpcRGHLkHI6TgZf7cE1m/zdQxNKOc1
	tA509xQHABzREdmfCzc1q7hMNtmLgO8Dwn01qexPDdWggrxmyW7HRB5EuPgXu5sp
	CpKDFEy9UbyfDqTPN17R4l8ayVkc3XgsW0IYjFN5zYCvk0qSIdeTuimTDxi83VbD
	xLJBszNiMkpDc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=PlugUNc0lZie1I21zjBg4Uc5q3AEYkllrMxGM5Oo22k=; b=hgdUNpk6
	3GVpVAIEBJ1Yt8QF8fBKMv1vq7pxFPXAhb6H8v6hahjb+l7qY3NTUQoVhYHuVQj5
	jdoV+J92LfhFjm20/wQwox+c2ty0fWc/a/j/xhf9MkNggjGFje05GX16AJbXaZON
	WXOS/MFs02UQP7eqAWxyaoMCbIlw4gJuR7EjOAiemOB8tM/hHMdA3StgfBZ0RPPB
	4EwvRWpKfluOBbkmsC2xMl8YmbYSV2tOnRh/YgfikqeS3Zpq3bxGCh67ZX6bNr02
	4cAChOCSpMJEXXG2fB5Btt/9tvGK1o99HmsXWSt0uYdqiVeHSYhXyUaBFQBAOmbE
	X99WYsbphmqzMw==
X-ME-Sender: <xms:DGuUWi2aVxOuRE7jP1xwXlZOrqDI40FLZPX2tLIbeD6dYakvJ-_26Q>
Received: from localhost (c-24-60-203-86.hsd1.ma.comcast.net [24.60.203.86])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7EAEF24610;
	Mon, 26 Feb 2018 15:16:12 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Feb 2018 15:16:05 -0500
Message-Id: <20180226201605.29261-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180226201605.29261-1-jsbronder@cold-front.org>
References: <20180226201605.29261-1-jsbronder@cold-front.org>
Subject: [meta-oe][PATCH 2/2] zeromq: 4.2.3 update
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
X-List-Received-Date: Mon, 26 Feb 2018 20:22:47 -0000

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb}                     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
index e126f3239..71d7e7cbf 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
 PACKAGECONFIG ??= "libsodium"
 PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
 
-SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
+SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "c89db4dbc0b90c34c9f4983cbff6d321"
-SRC_URI[sha256sum] = "02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a"
+SRC_URI[md5sum] = "c4e18bd0584ccd34213f152c11f54d6c"
+SRC_URI[sha256sum] = "8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.13.6


