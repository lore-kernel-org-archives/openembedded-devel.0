Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 638E078689
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r78so13920798wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a9pKPbDTFNvajOZyngC97H2yalEIp6o0eUe3iW9OkYs=;
	b=M+wwpB0+bxm3aWkSDd5thPm4HGd2TbwuKDorMFyHI6Rs1kpncbDenpIq5YpIjpi+vA
	mCTC7SCFNfKczRUZu1wIOg4zy4VPYmvK/jZz5CZUkv9H+yyz4df6Nnw/UnInQdP9aZuS
	EqdDT7UmDRUydL3aIsuSN8sbHePBBE/XzD4MA2Dii4I4KvWPaQTrYzaFtJeU9zRlhdVQ
	4X7K0jsNlRrj4bqRBaSDBS7eXLX3FiBDEd8GJdKk092TqZPsjbUmxOn39lyEWRLUB9AX
	c6eQeDiL26QG5boyEzrap/iuJgoAg8JVGpsdlNA3KN52vyFe8wZRC+ZPIqVuJCxbTgmD
	rYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a9pKPbDTFNvajOZyngC97H2yalEIp6o0eUe3iW9OkYs=;
	b=FvvK8pw2DsNQrWV8iWPP031507TL1Tm9dsKwPckt6hccyhb+Koul8bS5wCRsV9qiyM
	/12jGeBH8V8Fjr3my5xTl0Vm8dtPZ6RN1C4TGhKN2sk+L9baRi2RLWlqLy+MfOwNFE+/
	BmLVdqgKpxHvhw/beXC5EAo2oCvQPW72ThSXiE22kqzU7G4Oxs8LIV8oK/taQ5RNnXHm
	IaND+2z3r/cwhdRKB66RSjmpyNHSO1VTA0KHnCIiOEBtrGdL1TqEsin33HynJdgJwySR
	LimGAdfuYaPOJtIq3E5dZftwZGl8dyGF0vjnnlXtusIc9cvDyGTZNfGLt1zJXm32SeUe
	6Z7w==
X-Gm-Message-State: AKwxytdGKHrojhWlaZAFELR5R/w43k3lWPRhVmH1xjO/X4xpW4LINfDR
	mGzKz3QGkCWjYf+B/oVC6DgUIg==
X-Google-Smtp-Source: ACJfBot59Gr08rZ4egsg1CHLC68WrXMA/KDlB3yrstA2d2//+w2OqWJV0H+EhvOEmsx813Bz+ca1iQ==
X-Received: by 10.28.208.76 with SMTP id h73mr1498087wmg.35.1516178092955;
	Wed, 17 Jan 2018 00:34:52 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:09 +0100
Message-Id: <20180117083421.30233-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/14] xfce4-power-manager: update 1.6.0 -> 1.6.1
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-power-manager_1.6.0.bb => xfce4-power-manager_1.6.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.0.bb => xfce4-power-manager_1.6.1.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
index 08d00df72..ed117b0a6 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 DEPENDS += "gtk+3 glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "2e2e24a1a22912d6a561ba6155887503"
-SRC_URI[sha256sum] = "bde3157e06ab31ff23648d163d53ee5095f7819544a9f48d3a96d57829857f2b"
+SRC_URI[md5sum] = "17f0e6464ad6b3bc6a657f595bf91430"
+SRC_URI[sha256sum] = "1ea825452343b895566068018b6d5078608f8f46ce8075ba6bbb4b848f48656b"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.14.3


