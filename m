Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3386C6F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:34 +0000 (UTC)
Received: by wichy4 with SMTP id hy4so59779822wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=qX7jv32BM9xJWTQLLCmVaXnm6l3Q3HiwwZiZN+QGcEY=;
	b=MDW/Z02vHDdcZjtfDSC2cfKpiMJlaQSv/lVW1tLDFMI9kWSXw9KxfBK1gfs9gw2CQx
	8at6/WrJWwmM8HMsRak/jVCrMm5bjeaR6OFjzw+k6RSWkgj2GvdqLTuK8SOFMUhLXPEu
	Zw/AHyrx4hY4icI+kfQVnv7N3vFkCsSbYO9Vu7gRd5EJMTLtAxUcwakqtemwhs4tEkGk
	nMti3qjjvWE9nkWhnBX2NnXEcGKn3ue2npig9CNvKt4oy27CcstkL0dYTKPincRSODwv
	aOs8ZNfZMY2bJH2IYayovRBLYyqFB5oVVesXuDdLNu8w8fnKpgOINRMy7C76Z54AA0bh
	v+zA==
X-Received: by 10.180.210.235 with SMTP id mx11mr33306881wic.95.1432588475155; 
	Mon, 25 May 2015 14:14:35 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:03 +0200
Message-Id: <1432588449-31413-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] xfdesktop: update to 4.12.2
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
X-List-Received-Date: Mon, 25 May 2015 21:14:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfdesktop/{xfdesktop_4.12.0.bb => xfdesktop_4.12.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.0.bb => xfdesktop_4.12.2.bb} (73%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb
similarity index 73%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb
index a24528f..9c72028 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb
@@ -6,8 +6,8 @@ DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar
 
 inherit xfce
 
-SRC_URI[md5sum] = "d14545baf39678d3b1c7280f71e9d160"
-SRC_URI[sha256sum] = "6e7a8b87317762214b6407576f6e2c1efcc176c136b4c7b869d18a74c87b7fc7"
+SRC_URI[md5sum] = "9a29c8e6b8a931fecd29f1ea736a6a70"
+SRC_URI[sha256sum] = "c9788883163b57bac39d12e5f8310c869d176454879defb78b67f8e9f1ad5225"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.9.3


