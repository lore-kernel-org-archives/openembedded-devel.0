Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 12C736BDE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:28 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so336204eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=eeAKxZAVt+IPiW7TFFaeBou+QKEPMofuxUkqfBONoE8=;
	b=JUa9qoLeCOm69kkGTLmfnZHJdyPT2ns7it1KsxTtM/3u0zuOOkqSSd3hqbeI/77pWE
	64RK25joRSvNcA1OSeQtWgd4VMazfBPgH84gxX3CrNNw+4SMSTC+JDm50/DivG3CsiEs
	RXTjGFjJubMRuu7pPg6XfqycLXQgMb2aUDsBoks4fQb1QOX7tsGxbaSZ06DD751tyIBM
	f58o8qdEVc2eB8QARcz1z8abZOOiVAKnafzVqi8m3YXgYOUIFvlAKfBqJw+MNPE/yZXn
	KKf1pPeOYoVLQgtwyZqyKAI36z8BZZtasNwxB6WeZMvMhCiSbfNHThByY6KGfvcBsBsl
	SMKw==
X-Received: by 10.14.183.130 with SMTP id q2mr5452600eem.5.1377791489506;
	Thu, 29 Aug 2013 08:51:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47238084eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:23 +0200
Message-Id: <15d7eba1a767242b3ec54f19e584df8e28911823.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 30/66] sox: Add PACKAGECONFIG for mad, id3tag and lame
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 25b3d5f..cebad44 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -16,6 +16,9 @@ PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaud
 PACKAGECONFIG[alsa] = "--with-alsa=dyn,--with-alsa=no,alsa-lib,"
 PACKAGECONFIG[wavpack] = "--with-wavpack=dyn,--with-wavpack=no,wavpack,"
 PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
+PACKAGECONFIG[mad] = "--with-mad,--without-mad,libmad,"
+PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
+PACKAGECONFIG[lame] = "--with-lame,--without-lame,lame,"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
-- 
1.8.3.2


