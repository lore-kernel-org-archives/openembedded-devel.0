Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E34FD6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 23:13:28 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f206so146013760wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 15:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=X869jtGI5LpEE4YiflsGGYHmgOxdeBfVfs63hUB7wtQ=;
	b=S9XwB0O8bJGxowWtMV5SNw7fAPsY4b9tgzCqVYMBcYWMZ/idtp2KgsXPIHI3Y8oBux
	pu85XpUziihL6Pp4SlXR9+OmdXbCFJDvbxlS46ChsP7O3MbliR5Uv+Ro23Nx2xwSpduN
	dNFRS4IBSaT+aXVvotUKEPzCtiXHHUMxGuBjoTCndPDMM3TwLLjzvZrtsWcBcC6jYQw7
	WXne3LSrrCrJl0QSS6bw4l4Df5aM/RNJ1ixQN41mlML65SqHNVdyhZtRrlAjavT9rDer
	jWEgfJ4RgI/ZI/ypGpq8Qix703gQ7xmWDgKn09yTjYMRH0ADWlmqwEPXS2npdGkWNosD
	8WSg==
X-Received: by 10.28.111.217 with SMTP id c86mr64613163wmi.31.1451690008181;
	Fri, 01 Jan 2016 15:13:28 -0800 (PST)
Received: from localhost.localdomain (p4FDF0FE4.dip0.t-ipconnect.de.
	[79.223.15.228]) by smtp.googlemail.com with ESMTPSA id
	s129sm22130308wmf.18.2016.01.01.15.13.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 15:13:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2016 00:13:11 +0100
Message-Id: <1451689992-28225-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1451689992-28225-1-git-send-email-schnitzeltony@googlemail.com>
References: <1451689992-28225-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-xfce-extended: add xfce4-sensors-plugin
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
X-List-Received-Date: Fri, 01 Jan 2016 23:13:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index ccd6f45..f0126e3 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -49,6 +49,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-smartbookmark-plugin \
     xfce4-hotcorner-plugin \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
+    xfce4-sensors-plugin \
     \
     xfce-polkit \
     \
-- 
2.5.0


