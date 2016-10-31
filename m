Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD8D271AAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c17so20256528wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=glYMO9l3u3TZvfQl69YgeIF300pwnps+0PxXxMI8Q4w=;
	b=apGhq7YnZ0b9UMoIuIYB2UriS497+Hy7V82m4YPa5+s3zGqJtIDcFX53vnLJLoi7sK
	MXlESNhbEETSlmoxCQNfPeNheyAlO498idNrcztVuONgNPHJgnwmYVebdtQ+l+eePc1S
	t/oim9JiOex/yfxBbDwEoxLb9cVLVg12RGs3bWfHIdaA7gf50AOMJqboK2/bdUucKbRH
	iNNn3UWZMHu/CnODMZzHzNLm0AHgvGqlCsxi1897/vLYIGR5EJgsEfsLUaCwLSjJxRme
	pC2I7klkudzZEryFHJbBiqC//dXy5mVnGY7RjpNNaH/oeMu3gh2/VSeU6mTL4y5J/Gu5
	kylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=glYMO9l3u3TZvfQl69YgeIF300pwnps+0PxXxMI8Q4w=;
	b=AzfqYMt9CLnsnk6s+egsi4Nd/Uqq8mFFjO5mkDrBPwrziSrlVKEPFVIT//UqHo7mHY
	bs60bS8+Qg7Nns2HF1gCIBTZoWC9pVByBM2QG+MLHuEE0yCgEgsjk2dVL+QwCYDVevGI
	ONQsdsVQLe2Kmul1c7oAG6PFMCmn6khEzb+QCcxsUiPj9kyrawg7B23kqU78jCJ4hlrH
	9s8Eot5Pzgk92trLQywjLTu6upWD8uyuFcKGfk70upvXWXfw9pLoxC03uWRi4YxT6giJ
	nzFOc+F587KyouJ22l17Zc/czvJqhHLXzCKB1z6O/E2jxxkLBF45J81HU5Avpx//tw2h
	IIvw==
X-Gm-Message-State: ABUngvcW/SSqxqZZwpDm3nNkmaVp8/4G5hKcv+5zGhQmai8ZIqyFpC3Lcfr7EuNFd6L3kg==
X-Received: by 10.194.120.167 with SMTP id ld7mr23428515wjb.206.1477951870191; 
	Mon, 31 Oct 2016 15:11:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:42 +0100
Message-Id: <1477951849-32149-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] xfce4-whiskermenu-plugin: add menulibre to RRECOMMENDS
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
index 6950234..a8cecb7 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
@@ -7,3 +7,5 @@ inherit xfce-panel-plugin cmake
 
 SRC_URI[md5sum] = "abaae8068fdcca9e72a41f4a6d28c685"
 SRC_URI[sha256sum] = "c8ba09b3cc0b2ec863af310752a9ca69560fc4c27cbd3174a9dceca1af79e412"
+
+RRECOMMENDS_${PN} += "menulibre"
-- 
2.5.5


