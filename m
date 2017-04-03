Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id CC28C70018
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:22:54 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1cv5MW-0007aM-Op
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Apr 2017 19:01:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Message-Id:Date:Subject:Cc:To:From;
	bh=ZJZ9jE0r6dbpyuMd2dELGsOKtzCU9ZiLlqcQvwgNdi4=; 
	b=MGmXx4p4zhJcEufSH2GQrFQFBqD6sJx1Zpfrh/ZR6eTJWAhJCjmlflmKRw0qBlYbK0lLVzkCVI64PyKgOVmCalq/yoIxLADJZ6SQ7fcj14d1XsXIrieKtkDJNdvMiCVPywNOR8sZsQxqY20T1pi0LL5m80pCCPBFotD0a6z7/5ppx5jyNhcnxN+0ESpzFti5l8uhZqHQVsV2accG4eU+xpgLENq/eT5Tn3r6PI7dBRO7s7AP9DOrgpHoB6Yke8Ao1DDCt38UUBNbDX8zdPmfpqWAeb/kb5Z8O4LjLB/kh5yzvRU5HfDDqxK/NLIRwNS3+bAyWwT/IVDVAl9ZJtzjrg==;
Received: from host-87-242-51-16.prtelecom.hu ([87.242.51.16]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.80)
	(envelope-from <zboszor@pr.hu>)
	id 1cv5MP-0005kg-FX; Mon, 03 Apr 2017 19:01:50 +0200
From: Zoltan Boszormenyi <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 19:01:30 +0200
Message-Id: <20170403170132.19588-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.9.3
X-Spam-Score: 1.4 (+)
X-Scan-Signature: c0465d31707be8780557d6b88741a1e1
X-Spam-Tracer: backend.mail.pr.hu 1.4 20170403170150Z
Subject: [PATCH 0/2] Extend to kernel-module-split.bbclass
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
X-List-Received-Date: Mon, 03 Apr 2017 17:22:55 -0000


The changes are in two topics:

Support kernel module compression, both gz and xz. It needs
the kmod package to be built with zlib and/or lzma support.
The space saving is substantial.

The kernel-modules meta-package should refer to module subpackages
with versions, so if someone upgrades only a limited number of
packages at once instead of everything, the kernel upgrade can be
done by typing the kernel and kernel-modules package.

Signed-off-by: Zoltan Boszormenyi <zboszor@pr.hu>

 meta/classes/kernel-module-split.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions


