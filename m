Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id CEE0178694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:44 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id v9-v6so621575plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KYQXG3vzA/qy+kmkOi/K5lnoVJpCoeN969XQKwtWy/Y=;
	b=B046z6XvepYt5dFRRMkv6nzD/s6qpy2VYdf0yi0jfpXo40dwbHESXGrwHs8btxdT+y
	fvmgXcK0MD5smQJYWv00AtdJhHFbyVFazlA35fSwXl77/C8fAa/CtPeEnuDaRlx5BXh/
	WU5lZ8l8xSEADZgcwn6MUZGhwbHA2oD5hScxvMmJPMIfD6uKsYb1wubxUPLTm6SHJB9R
	yV/Y386uCtayGjklfuDdJqWZF500kut6i4W/URJlC88RdK4vqtqltx9muAyX3Ul/KoZt
	a3Ac5JsitfjiKr/86FJnu7v5RYRQWL4RO5ZwLASK7Bf3L5MKQURz9q/J0QHtpcvukJ90
	t58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KYQXG3vzA/qy+kmkOi/K5lnoVJpCoeN969XQKwtWy/Y=;
	b=eF28qaMbH2TEstO+EswX1N1sBtPbPvyHXjV3A6MOKieJDmZQyIalc/VVVn/+InFpCY
	YWbDkSgPWttRfW5Hf7GyuKBTCuTPoq4Uw4tAnP/PakfoVGqShYAr7BQs2OgIBy+a95IS
	ashdT3ngNLYwE1JF9pC+afNhEaqkkbpSWnjqD8oibzd/5yjWIx4gfBbMUXyXKlNIXxQY
	yPeES6jAR/XKWsFGMSTpaczOVMWMnHl9i2HsZkbUBBaRV3NTHDEDH4k8KylBO5OX9RLo
	yEBkws8QoI4mZVnTkOiJTWcNPLeV46VcgdOgFiM4t51iAL5T+x8EX2qCJYHH/oNNl5mn
	vzXw==
X-Gm-Message-State: APf1xPArN+84w8gbVhjeluj06N8M03/5eN5FQjCDHEuFBaempvcvpo0E
	yS+W26v5OyUREIgAQrTIaik=
X-Google-Smtp-Source: AG47ELuYz7OuIOrGsgzVmE6vZZdl/Zd7eXBuN/XnS43isrwX1H/81gQ2OoyRX+EMMTL3vzLBrBFTaA==
X-Received: by 2002:a17:902:b697:: with SMTP id
	c23-v6mr18967077pls.328.1520395426541; 
	Tue, 06 Mar 2018 20:03:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:21 -0800
Message-Id: <1520395408-19266-18-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 18/25] xcursorgen: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
index 27a38c1..a21dc42 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
@@ -7,6 +7,8 @@ SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.b
 SRC_URI[md5sum] = "09f56978a62854534deacc8aa8ff3031"
 SRC_URI[sha256sum] = "bc7171a0fa212da866fca2301241630e2009aea8c4ddb75f21b51a31c2e4c581"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


