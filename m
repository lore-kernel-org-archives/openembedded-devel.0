Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCCE73D27
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:41 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so125431372wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=lNGrAIY2Zkhyg33dcWhHwNmUmyeGX7IBiVxnt/HNxhA=;
	b=eYcLreIpfYkTfCP1mcqnn7fvgKD/or4ZptokMVBhBd5AtwP1eH7tZtzOvIZTnyo+hU
	RW+OHeuB9jBAp5p38zxXhDPK6zXhkJmXeIimNBXECYDylCr5C2Dx/fDWqL3SIBbQ9O6e
	GzDdwRJz/QzDyKKuM4/eOxqcLQNT5OrsvK/mXuRNPa/EbG8I7ZozsLQm2EH86BOLL1+L
	luadrhonBcftgJlGzeFKGyr5v7stbu1jTGScfdDqxfSNiQLzqsolwCdGvY87RaUDda23
	51Tq2qfsBTH/RSRp/cHkyW/BeTdUcu9FXJhdmeqmIZfw0+AqkACVJ6JkW3Itv1VBY3qw
	XnHA==
X-Received: by 10.180.108.35 with SMTP id hh3mr44130989wib.48.1441727021751;
	Tue, 08 Sep 2015 08:43:41 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:54 +0200
Message-Id: <1441726980-32656-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] packagegroup-xfce-multimedia: add parole
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index 00b0b91..72a96f3 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 inherit packagegroup
 
 RDEPENDS_${PN} = " \
+    parole \
     xfmpc \
     xfce4-mpc-plugin \
 "
-- 
2.1.0


