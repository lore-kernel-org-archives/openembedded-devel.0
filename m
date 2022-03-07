Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24133C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 20:19:03 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web09.211.1646684342161556295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 12:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=lP83UKiu;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id AC6573200B23
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 15:19:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 07 Mar 2022 15:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=mesmtp; bh=xleFbUNWoZjajx4HXYNejLqtTPm
	rSt/c1ATOwXy+s6U=; b=lP83UKiuvmRpvnL0nrrqtYyjtiojoP43uBn1/35rJO+
	411GYvaDwKPyLWN8AhtmW6i9jVR++k/+LCS8J7Mi11G84TLAkx0Y5sg0RhN9SvCS
	VOkwbP45NhcLLv4SYsC+RRlGRrW4b935djD7zd12LVGIrNy1Ayh3w3Rjg740net0
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xleFbU
	NWoZjajx4HXYNejLqtTPmrSt/c1ATOwXy+s6U=; b=JYRTX5UtQqy9P8wEG+aItA
	RE2TzxKLUjhDJ8jO2SVA2evibqg6Y3TSSNcoPkW6VnBoXff7u0xQdVmU0rQQeCGm
	DutKfNn5vVykkontCz95PQuLNEQN4sz8vIh9I7GCeMIQcKKjuuTTDNLx/1tpRmVP
	1Pl9l5Gkq4r9klWK2gwQLI17EaTJMauU0sz4ARBBmu8Vcs/0fyJpB0VlvsmPFTb4
	pUW+1j7FSlQruBessYXT9yvfDg3PexNlRa64mHizcQEkq+pZBdVRwPkQT0NmlN8Z
	xH0a3/qKFxk+ZNHDM3+SAA7b7FuIrWvEwA+dWtHBdryNKvfqtfeoYxBJOop/sHMw
	==
X-ME-Sender: <xms:tWgmYo-gSGrR6Ol_CnjbygpxIUBaA_Gm4onE6V4IhyDX1GsQPiv5KA>
    <xme:tWgmYgvz9s5SLy47-8QP0ucEi3ZGtnQG0tsIRTkEaKJdn4IkDIL7xm4pBl7VIha0u
    jMFaKanMW6JOy7Uvw>
X-ME-Received: 
 <xmr:tWgmYuC1BY2L5kFrW-CVmYdj99Oco-0Pbsdd7eK-TuEpuQKh5Y1pZNATK7n0duvbZ0nQWyzE0-TlVFSPOxqhvjlXHnRzdn0c1GTYuB4hOe6e>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhgu
    vghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepheelteetje
    eiieetjeeuueefuddulefggeffveeikeevffelgeeigfefteehgfeknecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:tWgmYoccOVx89Z3Szu7QgH_gXvtlUgGQe4kGMldKaDB4LiwkgAYpQA>
    <xmx:tWgmYtMzqi7UcZbRiR6x7xF86Xl0xpmCl765TOkr7hb-mkAMYK50rw>
    <xmx:tWgmYik_cgqUWuu-DPyu2rTJYkzJEuYK5j4eB3xrwxaL94QPGo6XeA>
    <xmx:tWgmYkZcJHQKClQtHRA8NqTyN1XozCOhUDluuUKKtJzjudClbMIjfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 7 Mar 2022 15:19:01 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-pymodbus: add 2.5.3
Date: Mon,  7 Mar 2022 15:17:02 -0500
Message-Id: <20220307201702.31435-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307201702.31435-1-jsbronder@cold-front.org>
References: <20220307201702.31435-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 20:19:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95874

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-pymodbus_2.5.3.bb          | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
new file mode 100644
index 0000000000..b628cadafe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
@@ -0,0 +1,34 @@
+SUMMARY = "A fully featured modbus protocol stack in python"
+HOMEPAGE = "https://github.com/riptideio/pymodbus/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
+DEPENDS += "python3-six-native"
+
+SRC_URI[sha256sum] = "5ef68c1a109bdb467c830ef003ef2db6494349a5248e4af946fe21c9eefe7e74"
+S = "${WORKDIR}/pymodbus-${PV}"
+
+inherit pypi setuptools3
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[repl] = ",,,python3-aiohttp python3-click python3-prompt-toolkit python3-pygments python3-pyserial-asyncio"
+PACKAGECONFIG[tornado] = ",,,python3-tornado"
+PACKAGECONFIG[twisted] = ",,,python3-twisted-conch"
+PACKAGECONFIG[redis] = ",,,python3-redis"
+PACKAGECONFIG[sql] = ",,,python3-sqlalchemy"
+
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-core \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-math \
+    python3-netserver \
+"
+
+RDEPENDS:${PN} += " \
+    python3-pyserial \
+    python3-six \
+"
+
+
-- 
2.35.1


