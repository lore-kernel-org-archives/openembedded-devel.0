Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A28A47191D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:51 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi2so354055wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uB9NVQfESumf7xKo6+MmnlgXlAncT1pMHSoald4mLq8=;
	b=pkOaHlibxW32LJyLDYRp22g9e8r5+WhWNlRW28ytEPT5SRVaAU2qSdkDLU5fyV3R7v
	eH9bBu97ZYXQsVHyo5mqhl2JgT1Nh1GE0b/kYVsY4DzhHuDUgGY4yePOTvDgl5MFXsbM
	DfpKrUkvIvTQ8XDDBGjBhzCFzOd0vdq6XDOuN4nLA5DTXAjYJ3elYhHXR6vWp1Qei1PU
	PZfdE6yyXoeWuw1FM9flpUKnY7X6tueBxbuYWSfkCSXhsAEh7jcUdZ4OPPxjmDSsXnaV
	FPL3Gcz/jDsfEEwjKUqVbndSdXqutQwo5mYtQumEVpZXrwuNn9vWmvVuoOy1pDR3MP3+
	wT9Q==
X-Received: by 10.194.122.231 with SMTP id lv7mr8119327wjb.27.1413324893020;
	Tue, 14 Oct 2014 15:14:53 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:26 +0200
Message-Id: <1413324868-11856-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] xfce4-dev-tools: add bash to RDEPENDS
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

| WARNING: QA Issue: xfce4-dev-tools requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
index 1d1a082..5884ef6 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
@@ -22,3 +22,5 @@ do_install_append() {
 }
 
 FILES_${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4"
+
+RDEPENDS_${PN} = "bash"
-- 
1.8.3.1


