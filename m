Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 34ACC7707B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a140so1212465wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ej2HITbbTnqSxabwesMxcEuxldwtfKnD3Nun+YSeToE=;
	b=mRJiULtKM+dcNl/uAO7TW5k6XIrqeflrDH1+vTv6fe+hTRHcFQSgsnQbOh0A2/e4uA
	79oSDl7F5mgedESrE4lfefyGc2LKcu1yoGdXnoe83LinnoK0fbPl1YwHuTYNFsJ1QUEY
	4jtBIQV3WTtw/vXByBi1yXRXB4BmdWrKy0fwNu8eqUetSCVxnXNzXrA9tcaqqDPOqj0N
	nKToI0ckYspPQxQ4sCqz+sg2SmxBCj+hBGFzQa22XQkWKrFr1dKqoF7hRln7OAvXn8Zj
	mwQKre66RewJ3F6BsRPVvgpQhNeXc4peCqx7C9VW4jI2L+9SFFFK+GX/G++rsAqy/ArZ
	RzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ej2HITbbTnqSxabwesMxcEuxldwtfKnD3Nun+YSeToE=;
	b=dfZdblaiFPCJiwcsEEK7M4WXNqNpJlMB1SDpxzvY2Em9YH4SZgyj4lx8USnd7fbzW/
	zMFZYjBFVf38BLW4BuH0AxGvcPTcfR1VjbtIKtiepWcK6fV1f4O6yg6RH3DokaKHNka0
	Yiz33dGr3nIl//RexWtsG9344EAVQXHKK8goB/bWZqqILCBy/fz1cYg6rsWPfEOnp3ng
	VhUYHPrip97HTioIXUkLI4bTLEUvzGpa4azLreIpf2N88LfxeCwNO/nizrKz5jLgy+EN
	ZxCUkoIP7LX9S22kyig28SFLeLBFlKdKpN96chcQklmp+CLf4R6yXGL3ZnfTSbl+QoK2
	z7Bg==
X-Gm-Message-State: AD7BkJJ8itTRGxUGIEDcHCKV9Z2VKJm//gduZ5P0BPX56VfrOMVq9nscE3Ar455eo+/YBA==
X-Received: by 10.28.73.70 with SMTP id w67mr4899480wma.28.1459834740848;
	Mon, 04 Apr 2016 22:39:00 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:13 +0200
Message-Id: <1459834720-17165-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 04/31] qtdeclarative: update sources to 5.6.0
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
 recipes-qt/qt5/qtdeclarative_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 93442fb..64722bb 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "0fab5761d5428aa708edd66e40fc3c449adc4b11"
+SRCREV = "dc558b69f083c89aa8c02952e5f167405939a61a"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.5


