Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4F42D7E08E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:31:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id r134so20498872lff.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uvwj8HMwJfJTOQfcA3BzL6R+7wygtyyiDW5TxZ52mu4=;
	b=ta99YFvc7WdDAbmSHZYO5uB4bhspRZJXRN51va2NY+hpOgtLl95kuMVtsuHjRN+SWF
	yiw/xwFs+SQJVu6oTLdXj1w231aWs5AIOux2Gce+bMAKHevi7TM50OiWop10M92YpA9A
	L2bfqxe4uaJ/3hFXNOrW0O88Fjyyv8NzHDxsi37PLnytN10DMovqX7RA9MyWjtg/sdKB
	gKNUPxUnREeWpwzMNlS1HfNlUDm0nmv5OLSbcFfdcNoUXRN1ayqTSDLiVoZqD+VrrFTY
	0yyXDmYs1OqdNDDghW9mfguoJsvfFs0L9aJE0hN3K4bgpidlUrqDUK4EFFHjQw6ASuwv
	dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uvwj8HMwJfJTOQfcA3BzL6R+7wygtyyiDW5TxZ52mu4=;
	b=VzVECIeTr/qwcs/isIg4QJj/CCF4Jmua+Jc3jKsH92GpDGGlx4nQaSlqtyLdy3vCb3
	9QLycJ7nsp3kN/2A2zLCY63HdJAW2T57NXSfw08z4e7MHsv3MBzpEnNyE81oTAU8AnsH
	NpXyBZp/WpbUrL71ZCwZv1HzBNsQscaf2n4jl6MDtlLoH7IhDL2rUWkcqWTpP/V84Iuz
	7pxI75QxeA/qLyifKzAWk8aEXbPdnx4DiphydsiT1aSw0zEsogJVNa9FrFnBrc7xiFOG
	tq5nxPhhlzO1zxA1mJ+Rbby9mXNRsPBYscqMpoE96XJirKf6euDLMuqnTsYmDuLr8u0R
	cXyw==
X-Gm-Message-State: APjAAAXp8LPRt8MbuHpWVX7k7yzBzpSKzcyRvP+KsBPWDiEeyN+sAJIR
	UIz/+QrXEqIti6GEpSGmzEOuyf5X1XI=
X-Google-Smtp-Source: APXvYqztmNzTJ49fD7XjEbHuYPehVqkvKrb1MybljDCcH/G9fJDQCFTyMUGSQ6rx+NtfqXcTdaQ6SQ==
X-Received: by 2002:ac2:530e:: with SMTP id c14mr2316471lfh.165.1568323863528; 
	Thu, 12 Sep 2019 14:31:03 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	c21sm2918056lff.61.2019.09.12.14.31.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:31:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:30:59 +0200
Message-Id: <20190912213059.18263-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] fmt: update to 6.0.0
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
X-List-Received-Date: Thu, 12 Sep 2019 21:31:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/fmt/{fmt_5.3.0.bb => fmt_6.0.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/fmt/{fmt_5.3.0.bb => fmt_6.0.0.bb} (67%)

diff --git a/meta-oe/recipes-support/fmt/fmt_5.3.0.bb b/meta-oe/recipes-support/fmt/fmt_6.0.0.bb
similarity index 67%
rename from meta-oe/recipes-support/fmt/fmt_5.3.0.bb
rename to meta-oe/recipes-support/fmt/fmt_6.0.0.bb
index be33bb863..c35c77b12 100644
--- a/meta-oe/recipes-support/fmt/fmt_5.3.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_6.0.0.bb
@@ -1,12 +1,11 @@
 SUMMARY = "open-source formatting library for C++"
 DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c2e38bc8629eac247a73b65c1548b2f0"
-SRCREV = "9e554999ce02cf86fcdfe74fe740c4fe3f5a56d5"
-PV .= "+git${SRCPV}"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
+SRCREV = "7512a55aa3ae309587ca89668ef9ec4074a51a1f"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


