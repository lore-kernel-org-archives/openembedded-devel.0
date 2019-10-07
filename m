Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Oct 2019 09:30:48 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 73D216010B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 09:30:48 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id HPEXiwEORDGRHHPEYinkuy; Mon, 07 Oct 2019 10:23:17 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=QaIYQfTv c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=XobE76Q3jBoA:10 a=-An2I_7KAAAA:8
	a=FP58Ms26AAAA:8 a=kfcp8jNP83mGSK0BNzwA:9 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FZfwKg1zw+Szu1VmzmjcdLwwLXMgxZSnzjCHWu72a/E=;
	b=Do3dfUKMcHrDTnH6UhauCfqLiN
	z54BWFJ7r+3isD7iKRvM/qUeE+JwGEEzRf5E5USoAc2HQzF1rjwXGlCR2L2+ooXGAtfVqi4qS1rFL
	Rdw6SpZpaOaVyb/RUu8e60Q+kpJy+s9rePr7Js60RXnT2RQkJUZ1s+fLwQPQR82rLhWpnvtmwrxMl
	0XhPbwUCen8unZmT8xDUlpeNaUFs/yuxOpCZLe5pibEjxKikmClMV/XRZnDhQLxyhDB+AElJsRj/Z
	tX7jEYQGUzsmTEhLi+u/fAd+mTX4QJ6MjL/au5zF6Fs4zDhKyz0/6Oj6bxEfOUfrQBu+yWM+FaCFz
	MNmMacjw==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1iHPEW-0006d2-2m; Mon, 07 Oct 2019 10:23:12 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Oct 2019 10:22:59 +0100
Message-Id: <20191007092259.7073-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFZeMd+AZv2xaN5BQC9Yi5OSzA5PW8KVwNtMk/ddrJT/WQvgKHcV7BP02whS3vZpkz7Q0LSCoMwkMnwPJwPKnfCjqKvRPkoWI8KJo9eoBTx/v0dFXIyq
	gCia5txxLIvZIpmPBC6S5zrkEC0ZhHmllOb6EU529m6/dU474+6lC5nHc2X+0Ye36A9LZQ6pZ0uG6Q==
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] log4cpp: Stop using RC as a variable
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
X-List-Received-Date: Mon, 07 Oct 2019 09:30:48 -0000
Content-Transfer-Encoding: 8bit

This recipe cannot be parsed when using meta-mingw because ${RC} expands
to the Windows resource compiler. Let's use PRC instead to avoid that
problem.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
index dc52c9ff4..19b94466b 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://sourceforge.net/projects/log4cpp/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-RC = "rc5"
-SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}${RC}.tar.gz \
+PRC = "rc5"
+SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}${PRC}.tar.gz \
            file://fix-pc.patch;striplevel=2 \
           "
 SRC_URI[md5sum] = "58b4591a2f3e7ef3d5e3e7cfb3a81a62"
-- 
2.20.1


