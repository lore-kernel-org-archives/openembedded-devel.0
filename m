Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4187897B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 21:46:27 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6CE6E211C8;
	Fri,  2 Mar 2018 16:46:29 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 16:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=rZBcX4pPxwukbe
	JoRtlID1XvcQ2qaT3rhncBADa6/m4=; b=QkUcx0wd5TUAkKqw/HhXtgWHBVQQge
	6dx0cewvQEngIzFXpsX73zkwIuABlreI0foDHAPtG931Go4HjVTxHeD6SmQPo1lp
	BBCpx6ClH233SvHIzb8bokOrFVHpf4R6Der+TZOxqzKa0M2yVFLmQhqLzPLv+Zn1
	mMpUxqMs8XZm4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=rZBcX4pPxwukbeJoRtlID1XvcQ2qaT3rhncBADa6/m4=; b=WsNtW80q
	nQ21dVBWaabPVbWSF870PHIF1cvykzHagkjFwTUsd3NcJmYqjfpLHlL5uhXahYb7
	1M3Rx59wte6ZiJ/H55kGEqJ/DPzJYPOvQbW3iDnwupkeY6W36BxBLEpPu3ECzLWE
	kJo1Jo6TRk6NgjMtkrHt9srH2n1ThAMLB568+/kZGAM+EMan0mTYIyQbd5AOc2nz
	pmVMjLTRn6+dWRN5Ve/QDWtWMz06vqNv4c7/9qUhigTycMxIBtqj3FrOUll6Zzes
	BdSSaJCjNVkF0UETUTnNai8z+1JW/47vgQgjErwmgF6TX2dmQEwOcNIPYOubwhaL
	1yAtRSLFza+8cg==
X-ME-Sender: <xms:NcaZWkYA-wIZgLEhJKAV9M1giVZILWtGojOiTaOTzCiDn6mhH594ww>
Received: from localhost (unknown [96.237.180.55])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1E4277E5A8;
	Fri,  2 Mar 2018 16:46:29 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 16:46:24 -0500
Message-Id: <20180302214624.18596-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180302214624.18596-1-jsbronder@cold-front.org>
References: <20180302214624.18596-1-jsbronder@cold-front.org>
Subject: [meta-oe][PATCH v3 2/2] zeromq: 4.2.3 update
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
X-List-Received-Date: Fri, 02 Mar 2018 21:46:28 -0000

4.1.6 was released in late 2016 and upstream has moved on to the 4.2
series which has a number of new APIs but remains ABI compatible with
4.1.2+ per https://github.com/zeromq/libzmq/releases/tag/v4.2.0.

4.2.3 ChangeLog: https://github.com/zeromq/libzmq/releases/tag/v4.2.3

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb}                     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
index e126f3239..71d7e7cbf 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
 PACKAGECONFIG ??= "libsodium"
 PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
 
-SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
+SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "c89db4dbc0b90c34c9f4983cbff6d321"
-SRC_URI[sha256sum] = "02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a"
+SRC_URI[md5sum] = "c4e18bd0584ccd34213f152c11f54d6c"
+SRC_URI[sha256sum] = "8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.13.6


