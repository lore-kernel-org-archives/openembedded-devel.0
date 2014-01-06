Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9D43860D27
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 13:55:09 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x13so17897564qcv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 05:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=a29tfeyrjTdejVnG0NF2a5I2QEKfLJtBa2uJchiEv8w=;
	b=oP0zu5H7/SqC3VvZXtudUGY4uDoq5BAqXEsTb7QdIyFhJBTMlwO79y6gOGB8QSmwIg
	sfUS/xja5WSOcP0c+bu89yGdTyQNUNlTAsyElTmUFH1YrDFPerj2TblqRavk2TTkiEx8
	SYBhlRVk6RmE8ys9sw0qyvKbDTEqoQESBFV9s59mhIdOaiJblC0eWCEWZaZmooQmLmSR
	UIiSDEpsjdecUw6TRRO7zbSPeUH89ezDzW1Ov69WeXOF5IeznwMAXIFbxxurZ618uJob
	yvYyHFQZTdkj+eu2yO3gzxpyICC7ntp4T4e2+LRzG162DEbPzCcbhmOtCTQzEyQkUitI
	mQkA==
X-Received: by 10.224.60.135 with SMTP id p7mr40076933qah.94.1389016510346;
	Mon, 06 Jan 2014 05:55:10 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	ki4sm105291650qeb.0.2014.01.06.05.55.08 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 06 Jan 2014 05:55:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2014 11:54:30 -0200
Message-Id: <1389016470-29712-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe] gdal: Avoid host headers use for SQlite3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2014 13:55:11 -0000

This fixes the host contamination when the host has the SQLite3
headers available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 525ead2..4ce5d33 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -80,6 +80,8 @@ EXTRA_OECONF = "--without-perl \
                 \
                 --with-pcraster=internal \
                 --with-geotiff=internal \
+                \
+                --with-sqlite3=${STAGING_LIBDIR} \
 "
 
 EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""
-- 
1.7.10.4


