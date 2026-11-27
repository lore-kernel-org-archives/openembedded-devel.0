Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.924.1795831323051496045
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 18:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=nZ235/bF;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB10960D42;
	Sat, 28 Nov 2026 01:52:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795830744;
	b=ehVMU9WkSTdnv4SZOJUBVZ+LrWB4j9laXOgThwyDIVUje/Vg/REIjkHDrbZJckT5ujNS
	 SmkNVYWWWKW1Poc6/RIaQky7ktKC8aP3A2QUL+xd19yP1Gppe8Os8N2O00FgUW2/ntCsx
	 VVOpAnGoy7MCDMXi3ZryQ1jDqyiI9irkcECDy1TPMjugAoxij46Go0LG3GLKY8164dC5T
	 qA0PcIimcoLTDwg3hj2zfvJPzCIqxMxexS+aK3jxnHVwM4GhixkpILglBT7Od6PYmkFuN
	 pbShD3Qdxb7qWc/L7YUhtCbgeSWCJcPV22Kl9vSN7TO3Ff2tlP9F3gHFBC60OGjWaog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795830744;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ED5Emds7XPjNy0wq+GdiNMZPOdMr52H46WwFQ4Fa6oQ=;
	b=c3HFxLxVPGqlhAzuqZ+KfTgwbVOanjSSew68SpIShb9Muk3vul/SsX2sBpVL/jcoGKMM
	 l1+f0Ow37y7qhAhu1cFfa0vT/KAi6rdMyfmk/QMUyfAeETzkvltPYh9BcFucynUrY83MA
	 KqOWVXbvsT3lu5h/UiclaDROTOkgq/copMvJ+uMEgggLXuY4oEJJESTYoAU7UmwxzPF8k
	 mYTTjwpwUpJOzDNhfe71nDtB7PMQ3CxkxperoleAPcs6hTCgWcxL2q0W46zf7+kRu1dkR
	 Jiy3NWIr1iyHR8lFOIjeoXTabD4DFm97igfmC1+DAhH917b8P7n8jA9Kalj9k5GhZJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D88B21F0089B;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795830744;
	bh=ED5Emds7XPjNy0wq+GdiNMZPOdMr52H46WwFQ4Fa6oQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=nZ235/bFjDIxMBn8tPSkKFlvRxY1d0fZxgqSF3eH+24XuGUoAPvzA5UIZJEVPc4q+
	 pOmSLoHP88aGX0Vg+sLqBeXu81mNriUHLZWTAKGKHE4HZPY00SeW4OtOWwx5Pnf2y7
	 ZFHBSPBbTFx0vHWIV80py9AHVPPtFxotMO4xQtPHtt441IYBzdB0VfsFAidrtFSbKb
	 a3NPUOjQkx5mbtQOeuFDXmtlFVkNYgI2VPOZ60oL8RQD0AQuO1lsJ3HrdjUM6kbPnw
	 gQ45ZMZkt7loZIQ08V2KnqqkVRBo+4eTajrRjo5y0mBUTzZeFEXrknKc7FPiNaQkJK
	 f5LCs//5U7gJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 692A44DF16;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261128-pillow-sg-v1-4-cbcff72e5e81@certik.com>
References: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
In-Reply-To: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 10:05:11 +0000
Subject: [meta-python][scarthgap][PATCH 4/4] python3-pillow: patch CVE-2026-112406
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795830619; l=2898;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=f0f1/8Xs4Bx9GcWebrCzo/t4/bZ2s1JSpSOy0JpVJzM=;
 b=s0xxUOIqNlKnxTtPY3/MEt64KXjSG9zvaNALzvugZrfJsgelSGfSbrwPAU6ykwvVI3ayMcgeq
 euyPgrEn4k2DaMbr+TPPrQBrqsHN7JnyCAOnw6J7UmFvOj7Rw0BqsA1
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 03:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133394

From: Dickson Wu <dickson.wu@certik.com>

Prevent infinite loop when rewriting PDF pages (#10125).

Upstream commit:
https://github.com/python-pillow/Pillow/commit/b3ebf20c694f2f12537a629c30229a1d5a53f777

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../python3-pillow/CVE-2026-112406.patch      | 26 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112406.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112406.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112406.patch
new file mode 100644
index 000000000..ab6e180d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112406.patch
@@ -0,0 +1,26 @@
+From b3ebf20c694f2f12537a629c30229a1d5a53f777 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Mon, 5 Oct 2026 18:12:40 +1100
+Subject: [PATCH] Prevent infinite loop when rewriting PDF pages (#10125)
+
+
+CVE: CVE-2026-112406
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/b3ebf20c694f2f12537a629c30229a1d5a53f777]
+Backport note: Omit upstream test changes in Tests/test_pdfparser.py.
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+diff --git a/src/PIL/PdfParser.py b/src/PIL/PdfParser.py
+index 5f75cf4d3ee..e7ec6180b6c 100644
+--- a/src/PIL/PdfParser.py
++++ b/src/PIL/PdfParser.py
+@@ -502,7 +502,9 @@ def rewrite_pages(self) -> None:
+                     self.pages[j] = new_page_ref
+         # delete redundant Pages tree nodes from xref table
+         for pages_tree_node_ref in pages_tree_nodes_to_delete:
+-            while pages_tree_node_ref:
++            processed_refs = []
++            while pages_tree_node_ref and pages_tree_node_ref not in processed_refs:
++                processed_refs.append(pages_tree_node_ref)
+                 pages_tree_node = self.cached_objects[pages_tree_node_ref]
+                 if pages_tree_node_ref.object_id in self.xref_table:
+                     del self.xref_table[pages_tree_node_ref.object_id]
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 374984d0e..d7adf8cef 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-112398_CVE-2026-112403.patch \
            file://CVE-2026-112900.patch \
            file://CVE-2026-112400.patch \
+           file://CVE-2026-112406.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 

