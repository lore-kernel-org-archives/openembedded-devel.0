Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 83AC56103A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 11:14:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z9so10255976wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 03:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A3M3zcCUII8FbP33wfo11qobO7wy8Z2YV+3WysVNP50=;
	b=b6rZWMImGvMx/ZhlCyInHVRkEHkasoU9Hysi7Yo7d5jptNbWC6jo7EYwZ3brucgQFW
	35ygDc60teML3Fy3QQ0+D5Rd7SdD3d6/2pDbooT24SzYZv7If6ZaSqYGzqK/eW3LDisL
	YKdtyRwFGM6bGiSEE5PDet7P7y8PsjHocPy0kmkM/H2pz7f/1VhCfYh8W3nYb7snaNut
	qLPtJAHDzd47he2CLKtDdJlCsNBeTDIGdGnyiFxFmba2pudwA1Nd6SdxftD4tyVxk9rS
	S/LWwLmrGvFrTPteg2fFmwlvuwEidl+aX9eoQW1A17NfPMDNFVGmb2RCR51gJtdMzgB1
	tyaQ==
X-Gm-Message-State: APjAAAX5Y2fhUZbNymCiUjJ4uRWX5hJS0xJ9pAng7gtPCgf6b7UjgNkW
	SXrZvsWhEMV0MgU0ek2P458iqday
X-Google-Smtp-Source: APXvYqzSRUZhdHCPID+rXIx9Z9vup3X13FG4luUgNE5Kjvg949lCOzTWy37WeD+xHKy7vu2dj8GJ6g==
X-Received: by 2002:adf:fe50:: with SMTP id m16mr23005363wrs.217.1580814867147;
	Tue, 04 Feb 2020 03:14:27 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	y185sm3513360wmg.2.2020.02.04.03.14.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 03:14:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Feb 2020 11:14:26 +0000
Message-Id: <20200204111426.35433-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] smem: add a native variant
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
X-List-Received-Date: Tue, 04 Feb 2020 11:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The native variant is useful to e.g. examine captures of a
running target on the host system.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-support/smem/smem_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
index 702217a33..947c47b0f 100644
--- a/meta-oe/recipes-support/smem/smem_1.4.bb
+++ b/meta-oe/recipes-support/smem/smem_1.4.bb
@@ -29,3 +29,5 @@ RDEPENDS_${PN} += "python-textutils python-compression python-shell python-codec
 PACKAGES =+ "smemcap"
 
 FILES_smemcap = "${bindir}/smemcap"
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


