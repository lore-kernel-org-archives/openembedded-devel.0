Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1590971801
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:42 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so319800wid.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=pvIwm6JyDl59lKWCaLuINZ07/4vuIG/moq6jXL8Ybb4=;
	b=FhQY4odiUvrOYFpksO+/ir8sbpslZgkOcHawf/EIsHh9bDPInr6oO/iOHY3Vb9LIq7
	xiqA5Oy9A2tU842JE7V6NTvDYdaVMCKbY0Or7aYTQeQLtm9GqJBFCI8QCN+mfF2EckQx
	+eXVJeQo9HaBxO1x27qiL0OV9zMq80YIAZLS4DX6K5guNlg4lBdC9rjjUf3tQi6nQ4Jw
	UzWf7c4ioh22UczMMeELhpnpRNjI4rClsnTZlhVaEM8x7lIfIWS5LFBWRHy62qEVarzh
	NIDIY2xiMQnTwHrqU2BuvFJ3jIPvYZbikYjL1nG5gM2H3RILRX+3x04nQ8mBeHUv1vjL
	+saA==
X-Received: by 10.194.200.10 with SMTP id jo10mr7837268wjc.11.1413324883516;
	Tue, 14 Oct 2014 15:14:43 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:17 +0200
Message-Id: <1413324868-11856-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/15] xfce-app.bbclass: SRC_URI calculation supports multiple digit version numbers
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/classes/xfce-app.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
index c60ad3d..8780ebf 100644
--- a/meta-xfce/classes/xfce-app.bbclass
+++ b/meta-xfce/classes/xfce-app.bbclass
@@ -1,4 +1,4 @@
 inherit xfce
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
-- 
1.8.3.1


