Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91271771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l6so16767037wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Vh6yiQv0ldboXEQkxrtfYJ30JdB5U8RTlIGpwi1oVdg=;
	b=VGNUTk+vqLkyzNCQ+XyIf6NkelFL/HErxfmL0aO4aUiVguRium/MJ/OtAZw59KyA2y
	QrXn1UfdXNTOUvB6DEsiJvqcB6F2eGiBJ/OpF0M5Mm/0pvsNIG8juAPJhivQMFlBmgaV
	MZ3nOjtA+pa21oqHJXeu3uGcPJO0LGnZZIjISGYxJdz+6s9rFQnf4hzox1d2GFfxqFa3
	YumXBl1vITv32UqYKOJxjeJWLA0Wdl8UW+jzXd6KHfr4pevGdR5XUm0bBotyRJXdhhgi
	kdX4w0eSOMiYywji2R/XGey9IqxurUGGHyQhpyojLxx1h+rsZq03G9d2b0gBw+zSEpry
	NXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vh6yiQv0ldboXEQkxrtfYJ30JdB5U8RTlIGpwi1oVdg=;
	b=TbpVL9KkRYzAh5jB6NDZVdvVEvwF53BF63i9DPC7ynCgPZyvlTcUhQI9Jlh1EXsUiG
	fs2weGOMtSfWYlA2SHIqQReaUKOIgC03vglJ7dl7vlTGuJX4YyGsVyzUmK4Fjp+GLQMu
	iZBaov20Gu84ahmZU9JG/zVaTzIoFeR6p1Gu8hFrbidVD6HticmY4cO6yY8LKEA8yEO3
	6PMwnF7V9nvfLSaEoSr3C+tguHRVLU8Q555jqJCQRjaGrmK5w1t3XDauFa0xi2wXnxVF
	2Klub1FteyNxOgdJIhVXzhwQd6iqvBhiNXsvKSsa7kdmqtljWPzsLuGhzbKtKkiYLHrc
	NCcQ==
X-Gm-Message-State: AOPr4FUGGoHOSDiCjROCzUNmeJYr1c8LelDuZ6meFs8I4/lRb9QOmVGc1r6l5dmVnqwVXQ==
X-Received: by 10.28.1.85 with SMTP id 82mr363628wmb.58.1460317317220;
	Sun, 10 Apr 2016 12:41:57 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:12 +0200
Message-Id: <1460317290-4787-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 13/31] qtserialport: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtserialport_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index f32a8e1..0d1133d 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "02e4a66a8bd9ce4d2f7f8c89cd1bddf4b6385b5f"
+SRCREV = "03d492e49e74eefa1c83e37e833d862f4b9f1e45"
-- 
2.5.5


