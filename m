Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8457FC2E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579608032; x=1611144032;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=PzAw6eCtRa77fDmXefWWMJGQIZy2gmKXHxbnmu4hGhE=;
	b=uCEvDyJN2Ai49j8m/Sq32Z6701YPtJmUva6R0IpzW8TTG8wW7H+aSn0E
	ftCDglNzHcnGNTLrHjhxiGN309X+BFPXr5DaRQb4nMFf7X+Oon9l0B27C
	LUuA7gxGTlm4FIGLouzHAgGbDgyEAtiS+oZnNV1ZEOtRPC/OUpZakl3pi
	t9qFnc5L5ZtVgBknf8EwkXG+qsvYJ17Orw2ijKUHaWDdtRgmQ2whCkYGo
	XHuM5pHIklnK5U/yxUoIC1M383177beMXy43ZlOlBSDK/ElzrS0U39kzu
	VNyurYP0MX1eeSqDl+285rZ2OXJ9L/7O4lJLMy9yyTTF791fKfSYUwIS0 Q==;
IronPort-SDR: xpUHsmvbRL55wzo6BupFipoPWZW9rhqxlVfFtY4wQHzrvc8/fEznE3O5a1CU91qFmjulG/TPUv
	dMuvKjp7CeN1aM3j3MeaaBW4sxIKhrZRTEUzX9fP+4NG+Nw6ta9JE0eTllK52THxP0dJlvf+qq
	2yBmoFY/+j3c8TMX6GnA8LokwIGcDqb79XYW414NVDQ0oWfaJu58VHRkW+68khxxj8Y9ApVjqo
	m2jmYW6gf+/5ZeRQNeey4920vPwUreDF4clifJa23vkPgKn3BXFYJW+L6kbjv8/s7/g3JbgzVv
	cEU=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; 
   d="scan'208";a="2495397"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jan 2020 13:00:16 +0100
Message-ID: <20200121120016.385617-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] README: mention dependency on meta-poky for oeqa image testing
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
X-List-Received-Date: Tue, 21 Jan 2020 12:00:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As the mejate distributions are based on poky we need meta-poky for oeqa
image testing.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/README b/README
index 743418c..d28da02 100644
--- a/README
+++ b/README
@@ -11,6 +11,14 @@ branch: master
 revision: HEAD
 
 URI: git://git.openembedded.org/meta-openembedded
+sub-layer: meta-oe
+branch: master
+revision: HEAD
+
+Furthermoe for oeqa runtime testing this layer depends on:
+
+URI: git://git.yoctoproject.org/poky
+sub-layer: meta-poky
 branch: master
 revision: HEAD
 
@@ -64,6 +72,7 @@ The meta-java layer may be tested using oeqa's runtime image tests. The easiest
 way is to add the following configuration to your local.conf:
 
 SANITY_TESTED_DISTROS = ""
+INHERIT += "testimage"
 TESTIMAGE_AUTO = "1"
 
 Then you should be able to use the open{jre,jdk}-{7,8}-test-image recipes.
-- 
2.24.1


