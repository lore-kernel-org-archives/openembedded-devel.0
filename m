Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE927520C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:14:54 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s47-v6so8953935qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4/dC1XAzEbLFaUGcAB23Cg+aFUe1bmXi3+GhqKhTyAQ=;
	b=APp9aKQ2qyR5OQJFPijnXxKTQJNqBy1qPg4KQRcqvm9OSRXEJk0rPOnywwFkqECK2M
	/VjuG//G4n6M/qPuLBNOUx7aCrg4UeD4TlaaHykeEzrQmGax5vjk4MzDBI10pwUCiaoy
	PKYwb3woMFypH5WWg3qzBiYmLerHRMTnq1rU8z/cdH4avIX1RUNXjXQTI02I3ECfuDUH
	MMxbCpMGSNAdv6Miry4mV0SU9iwExj3pv64O5o9vZlTGhKw5UrR9uBtjLrfndj+bD+p9
	RlXuvZoz91DU1J0uGASf7PTQd4sa/1KU7w3F1ilbqYDv7khHn5+efsTAiUjQixcYXz9P
	W5kA==
X-Gm-Message-State: APt69E051OffydIf+DCr/LtR5ym4z3lAOFbHjU3U0sbdRARtlHHimfk2
	poUO/jHBrxNMDgcUIbmgos6PPt7N
X-Google-Smtp-Source: AAOMgpdCmHZL34zKZJX8xQGGvBu5/MKDecgoRGzvYL1teWLFY0/bkwK3vG7oDdweoHtGkqj7I/93KQ==
X-Received: by 2002:a0c:9547:: with SMTP id
	m7-v6mr14498978qvm.138.1530303294899; 
	Fri, 29 Jun 2018 13:14:54 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	j128-v6sm5932328qkc.35.2018.06.29.13.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:14:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:14:45 -0400
Message-Id: <1530303285-18781-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyiface: update to version 0.0.6
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
X-List-Received-Date: Fri, 29 Jun 2018 20:14:54 -0000

License-Update: Checksum changed due to whitespace changes in license file

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyiface.inc              | 6 +++---
 .../python/{python-pyiface_0.0.5.bb => python-pyiface_0.0.6.bb}     | 0
 .../python/{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.6.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb => python-pyiface_0.0.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
index 620b244..8e464a8 100644
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ b/meta-python/recipes-devtools/python/python-pyiface.inc
@@ -3,9 +3,9 @@ SECTION = "devel/python"
 HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
 LICENSE = "GPLv3+"
 
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
 
-SRC_URI[md5sum] = "06c3c71fe51df740dae6a88a13afb5e0"
-SRC_URI[sha256sum] = "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1bf903ec32e043af924"
+SRC_URI[md5sum] = "2379d8d4506e6c4d83cf3d4824abce8b"
+SRC_URI[sha256sum] = "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6e4cf2d708dcd86f2"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
-- 
2.7.4


