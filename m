Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0727A78A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:32 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id m22-v6so633486pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=J1wHF8yRR3hbNxZQgYVQAcS1SxButwZqmi6ovrJbyk8=;
	b=XnIKAFBxJNm9ppuK/+X+4JjdHwpnHjsluJzbWcpn1RtIOUh/icK/sOzGDk8fwEURQu
	FuVkzbn+j+W5KzK4pPQucO2TmltQu46wlTGv7bopc9BRWifSmB2z296YlXqMYBx+ofrH
	wGIY3GCJVGwo0RcUpKA4/UfDNMxWgH6DPqyMRHLHSvefd54HC+1X/RhW0U2ifsN8lH7+
	3wDb98C8EMzgdWkyOcgH8lCn3euh/v5x6VgsEPeA7J5f3HqCtGrjcxi6qS6vYl2sG0UR
	v7fqw0eR7HFqkEWtSCnem/7BA/E/9ayyvHuwpJXIITcWOrdkdQy50u08b4+vC8wsJFys
	ZiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=J1wHF8yRR3hbNxZQgYVQAcS1SxButwZqmi6ovrJbyk8=;
	b=XN9aQAfV9m2fZRiGHx7EkTY65bn79T9UU0acmvDg8jUX8p7dX5p3j/0H8qoTKSmOFb
	Iv4bKZio+Mz6ODSSO8S5Fj6eMKdZYw7Ylh4D/4WizTpEOCyq04e4Mjcl16wSfiexpp/J
	FRiMY8UC10rbov9gEILD4OGnQiu2lyGyNgFHL/bQbnT7Y4Hqr6oo+xctFmajoolQtVse
	nFecUxEBJa6AVrppTiyx09by0NXdpUQUIlnK6l5JY2bJFkn/YSZFaR+YFHnEJjqmoqzQ
	mC/mPfoL3vxJYqasZiJcT6W+cimiEIo32SWjnUa2HoETR27kwUB5e6KL0y9Bef0cb4eU
	cUug==
X-Gm-Message-State: APf1xPD3PKtfcKiF7+Mj5Fah59CbWimkgRIPDY7yNv2LWM+xARbX/5N8
	KP9onIREtaMaXpPKFu4w3F914A==
X-Google-Smtp-Source: AG47ELv8Ue6cbeO13A6gJWNLE9Jy20McYOX9VN1tmAVxNVlP/1BtcZKiK/i85k1luAWbKliT8obnvQ==
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr19027951plo.162.1520395413716; 
	Tue, 06 Mar 2018 20:03:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:08 -0800
Message-Id: <1520395408-19266-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 05/25] geany: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:32 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.31.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.31.bb b/meta-oe/recipes-devtools/geany/geany_1.31.bb
index ce36e1e..bb9d8bc 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.31.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.31.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
 
 DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native intltool-native"
 
-inherit autotools pkgconfig perlnative pythonnative gettext
+inherit distro_features_check autotools pkgconfig perlnative pythonnative gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://download.geany.org/${BP}.tar.bz2"
 SRC_URI[md5sum] = "386000be6b26972c6a699939c37cda34"
-- 
2.7.4


