Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vzapolskiy@gmail.com>) id 1ON6De-0001Bm-J2
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 17:32:31 +0200
Received: by fxm9 with SMTP id 9so847076fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=nvRomb6MpiWsTwHAJViI1LpQ89mLERGb8s0q7cJtL9M=;
	b=P6ukbfqTlPdGZvxVc0tvGUJyqNJpLwgMd2be/ympzMsbE2lkMeQZCEyB/iJmA6E4KK
	drHQT0WBZgH/JyiqxxRxuHfm7ypq6O9Y3eBEi+CLI19e2HM6RWj9QkEfz39ZQMeo8ccl
	58kt7Ma+1mRgfDqRtL7JxPVBtP7icuv+BK1DU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=xLOjQFscj8QkJ+Q4L89r85YkAQM8lBKciYu94q0BO+LX3s8/NCmZ8buxu2s56Xmd0m
	TSPtuafJPaB0JIbmX+QQ4PSzWkiKMKx+Je8Vy7wWu0M5r/HryhXj5/PGtNTTMxgRwkqM
	q3nSLR6PZBlqOKzfe4ZDPMj5DdyBEcVbqUFZk=
Received: by 10.216.85.73 with SMTP id t51mr1115861wee.3.1276269593392;
	Fri, 11 Jun 2010 08:19:53 -0700 (PDT)
Received: from localhost.localdomain ([82.203.205.227])
	by mx.google.com with ESMTPS id h1sm586994wee.7.2010.06.11.08.19.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 11 Jun 2010 08:19:52 -0700 (PDT)
Sender: Vladimir Zapolskiy <animist@gmail.com>
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jun 2010 18:19:44 +0300
Message-Id: <1276269584-13266-1-git-send-email-vzapolskiy@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: vzapolskiy@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH] libvpx: pass disable docs installation configure option.
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
X-List-Received-Date: Fri, 11 Jun 2010 15:32:31 -0000

This change fixes an installation problem, when *nodocs* directory is
not found.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
---
 recipes/webm/libvpx_0.9.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/webm/libvpx_0.9.0.bb b/recipes/webm/libvpx_0.9.0.bb
index a59d94d..9b58727 100644
--- a/recipes/webm/libvpx_0.9.0.bb
+++ b/recipes/webm/libvpx_0.9.0.bb
@@ -22,6 +22,7 @@ CONFIGUREOPTS = " \
           --target=${VPXTARGET} \
           --enable-vp8 \
           --enable-libs \
+          --disable-install-docs \
 "
 
 do_install() {
-- 
1.7.1



