Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 82E397FDCF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 08:10:57 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y8so444206pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=amEf2Z++EgePh4LfHbzctA/azkOhgVHNDxMJXwpv2ds=;
	b=r0KARFX2rfTD1EA7nB77KIwx6DS73+9e/9CqFveHL2rct0AYPujeC3bf+bieUvv/hy
	rDfe8o5NvezDFYUkpwwkbSSmK7APwpkbs/f1qrUQ44UvsmCa1OkNTYiJbVFFTdAIRd+I
	MHnri26SgAn/Rhm9WwKsi4J6Q6NtXk5kpcODPWWQJh1wU6cksUz3SveUDGacyU+A76yI
	RpVSFSTFtGmLPSGAmfydWG5xiv7nncrUBZp8AT7WaBWff+b6ruDSZK+qbcmleIg/5ruq
	gjjfmj0xcgwx2BXvwYU/SRgZBrPub8Wy97EcbcTf9gqEUDwRfWkQS7M/CtBZrn78cYNP
	b7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=amEf2Z++EgePh4LfHbzctA/azkOhgVHNDxMJXwpv2ds=;
	b=nP7TEyOWADliNc0cTuWvqPjUlTxqNCCd3jU8F0/hEgDOSCSeX3kwals648OFfbxVwv
	O5XNt7ARF4d8V/9V6cWgcHiH/aXgWitbQBL9mOEvFrRE6l7lVcB/nEMSugcyAFTaqE9G
	AZVnT2lx+oHrPymqYlxdYtcrkbitau2GOa8sJWwbDZu8defB3PMSA39j8lpbbiS1C6q2
	ThYxBm80o+G9tyMU2BvtuBaHZpSW6khjcvagemmdbPAu6qkA7OUwuEbPUolpHry8lEDV
	z/1Sea3cEcMGX/ZikUziaMB8pWtkrRmyoYEs5jlfxyNTVIPgugtcFQYmrHszu4e9rDsS
	bnmw==
X-Gm-Message-State: APjAAAUZsVDx3ytsayKwHCCih1VDHycfibXvWkzMCwS8/b0Slwxek4yZ
	KTsBIna1Oq9CjxeXWlZ9Qj8pZycI4rw=
X-Google-Smtp-Source: APXvYqx+MYM48o0XIO3FKJHBDqu+I6sN/FgvSC6YIcGfdRInizlm4uEDFbuxErSStXApaAKjSPycZQ==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id
	y5mr1939878pjw.126.1579853458171; 
	Fri, 24 Jan 2020 00:10:58 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:3c89:c57:830d:1156])
	by smtp.gmail.com with ESMTPSA id
	g24sm5252809pfk.92.2020.01.24.00.10.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 00:10:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 00:10:26 -0800
Message-Id: <20200124081026.21969-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124081026.21969-1-ticotimo@gmail.com>
References: <20200124081026.21969-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] python-future: add target RDEPENDS
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
X-List-Received-Date: Fri, 24 Jan 2020 08:10:57 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependency:
  - python-misc (future_builtins)

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-future_0.18.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/python/python-future_0.18.2.bb b/recipes-devtools/python/python-future_0.18.2.bb
index 2dfcd28a..8fa066db 100644
--- a/recipes-devtools/python/python-future_0.18.2.bb
+++ b/recipes-devtools/python/python-future_0.18.2.bb
@@ -13,4 +13,6 @@ PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3
 
 inherit pypi setuptools
 
+RDEPENDS_${PN}_append_class-target = " python-misc"
+
 BBCLASSEXTEND = "native"
-- 
2.25.0


