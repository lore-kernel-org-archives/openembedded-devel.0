Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id C11337D587
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:15:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b10so14625584wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Wg4Xc1dHpt5eNcVH6mrP1zc/qLyjANssv1ln6uDiFEU=;
	b=aZDHDItQWfg4sMFUiwmZoZuMbCVA4RMa8iNSAAPghoymhQ7JcTYWbrAaPijqJboOYx
	qEtdEfT3FFuxy3rGQWJ9lUNVdOqPNUgTvXZ3NN6zL1ZFfE1PhRWHXAWBIpO/3fLwGBKh
	MOAIEuPEWEAQALcqRNgckH0MjIqEqo+h3ejEbHKmaAu7BvgaaoGwhkN1PlLI2ln+Juur
	XTYkuKuAIPlY2khPH7Wn7z0mE0Fk4DOzdxRWwQKkiRUgd181EWDpJjuOe5EbN03QJwBh
	x3luPPlxPsooaJLhAof/aYQAVHpJ7C/vng7VPWIYIGvtnfnGI9QT87MMy9iQxBtmJbE+
	e4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Wg4Xc1dHpt5eNcVH6mrP1zc/qLyjANssv1ln6uDiFEU=;
	b=j4kyTrRR+ZH0IUP9jwL7Ijkbh3rB75SAbWsKu8DxwWNHtq4irmSb1b0jA3TIw4tIkU
	DFISc8EIAkN/m4m7CN3I7rgvsSLR/s10e2ZKuu81mssueXImBada45MgZ2Ifxs/Ir9kV
	gk82DQPwiyegBILLvWXJd9X6dwK6WNtIEJe313AekK0m1r6ynaUEUndZFkEKATaljNqO
	MUbkjGGjtMsKqgsBnYIj6CPLs188j5KyeIbumwI0aikxYFXfrWMC8aPhwAmmOZzfqTyA
	BbMfwMUA+lJXErCTISlgEWGH9BGllPfxsrRDcvdLQoYU0mJMwoF6UGZe+VKGwsoCoNI9
	iSRg==
X-Gm-Message-State: APjAAAVFJjKzGWINWYIhw+hivM0pO9+G886dqbze1rvaEiD66VtCgfSc
	dWUJxku8gvc658V0K2W/rbpZYqhA
X-Google-Smtp-Source: APXvYqzKHxKlsF3B7KsrkqGs2Zw8gRaVlDN7Qlxezlll9XAUp9UikPkkuU6qyN/oi3fQU+F7G4C53g==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
	x23mr1874288wmj.127.1557130560424; 
	Mon, 06 May 2019 01:16:00 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id o8sm7012512wrx.50.2019.05.06.01.15.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:15:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:15:45 +0200
Message-Id: <20190506081545.21460-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506081545.21460-1-schnitzeltony@gmail.com>
References: <20190506081545.21460-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] meta-xfce: add meta-networking to layer depends
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
X-List-Received-Date: Mon, 06 May 2019 08:16:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* blueman was moved to meta-networking (without an explanation why). It is
  added to packagegroup-xfce-extended in case 'bluetooth' is in DISTRO_FEATURES
* thunar-shares-plugin RDEPENDS on samba-server

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 6e9d89294..fd7f9b541 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -17,6 +17,7 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
+LAYERDEPENDS_xfce-layer += "networking-layer"
 
 LAYERSERIES_COMPAT_xfce-layer = "thud warrior"
 
-- 
2.20.1


