Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBC065CA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 16:01:32 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id m15so767020wgh.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2014 09:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/QKThL1k7tSsPUeifij1zOB6EuB8TbeCNejGR1EMxok=;
	b=eLGLIpfg8DJs732i+XIi9YXrsNyTOMJLREHUalfhd6DPihrohyAehFXFr74fFFTl/y
	vka0o6sTjuSXWZ78MHqUIcYWAujTGWxMewKL44xDxnnQdZFIqW1NJ1AOok3KxEwFaJJ3
	Laa5doTTAa9EOJ7h7CiuIudX6txVdf4yva4aq4p94BwWeCcsvJnXp7VxNMn28c+rBbuJ
	WPFKKi9TMScSD0Vxs+fyrNpZcL9rZSHquYC2f/bRpQlhS5cSbyiYTJ6VktOUFUCxAhWJ
	wkh5fDl1EKNSEtOLDXQusJ+2SiJsndz9BQKDJypdxTKfKvlrRAzDgCxHYFG7oNu6hoNi
	6Fqg==
X-Gm-Message-State: ALoCoQnwGKB6jbDNAZWNnNJNLeQN4665olCmPk74/2tZGQN0WDQUjQHu6e4Zed/D2pbYoOJ90D91
X-Received: by 10.194.185.113 with SMTP id fb17mr4160548wjc.117.1404489691922; 
	Fri, 04 Jul 2014 09:01:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f6sm69829321wja.25.2014.07.04.09.01.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jul 2014 09:01:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jul 2014 17:01:22 +0100
Message-Id: <1404489682-30529-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1404489682-30529-1-git-send-email-ross.burton@intel.com>
References: <1404489682-30529-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] poppler: remove spurious GTK+ build dependency
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
X-List-Received-Date: Fri, 04 Jul 2014 16:01:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/poppler/poppler_0.22.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
index a192882..4e95c13 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "49d55921ce795778c7231fe9f2fe923b"
 SRC_URI[sha256sum] = "4f438f34e63265e2da8427f3423f940ff41c26088922a9f5d976f795c1dce13b"
 
-DEPENDS = "fontconfig zlib gtk+ cairo lcms"
+DEPENDS = "fontconfig zlib cairo lcms"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
1.7.10.4


