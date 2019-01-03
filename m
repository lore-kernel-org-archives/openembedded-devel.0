Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id C406D6BF33
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:47 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r24so33808458wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6jQIHpsLQ45zh8o3Vyj6UZVw25GCVdD3MKFJcOZbg58=;
	b=mWYxa35d/toygUuO51R83YmN2XRBX3UICxK6/lwcgMKpgMZYdSMJ1DM2VpA/gzeJgx
	ej+MHgP3KqW2dbE9Ji1HMPu+afu10XwWCNTJyFjuZ1eTzzpWcvP9KvwRSu+omBfS/UN+
	fL1AVhKPunsaiAYvfcsaOQL2mH7sJYoNt5pyRrvoFXl738lkftHGI0jiUS5aeBMVZupn
	juy2WMQAOgvXVOEdRnvDWYacEyzsNihR7C018/ryKwpMOc0PN1oD2rmCrtz1HRUj/pxz
	AHcawFh7PU7fuAfut6wrahgw2og05nNtBM3nhYB5wq5N9eOVb7kiDKxMuSbRRsMOnrSo
	owKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6jQIHpsLQ45zh8o3Vyj6UZVw25GCVdD3MKFJcOZbg58=;
	b=WmNWaR9AeEHsYiV7NXwVnjOs9suB4ON2ItcHnEneMQTuYac2b5K/hsSjV7hIeERDTx
	oma7qZmEFlZtpkAakEhkfiQAp+T0MJTe9yVQGdxK/UVDeKXlqLj4IxoJPJ6PnISHfDW2
	1FzRjRydfmy5JBYJiPDdg7FgLCOMpemMVbb2r89MnNLvz+Wydk1kE6DHGjRgWap/oxpC
	Br1Mi/np70abseEJbznDqTpbYJ/iGVHJtAin7xNPXfUegrjUIzze+/EuQba+yme0rnTZ
	COKs7WpzJfy77vOBvIjsVmDWFqBF2sBGyEKJktsPbphMbckQj1g3J081/DL7H1tIRZOQ
	B93A==
X-Gm-Message-State: AA+aEWY23PpigD41Ux1ZsBYUBjeu4IywOviZp6r3kN/wu0pwKFWIxJpC
	rXTYdJK/RIsAttPjlHznj3jgsSuQ
X-Google-Smtp-Source: ALg8bN6Fq2+L0yhbINwHrS2XoT2VCTSM0WrXXl04YL1/JEFKKYk8MdENuw6swzIgvsASfRGwnRgqPQ==
X-Received: by 2002:a1c:58ce:: with SMTP id m197mr38578429wmb.31.1546477967912;
	Wed, 02 Jan 2019 17:12:47 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:16 +0100
Message-Id: <20190103011222.7686-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103011222.7686-1-schnitzeltony@gmail.com>
References: <20190103011222.7686-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] thunar-volman: upgrade 0.9.0 -> 0.9.1
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{thunar-volman_0.9.0.bb => thunar-volman_0.9.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.0.bb => thunar-volman_0.9.1.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.1.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.0.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.1.bb
index 5a37b69bd..712453a39 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.1.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "3b403a4f846927391ea4bee765a055df"
-SRC_URI[sha256sum] = "e4bffcfee15530e277fa80865eb1de31e63c7effaf8835c9fa7c71e5a0076b2e"
+SRC_URI[md5sum] = "4992a18f422918c33b562d6e66045754"
+SRC_URI[sha256sum] = "cd87291a427e8a561c566dca3aa7e93b56fdce4caefc755dde0f59198f6db359"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.1


