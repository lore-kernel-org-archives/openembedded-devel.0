Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7456B73589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 09:57:59 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w62so33947912wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 01:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Tdk0MzdLjRvrDJ/zgC1vyWodmoq3q9h4xsweeYlYmb0=;
	b=Pi+MqHwOZr7he3EzYjy0OmAhDscH29I/5AiQcCh6USZ8Y45nzK0et8FclE1YPJ0NrQ
	iGF89ztRp9LbHLFCJKGO685pT8lcCax9wvSK4ZG24INJUGWm2EEA89XFqddnTymD4UQg
	7ExcmayLu2eO95HoblH7drsgBVtyCSy6Swf3+IeUU8XL0pYsZA9l4ccoE3C9MT+DDM0w
	tQT25Zxbl02R+B02eiYRz+KikjwrC/+sixrCUV1NX6VXEdICNXsWZgddgonUXVPzkWB/
	NYhw47LbbfsGcnT4/Q0OOQVR8q/ilmMVPC6t3/3kb06xgPaBFb2QjtqO/5ERnGutP2aS
	oeXw==
X-Received: by 10.180.102.73 with SMTP id fm9mr13907362wib.12.1424167081097;
	Tue, 17 Feb 2015 01:58:01 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id nb9sm13736945wic.3.2015.02.17.01.58.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 01:58:00 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 10:57:13 +0100
Message-Id: <1424167036-15517-4-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
References: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [meta-java][PATCH v2 3/6] rxtx: use autotools-brokensep
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
X-List-Received-Date: Tue, 17 Feb 2015 09:58:04 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 28603e3..85f55c0 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/rxtx-2.2pre2"
 
 INSANE_SKIP_${PN} += "dev-so"
 
-inherit autotools java-library
+inherit autotools-brokensep java-library
 
 JARFILENAME = "RXTXcomm.jar"
 EXTRA_OEMAKE += "RXTX_PATH=${D}${libdir_jni} \
-- 
1.9.3


