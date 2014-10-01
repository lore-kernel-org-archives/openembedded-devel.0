Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CF8B471720
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:30 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so463739wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=l8LvRwzEDM+FC5xhJJRqufbqu9Fha+QwqZkK60Mi7kE=;
	b=b95hpx/oHnYh4h0cYvBYyoZMrLPtO/4lb63VjFIczJIJLP3MiyqK3HoltcTMycCg70
	h8f2SbEaJlPHETOv6AJUWVwVbfa7hlaQOK+RHb+nUe2aS6ZVo09sMw8PxFXVjhMONH3C
	LbxXMkHaEmmMLNCG7YtUmeG69iiPFfgyDyu9LYxE6Ys3VZPjwVVVwG3WhharsgG9qn8n
	YhagxW1p+U9ZDdZTRYw6xhUtzOTwITMk+iQLQiHu2Z8ey76vQeiWMtzQGuHRE9Gf9uqN
	F8vlrL8CN6KfTJNZrZ3y0RTNi9TaCD+CQU3pkMbSvhwWwzcu1daCrBAy/v4MGxrM/+2X
	deBw==
X-Received: by 10.180.231.9 with SMTP id tc9mr12312526wic.58.1412151571570;
	Wed, 01 Oct 2014 01:19:31 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:08 +0200
Message-Id: <1412151555-19865-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 08/15] xfce4-power-manager: don't blacklist - networkmanager is up again
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
index 2f9994f..6e92186 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce
 
-PNBLACKLIST[xfce4-power-manager] = "BROKEN: rdepends on broken networkmanager"
-
 DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel"
 
-- 
1.8.3.1


