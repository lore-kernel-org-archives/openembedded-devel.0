Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3D27077088
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:36 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so34064686wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c6jYIU5r0pSWSZuL9G8bwprO91q4DGgs9/Kld0tETfY=;
	b=a/LXfzpOV9HFrQdzv2QCPHV4HzmgX9swv8RZCCrAeVlekIM+vh7m0bE3Sh2vfrbQRK
	S7/JkaLnIyO+NWqXtDdCJEepWCqvpIjsWpzjAlXDsj1CNkORnmFkVlypE8DJ3n1iqFJO
	SaTi66ys110EUVBxxVEphCno6E0Yaw5lTscpcUY7EnIk3v/wXbME1+RvOraMw5w5jVp0
	nM6xJmziOrJzWGFLpc63AQzN+kvWwcSAx46INevJudWuiHgdwo9IZFfKteYGD1WgQSGx
	3z0Vjqzjo/+6m1+YHeWyTYn30qnU4A63e8bTLGnRvMl0gwWriXpuHqdrLLrZR9XZeh05
	IuwQ==
X-Received: by 10.180.106.97 with SMTP id gt1mr4121832wib.4.1443713376693;
	Thu, 01 Oct 2015 08:29:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fr10sm3711668wib.14.2015.10.01.08.29.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:21 +0200
Message-Id: <1443713428-8635-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 03/10] libnet-dns-perl: blacklist, fails to build with current perl
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
index 9dc4268..312a812 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
@@ -23,3 +23,6 @@ do_compile() {
 	cpan_do_compile
 }
 BBCLASSEXTEND = "native"
+
+# Bareword "Errno::EINVAL" not allowed while "strict subs" in use at /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/perl/5.22.0/IO/Socket.pm line 135.
+PNBLACKLIST[libnet-dns-perl] ?= "BROKEN: Fails to build since some changes in perl recipe"
-- 
2.6.0


