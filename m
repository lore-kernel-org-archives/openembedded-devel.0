Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFDD76B7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 07:42:30 +0000 (UTC)
Received: by wiby19 with SMTP id y19so10320476wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2015 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HuMBTP4e6NTmca5gWJX8ke0ZqS03n2JLk+7SxFcJR1Q=;
	b=zG255uYbEEMm+L+gIlTRQaOsAhJW2526QUTnVnUKALW02ffk2ybd4Mf6M4efLbKKjy
	q1xl0nUrIQ/AgwrWnw2VJ19d8iH/Ux5QJ5184SwZW6Ahs66CpaTp5Wubqxf6Z3kyUttg
	GrcTS65chYQhrzi5600YMlEyHpewUT57M8LUwy2twBKzLZd1lFscUnMLPCxWaDGiIeI3
	g2x8uHIWHy28M9JzDaAoSoZ22DEhx9afdkAqCUjIPvv5Wk/pkEb6jpnuh8qst7PWLgQX
	XdL3csTQMstzIK+/n99pHo3ayP5HedG+xQR/peHak8PkrPGNjKndAtP9pO8qKB0XA+B7
	gXPQ==
X-Received: by 10.194.95.202 with SMTP id dm10mr28661428wjb.56.1447054950674; 
	Sun, 08 Nov 2015 23:42:30 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	ft4sm13830779wjb.37.2015.11.08.23.42.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Nov 2015 23:42:29 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Nov 2015 08:42:12 +0100
Message-Id: <1447054932-16038-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] libqmi: update to 1.12.6
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
X-List-Received-Date: Mon, 09 Nov 2015 07:42:31 -0000

Building ModemManager fails with previous version of libqmi.
---
 .../libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
index 789692b..7a15527 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
@@ -12,5 +12,5 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5b3b6b37a57e2fa828fd4cb6f86d7a9f"
-SRC_URI[sha256sum] = "d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624"
+SRC_URI[md5sum] = "24c9eb300662ba6cff0152de89bd9ec0"
+SRC_URI[sha256sum] = "0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780"
-- 
2.4.3


