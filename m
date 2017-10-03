Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 028226E671
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 09:40:41 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id j73so3196833lfg.0
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pUiDMikNKLT+25HQ1ILpjxy3Z4CkpLigHCAeTXZUYak=;
	b=h8VnRCirjymCf3yxhOXyGgTQxtQMepOQZMgho4vW1fMpPmfNXZDAzYnUw2RjPZiNFv
	zxJVoOufmyWCGGQtDgBbcO7DcHUUa8WP2uIs9Z9uEeKTRaexKB4zQPpXhiEvypkFAeMC
	txRUvW0IQEUF8DKPc0iP355XL7gPCmT4ZqajmZmdjX4Nfba/br6NPEgGj+1hhV47408h
	DKwyIDS/fs9gIUMJjF1C1dJUreBdlWGnmg5V5IwhlqVvjN+5RYvlwo8i9jEyjAoDNy5W
	2OvpdAdvMUiKJpgL+lKg/idr/QozkJjX74qxkknuoQz86EAFx2Ca58u5HcebdCVWkAfZ
	ks+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pUiDMikNKLT+25HQ1ILpjxy3Z4CkpLigHCAeTXZUYak=;
	b=SVZ+B0zlMfjwOa810M3565R2deTFUEIKEAFdztuk72AxwOcIEVGYxyY78ljFAuGJ4+
	Z/IgLsT9kVKmkVi3AuvQ8kCsJ5M0QLgPhh8deyXXPx2AtzrpRUDRtp+nswmJfsxDiWJG
	1//xj5xfl5m9Env+iAsirIhUNHV8/vad813006JmmivtoM0I2OHTC4OQ+0/AMWJ4OcSq
	oW4o9DvG4vmFG0f0S6rP3FYvdFnMDIrXkIdYneXlnEJHhBlpTPsRiej2rdmEl8tOPA6+
	/kfvWR0LRZ24Sx0iAflWadRP+i/auYHyYPMqbFfV+jOKcw6L6VEImyO/pwB6Dr2NMhls
	h6jA==
X-Gm-Message-State: AHPjjUj39PsDFvMHpCc5g6I+Fk1T1NFJTluSF1nb2Pzp55XVLwZUOxQW
	RCfOhcAbRiAnlo7KRDtBdVNK4IG8
X-Google-Smtp-Source: AOwi7QAcvsgs42VSY6Ntvrkn9YfzGIpUDQqRfjFNWeWX3aXC2iHGNLqR1BXYzUzy8GmVseqNqRQ9uw==
X-Received: by 10.46.85.138 with SMTP id g10mr8226688lje.114.1507023642563;
	Tue, 03 Oct 2017 02:40:42 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	g25sm2813636ljd.24.2017.10.03.02.40.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Oct 2017 02:40:41 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 11:40:39 +0200
Message-Id: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS
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
X-List-Received-Date: Tue, 03 Oct 2017 09:40:42 -0000

Without this patch bitbake cannot find sdl-config

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:

libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be found in PATH. Please either install it, or configure qemu not to require sdl.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dac3a1481eb..ebd758d1d904 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
+# Link to sdl-config if using host SDL
+HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDED', 'libsdl-native', 'sdl-config', '', d)}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
-- 
2.14.2


