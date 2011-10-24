Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH7H-0006ag-CQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:47 +0200
Received: by mail-ww0-f43.google.com with SMTP id 10so7127460wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:53 -0700 (PDT)
Received: by 10.227.195.196 with SMTP id ed4mr9015519wbb.96.1319449253151;
	Mon, 24 Oct 2011 02:40:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg13sm4458399wbb.8.2011.10.24.02.40.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:32 +0200
Message-Id: <1319449234-12080-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1319449234-12080-5-git-send-email-koen@dominion.thruhere.net>
References: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-3-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-4-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-5-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 6/8] live555: fix build due to missing INC_PR
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:47 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/live555/live555.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 8d026a1..e47bacf 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -7,6 +7,8 @@ HOMEPAGE = "http://live.com/"
 LICENSE = "LGPLv3"
 SECTION = "devel"
 
+INC_PR = "r0"
+
 URLV = "${@bb.data.getVar('PV',d,1)[0:4]}.${@bb.data.getVar('PV',d,1)[4:6]}.${@bb.data.getVar('PV',d,1)[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
-- 
1.6.6.1



