Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id E16E67D5BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:22:17 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id c81so2720060pfc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Li9zX4WCRJmaDhxK0tghbOawlDZMhtvVFeijYUa8kYY=;
	b=UvzdcC9mfRXLOMEG9uZ0G4h7qSfxBOY+SRlJtqpUgDEhe5f8hzgpVd2VNpQHkGKjyJ
	jWR+b6gdFPU7Aznm6xjmc4nPErP4waZNBFbH+XxLH9SYXCX277LxoNxVPK9OBmYhbAeL
	bGri0r7RLDkMwtWCNrqYQgeoZJc99nGmTsWEYFRmq/L1TPt0Qe9VWbCMVjDKrSmzhcf6
	6Y0nHMwe+SMtuR5ESIyEc3+yrSh+M2WQhPIvrUuJDb2OfWGPIXqah+dEBACdTwPrXDBf
	376FObTBGZxzb9C2s0gFEQSCRvRYPbEuxfYREIK8ITQOxfMj7ue26046Z3qEBB7GgkND
	0nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Li9zX4WCRJmaDhxK0tghbOawlDZMhtvVFeijYUa8kYY=;
	b=qB0Hr9SjGQ1tcapLVeG/4Awg9TBzFqQ6Lf5snXmZnahha2oDt9VlyJyWqJOE1CUUHe
	OoxLQQbPii1x5vY8neiNrrW+5n/qyhTzisJFsVu7trmlKcAdACO30fwhq7lwSC4mZqRU
	PwCoodzjHjT8VhEw+tkayjg8FiY0tIKr5o4UXH1Psq7pQoll4t9cguFJ7T4MZzkp37uB
	DvljKhj0Nk1tm+DXh/LpradRO19O/I3RkLMwZ7bAgpCqkoqPNZtXmVzBXQiigPWUH8ei
	b+OIb1/wf4ZSlXDODSorEOA1aHobT9sz7R7feewxIiEJ+pSrHaCXFgmdHNHhmTrBOCet
	p96A==
X-Gm-Message-State: APjAAAXytUOw64h8wZVGtUm3T33hTmReCumgWlZPgZUkcAmzZFLXb/4I
	pXrfOn2/oj62sBIbBmNJHldUAyGXJ90=
X-Google-Smtp-Source: APXvYqxwez3E5C+KIEHsda90LvhdzcdME7xCfkYn0mKCq3XqZzl1oEKih5heqGwhgzsDYzx4xOLalQ==
X-Received: by 2002:a17:90a:18e:: with SMTP id
	14mr11431904pjc.66.1567106538646; 
	Thu, 29 Aug 2019 12:22:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id s16sm4893281pfs.6.2019.08.29.12.22.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 12:22:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 12:22:06 -0700
Message-Id: <20190829192206.1200-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829192206.1200-1-raj.khem@gmail.com>
References: <20190829192206.1200-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/5] drbd: Upgrade to 9.0.19-1
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
X-List-Received-Date: Thu, 29 Aug 2019 19:22:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../drbd/{drbd_9.0.18-1.bb => drbd_9.0.19-1.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd_9.0.18-1.bb => drbd_9.0.19-1.bb} (84%)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.18-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
similarity index 84%
rename from meta-networking/recipes-support/drbd/drbd_9.0.18-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
index 6fb621a1f4..6683781af5 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.18-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
@@ -11,9 +11,8 @@ DEPENDS = "virtual/kernel"
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
            "
-
-SRC_URI[md5sum] = "f2e6eaa92861252af0b564f0100f1859"
-SRC_URI[sha256sum] = "d6b4188ed01d8555c78b04b5e31532d5990ca98bf063230f3e949ee8a7338d58"
+SRC_URI[md5sum] = "bd1202eaaf81641752d0c9b003b10f6c"
+SRC_URI[sha256sum] = "5b3d2bcb99542940e40af903dea783cf04524e9f41cc530e210d2c15ef84fa58"
 
 inherit module
 
-- 
2.23.0


