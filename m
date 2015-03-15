Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C9E6A6AC43
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:06 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so27056706wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=dcx3Yoin/ZAmOR/EbiJdZgpGDJOf3DkThTCfDVLVY1c=;
	b=tYndfwuYxLKrxeLvhp/sCA9JlNVNYgzMp2hI/mLyY3hQKPcm5myyhNP0kdqXTk669X
	kIHdBAo5PGPL3K6u2+zO7LAt0jFrV9q7Pxn9MB+Fij17sFwMZWgupIxa8GY68jgkypco
	BrUtyEfFjMWK09T4Dmknmzyl/OCWNdv8y81uvk04XUuBWfggeboHX4eg1Oc3Sp+N+MFY
	3vV14F8C9JHO0Hr0Y6e5wZszfJ7daJAc1w3N6yykyqkcQONWxeUPYQ1TPOxjyE9U7g9F
	tJ1KOAMmxWX8d+gZ6Ahw15fFMM9TQKaRWhlDcLZsuHfekreylnQu+j/kXjzSZnkbEX7n
	4JHw==
X-Received: by 10.194.63.206 with SMTP id i14mr119329512wjs.107.1426462447584; 
	Sun, 15 Mar 2015 16:34:07 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:19 +0100
Message-Id: <1426462419-10173-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 10/30] xfce4-appfinder: update to 4.12.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-appfinder_4.10.1.bb => xfce4-appfinder_4.12.0.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.10.1.bb => xfce4-appfinder_4.12.0.bb} (56%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
similarity index 56%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.1.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
index f2d688f..79e06da 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb
@@ -6,5 +6,7 @@ DEPENDS="glib-2.0 gtk+ libxfce4util libxfce4ui garcon dbus-glib xfconf"
 
 inherit xfce
 
-SRC_URI[md5sum] = "bea253956638e2df2dd950343b3b1b7b"
-SRC_URI[sha256sum] = "65ee74ffa76334d273e4c9ae501ec7f81f7de028813849f7d1441cbf7788eb77"
+SRC_URI[md5sum] = "0b238b30686388c507c119b12664f1a1"
+SRC_URI[sha256sum] = "2ad4a58019a76a6b64a816050db25f96854917c2f2e89d6a9df6c18e6c84c567"
+
+FILES_${PN} += "${datadir}/appdata"
-- 
1.9.3


