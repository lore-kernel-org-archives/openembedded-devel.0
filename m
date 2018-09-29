Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 009AB799C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 19:26:30 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id k21-v6so6461284pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BCZjJJxkl7vr1uxKzK6DQlq/28fj6cmZXRT3qdgTTnI=;
	b=ZePlsJNDgDtT6a615KPEgbx4KWweEDN3KlKC2PWnCCJ+AE+XE1JyM6f9Lmuwum65z9
	sSlsmxaClNb+fyq+cVUYLaCKolcdqxfW4aav6OSywSM156138lDAtsCgtU6ONIrHfZAb
	FAcdowbRhT2gCJnSGfG4rwO6U+n31/It+ipg3k0VIVZYQM2Pq1RclglqRoJ7d/HNJoSn
	Iwa4maIgKNIjiSYPFWavSSy1kuBCQ4dDSb3FnaGnSoZgVacBvjkfpQ5V0ExodZYXv+vZ
	Zz4IVuT7kisTdRRR9Ds8dsihiPrHZUyz24eGlk+cAj5LCQnIlEmzsvoj8I1luVvR2Pfj
	vCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BCZjJJxkl7vr1uxKzK6DQlq/28fj6cmZXRT3qdgTTnI=;
	b=HFLqn5LWwopCalq16OfRRguyEyfuEOU+faP0hz3TvhjMYYf73ZJf3y/L1LpM0rSDQt
	Moncu8d4lhlUGZpWjDIvHoGfRe+ZDUc/gka/20GPKYBv4VZD2Z22MKE0m7OALbabiEyN
	ZCSgmKyBQMSxTdl6BS1Z5rraB7/14zym0qDoTP8pxyh4NiWpGcAY2HPQiNUFhyU0PzYm
	nqIDI6tSzsaVzJFjlEZmVN8xxt+crsRC+H9u/vFg7GEWTVOaerwGIi5MMe1pq/iFvmgD
	7aUF0Yj5Oc5rrdkRPFWMW0qvg9PsVYWZ5qSSc1JVLhbPsqLb+Nv0yaQA5GzUE3cydD3D
	H+Wg==
X-Gm-Message-State: ABuFfoiwiNCw8mNrd3Z+uLTUCxE1GaeT1Hf41RtxVkIrj2i7RQu8b7xn
	MsTs1LVk4LeI6YFha0EFjWQ=
X-Google-Smtp-Source: ACcGV62F9Ot88cU4eUFa0B6c8nOeEDS21jQmIif0rZmj0ygUB4zfsA3aBPpSWavwCGJBHvZwPdyj+w==
X-Received: by 2002:a63:a40a:: with SMTP id
	c10-v6mr4022804pgf.140.1538249192071; 
	Sat, 29 Sep 2018 12:26:32 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	u21-v6sm4807000pfa.176.2018.09.29.12.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 12:26:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 29 Sep 2018 12:26:30 -0700
Message-Id: <20180929192630.25619-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-xfce][PATCH] thunar-shares-plugin: add pam to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Sat, 29 Sep 2018 19:26:31 -0000

package has a rdepends on samba-server

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../shares/thunar-shares-plugin_0.3.0.bb                       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
index b90e4e8c0..994c65282 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
@@ -2,7 +2,8 @@ SUMMARY = "Quickly share a folder using Samba from Thunar"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-inherit thunar-plugin
+inherit thunar-plugin distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
 
 SRC_URI[md5sum] = "a1773168c0b3c7c0f253a339f02e5ae2"
 SRC_URI[sha256sum] = "d6adc01ca45a3d2567a2a969a3b16d1799a8975453ab1803a065fa82496b5b65"
-- 
2.17.1


