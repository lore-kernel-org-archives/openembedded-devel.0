Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1E07191F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:49 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so27477wgg.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=kBMHjgG1dZ9MjJLLX7hZvHvX9mNR4UAESipjDonTI1w=;
	b=BgIraX7ST+Zg9D6wN+/ed31mBgqrzuZCofQFeDCPkBz1VziKDNHGZCCEXwnR0P2sqP
	4XlhIBp859FhHokngVZCnYccBcwgcZuV4eppsd0GWCFNhSgHbq23Arvsa8Oo1rUtxRFE
	EPJPWjZBpUnB1gte3rbwiTX0bE0rrkITbwMC6Ic6kBgknvh4BFVJ0NtqA6Rjo+HLlcrp
	70rZRRQ0/H/3bFS7ozd8/R1j5FSys1sfRicd5w7g+rdF3zlhBjnSbOXJpPmqJbVpy3my
	79cpvGalhWxm6eZqD+fS2YHRMNX/ttFGCCILaz1lkA0ihK/J3/KZkJfoYF4o3SBb1Wqc
	Hi5g==
X-Received: by 10.194.24.197 with SMTP id w5mr8131720wjf.71.1413324890970;
	Tue, 14 Oct 2014 15:14:50 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:24 +0200
Message-Id: <1413324868-11856-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/15] packagegroup-xfce-extended: add xfce4-mailwatch-plugin and gigolo
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 32f220c..f32ef46 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -41,6 +41,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-equake-plugin \
     xfce4-notes-plugin \
     xfce4-whiskermenu-plugin \
+    xfce4-mailwatch-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
@@ -51,4 +52,5 @@ RRECOMMENDS_${PN} = " \
     xfce4-mixer \
     ristretto \
     xfce4-taskmanager \
+    gigolo \
 "
-- 
1.8.3.1


