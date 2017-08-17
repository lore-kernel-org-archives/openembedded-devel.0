Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD597859B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:43:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 49so3720819wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xCMLZnq6t4VgxMu+G8uDl0r4I3gf2qXByFGa1uV4IhY=;
	b=KVZW8Ji9WrzUBxWUWRGaWC3xSKhenuGe8VMmFoyNlx1ePB3P5ragb6GftBwYhxGUw7
	BrTBVnWmPtDauVvo3p3wpnyTP2hrSlfqM2Ap7hSJbzGXT8yx9Fi88f0bKhAp28WUZPRd
	Vq2ZFTsY/XDk2XbsBrnLTRDdYYwXWZL2+Z2z9USJFhFzr5b3tEXZs0yu5HCICpokViw4
	vkbFh5ZjHuGISYpAW06PKu0VozpRyctTw6u0U68g06try2qnqAxtYErqwXHPpVm+pW83
	vmb8Hs7kEHRvkiXHQBe45+pUiYNfB4hH7ICnhdU7p+YLSi64BlQ6WlydUkhq0Yayh9vA
	VJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xCMLZnq6t4VgxMu+G8uDl0r4I3gf2qXByFGa1uV4IhY=;
	b=hBLTaLHDQ0/3/6/cpRN5UbCP8e2n1AJHdLMn4ghxQB15jnBGuP/+k1icjgltzACQn/
	cHqLcgSx193Hljf0cw4MSBR7IuE66NN/y2CEhfbHLrAOtX3RAHVosHR9lYSZQSql/KVA
	k5/m2jr0FpL0BTNBqEtIzVAA1mvDiv+DtH2bpKbNiXKvtgchPdGP7eC0MwUiymLSP3+U
	+gcKGd75i8sEiWys4FBGQkJNq/4pSdg1y5pdyiCfv1KioQm2I+ux5IpTAkpDVzluIunz
	cxjICIP3fLVDc0dB70RIv3rlFtxVfET0cgtNHXMdE6tcXRNyTtnhYY2POoBPrrjl405H
	aQSQ==
X-Gm-Message-State: AHYfb5g1XjFyTePS/BgOJWhVYy+4p8/C7bZIcDLmaFe1qGLHB6Ro/eqe
	MTlAI3ggjB95TH+i
X-Received: by 10.28.210.81 with SMTP id j78mr1271465wmg.180.1502995393189;
	Thu, 17 Aug 2017 11:43:13 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b13sm3141150wrh.41.2017.08.17.11.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 11:43:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Aug 2017 20:44:45 +0200
Message-Id: <20170817184445.10108-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170817184445.10108-1-Martin.Jansa@gmail.com>
References: <20170817184445.10108-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 4/4] qtbase: use openssl10
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
X-List-Received-Date: Thu, 17 Aug 2017 18:43:12 -0000

* fails to build with openssl-1.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 2115557..0afb232 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -123,7 +123,7 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
 PACKAGECONFIG[gbm] = "-gbm,-no-gbm,virtual/mesa"
 PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl,libssl"
+PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl10,libssl"
 PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
 PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
-- 
2.14.0


