Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB194783D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:04:30 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id p19so33038054qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7e4kGKIYUc1bodpUOBrXj4upgn/3AjQPKN0fyU3BocY=;
	b=o7hl+tPRW7y+DfABxgAFGtIAA7QTRiAZrYEHbql7rMUdAweBBt9lpb4yFWBaRBRoB8
	4aoJ46SEdvYr+YOPLV1vquvRh99Y+OqbQGeilV/QJMYM1oJAKUSYQRv7pgs5Eph2naVs
	OwKeQpJVm8lKpOHoIJbPnvpmP3e0gQ/NQ9kSMXk/4cupbabnSID0MoVqLQBdyrGiYuA4
	/KIgO4tHoUriiR4xNA8e6823UzFCQ4XS5fvt9CUyRBNzvPdQlaKR+shKVGqFI00AmbWn
	dqcqWi/RJurhe98+DU5oTl+Najtqv1ZyqZM23LpWxssMdni8X3z3JhT1Y9b2PzRL3XGB
	OemA==
X-Gm-Message-State: AJaThX4zUyq7tbbLm2OQvVPnxNRllz7yyL/Y8NdElct3xuuwGWsxT7vp
	6IieqhEjRKjkKduWPMryluUIkUjV
X-Google-Smtp-Source: AGs4zMZI306UrDrR0nmfkNRRemBcK9Bo6jpV5ApBjqTjncF7HAQvz1SXwDlyD0CvRB72CShoeOnj0A==
X-Received: by 10.55.76.193 with SMTP id z184mr28988106qka.346.1511798671671; 
	Mon, 27 Nov 2017 08:04:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id l9sm20953182qkh.2.2017.11.27.08.04.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 08:04:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 11:04:24 -0500
Message-Id: <1511798664-17286-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511798664-17286-1-git-send-email-derek@asterius.io>
References: <1511798664-17286-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python-django: add native to BBCLASSEXTEND
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
X-List-Received-Date: Mon, 27 Nov 2017 16:04:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 58fd70a..e4ed860 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -11,7 +11,7 @@ inherit pypi
 
 FILES_${PN} += "${datadir}/django"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.7.4


