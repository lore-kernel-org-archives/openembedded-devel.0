Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR2Jb-0002sx-Pm
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 17:24:35 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so1897910pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=EbxNIu51ovjiNHE46cp0W72tTkQ7m2w0sA3IyPgKGo4=;
	b=Nbkz79aRwOlNrwkBncfv5HKg5y7ln87tpqebOqrXPVk1zb72Xn+36aqzo0ssmJ+rib
	2DKJh8k0a5ZQM4yyP2up1O3YP+TLsLYfxUnp0W45iZdkB1cskzSmPYfPVZnHQdHf1VQ7
	mKuQno/QqQbA9gifaNDhp3ogwSLgbzqXeJtzxLjYRB2i8hi9K1sQRVkm2Q5Zy1JQkr6I
	+Hr/UnpO03XiduEJMqRyPDK5d5zq7WxHbuPhAdagqg0yor04wGTMav9QdSYTZcG6bPnS
	69BLtGH+E5ECzEw01HdwM3cf93fQ1IUorWgTvl+fMRo0fyIi1ST6HYfCq8TFj1zTNrjo
	cNgw==
X-Received: by 10.68.51.135 with SMTP id k7mr7882816pbo.48.1365865624999;
	Sat, 13 Apr 2013 08:07:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jk11sm12944071pbb.0.2013.04.13.08.07.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 08:07:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 17:06:57 +0200
Message-Id: <1365865617-23523-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <20130313111817.GC3260@jama>
References: <20130313111817.GC3260@jama>
Subject: [meta-multimedia][PATCH] gst123: move to nonworking directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 15:24:37 -0000
X-List-Received-Date: Sat, 13 Apr 2013 15:24:37 -0000

* gst123 is still "sometimes" using wrong sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/{ => nonworking}/gstreamer/files/display.patch     | 0
 .../recipes-multimedia/{ => nonworking}/gstreamer/gst123_0.3.1.bb         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-multimedia/recipes-multimedia/{ => nonworking}/gstreamer/files/display.patch (100%)
 rename meta-multimedia/recipes-multimedia/{ => nonworking}/gstreamer/gst123_0.3.1.bb (100%)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/files/display.patch b/meta-multimedia/recipes-multimedia/nonworking/gstreamer/files/display.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/gstreamer/files/display.patch
rename to meta-multimedia/recipes-multimedia/nonworking/gstreamer/files/display.patch
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/nonworking/gstreamer/gst123_0.3.1.bb
similarity index 100%
rename from meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
rename to meta-multimedia/recipes-multimedia/nonworking/gstreamer/gst123_0.3.1.bb
-- 
1.8.1.5



