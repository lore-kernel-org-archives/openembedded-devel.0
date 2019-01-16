Return-Path: <3i38-XAMKAGwgKUQYYQVO.MYW@flex--wak.bounces.google.com>
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
	[209.85.210.201])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD106BD57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 00:49:14 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id d18so3340668pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:in-reply-to:message-id:mime-version:references:subject:from:to
	:cc; bh=hZLdWzt9LP+QTAgV2pRL44qJ9ulqi0tRBZ3wX/F82uM=;
	b=eW3mEkCRQo3RBSczvzCpzuS49EdZrS6LfOOGG6Kh4hIWJ8qct3jyTduplg9DkYd111
	awTc+3kbXlHaMcTZ3qvvLpWE8p0XTfdMKLL4F54OTr4JXFDTMYF0Ryt+MakIcnNnt+rI
	Kc5z5FfW+Y3cVYeWg1rnyxBk+tMjnPQn+PGN1Q3IlBoaGR6AV4cd4jg8rLFi11dXNgym
	pMy9dXlBlbP9Ze2wckMvy6oCjEOPyaCQc06QYn7dw/x6XVK0XyPcTspByiyeP/Lvs5Gw
	lBf76TZdWeF6cL3KG1RudTrzsdPsSzk4gk1bmUN0K2GjOACY2F942eMWfQKsYdXfvDE4
	lD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=hZLdWzt9LP+QTAgV2pRL44qJ9ulqi0tRBZ3wX/F82uM=;
	b=EP2/xqWBbccH1DfaPf06t9+eNxfjxxTv7YoHSLzds/mWQpz91a1pTXlefJxlL7WIgb
	LUNp2q35ZKeRLhS0Nw1mviWM6z38ZyWU3B1bgH0SQIBGYfNtXx7u56//xw7kLSIDrnZ8
	qODttixStmIr6iQFzvGZevFW/hJj+Q9EVpKtCSkB2gOgNoGt3S/tbfWS/AJjDH8FWDx+
	2UnCTqEGEnPiwZlig/QmRYCr8zbL02EBSoM22qfDgOfGZ7OgBxhek4a9FTU48FWSMaLM
	rm7bX2S2fsNx5xTYEa2D5hubs+WtC5yZOeL/koLDXWSX6SGjlwJrpHIueGwoG8+UgM8w
	tUuw==
X-Gm-Message-State: AJcUukda/yTawnmhQbLtem+4lLLOU+bZ1ibU0uhnJ8rAGQ65TiCTrZsa
	4sqszAm+1awvneINKSTqDUmE8193ZzAnBZTptj0OvvmzxIYXMiqFB4JZ4bYZ4h0EKmjb9NePvyy
	5jg81QQGj+gcpjYF0rouaXknJfeLTDN828swOg/6Jb8YwqxpuvwAU+l1cP/0hPoYWiMn8G2HVxq
	RsDBg=
X-Google-Smtp-Source: ALg8bN7dcT7jNcxAHHROhDMduvMqL+pgpSk6/1rN/bxXIlWnA/Wed3IRKAikTJdtHYibF0sQqxMh9Ck=
X-Received: by 2002:a63:e210:: with SMTP id q16mr2397579pgh.132.1547599755454; 
	Tue, 15 Jan 2019 16:49:15 -0800 (PST)
Date: Tue, 15 Jan 2019 16:48:56 -0800
In-Reply-To: <20181003055751.174763-1-wak@google.com>
Message-Id: <20190116004856.51945-1-wak@google.com>
Mime-Version: 1.0
References: <20181003055751.174763-1-wak@google.com>
X-Mailer: git-send-email 2.20.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] cli11: Add recipe
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
X-List-Received-Date: Wed, 16 Jan 2019 00:49:14 -0000
Content-Type: text/plain; charset="UTF-8"

cli11 is a c++ command line parser library that provides a simple
user interface with modern c++ semantics.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/cli11/cli11_1.6.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/cli11/cli11_1.6.2.bb

diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
new file mode 100644
index 000000000..6899b1264
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C++11 command line parser"
+DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
+SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
+PV .= "+git${SRCPV}"
+
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
+
+DEPENDS += "boost"
-- 
2.20.1


