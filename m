Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5AF74A27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 23:21:15 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id p9-v6so2460302pgc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bw5A+J7ojd+CROFvBoVY94U7zwfyKV60zjNtxkiC0yU=;
	b=YRZi/o/i9OGTdSRUCR6dV+5fWeilmDk1l7ZppbrHu1KJ7uX225RiT7HJd9PVvxNjqe
	UFugj6B+8xMB/zhk1OsUV4UjxnLXK10uoYvRls4bgyKkp3ZxY6vd1XoF1Sk7ulmXAgll
	GZHzsDNCHvYmCHRScx5GyJ9J+ZSTfp+M7Y6G4iU8nBpevUYKY5Qc59sQnNhoOXueGq8T
	EAff7flUKAgfvBJp/MM9YVP6LGAs7OLNBLud8vq6/Mi/eHPpz/E09YrlI2+w1JLjQ5LM
	x69bpQXK5xFa/dGOHCxT6x3Ml35jUxfqo7VEV+CGOyiCOB7R0f8vNumOxGF9Ae9L/P7e
	KPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bw5A+J7ojd+CROFvBoVY94U7zwfyKV60zjNtxkiC0yU=;
	b=JFgM9ANd1eH6KtMHriF3R/K3nYSs8byDS+S8QthWF+JMwHpRydk9ZEYsfV4OXK14mT
	2KF2ISl4e5CKk/+UxeKFsUGZANviPH8H23ShHNNZBaL0c5k6DTJNvOJTcRFOxbqMmXUR
	+/vtw1xEIeSFgRM4ihk7Uc55OHomzFYRq/X7fmrwGpwlWmfcM3GUv9C4be4ePXTJh8kw
	vTyXxlr/VvWD5NvfjjMlHsUj5X+XpvRx7ZWuBR1WXDh2PjskBx3+fzWqktHAQWnP/01Z
	eRD2YheLBbcPeYMYW1KvzyDhvPrCYZDqwqUCOTO7uuCqmsB0ofGJqA6/fUYMlKCQ97Ql
	0t4Q==
X-Gm-Message-State: ALKqPwc+a64dGE/NeEdhR4VZGPwwEaVibHcovURaUXGEw3z+7XANIu3i
	fGLH/iohLZCFW26RTMua6z6FQA==
X-Google-Smtp-Source: AB8JxZofXmMpSyd4dbbCzTc16d3zQOZ7JqRxazZngZuXV5SIl8fRTDW9n+NE69ejtRAhQ9wYFsbJhg==
X-Received: by 2002:a62:ae13:: with SMTP id
	q19-v6mr6916483pff.155.1526599276605; 
	Thu, 17 May 2018 16:21:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	u70-v6sm13828212pfk.121.2018.05.17.16.21.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 16:21:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 16:21:10 -0700
Message-Id: <20180517232110.22663-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517232110.22663-1-raj.khem@gmail.com>
References: <20180517232110.22663-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] libvdpau: Rename dep dri2proto -> xorgproto
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
X-List-Received-Date: Thu, 17 May 2018 23:21:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
index 31bcce066f..b79a562c8e 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Video Decode and Presentation API for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 
-DEPENDS = "virtual/libx11 libxext dri2proto"
+DEPENDS = "virtual/libx11 libxext xorgproto"
 
 PV = "1.1.1+git${SRCPV}"
 
-- 
2.17.0


