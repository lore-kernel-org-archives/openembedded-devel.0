Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 54E4871D42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so15747333wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=F41iAoN24E+xeD7lJVBNCjn1PeQmZZsuOeHcD80JV0M=;
	b=vX5Q2TO64pXvuKlGSLeVUbKsF9tANC3luhnSh+1YCVGk2VeQpAy1MEbc+Ak+jWVDIN
	Lnd1ri1L0shbt+0w6okw91wSeg7B/AnDfwtHuE1Ceaz8DcZgFRfRjxRyGuN8DBEEXuKL
	ySpQPBeTy3gqk/2sp5JK4x5E9TG0mSj0EQ/Mx2t3kdAxPZHCnnxQfct23qR1gSOipk3d
	s8dzsECos+TUkUUi3LBsY0JmTciKSjR3fX4jdLJyT/dWSVRbhJu9XU2lsDaxKIk/qw4S
	TYO4RlXRAlGdOPtRwV3YhUbjM6yUL0GxFXk+vdfGC1IgNnB4ohNrbdGXdFV8AeR16Kcn
	Hlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F41iAoN24E+xeD7lJVBNCjn1PeQmZZsuOeHcD80JV0M=;
	b=uGVQMlS7sRbZTx0EH7s+LlEN8I6vUXOrvkcL6zs8G6Ys17Q2kRFCnrztsvo1KtVsBz
	jeIwhZ8LLzyIvhH1EN93ahi/X5vk2xMCg2vTpnFmoNyK+ucSy5LaiRAbLXERkyYXMLsx
	yZ6kGcKUUAjU9BBdYiriDJJK8gd6clP73N7qc1yqk8U3+lsm+nuEYF/f8Iya5U2bu1cv
	svO0RM4GdqAy/tEGHaO9KvmlS0ybEfZE1pWbpns8mJbgNjq2JDmAhsihof+7KFK4ad93
	8CujDFWWzjnflv2HExgNDoEt8QYMt16s01513RBGgYQThw+MaGh6y0mt0WBe81QTrWmL
	Ua6Q==
X-Gm-Message-State: AMke39m177fxrclGmmY9+3cYw5xn6t8CzHAaojrsogAvZWKhQUd70UtapBiBjRp7ctl08w==
X-Received: by 10.28.111.75 with SMTP id k72mr11760870wmc.39.1487614037016;
	Mon, 20 Feb 2017 10:07:17 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:17 +0100
Message-Id: <20170220180700.29836-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/44] pavucontrol: add pulseaudio-server to RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 18:07:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pavucontrol does not work without pulseaudio-server

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
index 51e24c4..e9f5d49 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
@@ -13,3 +13,5 @@ SRC_URI[md5sum] = "176308d2c03f8f3a7b2bd4f4d284fe71"
 SRC_URI[sha256sum] = "b3d2ea5a25fc88dcee80c396014f72df1b4742f8cfbbc5349c39d64a0d338890"
 
 EXTRA_OECONF = " --disable-gtk3 --disable-lynx "
+
+RDEPENDS_${PN} += "pulseaudio-server"
-- 
2.9.3


