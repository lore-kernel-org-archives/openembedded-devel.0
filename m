Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6889B60721
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:48:06 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x17-v6so8079924pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ia9MxzaBVSqLOi4mxsya55xKTorAVvz8/Arwfg1zFAM=;
	b=CtZYSlP/WiKLx/D6vKPBLlpmTpACSAD2LVgRX0+k4o9VEnmY7jU6oxAqckvcpdT12g
	Z0tJAx1v8GVrrrvQCAIOPyk8Rga9JICmo7EaXd/g97GRq5QtGjjlgjFeTcrp61mFkfSl
	XlqUsWmFsEO9kO8cpB/KpuJYoOmFv24VUIXkWBUT6iEejH70qJaSIaaVJ3ZYEob3vZVx
	WHCDQqLOnO4mXgZmmoW9K2kz/ww8QEyvkmg74g8RAo5FWeP6baQDuFz78q0u/knPYlcx
	WGgFWZeTH4ONcBuyrjNPSUUeaQ/bnz/oL9bXzL7AkOL7LfLatvyQDoMNZ9NYfvQEx6Tq
	k7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ia9MxzaBVSqLOi4mxsya55xKTorAVvz8/Arwfg1zFAM=;
	b=oXZKRuI0nWanvcKZ4fVagFL6Af+3j2ddyu8/ZpLPRUe8eU06drhiXaCCSa9hLCRqnG
	66Pc5eb3zN9DN8E4T6dfwBasb4xYb4pJ0dg1P/eriCU+VdZKv2rfbQ+DGuzTkjRFLF+U
	OhxI8yFogVUI6Upln6TdK6BHvA8Cv5P3Kikd+5tObgM0hYEvdsfgJ45u8osPRaYKnsQN
	uIq/bfIqdmsA2ahFxSBkCPOUaiVPUwIvz40MCQUEapEK2DMpbZOuTgt0mKRyUFVNtI2l
	EolU0tIbahcgGYgGikMWBC8NvRGSIVWUmD9dFDU3YBML/ABk8g2SXrY4qavu5DBpbOIj
	f6AA==
X-Gm-Message-State: APzg51DmhsD5pa1CS/BzBCu4szq6DBeKE40qbOobSF1DN9ViC0OFDDiW
	NxadLPsmjGgdy2Ju6dIc3HwPojh0
X-Google-Smtp-Source: ANB0VdYbdUxrGrfHbzwtg13ZPvGZWxzi2QJxUi9gXT8eKEiWQn+ZzibqqfFu+9k4Fi/XzSGsNfH2PQ==
X-Received: by 2002:a63:524e:: with SMTP id
	s14-v6mr12903650pgl.35.1535392087019; 
	Mon, 27 Aug 2018 10:48:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	u43-v6sm24454446pgn.81.2018.08.27.10.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 10:48:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 10:47:53 -0700
Message-Id: <20180827174757.7027-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-python][PATCH 1/5] python-pyflame: Disable for mips arch
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
X-List-Received-Date: Mon, 27 Aug 2018 17:48:06 -0000

Fails to build as support is missing

src/ptrace.cc:135:48: error: 'regs' has incomplete type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyflame.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
index 71fe769765..3914028ec3 100644
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -11,3 +11,4 @@ S = "${WORKDIR}/git"
 inherit pkgconfig autotools
 
 COMPATIBLE_HOST_libc-musl_class-target = "null"
+COMPATIBLE_HOST_mipsarch_class-target = "null"
-- 
2.18.0


