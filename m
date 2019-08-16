Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 666AF7EADD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u16so1109111wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/rNfkwN8hFOTeBUTZM/daKmoI2kBpSG/vnNFzp3WfrM=;
	b=HUYEkblH9mK9BcuHzBN58HGyJy8DmpzDlBGprX8EE5MN1SaekVj4cnLfXOaCCsE3KK
	ULNcGQ2/76pSA88a/oMrohCQOFvkSyKF2T2Xj3i2spcAteevZy8tF2d9Vody5CmkmwEC
	4efIgQdPQhxrOv1HT81pJeAVRV0fDQT4vczoqqv6BHLLCiLA8hFUgYdnnUGQQ0HkqxMe
	x2Qs+0vl7Fs2ht6Bru8mKT3BtSkbg8ld5sMmFDC+/5oPzTOmrqCP+p1h/5M+BSb/1NFL
	v9YhN9HBthw63ISAPP7NnPESCRukeFVFo82CtzjOP+A+UqumK2GPB3gj9z6UQztCpPeM
	CSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/rNfkwN8hFOTeBUTZM/daKmoI2kBpSG/vnNFzp3WfrM=;
	b=seVNIy2mN8C/sfKgQJjs2oXikMsDPTVlRLnTCrk9kvx4zonrIbbMnrymazuCqr51hM
	IdDGnR1BttcT58QyLCFJIXZZ0LZ8TsntIGJ5OKuJoOZfP7dxp75w8FSCyXUycQavlqUq
	XvHkjCi8Er54mEwn243lpGZBGgtUNsUNZ32U2TP8AVSBEGcU0OG7C1lJXfi3XG2KDzVn
	ofRlN6go1XNicPhAKxvCt1DllFS/4HeQJQ9tJT8AGkIyF2rMbwLEg0Gj7Yt3ArXPqhLO
	lWIK7/Al8+pRpYCVqfHicA/14JwooKPY5AxfZAijBLiyxbp2NNJzh+e/SQ5Hxgm3Jyg7
	N33g==
X-Gm-Message-State: APjAAAUVB6vnN6mjBWWm9cyq0ePQUfl2I6ob25impZHoYevxmMAvgXtX
	FkPGwsYo3+Ra+TPMeuPNyq+dlw28eL8=
X-Google-Smtp-Source: APXvYqylDPxWITKYBzEyEyY6BZQrWJsc0MuAvHRncMPKRWZ1696APfArgdEV7YmwKA8Pb/bitI3iaQ==
X-Received: by 2002:a5d:480d:: with SMTP id l13mr9840733wrq.321.1565951998836; 
	Fri, 16 Aug 2019 03:39:58 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	w14sm5331933wrl.21.2019.08.16.03.39.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:57 +0000
Message-Id: <20190816103958.2701581-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/7] lmsensors: add runtime dependency on bash
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
X-List-Received-Date: Fri, 16 Aug 2019 10:39:58 -0000

* fixes:
  ERROR: QA Issue: /usr/sbin/pwmconfig contained in package lmsensors-pwmconfig requires /bin/bash, but no providers found in RDEPENDS_lmsensors-pwmconfig? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
index b4fcfe3edb..585dc94810 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
@@ -144,7 +144,7 @@ RDEPENDS_${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
 # pwmconfig script files
 FILES_${PN}-pwmconfig = "${sbindir}/pwmconfig"
 FILES_${PN}-pwmconfig-doc = "${mandir}/man8/pwmconfig.8"
-RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol"
+RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol bash"
 
 # isadump and isaset helper program files
 FILES_${PN}-isatools = "${sbindir}/isa*"
-- 
2.17.1


