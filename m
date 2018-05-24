Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EB76A74AF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:18 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id p124-v6so2590178iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=okVOp1EXs3ymK902+WoJaU5TZRza2CqjcE+Vh+g6GCE=;
	b=Cfq/daqxqmQRSI2kZoESaVlOU9zcla+6UtfvJKwqxu1s/rvTkk6IT8VERWJ2WvmIOX
	mYHSJFggJH6008wdveSk3s/lDqUs3RP9lxEBh4OVrJDr1C8h3X083+FCAtKu0o/ytP0/
	/KqVB/AY7/nkMCxO3RnagQUZOQN36JqHYFbUs3pGp1VZID8HcsvOQ+pfueC0YFVupFg9
	vebMJi+iixi0IxZQBhoVc23WO3WjVwflyrn5vI4xlxukNgeA47S9aolsX0+Jw6m2TSFi
	G2M1S2giFlb3TNJEF+Y170Tb5XehFDmSGz9qSmwjjhU3ToYxJmCm9QoDKUzctxkIF5eL
	E21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=okVOp1EXs3ymK902+WoJaU5TZRza2CqjcE+Vh+g6GCE=;
	b=cu3DLl/X4bwmzkVtwR4QFEJkiUKX7oPqv2DH5vfTWPeSRancqZU0p5R6c8d4VAMvTg
	r4YYrtDTqHls2TxDkKaKafFQzEBchu8uDDqxqsrqui9Ot1d6Xy9FH6hwxZCQrLS7P2Gv
	4y2hF08dDsjTq2eF/Zcwo9p8YBaw1RG715EyiqilX1sDxtNa/TijfHcdaorI5Sw2ZdRW
	GDHhYkUx1gwJTJ5gpp+V1Vp5HMhf/B3eHk7aYEiGFCnx8VtJ5ZHikJv6CBF57z8SOlGG
	e35nftOT9KwUyGh6/xEsJR3V6xRUuuLVn4Gdi2DQcSakzNPr8fUn8uixQXmNfRLWrQK7
	t+tw==
X-Gm-Message-State: ALKqPwf2NOStVXTCnj5047PmN/Q9XIWsdjlNAxId0HVyG0PG3dcrmfO/
	c96vslh2FOgQCXHRAqZo7B0r9W56
X-Google-Smtp-Source: ADUXVKJmebebmccz2/dWvJ82KkpBKiZnfsaB684Zcv9ENZxn9XE3tuf5PW070H5Hm+DDYDrFTo2pig==
X-Received: by 2002:a6b:6707:: with SMTP id
	b7-v6mr1724985ioc.132.1527172759466; 
	Thu, 24 May 2018 07:39:19 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:18 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:45 -0400
Message-Id: <20180524143854.24096-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 08/17] glm: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:19 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index 4e2ee23787..dc0081d031 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -22,7 +22,6 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DGLM_ENABLE_EXPERIMENTAL=ON"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


