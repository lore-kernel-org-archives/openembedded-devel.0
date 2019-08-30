Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4F97F3FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:14:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o184so6863818wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NMcxsiMxAcvFVk1+b4IX5t4jBVgo5W/efsOVCiiDtTA=;
	b=YFxsitcayLPmcXv0kFEjMwdwTxo2/HU56GeTJxayI/IQQyu2kJeGrRM8SVWsV6b2Jb
	+sobSdk3hmwXRVTc41lcNdPbOascOrenT2Qyc/EKqihzFeS2+y2xuciFGwv70Mv233mG
	VgsbKEbCG2F9gQXWExuDdnnO0c7/3dGk4nmacRnrBJQ3J4oodzNzpwhLLjM+Nv0/0ryf
	EJJhfViJcAQMnvcDANEGaKtFY4x+ef7xfV1UOAH+OcVvhCBh9smL3IMmVjVzCNXbI29r
	UVjtZp9zxW7xCcghtH/AcavZona55PsIxVMVBcpam23ghV98FqAwg3ynndW0cH+baPeZ
	pOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NMcxsiMxAcvFVk1+b4IX5t4jBVgo5W/efsOVCiiDtTA=;
	b=sM9PAk1yJu++M49YUx2t+Obwd1NTAAVOhGXE6445+WKRFpPqd2S9tHlBRV23LbfdZy
	dIOgdayWmBxYDZHr6VJddCpBkchhSBxh6NMyN3ZrBeUmg64NMc4vT2NjfLjp1M7hr1ba
	P7jXVolzjtZ+LH483afF69psIHb+rt9MYWNr29ga3hM19woMEte3bj0jiVM2Q5tbwRs2
	S1KZnBLZPMnu+0vGMy0f0s4r0HYbafEx9YC68X/NcuqnWrs51iigiCP3VHee7HIj10Kj
	KtdYYlePQ9hvd/Vwl4C1QpmCX+2T8zHTH38ar4wn3XaVkygmntOzs30yl+MpuEY+ts0R
	22Sg==
X-Gm-Message-State: APjAAAWSl4nTabDeeffcmuDxJzIvHYu7f3+iqr5TYI2e476mIYRzVEgl
	u6HG8+mUkvzQZBUNwg3vhBFHwAdZ
X-Google-Smtp-Source: APXvYqw9kD32z6Ty88sm6ETIL9lY8UCvyf5iw+TLiFFNCTszi7i33u/UtqQrC2MZlO7H1FILpXSEUQ==
X-Received: by 2002:a05:600c:254c:: with SMTP id
	e12mr16853662wma.168.1567160077022; 
	Fri, 30 Aug 2019 03:14:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02915607EC4D6226D2CD7F.dip0.t-ipconnect.de.
	[2003:f0:7f02:9156:7ec:4d62:26d2:cd7f])
	by smtp.gmail.com with ESMTPSA id w5sm3866864wmm.43.2019.08.30.03.14.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 03:14:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Fri, 30 Aug 2019 12:14:25 +0200
Message-Id: <20190830101427.14200-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190830101427.14200-1-schnitzeltony@gmail.com>
References: <20190830101427.14200-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [mexta-xfce][PATCH 2/3] xfce4-settings: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Fri, 30 Aug 2019 10:14:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor bugfixes & translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-settings_4.14.0.bb => xfce4-settings_4.14.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.0.bb => xfce4-settings_4.14.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
index 902e326de..a24928cf6 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRC_URI[md5sum] = "dcbc673448e1a816b2c47a7ce0ca13aa"
-SRC_URI[sha256sum] = "e03040d623abda0222ad04f226582277a1936507ddfa927ec8e87927debc113c"
+SRC_URI[md5sum] = "2f4171c21db905d9ba0ca9bee3fc7a5b"
+SRC_URI[sha256sum] = "e873e9f6b8e801fd9304ee100c4c76ed9987446c38429d02477c086431c0bf7a"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.21.0


