Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6E35B6BE66
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:11 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so344610eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xDaT18c/1Dq/t4ZoiVZ4/W3nPGRwZkGN6ouOjCOifxw=;
	b=eiY2jBrkoIWH0iDMbJzPN2+Lg2By/WLuBJjgi5NQqK6iAU7wHY80SAqFDNr873oYj9
	KYg5+ZtD2gaVgMYgklZOGKK7/wTrkp0UEbSVrLeHhG5fCXa6OZIfyGqfAJo6iK4Q8taZ
	qK/KNABu1vWoVmBo7Lfnmp+kJ7kjHB56NzKTr7lit+EbZbpg+9SjIbi17kzK/fxP7xOB
	lFiFQzs7mmvU3Ve4viuZJsNhLcO+pu1+p2JduBBBax2n9PqDhpmgX/zAWDEfC7w1OTBs
	+86yt75ND1dzicUrY7xEjbPf2e2NJkmNKGTulUD7tz5e8+jP5j1imCIkWabzeL9g8nQA
	Ip0w==
X-Received: by 10.15.101.195 with SMTP id bp43mr4243825eeb.70.1377791531894;
	Thu, 29 Aug 2013 08:52:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47243216eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:55 +0200
Message-Id: <e8d4106fb4f484e2bdfa939e2a2b0df0307d8015.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 62/66] xfdesktop: Add PACKAGECONFIG for notify
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
index a36f1c6..11aab8a 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
@@ -9,4 +9,7 @@ inherit xfce
 SRC_URI[md5sum] = "54a84ce63046c279fc3ec3f436d2f1b0"
 SRC_URI[sha256sum] = "49a6e0be513e307e896f7e5929825babec9bbcd4b2e73552f9d27647a4db797d"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
+
 FILES_${PN} += "${datadir}/backgrounds"
-- 
1.8.3.2


