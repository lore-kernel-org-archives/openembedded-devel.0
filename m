Return-Path: <3cRElXQMKABgKy84CC492.0CA@flex--wak.bounces.google.com>
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
	[209.85.210.201])
	by mail.openembedded.org (Postfix) with ESMTP id 61C6F7ED3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 22:13:04 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id i2so81079pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 15:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=Wp5WbsVuVDxXIELLmabN8igz/YDIq8eaZWQkUCEE3nI=;
	b=Y4pDuEwG1gvbqKmfbJo1EW5nGX9f71aCRWsk1437x1lT+4RIp8P5Jb1kQwMK/l6PPc
	/q7r1dQvWqig2uTLEQeGYchsV8FCE7X+lALKN8bQ5NQnPvbhsazNn9dNp7oVfxp70N6E
	kwmoTqtT7nTyrbcpjxVIsbjo0L+IGs1mn1M2lBKMqQXOWFLhsRATU26wGy2np8bdYmZX
	4U/Rx4w1BJVa25U8+IWGYaCkcJju7AhA5zD2/YHk4bxepkkX5Y7jLG9Sx9Lbfq6zE37B
	zNBXKkDD3SBb+mH84A0AZXiZq2QgzR2agADYhfmg7xzAOVpFTvslNm+dP1i/TVkeingg
	YQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=Wp5WbsVuVDxXIELLmabN8igz/YDIq8eaZWQkUCEE3nI=;
	b=OPLweqWmhGXUj4LTpohOgMJMcqt3r1DEakaomg+oTvI0SK/NwBHTjVFq+NqBVcYgxL
	qXysH/LKY+0pnNYZ3mzkaVw3BEh28s3II6c6fsaMl2MPRGxgxHI1dMII1AiXqn9Ldvb4
	z2QgTj9JroMNuu+bgW/fd0fyhm2w5n650gR03G+oGy5iTz+JivuKDLFs93TDn3uiM8je
	RHNwq/NLLe1ToiLbl2WIfIfMaavu6fHR+hZzcJfRxv+E97bQJYPkUjUqEJFc16v9AiQ9
	DO3CL/UWRqg20ooQSJjn9f+Gpu/bXsb6ip/mcRa/9QfI4kwaqZcntoZXzI8JAjkctHw/
	x44A==
X-Gm-Message-State: APjAAAUyMjUfnvD5jYi+xKAl+k5TbPj0+ndFufB7PEUHIYeScWB2FrvZ
	LVF2Sdimm2RkIZNBKxgUixWVq3SWZSsyXt5tuTJuFvLE9oLeIbcVWOei5EzuW0zZpItrHNmugP9
	lulSUQL0HNQRjvLZorZm3u0KUPQb9+Ddds5ZF0J00dTfM80d3+aYkSE57vdezYbg3eki0e4CpWR
	vxH3o=
X-Google-Smtp-Source: APXvYqyuwRezH4UWauZw/c62ypDSOh3ToaMrGw5XAgFBgEXCJnwiP7iduIxXq3AcQOngqmZ4IWFMUhc=
X-Received: by 2002:a63:505a:: with SMTP id q26mr17221025pgl.18.1562710385074; 
	Tue, 09 Jul 2019 15:13:05 -0700 (PDT)
Date: Tue,  9 Jul 2019 15:13:01 -0700
Message-Id: <20190709221301.112133-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fmt: Init at 5.3.0
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
X-List-Received-Date: Tue, 09 Jul 2019 22:13:04 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/fmt/fmt_5.3.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/fmt/fmt_5.3.0.bb

diff --git a/meta-oe/recipes-support/fmt/fmt_5.3.0.bb b/meta-oe/recipes-support/fmt/fmt_5.3.0.bb
new file mode 100644
index 000000000..be33bb863
--- /dev/null
+++ b/meta-oe/recipes-support/fmt/fmt_5.3.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "open-source formatting library for C++"
+DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
+HOMEPAGE = "https://fmt.dev"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c2e38bc8629eac247a73b65c1548b2f0"
+SRCREV = "9e554999ce02cf86fcdfe74fe740c4fe3f5a56d5"
+PV .= "+git${SRCPV}"
+
+SRC_URI += "git://github.com/fmtlib/fmt"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
-- 
2.22.0


