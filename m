Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 678FA77CFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q125so8652057wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=p4AbHGxOFIZp9USV4INhJ2hRpOBY4lFIu+V2nsuTO/I=;
	b=VH7/BBdPICv/dueWA3gRn84rEp1dVTKbRgQD6CBohWL40QfbXRBwdFmRfJqI50itOu
	U59sEjwUiCieouKBscDaC8xwyeB9AxIQ6KNmAOei+3EsOqMYc3s0oX19g8wb/Jx5TEvh
	IsXcmHzPinPfnunoLwV2AOH3JAkKgkVuBB402CKLKehSuszHYg9T3eCgXHdfih4kN1X8
	8lQieXICJDG7OOlpeptSyB+rBkJPjBhhULA5mfCwZDb5qMiKOJUwyTUaUwCeQ3BcH5Q3
	1YLdJB/hZORVP2+10xFWtQmxs6OpD89D+FPideljanr7lWcUEPpkuSCQMj6/NpSOGQpD
	PbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p4AbHGxOFIZp9USV4INhJ2hRpOBY4lFIu+V2nsuTO/I=;
	b=V4f/MoBdZScvEAXeaq6ht+TXz8s9klgvEaewAuxqsKZqOoE3m+duwJigY9x989SU3C
	ccP+fp8GLnlCn3uojNnf00O3SPF906dPwD4Il87aPQVgPMzeGCp1X7JSoDdHmkKAAmWU
	lHpvvNLwzTnAYVNN7y9y38rzRvRlPTZkzy2N3aUU64UsfgvjR1Lih4f9CQJbgTtEcobK
	NqslkrZN2k++9iRZZ+sxflox0r95WJH0oLXdxVz+xdc3W+X5W0jWeXfcYUxaEp9Hc22X
	/0Y4ZUuelK8w/9sz5hGB5pw5xZZcbgoPed148TF7HWM3NLxns2hcn1yp96NAjxIAdkAO
	k0pA==
X-Gm-Message-State: AN3rC/7T4qt1n5Wvc9HsoHtZTn0xNlcrFCNvGjI3SaFshwGAwjtbrjl+
	hfwxNBkN0xCzH+bV
X-Received: by 10.28.150.145 with SMTP id y139mr20899570wmd.109.1492027016012; 
	Wed, 12 Apr 2017 12:56:56 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:13 +0200
Message-Id: <20170412195638.3243-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/29] geany: update 1.29 -> 1.30.1
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.29.bb => geany_1.30.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.29.bb => geany_1.30.1.bb} (75%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.29.bb b/meta-oe/recipes-devtools/geany/geany_1.30.1.bb
similarity index 75%
rename from meta-oe/recipes-devtools/geany/geany_1.29.bb
rename to meta-oe/recipes-devtools/geany/geany_1.30.1.bb
index fa1c244..e316ea7 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.30.1.bb
@@ -8,8 +8,8 @@ DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native intltool-nativ
 inherit autotools pkgconfig perlnative pythonnative gettext
 
 SRC_URI = "http://download.geany.org/${BP}.tar.bz2"
-SRC_URI[md5sum] = "9b62a443461cc917b41c94fa7d58fdb1"
-SRC_URI[sha256sum] = "394307596bc908419617e4c33e93eae8b5b733dfc8d01161677b8cbd3a4fb20f"
+SRC_URI[md5sum] = "75081b600560c5c8366eda0e1b8cc531"
+SRC_URI[sha256sum] = "0ac360f1f3d6c28790a81d570252a7d40421f6e1d8e5a8d653756bd041d88491"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
2.9.3


