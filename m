Return-Path: <koen.kooi@linaro.org>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 May 2014 12:29:56 UTC
Received: from mail-wg0-f41.google.com (unknown [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B180E6098B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 12:29:55 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so299608wgg.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 05:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W+f+U5Yk5b7LsMLaozq7y7vyVGCi/POZeEu02BESOag=;
	b=EgY0AguOSoANcqRVvE3zz2m8vyLSlqtJowlHeKH7c/aqkynmmzNG11KkYch+PNeyYr
	/AT/Q4T0Qh8Zg+Wfu72mzmK7RHLA9up2/9OrFjreVJwwCkBK6TxgobtlWXqTBlaJpATI
	4hSWgSvExr2sKBHonmpe5iqe6jHKQyIHqBVj8toBXQY+MLxqSbY6lK4gleO7TVF30GBt
	rN3iO7lCPBsQxiEZo0exKFizWu9OeGJTX2ZAd1Wgo/pMflUM4wlRf8VVH72p8/dL8exw
	ErdSGQOSSCb4jv6a8Z4ZafWsksyJ9FhIURTXAZxftQStx+WUsbalArtlE0JDPW/6bx1z
	D1nw==
X-Gm-Message-State: ALoCoQm4cikCsmR2TozuUnZz0+opHU2Ciy3u5x+rG8V9lBT+k6ZOPq4KsId8OeEUAd5pzjupOgM/
X-Received: by 10.180.93.41 with SMTP id cr9mr20675562wib.7.1399983779117;
	Tue, 13 May 2014 05:22:59 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	ej2sm22034530wjd.21.2014.05.13.05.22.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 05:22:58 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 14:22:56 +0200
Message-Id: <1399983776-26237-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] gpm: fix S!=B failure
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
X-List-Received-Date: Tue, 13 May 2014 12:30:02 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
index a30a891..7022057 100644
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
            file://eglibc-2.17.patch \
            file://init"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "gpm"
 INITSCRIPT_PARAMS = "defaults"
-- 
1.9.0


