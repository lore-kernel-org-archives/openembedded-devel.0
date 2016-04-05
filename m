Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4773760132
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n3so1224310wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4bv5v/nxCFvv72f39PvchT5LzUNfFBD28snUlzILTVU=;
	b=mtkS2177mqU8td7WuNI7s2n1mHgbVP/QfQFedLzmxcaeIhGAu9w1zUtT4Gp6WFWJcG
	hPtb6VGx88q34fXFQHf8z2bKQOWBOkQ3LvMn5kEae5HdAoC2+uGTY+yYyQkknem7qlxl
	RISKJhK/n0FhWVkb2+CE6BlpmlvKf1dlBuqBS8dAbBmCQLJ3U0TTmzx+ezM5vD4oL9f2
	rCU5hyQQoqKrwLY5kmHFUosjOHvoWv46DZi7DlxMrqYkKG9lBF9UagdOjahwf7zdU4oh
	7kRtZsYp1gUAR25VZqtF6OC9R7ruMixMYqP2kvdYV47YusMzoyD7t6A/crIHRlIp7QTo
	WEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4bv5v/nxCFvv72f39PvchT5LzUNfFBD28snUlzILTVU=;
	b=WTcOaOAdotidm1/MWv2UCn7rOOlvnZH8asKUjDuyHpWW4arkKh070f7jDUyWHtYkq2
	/375UBMW2CpwJY+eAd42FLC9xBf6y4T5KjBEOIbGWsWNFHahylV8dkYHmOSa/afG6Km7
	Aq42Qj2uu13Rgbq6JyQabNgO+bq7b/OdrSDyC1sg6locXTJNFZxrN7IQvYeog+JtZety
	G1m38tUGxz8qv0EvHMrEE6MumyCcvl5hzDr9vuXzfYZuJ2wWs5Zn+rC+AvYlRYwJwuwC
	ppR18mMmA8D8NpifqSnym4oGbZo2HJ6XNrUiOpGn8GQyckT3eIeZzx1D43RNofm6RI7y
	PyJQ==
X-Gm-Message-State: AD7BkJKM+ffftTmE7WrjyhTEx5LS1COo8K1CusaynfVHKNPYNB4HVfALNXz+sp5LVM0HNA==
X-Received: by 10.28.148.8 with SMTP id w8mr15586614wmd.29.1459834755920;
	Mon, 04 Apr 2016 22:39:15 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:33 +0200
Message-Id: <1459834720-17165-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 24/31] qttranslations: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttranslations_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 7908a3e..cc84755 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "ce85e4ee4ee22e5dea3b44707a27dab44319708e"
+SRCREV = "41d212290c3822b8eef151785d89ac5f5b246bde"
-- 
2.5.5


