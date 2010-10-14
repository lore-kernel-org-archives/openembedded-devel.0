Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6Qn2-0001L2-M2
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:36:28 +0200
Received: by ewy1 with SMTP id 1so2516009ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=5lyGZBttocNdOfGgLslFZ3tdCORzgUczH4KES6mFNB4=;
	b=ha5CvbnBZCeOraMlCdg0GZtQqF5DzSqUqgjCG0e3mjniXLM6YgpVEFNNJyr/ec9WxI
	mpfjV6K+xUMmFuC717/WDg0FAZnSTx09uTcZdXEHQnIpuRTl5GXAwUYlwLHEb6i3vfdj
	70YrFxFcfu4B6tAbv5n6BpLNitQsuG7QV96dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Vg5c0DPEzBYplAUpJIHRM2A9ttiqCfpCLnO7D04ZRg9J/ah/qf/8+kDhkPlxC8rjjo
	0tZQbS1SzcBf+NYywFPUSWSNlVdeRyrC9x5goMk8jPhJ/VhwH5u9PSiVuNkss0PMdK80
	EAz1sx3FXNFTA1F/VPnRQaQtLYn6JklH0fAE0=
Received: by 10.213.4.71 with SMTP id 7mr327842ebq.25.1287074156283;
	Thu, 14 Oct 2010 09:35:56 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.35.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:35:53 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:40 +0200
Message-Id: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/7] gsmd.inc: remove useless RDEPENDS_append = ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:36:30 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gsm/gsmd.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/gsm/gsmd.inc b/recipes/gsm/gsmd.inc
index 1b8ad29..5210edd 100644
--- a/recipes/gsm/gsmd.inc
+++ b/recipes/gsm/gsmd.inc
@@ -16,7 +16,6 @@ S = "${WORKDIR}/gsm"
 inherit autotools pkgconfig update-rc.d
 # handle update-rc.d RDEPENDS_${PN} manually, we don't need it on
 # anything but gsmd
-RDEPENDS_append = ""
 
 INITSCRIPT_NAME = "gsmd"
 INITSCRIPT_PARAMS = "defaults 35"
-- 
1.6.4.2



