Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C3DA878694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:48 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id u13-v6so643487plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bkxWZreJtvlnXHxe8VWqxJEQ8rBHW9tA1QGuQdRhnm4=;
	b=Psc7Uyvd4zm6yjJmk3BRY99rlM9kicc5spaUY3N4UndWuZ8V0qs3/LgyG/bRi18GOs
	KGTsRNM0tAWZdC9liMROVdra2Yoom0UXUdP5VNVoPYGdrkkRFlVyTcQUVdJJP1JSG99d
	SqLZ0RfU43qfTpc2fxNNAZpul4fQI8H4VxyUpKfuUqyHBKAft2+7046WH3IX2US45SmB
	JgFudi7Z6KSDSbMF2sNJZQubARVbA+SIGLGX69S+B3dM6AKVANlB0EkBV+Y1rhNz4Dp2
	iYT49uLtEsglpSTkdhfZ2oHEXpi4Jw4U3Qsn1ulBEBF66pTAvraXtOUv+5k4Prk8UznO
	k61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bkxWZreJtvlnXHxe8VWqxJEQ8rBHW9tA1QGuQdRhnm4=;
	b=FygjsdbgxyiPN25qDzHH6b38MuHT4wf6pB9Fw0la/dRAzMvl+Z7pp7/SdZteuOrV5w
	BbBJoCQlS/mSoxNjrYHragthlOVsj1MILsG18cCsFwtOCxS6bKCq99oSWrgsi1nNdHy/
	2rievkd2HNE4v2oywqm5465+JC7PLtYp0tzlEoXq/wEOP+G2Hkgp8sUFPF38qJ+RdZHV
	J46tftJRAYhuzfgk/vZSezZpHZkgEYZAd9KQk1YxZsAX/6S8gGmAPm/8HsDjbPehZcmz
	FGxXTxyfOa9rHhwunVu9nkF1BAo9kkP2ooOaIhrMfI1KMntGJNuxVf0XrXHgIu4/0odI
	lR5w==
X-Gm-Message-State: APf1xPBT8LgFYbmXiUUB8HX6JafxtyAKr4nk2rKfwFgO6PMnWDu6pgl8
	++i1sQurZZQW2DI4KxJfDcA=
X-Google-Smtp-Source: AG47ELsGmiN7oJ5xB9C/TE70/ol6CDOcqVMb2GesFVEXYVgag0UyB8+DjypH3aZxozXV2x3299IaJQ==
X-Received: by 2002:a17:902:3283:: with SMTP id
	z3-v6mr19508650plb.118.1520395430312; 
	Tue, 06 Mar 2018 20:03:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:25 -0800
Message-Id: <1520395408-19266-22-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 22/25] xserver-common: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:48 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index cc30541..a5ed21d 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PR = "r9"
 
 # we are using a gpe-style Makefile
-inherit gpe
+inherit distro_features_check gpe
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "82f2f84cd96610e8f7b92c700cd31c14"
 SRC_URI[sha256sum] = "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166cc34210"
-- 
2.7.4


