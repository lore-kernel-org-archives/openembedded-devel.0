Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E8BBC78CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:39:23 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d22-v6so3120149qkc.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 05:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ojAOt1AHq6tscwfy6gXoi5NCtZOtZ9FD8bS9ovVpWfQ=;
	b=PG2jbWvczng6ESZZoZENmOc2AeLtdHP4i4Buagxx/flNN4ZQ5BZsuK//ULVpeLp/8T
	DizRAFZzn9wyoTXutuy4V2mnqiyASHBvdbgSm3k6oFb0jEj/qEDPfFhTHgNC3tq1qVw3
	gyPpQOgSOOPgoArB9Dv+wY8vHFs9WqOxdnn+sktzFAFLRy38NCyyDYrp+l9StAbXldDD
	l42caqrLwZhw4mzwyDoB1jQhLYdc95Qh+w8y8IgjmC4zyvlg7Jr8No9HVn7GvRqMakCb
	B0Tgpxl+cAi6vUdeyIYtfIY0f/tta3Jju9Joi5EXWTtaPbNfTdN1yIIpDFGab/54u0sp
	qezQ==
X-Gm-Message-State: AOUpUlHcwhXLXKFCm1KlLoeMd4VpdUcNJvQV1RVAbh1LiPzaAYsZ+3k+
	qs/VHS2ZgFhsPLtk0H57kBrGmAHr
X-Google-Smtp-Source: AAOMgpeBCppCLHy8Ao7gTBCNYqNP/AxJF5uPpCV3w4qenIiRTbSs125f2IN4XHwMkdebowJTjXSApw==
X-Received: by 2002:a37:2b89:: with SMTP id
	r9-v6mr5592487qkr.389.1532695164433; 
	Fri, 27 Jul 2018 05:39:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w13-v6sm3014930qtc.88.2018.07.27.05.39.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 05:39:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 08:39:15 -0400
Message-Id: <1532695155-27937-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-daemon: fix build dependencies to use the native version rather than target for docutils
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
X-List-Received-Date: Fri, 27 Jul 2018 12:39:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-daemon_2.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
index 4c18e2b..ffb5beb 100644
--- a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
 HOMEPAGE = "https://pagure.io/python-daemon/"
 SECTION = "devel/python"
 
-DEPENDS = "python-docutils"
+DEPENDS += "python-docutils-native"
 RDEPENDS_${PN} = "python-docutils \
                   python-lockfile (>= 0.10) \
                   python-resource \
-- 
2.7.4


