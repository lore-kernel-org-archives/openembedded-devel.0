Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id B33B87D00F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id v14so1587918wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yG8YbgEFaGPfHRFaM6IxcCwvKLtyyMHfziqBRSN6VXM=;
	b=F4Uc/AMSvMiP0kf0vwHoFLe/IiQLjUGLoV/dO7fWPhTnmVn9RVU7hoI5dvPqeI0gwL
	grdhiVD6JrDuUSf/Io5DT7PNxynsjXf/Vr3AEwOjeIR+W+octXjZh0QnuxyuS3yf6hs2
	Mt7o5Q33jApq4E1N8tu0+/3ILkUM0D5oY6cdb28KmHkynBYz+zoWRXROzCWDPHDlzHj9
	bJyqq9E6nfVuoKKm6Zv7QBx77pb8dgbTuZqembUgb89ZlW0hHuwfvoSq0PnLl/20IbwL
	ySyen/6D4ZS7wHeFE8PBNIrKrOlWtRLy1Xax0UY6+fZlTFNBW7wJwDMBExCIKQGKb7hm
	mShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yG8YbgEFaGPfHRFaM6IxcCwvKLtyyMHfziqBRSN6VXM=;
	b=LFk4fbIzhVOKWIr5jPaNODdnG880zT6SxVF5dfQKjgqyY6EL7Hnqocd0RMX3OAaIVh
	JDqDPLPmSf41NnZTNfRSp1p8D7TwyFq9/vQqEF7TEb9z4TsKit0jIT080QUghLkOXfn2
	gApyUMC/rtgb0QIgTk2WZSQo5Gpkp+QC4uSc1xMUXcHpfvYL4DRx8vm6755SgAPbUCS7
	nBR/UsYqUXk+oqh5JNo94PuGHFgHQN5GTZW10YUMQlFL4/Qnfldsz1enZlVTMM7lLTS3
	JEI1v8ij+dj60vNyiKpXndKwnedN3gKgFGfs7IWle8zT1inlJ2P5F83smkH4UxEE5b84
	nr6Q==
X-Gm-Message-State: APjAAAUekQF38Ya9ajP6B59Yo7a33I/glkqwv4pQJiFo4K9wnStgoVv+
	coD4SSBMld7hR6PV7WIQX4E374RT
X-Google-Smtp-Source: APXvYqxqeOZsGD6hf45J1GFZd7aJ7uid6DhqlNr3m/Fbrv1+lH5quB5DL99JyxTqmVlLgje6lavJfA==
X-Received: by 2002:a1c:c707:: with SMTP id x7mr434095wmf.149.1553250107322;
	Fri, 22 Mar 2019 03:21:47 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:24 +0100
Message-Id: <20190322102129.5067-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] xfce4-screenshooter: upgrade 1.9.3 -> 1.9.4
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-screenshooter_1.9.3.bb => xfce4-screenshooter_1.9.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.3.bb => xfce4-screenshooter_1.9.4.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.3.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.4.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.3.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.4.bb
index c6a4cdb9a..7c5848b92 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.4.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "f783eb575e2015f39e1c1aae499b113f"
-SRC_URI[sha256sum] = "364ebddc4c9971b4023aa8019d4e3bd08f091b65dc98b218beb55851f69ceda2"
+SRC_URI[md5sum] = "68321e50939fea3c66f0771d59845dab"
+SRC_URI[sha256sum] = "c4f3225b3f73f1feb1869807b8b27aec4c32a3e9c2954915a5fb39d18d3a60f2"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.20.1


