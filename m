Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD0D78744
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 07:51:34 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y137so5380736qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 23:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lUsA1O/n+dmAXQLZ/eO47exKzABttAV/3ZMeSv4SKzA=;
	b=MnCmXB5q0hfGxoKd7PsdIQR2HNO5JowjJlIlugJZ9zkzq+uDpjrQsr/nDNTqKlNS4Q
	mHD6oEwjtX8wyIULnM3j1oA/DWTF3YRy0nowqym3mYJUrQzZN5wpejcHAnV9nySfxW19
	V4V8xINZxYw+8JnGrCJZ/3NsMCahkCDoarO5Tr5P+vAU9EVvcSggluNcCZmgK3xWWpYH
	nr9dbDG2NfQpVXvjVdsGCGRMdZDhBYpfNAPp59s10X1P/hbsEzOK7H1/l8X16f2xsq9Q
	nIA04aelSKnqfRRqnSqlxWC/yoQgX1NlqR0+5LAlshf+zfpNdcSsUKQ4eyUS/Sc1mRKP
	4z1w==
X-Gm-Message-State: APf1xPB7DV4T7BmGXbDe0EqxhVKOnM5T/YvJAuEeKGAlYH12HwMQfFCd
	qah0ufPe6cWBHYd3sUi4S7p/qA==
X-Google-Smtp-Source: AG47ELtXBtx8JH6WlxFsSRZHrRCZdsAupfAwLbvwvbdd6kw7AtIHianpStNeiRlzpCGYtwRsU0H61g==
X-Received: by 10.55.133.7 with SMTP id h7mr9664347qkd.130.1519285895350;
	Wed, 21 Feb 2018 23:51:35 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e131sm3317273qkb.12.2018.02.21.23.51.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 23:51:34 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 22 Feb 2018 04:51:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Feb 2018 04:51:16 -0300
Message-Id: <20180222075116.4175-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180222075116.4175-1-otavio@ossystems.com.br>
References: <20180222075116.4175-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH v2 2/2] python3-requests: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Thu, 22 Feb 2018 07:51:34 -0000

The selectors module is now part of python3-core. Remove this
dependency.
Tested using updatehub's uhu utility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Fix commit log

 meta-python/recipes-devtools/python/python3-requests_2.18.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
index d91d993bf..0a2410f85 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
@@ -1,5 +1,2 @@
 inherit setuptools3
 require python-requests.inc
-
-# Add the runtime depends for selectors.py
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.16.2


