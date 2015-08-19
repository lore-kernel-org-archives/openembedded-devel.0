Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5425C75E81
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 15:06:00 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so5242670lbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GNGO4WQNordbwjHQQjmt1N9dFBFY0TJ9oiaqbPcWBFU=;
	b=QtR/CKLuvmtHLcHVfOwcSWlGXBJ5mwCzHT/arsGlu3erKGCMFHUCH96WPJYZCvED98
	v9rhqd+kw1FZXoZ9GY79iFAzC6vGZ3xY5Vnezy17CIuzOOKMXurjfbtvMAjmC24tF30d
	wiVVJDDw9867LsUOaJXIaw2h9ffl6Z+x0O4ccyAIvmSnQVxiERIGFK1tUaxGcNS+oqwT
	RYNGZ8/6Q7QG3v0VzzPbvAMWi8r14XUuji4TNo/xWEzkiAft6ikO1eGCuk7hsDIwoTUr
	nUB3IKGeDn4T/3uO/rg4HE0kHjUhJTElPHkxShtvnlSd94FUHp4m8SYXhAR4SV9+/Qqn
	hpuQ==
X-Received: by 10.112.160.165 with SMTP id xl5mr2197218lbb.44.1439996760072;
	Wed, 19 Aug 2015 08:06:00 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id jf8sm294039lbc.12.2015.08.19.08.05.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 08:05:59 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 17:05:45 +0200
Message-Id: <1439996745-4053-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439996745-4053-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1439996745-4053-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 2/2] opencv_2.4: Remove unused INSANE_SKIP line
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Aug 2015 15:06:01 -0000

Credits-to: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index ca378d7abc1e..570de3109a74 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -84,7 +84,6 @@ FILES_${PN}-doc = "${datadir}/OpenCV/doc"
 
 ALLOW_EMPTY_${PN} = "1"
 
-INSANE_SKIP_python-opencv = "True"
 SUMMARY_python-opencv = "Python bindings to opencv"
 FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core python-numpy"
-- 
2.5.0


