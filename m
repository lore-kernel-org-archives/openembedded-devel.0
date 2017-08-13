Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 915D860043
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 11:37:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x64so11426400wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xJeXqu6TJ7xYqMEhypVKhyg6jUnVUWZicv6/w7tOESY=;
	b=j7mb/jkmvdPKJ5iskd39j09+r1ap+FsUbt90GJheIY8zuJariueebRjmp8MJ3IozUX
	uePJFJR0L08Z4ewlTfXLSfc1JH0m1rIE5xI3zK73WYsEKk+WyaI4nxvdneXQTMr9i8Hu
	5rY/CPM9miCdIPKJ89BOVa/AGfRCNnqW5VcmUjnQUvsTQRlF3+7E9jyo3E6bogS4txKj
	2ExW7efRWeJwUEk6pDOQFnbxiQXZozwMAp5wm53+qNRdyqyAQ62TZsiJKovXvb5Pd4wQ
	sFBh5sBV1jDH+Xnx3kWPxYkQL9kymeqqc3E9fQExKKfH1mISfHsCOc7ZUkjzvJgEeW/3
	Ymzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xJeXqu6TJ7xYqMEhypVKhyg6jUnVUWZicv6/w7tOESY=;
	b=WdTb8j2CE4V03zjVbKIFFHQaPWWfc8kDiqra5C2UlU8a6IDFqTmxM4kPyKcyuJIROp
	KNrHURQrSnqk7o+dJCuMBh/qNWu9OfclSL8mY9r5gEYqBNIloM4yaTTA9mBy74/IeDxp
	D7e43Kd2AELHpHAArihQ0myB27CStNZCoZS58/0g/VMfnaGxzf0K+xIPJfXNF5bTz5Ig
	jEtXQkQwPvgH/6hcLjmhWskVaJf0J5oaZ6iW1oO7fN3CHL3iiIETaIYBOO88LJmFbeKa
	lI3gH40XocUHnpkTMKiN4eDL9pAlD2iGx/SswwHwNf5hIpwyRDibrqMtCvraXBVekCJq
	IBcA==
X-Gm-Message-State: AHYfb5ibguFGvT+TLSo3b/8MmHBoocfFXPnEfyppFvl1UxWk0120z1mQ
	YMFPewFRicF6gW5z
X-Received: by 10.28.87.6 with SMTP id l6mr2224166wmb.110.1502624222013;
	Sun, 13 Aug 2017 04:37:02 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p20030046E902666856A7C2EFFD165696.dip0.t-ipconnect.de.
	[2003:46:e902:6668:56a7:c2ef:fd16:5696])
	by smtp.googlemail.com with ESMTPSA id
	d26sm5812501wra.92.2017.08.13.04.37.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 04:37:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Aug 2017 13:36:50 +0200
Message-Id: <20170813113651.2987-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170813113651.2987-1-schnitzeltony@googlemail.com>
References: <20170813113651.2987-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] geany: update 1.30.1 -> 1.31
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
X-List-Received-Date: Sun, 13 Aug 2017 11:37:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.30.1.bb => geany_1.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.30.1.bb => geany_1.31.bb} (75%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.30.1.bb b/meta-oe/recipes-devtools/geany/geany_1.31.bb
similarity index 75%
rename from meta-oe/recipes-devtools/geany/geany_1.30.1.bb
rename to meta-oe/recipes-devtools/geany/geany_1.31.bb
index e316ea7..ce36e1e 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.30.1.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.31.bb
@@ -8,8 +8,8 @@ DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native intltool-nativ
 inherit autotools pkgconfig perlnative pythonnative gettext
 
 SRC_URI = "http://download.geany.org/${BP}.tar.bz2"
-SRC_URI[md5sum] = "75081b600560c5c8366eda0e1b8cc531"
-SRC_URI[sha256sum] = "0ac360f1f3d6c28790a81d570252a7d40421f6e1d8e5a8d653756bd041d88491"
+SRC_URI[md5sum] = "386000be6b26972c6a699939c37cda34"
+SRC_URI[sha256sum] = "30fdb906bb76c4251a8bcf83ee267db28c26ef6ab867668a782cec1164a3aba5"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
2.9.4


