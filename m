Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0AE071AE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:41:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so24333284wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 14:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1J/hfQltescqI26OgbXKOmt6DkGZDPrPV/xb9ETKuYc=;
	b=a8DadfrrDpZEnCIv32UZBY0QV6NOjg6iGfWoviJbf3xlHJdTc2ie8sbfXx5uD9iGDw
	HlIV4uWSw8lnxlh7frm3K3ilz4TT1IQAtyO3uEzMBG8Hlbzd/QkdCRoKkOWxVT/6WqT+
	CL6p0+dAaXGsM3Jt+QHXuhCqZomBGM9BcvadyPIqjen1Umu1BtRBkAGDWnqO6/65jEv6
	+VYluRTdyDCVhaK5k4xJyvsVjp+3jqdDu1ScnpG9KyngHmD2Z8Zi34Rla1GLjvNsIvus
	YpB8QiMij7d4RL8RgrpaAVAABAQhhkM1tdCjyppX/ttmtSVDEoXPwpGMJF4oLT25o49v
	zh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1J/hfQltescqI26OgbXKOmt6DkGZDPrPV/xb9ETKuYc=;
	b=YwRYcvE8WqaD0+GBH9tdiGICajPILRYmf8YExufiUOrtMFwcgDHTcRDQt8D/H69CRR
	oteTlTFfj0qKwo7YIuGBRS2zYro2seguh2h6yDeC5oFtwKzndNkefbNzmp6fN5Hf5QRb
	sffzJ6OhgfaW/rMP+1VZRl978So+JYTJ+aH5JVt0ydoCYvTOsmnesbIL/FEe/wRXvU0+
	RDF3ItxLMPQlalmoTQABs2t2ci+hIGv9SG0371yabBsHa5U7hAPJ5qVHL+9oXmq4zKW9
	Es+bE2uMbrRuc2ap91Uv1g9JxoTZC6PfIv3K3oiUlqWLW7gJqRgXopW+/cfWRG5Ta/z2
	k03A==
X-Gm-Message-State: AKaTC00Iom+omr4Dujh4CXEz89aPvHkVMqnl3klJjDXXDOPz2qMx+1e82qxUoVU6zXA83A==
X-Received: by 10.28.47.15 with SMTP id v15mr696363wmv.76.1481064067367;
	Tue, 06 Dec 2016 14:41:07 -0800 (PST)
Received: from localhost.localdomain (p579CEAA5.dip0.t-ipconnect.de.
	[87.156.234.165]) by smtp.googlemail.com with ESMTPSA id
	j6sm28060674wjk.25.2016.12.06.14.41.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 14:41:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 23:40:43 +0100
Message-Id: <1481064044-26249-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] xfce4-clipman-plugin: update to 1.4.1
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
X-List-Received-Date: Tue, 06 Dec 2016 22:41:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-clipman-plugin_1.4.0.bb => xfce4-clipman-plugin_1.4.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.0.bb => xfce4-clipman-plugin_1.4.1.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.0.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.1.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.0.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.1.bb
index 988fbb0..aa6a5bc 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.1.bb
@@ -8,8 +8,8 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xproto libxtst"
 
-SRC_URI[md5sum] = "cd9c05e54e0fcc3f8d774cacdf18f42c"
-SRC_URI[sha256sum] = "a97671540663df1d90503f73695ac36e16fa2c832be8845ad9402529b8148294"
+SRC_URI[md5sum] = "5a5c01c347f4503c58902977e671ea09"
+SRC_URI[sha256sum] = "341cce9665a89e5930e754ef3e27ff97594da22b82b1403099ebcf5c18a5351f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.5.5


