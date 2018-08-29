Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 38DCE79020
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 03:17:28 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x6-v6so1635094plv.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NDRQjt8zrz9aWQkMsnANUyjzQyGihfcBp+rlNnA+E5Y=;
	b=qK3KBmWzvBHWaDfX5iEh4YpE19T1NQ1gpa6lGv9CP5u4kfWXFv3qDQDe0+Pyohjfzb
	IE3XGn6CHguXMlL0lRsUANCqgPguzPzbG6qPWrh4M+2Txsx7Z1sDCdVxbzulj+iu+7dG
	AlmfS+qySWaLvYAG1yUTGJ3IYsjuUFdVUFaoDUjZKpTnryviAhALANtG6lpI35FqazQX
	dw4rvTCA2UfnL0jbhR5JcNuIqI4FEAkM5du4I8RRXhNUpBcsJRcLQ9JH8lyEk/5ykeQ2
	4SyQjJ5kclaXj69uJA54wOD0+ddxmOUMUB8FeYtV6M8cPxs6rCoJSXgWT48hxpUqXFtd
	34bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NDRQjt8zrz9aWQkMsnANUyjzQyGihfcBp+rlNnA+E5Y=;
	b=BddVgRD7eimoDtyOViCHrAONezaUwKEL1z+W4Wm8RHf4C3GLrQCP+XiF6+HlDFEF8M
	x9PT8z71N3E0mqmcJIxfN2yJNq/5IIH3a5yH5Gm7+I5OCrXTqc3Bd3zPiYVP+CZjanZJ
	KGBT1poZsEzBY8IqZXc6BzYswMEGD6UpeAK1L95AhIDjR9xLq8CEp2NteOzNxIC5KhDn
	AKubX195lDD5o1HeWseIjvRRzNKOQavpKaxR5qq/ey/2qtYQe0PUQxcBABBHB1wKCzIv
	kSDrCjI4+wtu2eYMs1G/DkNC8g6XOROmalLDSczl1jxUsrVZ7Zvrr8mYCyL33IjWsdBJ
	YaLw==
X-Gm-Message-State: APzg51C4fVZi+ZpBwBMWiZg1ahkdBCxqNj97yFm7zjeAmp1bo6H/ggfT
	zRl5fASLU0KDsHATdtaK1FcLBWHu
X-Google-Smtp-Source: ANB0VdbLgg+WUwuUrlTpyveBMZMzLsI/1owBanWyFmGX4dEtZTem3eWBfN6SIZLZFBSv4IFOv5WR/Q==
X-Received: by 2002:a17:902:8ec7:: with SMTP id
	x7-v6mr4202987plo.336.1535512648862; 
	Tue, 28 Aug 2018 20:17:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	z19-v6sm10411764pgi.33.2018.08.28.20.17.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 20:17:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 20:17:19 -0700
Message-Id: <20180829031720.26437-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/2] zsh: Delete ${D}/usr if empty
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
X-List-Received-Date: Wed, 29 Aug 2018 03:17:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
index 100c449f2b..3aab65bf5b 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
@@ -49,6 +49,7 @@ do_configure () {
 
 do_install_append () {
     rm -fr ${D}/usr/share
+    rmdir --ignore-fail-on-non-empty ${D}/usr
 }
 
 pkg_postinst_${PN} () {
-- 
2.18.0


