Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C17771A9B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p190so13518734wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a7jMU6sd2lDiYyRyBxINbdRqTcHqIVWYwqF7sXkhEzg=;
	b=mVuhryLhep8rIDLzkTdKDAI7wUiODkZNLW3GcgyN9kfywn4kJqFFGHJNBnaEbDmcdy
	WcUfNUTm+BLKulQYlTtaWwOXagGgk39qxqXlTPfBsHpKLbbeN3alOmjwwxYQLlFOTlWG
	dqF0ZUmzugFt1+f9fTd8v/u1vxCdKC2I5b3YoLvInUZ0xGPp9AWlpLcnfgcm+HMD3a1Q
	3yJiY06Jyh/cNMcTa1NAE1GjGoKYRdVcilub4WL5LP2KY5j88EVRibIrOkZdFRHVo+0g
	o+SQMNb3F/CvLihYfQSxqsWOn1XgiNoXQAjRgHJFRskccY2UY53HSdk6tvXVUS5lojPU
	VuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a7jMU6sd2lDiYyRyBxINbdRqTcHqIVWYwqF7sXkhEzg=;
	b=eM3FiarvQiyB81YyM1oYKAyTMNPM6hCJm8LasgzMwZteDwFGcY4RwC95NcP+vTIZCS
	3VGVY3iXeZDUeFiUa67IJb9DDK0CMOZhvB2Qm1NbNgcO1OeftD+ER9gBayufx2G5qXp1
	xccKynwvB8/U1Fmn1KLwIxozdd0FX+STABYD3oeDzTBblRiKmw8MoGpD8kymQVGSwVET
	s3NTouAkmBXrX9OrjSfRKVeb1K9NRB8pGVzWPWlN9NFEzCNcJcobwNB2srTjOfXDl5mT
	v4jTE/O3kuL9v+UBWeMgiSXIoTncPlzxGmv9RaZkuZ34UjX7iIxCN5QWkYMrn4OeSdsm
	v2wQ==
X-Gm-Message-State: ABUngvd0Hfg8bWuBzYXIGuCdn20WLm/03jsgrtaI+SigheggWkHLt/22sf20tYR29leaGQ==
X-Received: by 10.28.211.132 with SMTP id k126mr3749250wmg.66.1478470038593;
	Sun, 06 Nov 2016 14:07:18 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:48 +0100
Message-Id: <1478470013-27247-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/15] xfce4-wavelan-plugin: update to 0.6.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-wavelan-plugin_0.5.12.bb => xfce4-wavelan-plugin_0.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5.12.bb => xfce4-wavelan-plugin_0.6.0.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.12.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.12.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb
index 1ccd557..0c94f3c 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.12.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "3ba5ee0626612942d249d4a80a1a67b7"
-SRC_URI[sha256sum] = "67dce45739f063b95e2bc2232c625277685887b1f84088316d919671b5500ac4"
+SRC_URI[md5sum] = "b163b22f8543e5e5767a68af35c9028e"
+SRC_URI[sha256sum] = "4d5bd6654cfd077f3432b08d296f7bd052e765e51b77c629886a9542f4e5ecdc"
-- 
2.5.5


