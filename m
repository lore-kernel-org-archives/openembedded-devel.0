Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com
	[209.85.161.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9395678DD2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:44 +0000 (UTC)
Received: by mail-yw1-f44.google.com with SMTP id q129-v6so13137740ywg.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N3UrITamLGjz6SnzgyqU3SPVKnwysXhzA8weiAcgb5o=;
	b=p7SDkpckxsTzA1h4NDLysagNOcd1ygiTgoYEb6j1i4RePaT6efMeZ4cK17f+fuXWOJ
	T44sZPYVsId/PIX5xK31u6tvwyIIYnfOD2RPEMIvu3Wmcxs6+BY5DcUVirVrpgOzDmH6
	mZLvboYuEkrpOeBQUJdekE8artxKo5JliWTMpOgB2Wj3VkozXfiXTfoc0pxHnu6tXLZh
	z3pJm+U2GOptX3sDKZJpWrznQGUNqPWYOcDhZr67Op6liQeRqOpjBVhQzJ1+hWNBG/hI
	PjQGXC6fvOMeB74CYiHUv5N50kONliXxKCqwTGZ4FUWBGKmotVjIy3aHycMkQdMHjlpu
	ML2Q==
X-Gm-Message-State: AOUpUlEPJ0r/qOUzJBL0km9DsFfQkISTIGyyeYMjKJCF/z9fBb+hb5JR
	gEjuLQWIRIHsi7uQ81dMZNxaEtAG
X-Google-Smtp-Source: AA+uWPxIgNUpy7SYBMz1HfSJPfER/lWJZmM3C+WgdKeQC30wJgBpeg9n5PqvxrakhBUI0vZOK8EYsA==
X-Received: by 2002:a0d:c004:: with SMTP id
	b4-v6mr9517153ywd.289.1534154985525; 
	Mon, 13 Aug 2018 03:09:45 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:45 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:30 +0100
Message-Id: <20180813100936.23663-4-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 3/9] openjdk-8: remove superfluous compiler flag (-std=gnu++98)
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

These days, OpenJDK-8 adds this to the build itself, no need to do it
again here in the recipe.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 0af320d..4e52448 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -253,4 +253,3 @@ def version_specific_cflags(d):
 
 CFLAGS_append = " ${@version_specific_cflags(d)}"
 CXXFLAGS_append = " ${@version_specific_cflags(d)}"
-CXX_append = " -std=gnu++98"
-- 
2.18.0


