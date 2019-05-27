Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4337D1F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:22:01 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id s11so9659440pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=c7yh3Kv2dvv3xisPAqKLGmNTZbI8QK4Jq0C/fsHYd9U=;
	b=I8QmoWi7fmHFSHVq6Gf3lmViuT7iF+jtJ0ZVaDkNOXqRFmw2YbrBKIwlGEPuRkV48T
	GCWuFL5mzOQqvsrJ/bz9lM1gwsdSDS96YN77p3UAVqQr7WeM/5SVRdP5ilCHF6E7cWTv
	ENd5Gl1PS7u0ZocmEmegoW/YZ8hnX2xL7O87r12+hFC8oo/VwgrVdVN2j+Nj200Z5ixj
	ehz9DG/hF1h0quQT0mHhGuCpIbolKFuoiDrDpDSfaSV2ybQgClapc3ViBX9Ud5Sok+Vl
	NMncPwCJCchIiRgcXytIth5OoMrxMBtJou/qelVG1F+xWrVe7mrT9RFAh36OX5+h9+XJ
	VbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=c7yh3Kv2dvv3xisPAqKLGmNTZbI8QK4Jq0C/fsHYd9U=;
	b=dplndy8MlYNvlcdmX30bLR58y+Tr7Yxa+Y1v6UK+OfmsYaNC81gjsHP13TKKZXxcME
	GgDZOGYLFL6KXUD91Ro0BAvxk1V1GNEgfNF+fNI8mbA63nab3W1YS28nPDisrvtL0HhW
	AYOzKnxLFk7GWAC/Wq5JL4eDfDf+cjgEQ/OqyG/xJ5RyItZobM9M0uAfdIzTX1nPKOSd
	Fx2ri3ekr26umxPUAJ/NHPgkZfbHJk2tbzB+SbFp12CAW8GgS/gtcgYBabQCoDnLbKHz
	0WwoG3BSgcSikOu0Cm6yZ7XBOCbz7waSo11XTJ90CWkav0R7VxOZNSUpBviX9nRihwlj
	koTQ==
X-Gm-Message-State: APjAAAUd+UIkMW9ieq6gNbO2EgPadDaHC/EDPnzZ47T3OLLAL90CcQvQ
	2BLaDcDnrUtJRX3H5PYVrHuVKf1a
X-Google-Smtp-Source: APXvYqypa38FEDeF35Q0dOHjhRFpI/rpfIWp/WiTirhHTPTGzvkZGKv4calZynG5IbM8ZkvzRcgriA==
X-Received: by 2002:a63:224a:: with SMTP id t10mr13256657pgm.27.1558966922526; 
	Mon, 27 May 2019 07:22:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6833:552f:fefb:d39])
	by smtp.gmail.com with ESMTPSA id
	11sm16902190pfu.155.2019.05.27.07.22.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 May 2019 07:22:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 07:21:56 -0700
Message-Id: <cover.1558966857.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud 0/3] Patch review for thud
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
X-List-Received-Date: Mon, 27 May 2019 14:22:01 -0000

These are being backported from Warrior-next

The following changes since commit f6b21313abee0fc53b77a7e977f3fa54a8428118:

  ccid: fix SRC_URI (2019-05-26 09:09:32 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/thud-nmut
  http://cgit.openembedded.org//log/?h=stable/thud-nmut

Qi.Chen@windriver.com (1):
  netkit-rsh: add tag to CVE patch

Tom Rini (1):
  netkit-rsh: don't build under musl

Yi Zhao (1):
  netkit-rsh: security fixes

 .../CVE-2019-7282-and-CVE-2019-7283.patch          | 35 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch

-- 
2.7.4


