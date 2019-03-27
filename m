Return-Path: <38-yaXAMKACQWAKGOOGLE.COM@flex--wak.bounces.google.com>
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com
	[209.85.215.202])
	by mail.openembedded.org (Postfix) with ESMTP id 568A77C603
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 03:24:34 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id m17so13185719pgk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 20:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=+SCOxbNFKUxQQ5PWK3MbOrv3IeqrvL8/cRJ54IDNmC0=;
	b=HSyCFwxpkwuisUmzi6pJ7zRIQ4nRk0DWPE9XyNjBsldTfylgICDHj1m0R/Cwg7TG4z
	eqhjw2+sl4NK/l+aYZwrlWBzEIJ6nVYjVtNq68GNM3YMbdUZ2t+2xet4v/5aYYZ/yR4A
	Tv6pPEc8po5RXD2O2dNUKdokUZOb3HG20ijUmMxMMtUHJLX0ZIlQiRIPeKYBopK5JCiB
	t8WSkDBKDC5IpfIwmBbDIPT9nWIA1N/CL2jIfFKcarHRrJu26ZKTb3FuPaYOWAiuArgn
	jxFQ2pc4Eh52zKHxYmFph0OBiruSlT2aE+SVT3i9zoN17TIBWRaHPPN9MbBWwctrHw0I
	fjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=+SCOxbNFKUxQQ5PWK3MbOrv3IeqrvL8/cRJ54IDNmC0=;
	b=RwZult642/jydFIvM6AUhEGWRsMKRMoTVFUzUSAOjgYuC8ICxXual1r6wxRsUUdxmf
	ie8On366rL71BdYCu9wPhiGaSH5/82r1qMrJ6/1f5qaFmhfB/ha4pvYuuHmUlg4rFNlN
	uZcRgyzx0odyW9MVlXzAtSb8mjHvftBeLZ3ZJnGnwVOl/RIlqYzL44seaGYozbV3HjgI
	pMJZVAONVIJTxOIcY2VlHzxLnP9oRITDXfvVE3sfSt2CeOkvoHeb+Aj1/sbGpqRConNp
	Z91KELrCOSNRZHkVMhzOmE5kcviqzMuV5aE04YjWqWqPI8ZUpHy8fhGfnCLX2i8MmSYy
	sHhw==
X-Gm-Message-State: APjAAAVi3ofLlma5l7cB8pxGA8Fl/9iuP+W3nG7f7m5+uWPWgiwlERtL
	djN6qEgxlVN42pHrUuP6qkVvKzvBO1gVNm/aEYaMPnSU25ghk/vi0yHBy6pCm29L9NDuXWOYz0I
	rx/eXsAuHGjd2BuXTBSB/qREbgyYN3NTJ3mpYdv3dBHUMXN9rOjt6GaxVvvuzUOMV3m9wwPXjdH
	kNg1A=
X-Google-Smtp-Source: APXvYqwq+H54ySFYYlC63xHhjgeoI1Xgk5Ld8FxtjsMyl5a8IeBry/wAWnA/iJOzrwp4DfVtgzDa8Js=
X-Received: by 2002:a63:3fc2:: with SMTP id
	m185mr10571433pga.145.1553657075334; 
	Tue, 26 Mar 2019 20:24:35 -0700 (PDT)
Date: Tue, 26 Mar 2019 20:24:30 -0700
Message-Id: <20190327032430.59511-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cli11: 1.6.2 -> 1.7.1
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
X-List-Received-Date: Wed, 27 Mar 2019 03:24:34 -0000
Content-Type: text/plain; charset="UTF-8"

LICENSE checksum updated to reflect a new copyright date being updated
there.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_1.6.2.bb => cli11_1.7.1.bb} (79%)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
similarity index 79%
rename from meta-oe/recipes-support/cli11/cli11_1.6.2.bb
rename to meta-oe/recipes-support/cli11/cli11_1.7.1.bb
index e62c1d3d1..1ed97a27e 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
 DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
-SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8489f3831fc7b75264c1d5e346251a74"
+SRCREV = "49ac989a9527ee9bb496de9ded7b4872c2e0e5ca"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
-- 
2.21.0


