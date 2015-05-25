Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AACF165C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:36 +0000 (UTC)
Received: by wgme6 with SMTP id e6so12551152wgm.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=A4dUDeN4C2ocQ6aYLVTXGGF/jtlpiQrdU4pp17IqoT4=;
	b=kLbYkkY9eq2gOOO63dwjRLFLZ5OLYc7upE3QxOdPc3QtIy3qil8EjKxfHQb49pF154
	KE8jPRGexsJdLmcaxMzqS1ngk2T+urXNR99O70UpRsung2min969GWwz22SYGTxwHWBv
	1HJJmzNQl2o3LTyeZaZ3GIMIi5eRkAjkmU9OcLRXEEhed4zMR3I7uU2Uv5wd+05fkK66
	mLGs2HJrrJF1j0LeENIUKz8ILkAubwrPbhs+T+/vd9r5yTo8Dvbi+ZFKCJLo3sLwqt39
	HCuZiJetIGTHVxbOY5MAgyN6PezF2BQG9b5lEWliNlKrZJrXY1A6UdL8JQ/6q1WqOAzh
	quwg==
X-Received: by 10.194.133.102 with SMTP id pb6mr41753208wjb.97.1432588476939; 
	Mon, 25 May 2015 14:14:36 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:04 +0200
Message-Id: <1432588449-31413-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] xfwm4: update to 4.12.3
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
X-List-Received-Date: Mon, 25 May 2015 21:14:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.2.bb => xfwm4_4.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.2.bb => xfwm4_4.12.3.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.2.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.2.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
index 8239f39..41daa00 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.2.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
@@ -7,8 +7,8 @@ DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbu
 inherit xfce update-alternatives
 
 SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
-SRC_URI[md5sum] = "3728768dd9ea0de624cd3efc5dcccbca"
-SRC_URI[sha256sum] = "5bb5f72b41060d10bd3823f8b69abcd462bbd8853fdf9c82041450ae68e7d75a"
+SRC_URI[md5sum] = "197ef087ca6a263627f1bea6d5a79d6f"
+SRC_URI[sha256sum] = "f4a988fbc4e0df7e8583c781d271559e56fd28696092f94ae052e9e6edb09eac"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
1.9.3


