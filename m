Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6QoR-0001L2-HC
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:37:52 +0200
Received: by mail-ew0-f47.google.com with SMTP id 1so2516009ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ZaNSoznnMRAolts0sdU5LK1yvKzdf/LwTIFZMMbaKLU=;
	b=In5knWVfHE81TWKXfBAlgviBLxKZBdQtiqfSg8mava5+fTgIYClPkbpksgVdax6/rk
	SuA2r5jK+7C4zhaCJpHv3ngOXyTKFXJUw6Cp3FlDxAiE4tIHsenh/xWGfYAmOT7/05wq
	Dg5NDrtdX2CREns+5esRBe3hKwlxFiicuxM6k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ELDIJy8OFmADSW2WtxtfUccroiSYNWpik4f919o1+CQaos1qCeOxa/pagOZ4RjDuHR
	Bb6O2AWYFK1no9I6SalNJIo0eJyIQke/P27D/HmZ3Aijno+/Gwsf/qN+kuGYa6Xa3RlO
	DHtM+bnI8Ie9XasGrl9RkVXeUfJnHnzJOgcwo=
Received: by 10.213.28.4 with SMTP id k4mr2097859ebc.41.1287074244724;
	Thu, 14 Oct 2010 09:37:24 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.37.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:37:22 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:44 +0200
Message-Id: <1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/7] mono-mcs-intermediate: remove useless SRC_URI += ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:37:52 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/mono/mono-mcs-intermediate_2.6.3.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/mono/mono-mcs-intermediate_2.6.3.bb b/recipes/mono/mono-mcs-intermediate_2.6.3.bb
index cd5bcae..8aa54d3 100644
--- a/recipes/mono/mono-mcs-intermediate_2.6.3.bb
+++ b/recipes/mono/mono-mcs-intermediate_2.6.3.bb
@@ -8,8 +8,6 @@
 require mono.inc
 require mono-mcs-intermediate.inc
 
-SRC_URI += ""
-
 PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "b1dc21bac2c7c75814a9f32246eadadd"
-- 
1.6.4.2



