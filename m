Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC36260721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:36:41 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id jw2so47621586igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nN6U8kvENYkPupOK1kZq7o11BG2Vy0vAX6B2/mX80Gg=;
	b=qldFA8xB3dGU33oHcj75SSlvvgEi3S+h3Vpl1gJRRu2xfBLChI2N3zx0Cx0StyKJFC
	GNpcpZcuwsAKvEKwP50h7AAOQwqPeFdcN53A8uxt4y+SeGoaWF60HIJ062bbckxjHsWV
	n9PstdjWlmhUy22MTQDxmgzKwfREOkTca/fqEKE1BVbTJVEY7F4XgfdTKHTmKRZiW/jq
	HF0L1UNVl9fznMcboVJqHdUCWKAa0/TUBn6fdWhyA6SS+ZESkP0oCBVmIFwbxv5y9loY
	QUPPd7RSZhkGhbgk93k74Prm+jrl6bCG3CnvJOZ5AuMljvwwX//73pxswlosYYkTp/53
	1INw==
X-Received: by 10.50.142.3 with SMTP id rs3mr20520333igb.70.1450744602215;
	Mon, 21 Dec 2015 16:36:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id d9sm9184283igx.5.2015.12.21.16.36.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 16:36:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Dec 2015 16:36:32 -0800
Message-Id: <1450744595-8679-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 0/3] opencv: minor recipe updates
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
X-List-Received-Date: Tue, 22 Dec 2015 00:36:41 -0000

Andre McCurdy (3):
  opencv: sort PACKAGECONFIG options
  opencv: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
  opencv: support machines based on oe-core tune-corei7.inc

 meta-oe/recipes-support/opencv/opencv_2.4.bb | 10 +++++++---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 20 ++++++++++++--------
 2 files changed, 19 insertions(+), 11 deletions(-)

-- 
1.9.1


