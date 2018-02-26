Return-Path: <timo.jyrinki@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB31F60123
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 09:37:28 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id x196so21181197lfd.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=539Sr7Y0r38Sh0va+yQIk24tNJkumNkEEKNxjPVuMX8=;
	b=G6MCOpa1t2K27eJVCPjvK+Pd/K6h8Rz34KBCdwt4yxhKwqyMMgMoowJmias9FHc67Y
	7bUqurizZBsw9DJjHnqO+HlkHeEmOZGWa6Sa1IAIWoRbw0BCYABrsmmhNreLCd8W+WNg
	vGAp1vhMV1OV30NJPemlsH0t/1DXaMOx/DwZwZ43ywxTBm7cFyZlIifjaMc1ccXe6qsV
	30rWyAmxUfHDPbQ2Pes14ALMYF7qkxDoyn2XxwRNHyKUTCtXgdXUz4u0RVQT54NPxd4y
	tCLsKfTyHBCxat5AUqdO6GC1TB/Wt5Tn7cwy/dA1gGMGXCBgiu7ps5SDAGvAeb6IUN61
	khug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=539Sr7Y0r38Sh0va+yQIk24tNJkumNkEEKNxjPVuMX8=;
	b=DZD7/epf106jnzgtiW5Aceio6UGExDXynS2LVuhzPP4FAuWqUFdBpPHJU2VE5j0+g5
	Apr9Lt60O8xq0TjiSFVk2d2EN35XX2JpClXlaDXU6UoExMTX8Dvz9W5POuSMLbWrvJbx
	h1u3T4+hhL++9kyAqlRiC1inKKe/dbvcIElrCwY85WSquA8vOrpfonpm6xFB0VBknBCR
	g8R6hdo7G95eHVXN/jaSj1ngE4vE8ebUpFVf3Wi1A3+8UnzXQNsoONT2uKTm6tTJiWUA
	Nu8GLwqTbUd2F99sv9HwVi9r2WI21Hp733pR6nM7N3ADiaw7aq6+iuYSWGnStlupp/NT
	+ztQ==
X-Gm-Message-State: APf1xPCnhB84Jm/XZBi1EefjwCKkP7h5YAGhR4l/SEiDzZs8S33OUMHg
	4YklAeo5eQsq01zQq5saiqFy/Q==
X-Google-Smtp-Source: AG47ELuRAhlxIkhciyt2FWtKdqhSYLWpOFHgaFQV0P+845MuLQb9XYehkfgto4S4t0TF4u6vsQLctQ==
X-Received: by 10.25.211.212 with SMTP id k203mr7730021lfg.146.1519637849330; 
	Mon, 26 Feb 2018 01:37:29 -0800 (PST)
Received: from timo-XPS-13-9343.lan (88-113-242-103.elisa-laajakaista.fi.
	[88.113.242.103]) by smtp.gmail.com with ESMTPSA id
	d82sm1899142lfl.66.2018.02.26.01.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 01:37:28 -0800 (PST)
From: Timo Jyrinki <timo.jyrinki@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Feb 2018 11:37:25 +0200
Message-Id: <1519637845-8644-1-git-send-email-timo.jyrinki@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] qtlocation: Add licenses used under mapboxgl.
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
X-List-Received-Date: Mon, 26 Feb 2018 09:37:29 -0000

These licenses are in use in the fetched mapboxgl submodule but not
currently listed in the recipe: Apache-2.0, MIT, openssl and BSL-1.0.

Signed-off-by: Timo Jyrinki <timo.jyrinki@gmail.com>
---
 recipes-qt/qt5/qtlocation_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index fce37b8..f6d3e09 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
+LICENSE = "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-- 
2.7.4


