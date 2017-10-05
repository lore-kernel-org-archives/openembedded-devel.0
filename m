Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1C60271B45
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 18:19:09 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 17so3542466qkq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Oct 2017 11:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=HxXnBx1OgFiGvlU66WZR5tKc8HpgFFm8CY85AXeUJUM=;
	b=TM8sgIG3QuVvAAeUEN+KR2geNeRXFMHeu58n7SDUgF/9F/zYVEWkPhGbGPc+v8yeOv
	S3I5vD0KQpO0KvX0CgO3ak4JrIPerZtQ3LDDVSJ+OqziawxiKFqrPtVsvCYbFngbsVO4
	AxHiVBLpd9nufvwy6RcrVQrcXU9HzVOgQlzFu7oRm9gx5eYmzzj/RF7bKz0ZFNzWezWz
	JkLGxKhQcNLzVF+jdZc0W6esiQyKwxnm9trBlyUq3hotLzgx5w2Mor97gjl/Rf+9ZyHz
	sMl1qozwTju8vlHHfQTbCvKObCVzH2rgPjsXy4lBepj0Gg/i0hqWaCHLKGHuUkGHgKTb
	b+Tw==
X-Gm-Message-State: AMCzsaX4l/mWQZYHFDhwvg1aFMa0xYf7/mYMuTwHsurZPRjGLj8YPkk4
	XfD0ISYtF+HRTAymlftdTlEhkg==
X-Google-Smtp-Source: AOwi7QDjYP09i9EQqdJkkDWEC+RPkNpJqAXIorw3/jqdK2NolyYpfjD0PRs2CHQSmcWjiY8C2Oj+EA==
X-Received: by 10.55.116.5 with SMTP id p5mr32558633qkc.151.1507227550665;
	Thu, 05 Oct 2017 11:19:10 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n45sm6940214qtf.51.2017.10.05.11.19.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Oct 2017 11:19:09 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 05 Oct 2017 15:19:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  5 Oct 2017 15:19:01 -0300
Message-Id: <20171005181901.5562-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] meta-oe/conf/layer.conf: Remove "id" from HOSTTOOLS
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
X-List-Received-Date: Thu, 05 Oct 2017 18:19:10 -0000

The "id" HOSTTOOLS should be add to the HOSTTOOLS definition on
OE-Core; especially "id" is used on
"rootfs_check_host_user_contaminated" rootfs-postcommand which is
available on OE-Core thus belonging to it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 3896ff7f0..d84bd09d3 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -75,5 +75,3 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   source-han-sans-kr-fonts->fontconfig \
   source-han-sans-tw-fonts->fontconfig \
 "
-
-HOSTTOOLS += "id"
-- 
2.14.2


