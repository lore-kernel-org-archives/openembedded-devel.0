Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id CD7097F691
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:35 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c20so12423626wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4xL3895dUTt7xkHJhm6NECB3ld1h8X2nUoixraR8t50=;
	b=XsWMkiPbq2rIX+HnBDp3KcTDU+jvSEMr+TNjpvuylSYODVxoLbMpaKH1R/ERapkVKE
	UF6Vi9CoI5b5YhN1QPAQ+8evUlCO8h10dfnwN5uH2BjQNc7vquTABfSZMhEraHv2M7tc
	gU2GhQTQgNGCR05gGuL6i1RnwMf9V/YaQ7JmB4l0zBB8v3a+tbhmZqyNHb7cn90t5haj
	HMIcjgSoDY/aHra/5ltwCXlggujCfDIZPo5/auZqt0I1S/FBp1g19K3Z4YKKy6MvstTj
	Xt1wnFYXrxLqsf+HBeGDSSd14E+oClMn+3QGW0XlfpkmZWMgVsgizq5us0Xm5isZFQfc
	7L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4xL3895dUTt7xkHJhm6NECB3ld1h8X2nUoixraR8t50=;
	b=gLTB3w/23ArPeEhop9CQow+5BKnVIbx4kDFiSQ5Aj5sX1QGymfQC5fI7pqyg2Zqzoz
	bI6i1db3ABn8j+wcxX9ZUuJh3iocLk4uEBRs9+ZgKkdTPXOC/HBIlV3HDRavOiRq8gCu
	axOeqJ8IuHXLrKFrv5T519luBvHDkGKWXbsKY75QeCSUrK/VwVGWZGiLXsACuuY8TFED
	+gA1KC/UJFTosEpUsBjSvpUph28QHw2C0S6ePzTq26tPfjV5psR6bbERUMjE57AY5deu
	p0JHr3vLHSMeQszEr8OrizBC2BtCKMludaf2BHfGw1mL0Wz6k5m/YReZHIpxxva610T1
	73QA==
X-Gm-Message-State: APjAAAUBJpFV8YCENhKrN86bpzXd9zzSIwgzv1UHxzks/3JIUkCWqkVs
	30G06E94jWXleQ30JrlpcxSEC1ym
X-Google-Smtp-Source: APXvYqyI5eRvr7bt/1MvnXYUHVmKks6arvC9eenCBH3wic+usjqILGl9CWNIyMlAtn+DZR1cogjydQ==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr1360535wmb.165.1575880596509; 
	Mon, 09 Dec 2019 00:36:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:06 +0100
Message-Id: <20191209083612.23922-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 14/20] stalonetray: Add x11 to required distro feature
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It depends on virtual/libx11

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
index 8851729f5..7db70ec96 100644
--- a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
+++ b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
@@ -11,4 +11,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "ae95dbbacc2620e032acea8abab8c9ef"
 SRC_URI[sha256sum] = "36548a588b2d466913423245dda6ffb6313132cd0cec635a117d37b3dab5fd4c"
 
-inherit autotools
+inherit autotools features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.0


