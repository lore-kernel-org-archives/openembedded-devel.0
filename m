Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SOrBI-00078b-KE
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 16:02:24 +0200
Received: by wibhj13 with SMTP id hj13so2419208wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 06:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cNlaw3mps8IkmZWSMYQagQ3IOmB+Su/0yGGJ9nvLthY=;
	b=ptTkVeWPVBqGD4fzGuNW+3C3z9lSkkFE3OqcVJBJ9u9ciCwxyILbsNSCApF8XK+lOU
	X8ZzV1yk6QE1qAey6dMAHbF5Cgj1/YkQ5sZX0yTv+QbyCNBEWud6LQsj2a6+Ep5XrQAl
	kvB5bpjSOFnsdiUAeDP/Hv6GsA2ckOZFvyLxT7A4j7Ad2WeQ5QFVy6CCwKDpagnJiljQ
	t3OZXzvWuP57LPkWnGMW5ZW9bav7zbMLFSwif1OWEugSvsGuMxduwkaLVbLBCU4oGoqi
	EbbgLcAtJZFlOJCLb4O37Bh6tZA2oC4X/RX9/GY4DMwj/1wglDx7KNV5JzTnEkf+F/BA
	jihg==
Received: by 10.180.88.67 with SMTP id be3mr29011169wib.20.1335793962447;
	Mon, 30 Apr 2012 06:52:42 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm45366233wib.8.2012.04.30.06.52.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 06:52:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:52:37 +0200
Message-Id: <1335793959-28130-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmlU2xE6HjnBbPZMHhxHKokVC/br3tICp2Wma6YRu3gJqXSpiNYNfHUxnEU5NO6/JDCokVE
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/3] yavta: update to latest git
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
X-List-Received-Date: Mon, 30 Apr 2012 14:02:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index 705bf7d..054912d 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -3,9 +3,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://git.ideasonboard.org/yavta.git;protocol=git"
-SRCREV = "d62cb9d7435525660fd5c97941c7cf57921370b3"
+SRCREV = "82ff2efdb9787737b9f21b6f4759f077c827b238"
 
 PV = "0.0"
+PR = "r1"
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
1.7.10



