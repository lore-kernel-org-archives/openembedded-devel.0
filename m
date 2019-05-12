Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D8C3E7D38A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2019 09:40:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so10922709wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2019 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xCE+wZzv+dFrODKbadPpKOCfNAUKWvCOKUSyA2A1pc8=;
	b=FTHZt9vEPqIHseMNeBUKr+bRbXv5X0/0nJfm8Lsue5p/Z3Vgj19GKUVcqB2mHSORku
	4qBRRpDaPs2E61GDLzxQaQzLGDnkUXOernJtHTnPPlDv4FJIDeEK1LeCHCWR4Ry3wCNL
	ViE5b/V681zjYcE2DQ1xCN+k/zfS6bYYo2FSsei5IA3pe4ISlVDCjDAhLt05KI32wK6r
	5/gUukHUWm4txUBa88AWamgrgK/iD6D/D29fO4cHDp5ZkX/cv2iQdkdcv9ouJU2wYCqg
	plFIm231wINc8JeKbX/L1xgbSLMifQlix8raLgJiiXQ+zccK/1AIdXky3v0KDgy73sb5
	Ql+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xCE+wZzv+dFrODKbadPpKOCfNAUKWvCOKUSyA2A1pc8=;
	b=bzt0OgT4jvUr+daeHEN1LOdz5ZcbG7XsPoB/1H31ZEyksk2drGEjCx2xHUoFEQ12ip
	/C0SsbVkW4P80JFWCnyRUKYBHT72cSRuDoGY+vQaDJr0ztv2seUVTMmb8biZC6ekY2kf
	B8GnSX/8Exhh69E8vwCECEeeN6+QnmBfhZAn0cuYKTAUMqsVmfvHW3fP7OUq/fp4VRIx
	rZB+hRcGnKes2REMf7mktuHmWzVb+12fQpEPEttKVpk8E7ZaBzGRF4tFnkePHxkkXuSj
	ODhBEv1SuGmpuHlAMxARRp1lmFzXA66t81RbhUDVy5LLRVSqxyMOg/7IX+zeIjeqZ+y8
	vEUQ==
X-Gm-Message-State: APjAAAXhrTmFY8Mp74KWefFppA8rKQW6iRqTGdfbeEpBof5IDBW+wh5z
	QY91xLjAUWYhjC06kUbkQgTE4ZHT
X-Google-Smtp-Source: APXvYqzIYBADjG6z9kz36F3UNBsnu/ZZ/UwivDOS23xJwHpLkR4+X4tWTxP9WCJGdPnRyQareOY3NA==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr1372384wmj.127.1557654038874; 
	Sun, 12 May 2019 02:40:38 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e12sm414593wrs.8.2019.05.12.02.40.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 12 May 2019 02:40:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2019 09:40:34 +0000
Message-Id: <20190512094035.13949-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] efivar: prevent native efivar depending on target kernel
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
X-List-Received-Date: Sun, 12 May 2019 09:40:39 -0000

* fixes:
  ERROR: efivar-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
  Hash for dependent task linux/linux-yocto_5.0.bb.do_populate_sysroot changed from de9e49b4f66adddf9a0943db020b4eb677404e0b6ddac60073184a3855d406cb to a912d6ea21336c85c8d8a5e9db4800fccb95197744465b641eda60339bee8901

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-bsp/efivar/efivar_37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/efivar/efivar_37.bb b/meta-oe/recipes-bsp/efivar/efivar_37.bb
index 87f5df423b..4b458dedd5 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_37.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_37.bb
@@ -40,4 +40,4 @@ do_install_class-native() {
 
 BBCLASSEXTEND = "native"
 
-RRECOMMENDS_${PN} = "kernel-module-efivarfs"
+RRECOMMENDS_${PN}_class-target = "kernel-module-efivarfs"
-- 
2.17.1


