Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 69B62766DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:59:47 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so105894578wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yyl/zIX4Nuh7YLhoYSl4nJh/jwbEz3TebgVxX7f1Y94=;
	b=wgIlsBd5hVxQRnu79y15M8yWwwTUY3QMgEjaBlN1Kar6vkQdYwvijj26vR/pau7KxO
	j7/etzhu3yUWtDhiXbDQ0fRcVXzNClCRmfratvGWe4r2905ASSofvID9cjdBv8Lq4nfe
	AxVy1sVli7d37eIx+PZg9RDPO2IqdqD251dBCCpQWHMXu4yVYnypXNRbjTsSL42gB7y1
	083aIHNQ4G4pZMPpqxKwxnsPHaypJthEjOl0mzoc7k2v/jmWdBPUiFM5r0Y9YOQKRgEq
	QVLW2ZSw5z6FIxAWGdk1Vvj4sul53g3rE0LAgLjmceMA3CT+G4BH2w4fTLsmiN2WYT03
	dkCw==
X-Received: by 10.194.117.5 with SMTP id ka5mr20975569wjb.50.1442825987111;
	Mon, 21 Sep 2015 01:59:47 -0700 (PDT)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id m4sm22970274wje.5.2015.09.21.01.59.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 01:59:46 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2015 10:59:35 +0200
Message-Id: <1442825975-8950-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
References: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [PATCH 3/3] modemmanager: depend on libgudev not on udev
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
X-List-Received-Date: Mon, 21 Sep 2015 08:59:47 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
index 6dfd0e2..b273c91 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit autotools gettext gtk-doc systemd
 
-DEPENDS = "glib-2.0 libmbim libqmi polkit udev dbus-glib"
+DEPENDS = "glib-2.0 libmbim libqmi polkit libgudev dbus-glib"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
 SRC_URI[md5sum] = "fe74eaa9a77e51e552b4356b4c7195cb"
-- 
2.4.3


