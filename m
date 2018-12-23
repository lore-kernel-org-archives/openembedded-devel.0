Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id A575F6D73C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w6so4866975pgl.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GajNc8hB/dbq6quOf62FkwzX/vbBLHeUEAxHP1D6zRU=;
	b=e5H+DsjhOX/5bhgrDlQyC/FTLLNIWV4xBOkOPDRBRFuGEVvgVG95yMW5Nwt5STRyio
	5TgwlAxRb4DC8QDD7jWqLStIIR6C1pzw+UsDiDtjw/JPW78goihZbCgC67B7GjrPQWKE
	Bw4E4gJ3rCrtvVjo9BLeAGeGoBKXVboKpr7skl0HrJg6bQbB9wrOMdCTseh/5H/+dlJi
	RFi2qZNBYlFAx7CMPUj6ekeEchjJVGRIAbD72jl5JtKhep1GDWIDohd/B5RdaefGsDTd
	UBI3oQm3T46pswJghE3dp3GHPxELMpx/n+HirzdtzkJ3LcguyU9LN7nH58MbmG4nbKW1
	8yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GajNc8hB/dbq6quOf62FkwzX/vbBLHeUEAxHP1D6zRU=;
	b=mmBS2nNCPstueb8GwjdzJS1NqkUj0wl7NvBv1bx8XWSzTNtjAIZfdUImUqICJMCsvl
	aN/nV/ducyiudMNe5Rb1CCn9s8WS5XcXcgq4KSRv9MgtmU13o0R3krjT8EGdpbrJj7DZ
	F0plaac9UN96ObUF7sVQollVNavL/li1JnCajizBzu0sTU3Xo5bPmu2SicholVS6A3a+
	LJ9/YKXFLDVKv+6+OLG0Zqjy2CKLr1yfyHCHbGSc7EicZvGz9fEHrl8DfO27KayWZKDx
	cFa5SLzP9+8c57VZvYR8q0oYvBvfQk6pINqggtMuUUuLo6TSac5iY+kZJwL23EQc5h1L
	Kq9Q==
X-Gm-Message-State: AJcUukffC456Wyp4RCanptQEwP9RBBOyHlGl5BdZqH4KtLeHt6b3j2Vq
	bclfLnskZGAzhDYi3PrxVnUib57l6+A=
X-Google-Smtp-Source: ALg8bN5Hvg254allSYJOJam37y6CBSLP8VVuFUkm+C1mlPY74nEnOKn3D3EuEjedMjNgfqovUmPeRQ==
X-Received: by 2002:a63:de04:: with SMTP id f4mr10140924pgg.292.1545600974431; 
	Sun, 23 Dec 2018 13:36:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:45 -0800
Message-Id: <20181223213557.7834-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 06/18] srecord: GPL-3.0 and LGPL-3.0 is correct license
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/srecord/srecord_1.64.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/recipes-support/srecord/srecord_1.64.bb
index fe1af476f2..d3488df2cf 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A collection of powerful tools for manipulating EPROM load files."
 SECTION = "devel"
-LICENSE = "GPLv2"
+LICENSE = "GPLv3+ & LGPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dfcbf2f0a144b97f0931b6394debea7"
 
 SRC_URI = " \
-- 
2.20.1


