Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF9D771FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y144so16736078wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6k93a4cSrT/WsbZyCktz92IGDI57EcKD6L04IEL7AUs=;
	b=HQinHgdG14P6C9bpYQLC743/nR+MsIp8XHKB9GOy8IjCU8zMMulBNcmmFOEWqAzLlI
	KLawpT9Z7PujOsmyGw3ocwZm+jtscKqG4JV9dyfDOATX016Krm8H+29ei+kVkhrOxndZ
	nZ1CTFDv1pw37/AMcFZ/cY5pppSnaOQE7pBRaWzOX3dKXKvt8yzrx0O7tJ5E49fPeuiZ
	Z4VkU1XIyUz/Lz5bH/VXdZJCp421T4nU/7cUx/WOHwWN+Ix0OePh4bmX5gZMPItrkMv+
	ZLgKBOLyIXIuTHgmkGkHAbO4w4C5LQxRCNxHRdhenKNZzKfKTImtshdDa+T4pTVvAMvY
	P8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6k93a4cSrT/WsbZyCktz92IGDI57EcKD6L04IEL7AUs=;
	b=fsJVCPfcpHxV19vN0VB2PP/vJZipDyOrvP0AhGkItt6mx7CfVwN6cmf4m0nlkPfZpH
	xMUlHVxWUGl05A9Yu5BYhfzRSJeRmKtmL3GWhvqjkEzAfs/vksT/M3+ZztpI2ksinCMf
	LW7eYtZ5bsLzV8+o1lJP2AI3jgOFUU883MDRjJp6BGZonWCLSf9XHGYmNmZrskctpl8z
	ooNBvKnDUjLu1bWz6+7i0RHjCLajTOa3AnGFGTFaov1Jiup/M+ffstN14hl8dfpZrfqb
	ymxt6gBXQdC3kHQxbAHxpomNB30aLf5jQ2mn/vVlbGT6MS1PgWGkh1L6B/Uv/t0R+M0N
	jWYw==
X-Gm-Message-State: AOPr4FW9YDx3a4vvjpmAbqnOs99z3GyHpQsmWQMiIX9ZLL9qZACM1IfANLp1ZwD3aK2D/Q==
X-Received: by 10.28.18.10 with SMTP id 10mr9576297wms.0.1460317327807;
	Sun, 10 Apr 2016 12:42:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:26 +0200
Message-Id: <1460317290-4787-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 27/31] qt3d: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index a19422b..730efac 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "9b9f34701f47824e8201453d148152fb0855f98a"
+SRCREV = "7a208d76ed96bb506899becfe680df06f95451c7"
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.5.5


