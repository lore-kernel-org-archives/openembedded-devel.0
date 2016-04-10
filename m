Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6FDB771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so16812677wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uMukkIXlrec16jcwG3P6fIzMyLSkXoJLEZorjr8CB58=;
	b=v4uEPR0Q6lIMAdKuZEhtgzBl3wUJKKyxTIs7+au6Ub6EKJoc8obiFCd2g4E93V3RdV
	UYUS5Y5KotJik6D7xBApuvM05lTiWnbhYE75LKWUC5MX6Lh3DDLHezXPPGSOGlAdHdTn
	t+jFrfid8D1oYvs3cUacckeJRDroCBoVvJHGSf30JHE09/N8uKR4jMhDyaw4tWKdyUF+
	AvpHB/5i3R+vtrTVVeut8eyA7vZSPnrqtZmbBHzWVV/Gc4l5Opv0ffjDTOCgZd9T3DSd
	vkAWXZ8pIkCwsp2jBcP1nqbQCZ8b8W8DBTAHZ0+ko6xsUtBu9SGccZPbvcREjs/HLWme
	kYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uMukkIXlrec16jcwG3P6fIzMyLSkXoJLEZorjr8CB58=;
	b=cIFI9cNOjYwVAoFwKGsc0/4RhCaatzYi1sODX/ZTlGSROtuWwx8+B8B+YKEZUQUBXw
	VY8eV3AjB6WV0Ae88HaKyczieVJnRsXXN07aWh/0INW8xGcyl0vY53A1+FM5sP6Gkh9M
	RY1ToTsVYw2JV7i4wUDuntcSzLzF/RlLz3zDB+nzA8CUHnG918ZI/761+F/dwEO8S6dd
	IuiHPDmrqzkp4Yg+rj/TbVSkIj1tjR3nMiTMAOQCmx2lW5AO4mfE4vkhgHXKC/w/vFR6
	rXQH9nLrK3cYXZU/izY5mnmvFfKzVNt53snuqs231iAfiDjiirVuL6hr1Mn83A8lDv63
	6AnA==
X-Gm-Message-State: AD7BkJKIW6BYK00Sll8yrH5jFgIknUJIBYzlV9X1yWgUUW9YALHj4akO+qJ6G4p0SHZZfA==
X-Received: by 10.194.202.133 with SMTP id ki5mr19824024wjc.27.1460317326308; 
	Sun, 10 Apr 2016 12:42:06 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:24 +0200
Message-Id: <1460317290-4787-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 25/31] qtmultimedia: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtmultimedia_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index ce42302..61c767e 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "3b6de26fe585c586d055ac86c5911cc6df0e3887"
+SRCREV = "9985224a89b830dc182b428f491b6187d6f0e1ba"
-- 
2.5.5


