Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8917C2EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:14:11 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r10so7517418wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qdIFAguhE3QrJ0HJj1JGyc1Vhmss1m810IaWGN03cnA=;
	b=sbu+vPIqHU48Tk/EZ/br3itMDacawGKZnSaJvJAQpmH/H3L1PBVdDtCaeoaVw0XByi
	XED5kC9R3ZDoT/eRt6QcZPTCOCIcQVuBt31985I9wrmoN3R2BoGUrTaCGvS+zEIgEUpp
	1EBBczuUxPIR32xFd8OEd+IC7CHRTDZx5UG5d/23wOLEY5Oy2qUn0pIuf5lbrseLaV1r
	imZxxq4/JLbFXED37R6GgkYsm/vBMZdqC3jlndltVJKruquAzrL38Lut5XWAdi8QNEfa
	cnq38Y4XV+8TZ8+ovN29NmFITTmZ5idvop/PHt8zdLfNLHlms1/nWsqSKpTM6QK79bni
	4Jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qdIFAguhE3QrJ0HJj1JGyc1Vhmss1m810IaWGN03cnA=;
	b=m6U8+NOys8vqVllSc9u/PgDTmoWQrDie3qPzStoyCZzwXKacTSC4nklcdY/VHct/v3
	KCtwIBLTrAU1WrcJn8BPfD1w30D3TDwP9EuoCPd0qpqLqY2gQ6fW/ZXsyL/K8BzXZFUE
	HBH4lO2JqG7zUi+vO7aBzDaLq7y2VsBxxOf2LBdWjEhsV7KbqAuPTJhgVJr825mCjkhX
	JzaLyTc8pamOlhxe+pQmymxepSwabFxaf9EZchMP3XLQ9yxiCM1s5R0hdfWfZ/BN0VGh
	6RmUBW10gWK0kjPltJ1JhdM0RfKOQcNcbnL16bjL7yKn1ivIHe8cV0z7G+kTX5+IvTpI
	MM4w==
X-Gm-Message-State: AJcUuke4TIZEYJIlZQ1nqnYyufNH6VQXWN10gB/fbl0z2b8Mk3MP+2Ub
	9v4ERkFM0W0swLgy8oC5D65b2w7x
X-Google-Smtp-Source: ALg8bN5B1DXwOVzigeHphtXRWcsNAraHZcHJbcBEYtXTmWRtJKEvFaQu+BtbqKQhGSs2ypON32Wy5w==
X-Received: by 2002:a5d:660e:: with SMTP id n14mr8128367wru.19.1548353651911; 
	Thu, 24 Jan 2019 10:14:11 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	c10sm100318274wrw.49.2019.01.24.10.14.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 10:14:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jan 2019 19:13:53 +0100
Message-Id: <20190124181355.4609-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124181355.4609-1-schnitzeltony@gmail.com>
References: <20190124181355.4609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] exo: upgrade 0.12.3 -> 0.12.4
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
X-List-Received-Date: Thu, 24 Jan 2019 18:14:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.3.bb => exo_0.12.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.3.bb => exo_0.12.4.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.3.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.4.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.3.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.4.bb
index 9c4829bbf..7b7edfe1b 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.3.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.4.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "da934c5939f2ee4540f5d48991053f01"
-SRC_URI[sha256sum] = "b96fe86bb504aa9b3332b96105d755f5d9052c903fd6574b512a5ef76c0ad439"
+SRC_URI[md5sum] = "962bbccb38db0aecd4151ca97f6a39bc"
+SRC_URI[sha256sum] = "b0af60816bdb572ce53f19462fb1f3a5895a04017a878893dc03c166ea2050af"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.20.1


