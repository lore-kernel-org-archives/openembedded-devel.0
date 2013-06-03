Return-Path: <danismostlikely@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 09C6561EBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 22:12:27 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id fb19so8079363obc.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 15:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=rU9fq2LFl3calHPUgLZ25XECs9da72DWGMwFK+P5+SA=;
	b=aF8XKM54J6rncF2ABuGaSC43vOEKJyI1QHdGcP6X7f2JiRC3XxCO/3B4SGEr+zB4Bu
	7GnkIR9mTVDiYF0zQ3VVMeLYa7FB1xOcwjYnCJJoSN1KHbMstSBMIiT2WlcqU9xlevXe
	97HMb4iW1UfN/Ighc4q9MNOIrulwS/9rtmDQmf9pzrHjcRLdY0iHUVo46t2PbpmY3RtN
	J9uRX+bL4Ila/E6/TWgizq4UVh2BbvGzP7noXhiSsxyu9JNJhGzRlFsv9gdc+akNlCvV
	AwIhkPO/creAh+KK0Pqy+bKiJi7CPYs3LlK/aB1kgw+DMJWT6o/13yMoVdV6OdvkluYQ
	dTSA==
X-Received: by 10.182.171.9 with SMTP id aq9mr10989077obc.16.1370297548823;
	Mon, 03 Jun 2013 15:12:28 -0700 (PDT)
Received: from mediabox.gateway.2wire.net
	(71-17-188-15.sktn.hsdb.sasknet.sk.ca. [71.17.188.15])
	by mx.google.com with ESMTPSA id jt9sm47794942obc.0.2013.06.03.15.12.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 15:12:28 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jun 2013 16:12:13 -0600
Message-Id: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [oe-core][PATCH] Make Python IPv6 aware
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
X-List-Received-Date: Mon, 03 Jun 2013 22:12:28 -0000

I found that gateone would crash with a socket error when Python
isn't compiled with IPv6 support. This patch enables it when
DISTRO_FEATURES includes ipv6.


