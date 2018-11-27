Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2723D6B507
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 07:46:37 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id i12so7943670pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 23:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F5TyVN5YDLbxwD9zYOBa+NrifmQr6v6WosG6RDZnDDg=;
	b=MkxRUVKdIoFwGGY7ZczK0TzDQwMmSrLDV3hbpQl+j2FVrzZGtLQ/uzGgc5/zDKI7kl
	dIvsA7qTKZLhsSGwXh73nY41uTtGQYD+f+qxNMWAcZCoLP0EaRAAwo/ZW7iGMrTr2/jA
	Gh7gG8nMGcZRZ9Pryufb+ok9F07Bm/7Rfb2AM+MRE91i+IAVdAMFf+7tl5NeFuItP+lY
	+RKTpDzpwFgalZV7sbg9YDpx0dF9wLxrVvFLYRjN6x4iFPpTtBOV1wD5r4PIhe9CtoHa
	YiJffWv/7oFQGtNFSBJi291M3HRJYiWNrVeq+V4N7Emi7MibMmtzyaPQnLb1YiKpI3SA
	XSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F5TyVN5YDLbxwD9zYOBa+NrifmQr6v6WosG6RDZnDDg=;
	b=f8buSLOwl8Hb/fgzVMW19PQeumFf3je11Al3yTgNJ2qBUoMUQvrMUc4Ks9A+7qze5n
	YP4MpGlhBYjuZX2cXcR4GrOKL/3ShJYwmrf6DN79aKoL2eToKhnzYdZyqqjImbz0dien
	xCzRjZAsJaqhq4eFyW5cObDF66qhm6ZLLjM/g1PG3qcmhPSVJqEDlsEZvWo48YuR7hRY
	macVabeBIbfw0lZAtHpIpJYM9ONGlvI7h+34pACw4nE0vsWuOL5VYja42ELFiliVuWlt
	isXgKFOjGcZLlND0xNx0oImtelJaGMSDSTIzhCVs+mg7Ter3Ph3T7leT+D+PfZVPCkv2
	W9jQ==
X-Gm-Message-State: AA+aEWbo6PxX36SALeKltGaRCkYqpV9kkRvlKzhOH/6pQbnfh3i3Xkbo
	bpXLrNPQu/uQ5SdfBAkZ4Nx5cWcH+pQ=
X-Google-Smtp-Source: AFSGD/UXy2sOouDhJR4Za7AGpMe6lZjeY51OLje8cc8kKTnc5AkB3YcTz1iRvn5E2ntLtb2bYcuGjA==
X-Received: by 2002:a63:193:: with SMTP id 141mr28319042pgb.136.1543304798557; 
	Mon, 26 Nov 2018 23:46:38 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	l63-v6sm3339036pfb.75.2018.11.26.23.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 23:46:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2018 23:46:28 -0800
Message-Id: <20181127074629.23966-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libgee: Upgrade to 0.20.1
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
X-List-Received-Date: Tue, 27 Nov 2018 07:46:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgee/{libgee_0.18.0.bb => libgee_0.20.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.18.0.bb => libgee_0.20.1.bb} (83%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
similarity index 83%
rename from meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
index 6386f1ffb7..190e5dd4e6 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.18.0.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
@@ -20,5 +20,5 @@ do_configure_prepend() {
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
-SRC_URI[md5sum] = "29ea6125e653d7e60b49a9a9544abc96"
-SRC_URI[sha256sum] = "4ad99ef937d071b4883c061df40bfe233f7649d50c354cf81235f180b4244399"
+SRC_URI[md5sum] = "d224dca55bb909f6730f40cc267337be"
+SRC_URI[sha256sum] = "bb2802d29a518e8c6d2992884691f06ccfcc25792a5686178575c7111fea4630"
-- 
2.19.2


