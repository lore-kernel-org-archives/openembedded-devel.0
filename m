Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 112DF789ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:38 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w12-v6so632446plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=a4IDSr+2KldfjPNTOLkQN1rxi7wHYijqL7MbrtizGyI=;
	b=XtmG3X4bKcIeoPai/mQPvg8yoKZVcDULGkaiQm1Yt5LnFe2Np0IJ52uZfNNpkivQUu
	m386BjFeCHr9NhjPmgJ8oW+MqxQNEbShK462hEmneMx9TM+X7f4cs3qiPO83bCQgznx7
	KtrML6CSPwjWt47poQ19KltoGhO/D4wmb5iSuRpFdOfUqKSAJVh7qcCbNeel6CmkrNgk
	UytAJm95vCnD7RsB0bZKyMHRoPkQGcOBgcFAq6ymdkXqrHW3ByDZGO+D4n5SVLUBLmL3
	oU9aKdfWHiAlD6nDO+TIAPrRL8yccX2FP6Qoy3ULPrC1LO6KX1WZsMxkL8JSSKjcijsz
	v1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=a4IDSr+2KldfjPNTOLkQN1rxi7wHYijqL7MbrtizGyI=;
	b=Qui5VFyI/Wb/nS+tWME41a8S115DcJeChcAP3Uim6V6t9mHijOsD4QMW9rr8QWOfQE
	9RUr7tGCuTsDywJG2Mnr8b/3CL8F3VsqWxBSnH92kbB2IsqQt06FpXkt/cug/PnJVdS+
	1ge6euS9JvhY36pALr31KcDyRrsYIYSzuNi7EGq32H4PF/gNeO7AbUIQ4ntv1sJUUj4G
	FZMb8k0rauqNxrZ8FHvQaH0wW/QICjhOk1K8mprec66McCLb2zPtDagXCsDtSKWkhNE0
	KBvwsEjrQR8mUKPQQ7BU4N39Hd6QuJM+0m3uyjgbUO4w561xFVl6qlaqvzdnbKsyOd6R
	1kRQ==
X-Gm-Message-State: APf1xPAdvZrl1lQ0eM+JLomK4zk/oTc8YYi6RHZZBlbwOb0gMcOgHNxX
	vpxBK49Up+XQRAnvk43H29Y=
X-Google-Smtp-Source: AG47ELsqH2ILct2ZP57bVpw85qAtraKXjI+rvNK86e7/HCpo9J1a4HEGoJIs2iza3xz+jYCQwrY6lQ==
X-Received: by 2002:a17:902:7045:: with SMTP id
	h5-v6mr19159907plt.217.1520395419756; 
	Tue, 06 Mar 2018 20:03:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:14 -0800
Message-Id: <1520395408-19266-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 11/25] gtkmathview: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:38 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 15935c8..df82bef 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -17,7 +17,9 @@ SRC_URI = "git://github.com/GNOME/gtkmathview.git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_configure_append() {
     # avoid host polution inf pkg-config files
-- 
2.7.4


