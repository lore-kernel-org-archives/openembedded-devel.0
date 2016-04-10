Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 11CC0771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a140so16802129wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8QZq6Em/QyJ8xFCVnJVrg2ykYY30tEuQlH8SMMTMXA0=;
	b=TlHgO0EwhAjBBJTzkExOoIdTM4BLXR0aHkR3o7btVYPhw2I3V+v2OOwDhP9XO6jH76
	Ba6rFbEyi1FnDevcJaNnmvN2VHAD+lhDUM4F04Hz3LAMtfQMx57jDg/uOH+3Jr+uvqd6
	3vH2sBZ/PH4A0S3Hk6Dd72AOlRVasoTThuPLoCghcZK0vmBAaay4c7Qs7IA4OSapqMaj
	uv0TGey5/obOKOz2k2Atg8+cZB9jEAbo1AuuXyRIhgap+QuO4zywYSgCzSh6uHgQCUTl
	5YlAH/QaIhDQDHZq1CfRyumPEOBiGRnj8juuAyXEeqFrIyR7qgYm9AZaONCbjLxoLi8z
	gvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8QZq6Em/QyJ8xFCVnJVrg2ykYY30tEuQlH8SMMTMXA0=;
	b=lep6ARdjj3pIlem6juds/oqHbXwoTsFuzwXJI838jqsabsxSB633RmhC9UD/vjco4S
	ZgRktaeyMuA1nRuWHQmC2qwqFmNpj0Wz9m89Gn7Qe/NVUaLuie25bQwpV7Rotu262sbF
	eS7IxSwbv80R8nToonQeGOtu+kKaPkXgtnu4JqaXnU06EPccysTmvU9X6TYyxAaJtXe2
	ossPBbtWtLb+jvmx4zUvTUv2SUofGa5cHHQdzNJiPyq8ReHiYtEkCxGrXMPYSlD7qHsl
	swJJKu1YL/zC5FQ/AQpfW8BZ/rghobdqby4aRjqD9MX7ptwqWO3gA58rH1cXLaf+1ReA
	Gfow==
X-Gm-Message-State: AD7BkJKvhvRI+CsISPpD/aOprIPL22o1+0uQMI8aLCeYtLl9nqQnmvc8Pbmvl7aCivihjw==
X-Received: by 10.28.230.69 with SMTP id d66mr15055430wmh.54.1460317318685;
	Sun, 10 Apr 2016 12:41:58 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:14 +0200
Message-Id: <1460317290-4787-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 15/31] qtwebengine: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 8f5276f..af5478a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,8 +119,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "3f02c25de46f5ff296b8189af3435ce5800b39a7"
-SRCREV_chromium = "779a2388fc123a7f3a178ce2ced921ee4a307e2c"
+SRCREV_qtwebengine = "5c4ae298b0a3d75c4c5ea8aef0595914ab25607f"
+SRCREV_chromium = "cbe3845eff59c2d1726ed3dc0f934f7f483a1271"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
-- 
2.5.5


