Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 556837F81E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:21:01 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q10so5232914wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H7S9wkmwMjBR2K4MKLqPxHju9KwCiTryYC4PjL83is8=;
	b=NpkXUJBYiTcQO1qimrJUJ8BRvyBGBnBP2e9wV59xTADzX6CO7xPMRbpL6tgI2dWmK5
	YKqbXY/sRvN3NLPW6jDlwibDN5KDY9EPU95gvMTnG4W0FXs0dpyq1QzaovWRIBYubg4J
	bbfKUkrKVhc0EFXTXVoez5See96j93oWNMcCIDxsIB+CifgpCu9xRw3fUMuAP8byAZjM
	KZM2hex4VI68frTNZlzrQBJ5JS2GadFQPOMx9B92S4IJdBFtns/3egDki6ppUoPxpi6i
	Ekn4Df9ziR3gC0iTbPoJ+I01kHYG/BQOdS8ngPZ3VuXKPAcJ6O2oZdX3WLoe3KqCeCGN
	S33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H7S9wkmwMjBR2K4MKLqPxHju9KwCiTryYC4PjL83is8=;
	b=LAfqN3lrmLzd4e4lycpTIRI/S2Ck88GG63ujZbOfODadcTFkcAZicIU8BAyjOsWW1d
	W/N2x0PtaCLajuWLACF0IE4c9M1urdVudApsghKtCe5SprOk5IA7KiYBV+Zvrz+BGgsL
	i6bsIodVgyWxTWubXiu0X1FYeSMl4peSdLgLMN4ZeCAElXWaE+8TOwjMeWrnvfaVmGxb
	1h1yFitdc18uC2kZNmbGALBzXvqq1Eco6Xef0aU6kFl+qtDMk8AsWbNIfBQL5fH5MoHb
	IWIXTxkP6+cyA3l3kK0RGHuSUZwKpWzAi97mNILi685C01Rw1Z4lPO6r5u4cZ8jQNco/
	anEA==
X-Gm-Message-State: APjAAAWd3Fr/D28T1axL6WS5MS37rr0AmIoZbz6blmni+mNh+fA5ULHn
	SqsofiC5GhOihroZDrxkYkgIOkxE
X-Google-Smtp-Source: APXvYqy+WXsc6/2SWhAJ8ISHEhCAwsreTt2h0Kf0vsIRs4yuBcbiKzWbzJ+IgYT3rUetNQUGLSOd8A==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr27513868wrn.239.1576459261751; 
	Sun, 15 Dec 2019 17:21:01 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A307CB3B21B8240595DD.dip0.t-ipconnect.de.
	[2003:f0:7f06:a307:cb3b:21b8:2405:95dd])
	by smtp.gmail.com with ESMTPSA id
	t190sm10877063wmt.44.2019.12.15.17.21.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 17:21:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:20:45 +0100
Message-Id: <20191216012047.17312-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216012047.17312-1-schnitzeltony@gmail.com>
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] geany: remove pythonnative from inherit
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
X-List-Received-Date: Mon, 16 Dec 2019 01:21:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested with oe-core patch removing python2 from hosttools
* checked log files and there are no traces that a running python is required

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.36.bb b/meta-oe/recipes-devtools/geany/geany_1.36.bb
index 0d29b138a..17e16bf56 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.36.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
 
 DEPENDS = "gtk+3 libxml-parser-perl-native python3-docutils-native intltool-native"
 
-inherit features_check autotools pkgconfig perlnative pythonnative gettext
+inherit features_check autotools pkgconfig perlnative gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


