Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3BEC77245
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 20:15:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c133so10457791wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2016 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WUJg6TNIAby7E8LjYrC+4kzN9Wj0b3qrlIDjxqYy7Xs=;
	b=vEnpwQ2NBJVoNos5ERaPa7RJSYJhhdQpwCdY5FDQQamAjS+idTQ5QLpOfBXSxW/GMq
	vaID7a4zosTe+0/QPFnGaq3kjUFR4ZC/QuP7FDdrU8nFKCKNkq6dSlfEfgrM7jQSYEeR
	eaL9XcVgPwSDLDDOtOwmR61LkBs7/QeW1etzkwv/5mI4d78eocHmvQdBmzzdEX1QAvit
	vaqu0WyHmn5wq+Tz7R3b3G47BRGlKoI8+hYzUV2XFcUfumzZtRUn9ZP8LNC0E7L3DW9Y
	TRhIiz5f+uaKOxron6Lur7j0uITzR8TEoyb8DebqTWo5pRmRLhoQE/t9UbVfWRBPY5E8
	BWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WUJg6TNIAby7E8LjYrC+4kzN9Wj0b3qrlIDjxqYy7Xs=;
	b=mHMC8/XVrbeH8MXlHmcyRAg0Xxzx5PjepBXccLw3N1oabmpOV2Do6xVjgTbS4CGO7Y
	rMTzVbxvV1+Z5w+NtaZpnXmB4pty5gyO2jinivz9T03fZKofaMuNpCy7NCVi2AxaoVpG
	fV7ncdnECujtrxNzzdHv1cQc/nyhyaG0IhzFvsLqV4Ku1a4vT1pUt6jSkA4U6MPHHeY3
	7GE5O1BTzhwTcVGn7jlp5RdTUMz9N0mmipn0fGoZT1sJSbvw74kmrTP9mFIVsyhZbMuZ
	fUDgIo+B6VtZGlRLIT9THhqxfbdo+WF2K3MBglUBJLgsdM3EsfqtCgc7c0NnnJ6r+JON
	7oqA==
X-Gm-Message-State: AE9vXwOpdDOydNQRQXsFskALKFEFVijrc3y48KnBX1RRnitEkb3gK/5Es64wJyKCwYo4Ow==
X-Received: by 10.28.191.80 with SMTP id p77mr11483398wmf.117.1473020136288;
	Sun, 04 Sep 2016 13:15:36 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3967.dip0.t-ipconnect.de.
	[91.10.57.103]) by smtp.googlemail.com with ESMTPSA id
	v137sm10708151wmf.3.2016.09.04.13.15.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Sep 2016 13:15:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2016 22:15:09 +0200
Message-Id: <1473020112-25797-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] libgsf: add intltool-native to DEPENDS
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
X-List-Received-Date: Sun, 04 Sep 2016 20:15:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
index 57935c5..602d513 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
 
 SECTION = "libs"
 
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native"
 
 inherit autotools pkgconfig gnome gconf gobject-introspection
 
-- 
2.5.5


