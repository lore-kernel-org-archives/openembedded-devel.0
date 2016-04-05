Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 163C2605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 20so1204178wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oEOoCJPjhqrIAgL1oSFyMb236M3sPj8xF5wlTlb6eh4=;
	b=DKZAVzpFOmc8t3/37AzyTbI+li1YwFsKRDHmeJOSOVM/0eY2SEjJ1GkbgZTqwGuhUl
	jLRkHNNWQRWszxUXKnxsAsg2loI9FfQH+ibvdm4B7Xe0XgeLMGMuGqz/mY+OuQ68f5vZ
	7Ck5k0YiWWNWsMhrSov4ttDNi3W2rlst2IDUCiJdLKlYT7Dt9CAohEwBQKkNrikLBT1J
	1fnGAATqIbtnytsKetouCm/Vz5h/tLN3amMFR7J5BPnSeDqhZFCub+NjzyafAy/otjt9
	INmWVMQ9FqK0p2CoRLIv3FhjglHZarCWl8qfdY0qFozoqMv+Ls2KtqKVqS1rrmgQkIRx
	toTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oEOoCJPjhqrIAgL1oSFyMb236M3sPj8xF5wlTlb6eh4=;
	b=VBN9Pv4WTAN+ofZZzVnc6EU/8FFBt4RsHbWT7u4Fzfs+1SHxJeKbwZsN15un8ALJ8L
	OAKP94XtVAG6rTDmRCa8/9AH4yInDtJPI9M5oi1fM+c7R/dU1jS0XOWkgiR7mD30XWkn
	6F1VJewOr6uX4WYUYNrsYW6gDF1PaPzFBMxqGk6k6mW7Fq6FQApprOSyUa3OmiPhb8kU
	Th6IGwJ/a9hsK69paXVzg66ndrUdrP3G8R8Q0qpHFuaeYMVGOESJPRSG8Kx8S4NhOkUZ
	eP/t/OF3LlXbQhlMQ4vtOrfIdw+ZaU4ixaeFn30UdzhGUD0AhIMj/qt7eVbLYuJDRkGM
	w5Mw==
X-Gm-Message-State: AD7BkJIFSD6OTDZfjIr9zONmkb67JimXmhLwGWUl13g9SqgvpYg96e5ifbZEo2Z6bPDrwA==
X-Received: by 10.28.8.139 with SMTP id 133mr16017491wmi.26.1459834741667;
	Mon, 04 Apr 2016 22:39:01 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:14 +0200
Message-Id: <1459834720-17165-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 05/31] qttools: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 8991633..afa4f79 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "05206b44cf25ca6a895cc9a8716f2b7f2f14191f"
+SRCREV = "9904992dc4eb9a5958fcfbac238374ff38498143"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.5.5


