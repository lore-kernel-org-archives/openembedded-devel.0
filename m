Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E5AB1770C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 20so1204600wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Vh6yiQv0ldboXEQkxrtfYJ30JdB5U8RTlIGpwi1oVdg=;
	b=xA+/6BMkEz46KESBotfNYjBd3I1EklPndoV14FrSpiC3pHEg2R84vgCwVBVWjUIzDk
	8zfkPKi27I55hGz346HlaqHPyLgBqMawTNsuZOu66POAl1RDQ4oG3ntLeOD9mjiGreei
	/YZR4sOy4ieKBKZnpstYUGAJcXkIwWBb2dKIBOuk0fhq6XT654ElBKsZmYYV7qSaj2jA
	R3XM78eJSXTi2rJ3n8WYilUrdm0/3fXnoTDYVJZ6co6klDFSCH2ZxkosTIuEyC3iLi06
	CHiQziDl1vfFsjD7+ojUWdELOpFfTkSqMczYGogiMDrz9KExohfH1D0PAGHakLYUG+xe
	giEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vh6yiQv0ldboXEQkxrtfYJ30JdB5U8RTlIGpwi1oVdg=;
	b=Nz1FMV3h819zTY8zopS/gs28hHOI3tkxQdnbRtX5uznmLg+6PDaZo2G2SjW/iNDmig
	UyYWe6JsXc89K86ag9V58w4Gwbp1OUPspi/JWlp+UyErI9nhXNjpM7QWfHoHmuCLtFEa
	kZ8Z5JvA0Sm5uk4svNrrX1+dbjtx2VXnGLR3wvyG+wMKOSlQwHcH8W7DMDnOhACT3TLQ
	Xwk6JXikpOJyzFoK/8/JikrUDpxRuCbAfmFk0g3kq4RbV96cdnyJAihWoi4Uq+vBnlO5
	R3bMGXuSdmbEFGCdiZwYtK1bRu/aZg/+1MJ1pvPlzGnWcAMsUfo180QwkhTMmXXvw+dp
	HWYQ==
X-Gm-Message-State: AD7BkJIpph/RG8VZ4myyPwEmb+7LwHZF4RQNTORLZzrQjuofN9phYqZW0KCdS6ln6Nih+g==
X-Received: by 10.194.157.65 with SMTP id wk1mr7888597wjb.83.1459834747576;
	Mon, 04 Apr 2016 22:39:07 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:22 +0200
Message-Id: <1459834720-17165-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 13/31] qtserialport: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:07 -0000
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


