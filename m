Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5135071A4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p190so13518769wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vEDFbfpakn3VeBQq3061h+oLPQrZDiEaaSBhlyEbNcE=;
	b=xz9udrJAKowO8wrpOegYoVuoMmjMsGTupyKCsd0AY08ljqOCz3VNnWtYsqkhpns69k
	t89VT1Aqgr//ViWYk2gM6LTqAE8GCPi35gXJ10kfJPorzHIfLHzZUUczJlqYbDyYux9G
	+VaY0J6IwfIv7XiR4G/qAxPlACl53RN2pF3Mp7JfnwbhQgOwM8g5/Low1zfiMKBOhMCm
	lf7F1MXqteSJqNA4XShqWtI6POdMsQbRdDqCdZWTjUTxcaYKf3WKw5mqJ/OKOx17zYQy
	0VHwjJQwJpAmRiqFaM+PpeXlVAwysvF75oOROn0VDZ8hkWbidGpZjHoGWbwv2Vt/SOTw
	r+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vEDFbfpakn3VeBQq3061h+oLPQrZDiEaaSBhlyEbNcE=;
	b=P0vkPEM+CSILRgcM7Y8ZxKrmSaYAaiNKqZKoTzSCrWxrUgMtwRukAIOTi1xXksuWrn
	T5nW69e+MNk8AlmfWiTqXOq0APkco9W5adI9eGhRGtJpZm/fO3Zn89wd4AuqIG3tXAta
	cNTrBekdyMt3USe3Wq8xp7LzLpiZwOMmjWfmCJaKDbBgyd03zsqLn4yO5hGDYLd7zOOq
	RXX9gFRl/DhQ+2jHtKUtu7TYh+AImhUDE+X7dWWb0GuFv0ECTWrrz4Uk7bN0v1oGjtEQ
	VFmdJm8cCAJ1yRIrbvuzthTSW19cbKym/JjfjN5z2OSDSSCl/YR0U1weXPLUp7WyojOS
	q1BQ==
X-Gm-Message-State: ABUngvcJhzZHGOgln2bKcdiRKx3uy5BhRSXRCmTyUmTzPRRjRJ/wHUj3TgvBP/wpgs5NnA==
X-Received: by 10.28.133.143 with SMTP id h137mr3748241wmd.58.1478470039416;
	Sun, 06 Nov 2016 14:07:19 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:49 +0100
Message-Id: <1478470013-27247-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/15] xfmpc: update to 0.2.3
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-multimedia/xfmpc/{xfmpc_0.2.2.bb => xfmpc_0.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/xfmpc/{xfmpc_0.2.2.bb => xfmpc_0.2.3.bb} (72%)

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
similarity index 72%
rename from meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
rename to meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
index b1cabd6..3d902a1 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
@@ -9,5 +9,5 @@ RRECOMMENDS_${PN} = "mpd"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "e4e198850c2467c47783969ac9c16ec0"
-SRC_URI[sha256sum] = "ed0cc2940bd5928bb30fab1531c22185a97bd0cc5beacd9e3be4d4cd994a6862"
+SRC_URI[md5sum] = "e2d2faeb7a6f62813e287f3d12522b71"
+SRC_URI[sha256sum] = "4189c0c82b66b758a6d5bc651493b675d3d46329e5f1a76ff26c448125f4fcb0"
-- 
2.5.5


